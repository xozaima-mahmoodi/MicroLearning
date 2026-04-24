<script setup lang="ts">
import { computed, onBeforeUnmount, onMounted, ref } from 'vue'
import { storeToRefs } from 'pinia'
import { useRoute, useRouter } from 'vue-router'
import { useCategoriesStore } from '@/stores/categories'
import { useConceptsStore } from '@/stores/concepts'
import DomainCard from '@/components/DomainCard.vue'
import LoadingState from '@/components/LoadingState.vue'
import SearchBar from '@/components/SearchBar.vue'
import { ChevronDown, Layers, SearchX } from 'lucide-vue-next'
import { paletteFor, iconFor } from '@/lib/palette'
import { normalize } from '@/lib/search'
import { toPersianDigits } from '@/lib/numerals'
import type { Category, ConceptSearchHit, Domain } from '@/types'

const route = useRoute()
const router = useRouter()
const categoriesStore = useCategoriesStore()
const conceptsStore = useConceptsStore()
const { list, loading } = storeToRefs(categoriesStore)

const expandedSlug = ref<string | null>(null)
const query = ref('')
const searchBarRef = ref<InstanceType<typeof SearchBar> | null>(null)

function toggle(slug: string) {
  expandedSlug.value = expandedSlug.value === slug ? null : slug
  router.replace({
    query: expandedSlug.value ? { category: expandedSlug.value } : {},
  })
}

const stagger = (i: number) => `${i * 80}ms`

const paletteOf = computed(() => (color: string | null) => paletteFor(color))
const iconOf = computed(() => (name: string | null) => iconFor(name))

// Group the search index by parent domain so domain-level filtering can
// answer "does any concept of this domain match?" in O(1) per domain.
const conceptsByDomain = computed(() => {
  const map: Record<string, ConceptSearchHit[]> = {}
  for (const hit of conceptsStore.searchIndex) {
    ;(map[hit.domain_slug] ||= []).push(hit)
  }
  return map
})

const queryNorm = computed(() => normalize(query.value))
const isSearching = computed(() => queryNorm.value.length > 0)

type FilteredCategory = Category & { matchedConcepts: Record<string, ConceptSearchHit[]> }

const filteredCategories = computed<FilteredCategory[]>(() => {
  const q = queryNorm.value
  if (!q) {
    return list.value.map((c) => ({ ...c, matchedConcepts: {} }))
  }

  const out: FilteredCategory[] = []
  for (const cat of list.value) {
    const catMatches = normalize(cat.title).includes(q)
    const matchedConcepts: Record<string, ConceptSearchHit[]> = {}
    const domains: Domain[] = []

    for (const d of cat.domains) {
      const conceptHits = (conceptsByDomain.value[d.slug] ?? []).filter((h) =>
        normalize(h.title).includes(q),
      )
      const domainHit =
        catMatches ||
        normalize(d.name).includes(q) ||
        (d.description ? normalize(d.description).includes(q) : false) ||
        conceptHits.length > 0

      if (domainHit) {
        domains.push(d)
        if (conceptHits.length) matchedConcepts[d.slug] = conceptHits
      }
    }

    if (domains.length) out.push({ ...cat, domains, matchedConcepts })
  }
  return out
})

const noResults = computed(
  () => isSearching.value && filteredCategories.value.length === 0 && !loading.value,
)

// While searching, treat every matched category as expanded so users can see
// the matching domains immediately without an extra click.
function isExpanded(slug: string): boolean {
  return isSearching.value || expandedSlug.value === slug
}

function onKeydown(e: KeyboardEvent) {
  if (e.key !== '/') return
  const t = e.target as HTMLElement | null
  // Don't hijack '/' if the user is already typing in a form field.
  if (
    t &&
    (t.tagName === 'INPUT' ||
      t.tagName === 'TEXTAREA' ||
      (t as HTMLElement).isContentEditable)
  ) {
    return
  }
  e.preventDefault()
  searchBarRef.value?.focus()
}

onMounted(async () => {
  await categoriesStore.fetchAll()
  // Fire-and-forget — search becomes deep as soon as it lands; until then
  // search still works on category/domain titles + descriptions.
  conceptsStore.fetchSearchIndex()

  const fromQuery = typeof route.query.category === 'string' ? route.query.category : null
  const known = fromQuery && list.value.some((c) => c.slug === fromQuery)
  expandedSlug.value = known ? fromQuery : (list.value[0]?.slug ?? null)

  window.addEventListener('keydown', onKeydown)
})

onBeforeUnmount(() => {
  window.removeEventListener('keydown', onKeydown)
})
</script>

<template>
  <section>
    <div class="mb-10 text-center md:mb-12 md:text-start">
      <h1 class="text-4xl font-extrabold leading-tight tracking-tight text-slate-900 dark:text-slate-100 md:text-6xl">
        میکرولرنینگ
      </h1>
      <p class="mx-auto mt-4 max-w-2xl text-base leading-8 text-slate-600 dark:text-slate-400 md:mx-0 md:text-lg">
        نقشه‌ی راه تو در دنیای دانش
      </p>
    </div>

    <div class="mx-auto mb-10 max-w-2xl md:mb-12">
      <SearchBar ref="searchBarRef" v-model="query" />
    </div>

    <LoadingState v-if="loading && list.length === 0" />

    <div
      v-else-if="noResults"
      class="anim-fade-in-up mx-auto max-w-md rounded-2xl border border-dashed border-slate-300 bg-white/70 p-10 text-center backdrop-blur-sm dark:border-white/15 dark:bg-white/5"
    >
      <div class="mx-auto flex size-14 items-center justify-center rounded-full bg-slate-100 dark:bg-white/10">
        <SearchX class="size-7 text-slate-400 dark:text-slate-400" :stroke-width="2" aria-hidden="true" />
      </div>
      <p class="mt-4 text-base font-semibold text-slate-700 dark:text-slate-200">مفهومی با این عنوان پیدا نشد</p>
      <p class="mt-1 text-sm text-slate-500 dark:text-slate-400">عبارت دیگری امتحان کنید یا املای کلمه را بررسی کنید.</p>
    </div>

    <ul v-else class="space-y-6">
      <li
        v-for="(cat, i) in filteredCategories"
        :key="cat.id"
        :style="{ animationDelay: stagger(i) }"
        :class="[
          'anim-fade-in-up overflow-hidden rounded-3xl transition-all duration-300 ease-out dark:saturate-[1.1]',
          paletteOf(cat.color).gradient,
          paletteOf(cat.color).gradientGlow,
          isExpanded(cat.slug)
            ? 'shadow-2xl'
            : 'shadow-lg hover:-translate-y-0.5 hover:scale-[1.01] hover:shadow-2xl',
        ]"
      >
        <button
          type="button"
          class="group flex w-full items-center justify-between gap-5 px-6 py-6 text-start transition focus:outline-none focus-visible:ring-2 focus-visible:ring-white/80 md:px-8 md:py-8"
          :aria-expanded="isExpanded(cat.slug)"
          :aria-controls="`category-panel-${cat.slug}`"
          @click="toggle(cat.slug)"
        >
          <div class="flex items-center gap-5">
            <div
              class="flex size-16 shrink-0 items-center justify-center rounded-full border border-white/30 bg-white/20 shadow-inner backdrop-blur-md transition-transform duration-300 group-hover:scale-110"
              aria-hidden="true"
            >
              <component
                :is="iconOf(cat.icon)"
                class="size-8 text-white"
                :stroke-width="2"
              />
            </div>

            <div class="flex flex-col">
              <h2 class="text-2xl font-extrabold tracking-tight text-white drop-shadow-sm md:text-3xl">
                {{ cat.title }}
              </h2>
              <div class="mt-1 flex flex-wrap items-center gap-2 text-sm font-medium text-white/85">
                <span>{{ toPersianDigits(cat.domains.length) }} حوزه</span>
                <!-- Concept-count badge: glassmorphism pill matching the
                     category icon ring; reads as ambient metadata, not a CTA. -->
                <span
                  v-if="cat.concepts_count > 0"
                  class="inline-flex items-center gap-1 rounded-full border border-white/30 bg-white/15 px-2.5 py-0.5 text-xs font-semibold text-white shadow-inner backdrop-blur-md"
                  :title="`${toPersianDigits(cat.concepts_count)} مفهوم`"
                >
                  <Layers class="size-3" :stroke-width="2.5" aria-hidden="true" />
                  <span class="tabular-nums">{{ toPersianDigits(cat.concepts_count) }}</span>
                  <span>مفهوم</span>
                </span>
              </div>
            </div>
          </div>

          <ChevronDown
            :class="[
              'size-7 shrink-0 text-white/90 transition-transform duration-300 ease-out',
              isExpanded(cat.slug) ? 'rotate-180' : '',
            ]"
            aria-hidden="true"
          />
        </button>

        <div
          :id="`category-panel-${cat.slug}`"
          :class="[
            'grid transition-[grid-template-rows] duration-300 ease-out',
            isExpanded(cat.slug) ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]',
          ]"
        >
          <div class="min-h-0 overflow-hidden">
            <div
              :class="[
                'bg-white/95 px-6 py-8 backdrop-blur-sm transition duration-300 ease-out dark:bg-slate-900/85 md:px-8 md:py-10',
                isExpanded(cat.slug) ? 'translate-y-0 opacity-100' : '-translate-y-1 opacity-0',
              ]"
            >
              <div
                v-if="cat.domains.length === 0"
                class="rounded-2xl border border-dashed border-slate-300 bg-white/60 p-8 text-center text-slate-500 dark:border-white/15 dark:bg-white/5 dark:text-slate-400"
              >
                هنوز حوزه‌ای در این دسته ثبت نشده است.
              </div>
              <div v-else class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
                <div
                  v-for="(d, di) in cat.domains"
                  :key="d.id"
                  class="flex flex-col gap-2"
                >
                  <DomainCard
                    :domain="d"
                    :category-slug="cat.slug"
                    :index="di"
                  />
                  <p
                    v-if="cat.matchedConcepts[d.slug]?.length"
                    class="px-1 text-xs leading-6 text-slate-500 dark:text-slate-400"
                  >
                    <span class="font-semibold text-slate-600 dark:text-slate-300">یافته‌ها در مفاهیم: </span>
                    <span>
                      {{ cat.matchedConcepts[d.slug].map((c) => c.title).join('، ') }}
                    </span>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </li>
    </ul>

    <div
      v-if="!loading && !isSearching && list.length === 0"
      class="rounded-2xl border border-dashed border-slate-300 bg-white/60 p-8 text-center text-slate-500 dark:border-white/15 dark:bg-white/5 dark:text-slate-400"
    >
      هنوز دسته‌ای ثبت نشده است.
    </div>
  </section>
</template>
