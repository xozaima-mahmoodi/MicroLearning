<script setup lang="ts">
import { computed, ref, watch } from 'vue'
import { Bookmark, Check, Eye, Sparkles, X } from 'lucide-vue-next'
import { useI18n } from 'vue-i18n'
import { storeToRefs } from 'pinia'
import type { Concept, ConceptSummary } from '@/types'
import { useLibraryStore } from '@/stores/library'
import { useConceptsStore } from '@/stores/concepts'
import { useDomainsStore } from '@/stores/domains'
import { useLocaleStore } from '@/stores/locale'
import { toPersianDigits } from '@/lib/numerals'
import DifficultyBadge from './DifficultyBadge.vue'
import ResourceList from './ResourceList.vue'

const props = defineProps<{
  concept: Concept
  domainSlug: string
  domainName: string
}>()
const emit = defineEmits<{
  (e: 'close'): void
  (e: 'navigate', slug: string): void
}>()

const { t } = useI18n()
const { isRtl } = storeToRefs(useLocaleStore())
// Logical-direction arrow for the next-step chips. RTL flow reads
// right-to-left, so the leftward arrow is the "forward" indicator.
const forwardArrow = computed(() => (isRtl.value ? '←' : '→'))

const showExtended = ref(false)
const library = useLibraryStore()
const conceptsStore = useConceptsStore()
const domainsStore = useDomainsStore()

watch(
  () => props.concept.slug,
  (slug) => {
    showExtended.value = false
    if (slug) conceptsStore.recordView(slug)
  },
  { immediate: true },
)

watch(
  () => props.domainSlug,
  (slug) => {
    if (slug) domainsStore.fetchConcepts(slug)
  },
  { immediate: true },
)

const relatedConcepts = computed<ConceptSummary[]>(() => {
  const siblings = domainsStore.conceptsBySlug[props.domainSlug] ?? []
  const exclude = new Set<string>([
    props.concept.slug,
    ...props.concept.prerequisites.map((p) => p.slug),
    ...props.concept.next_steps.map((n) => n.slug),
  ])
  return siblings.filter((c) => !exclude.has(c.slug)).slice(0, 6)
})

const isRead = computed(() => library.isRead(props.concept.slug))
const isBookmarked = computed(() => library.isBookmarked(props.concept.slug))

function toggleRead() {
  library.toggleRead(props.concept.slug)
}

function toggleBookmark() {
  library.toggleBookmark({
    slug: props.concept.slug,
    title: props.concept.title,
    brief_summary: props.concept.brief_summary,
    difficulty_level: props.concept.difficulty_level,
    domain_slug: props.domainSlug,
    domain_name: props.domainName,
  })
}

function chipClass(_c: ConceptSummary) {
  return 'inline-flex items-center rounded-full border border-slate-200 bg-white px-3 py-1 text-xs font-medium text-slate-700 transition hover:border-sky-400 hover:text-sky-700 dark:border-white/10 dark:bg-white/5 dark:text-slate-300 dark:hover:border-sky-400/60 dark:hover:text-sky-300'
}

function onBackdropClick(e: MouseEvent) {
  if (e.target === e.currentTarget) emit('close')
}
</script>

<template>
  <!-- Mobile: full-viewport sheet so users get every pixel for content; the
       backdrop and rounded card return at sm and up. -->
  <div
    class="fixed inset-0 z-50 flex items-stretch justify-center overflow-y-auto bg-slate-900/50 backdrop-blur-sm dark:bg-black/70 sm:items-start sm:p-4 md:p-10"
    @click="onBackdropClick"
  >
    <div class="relative flex min-h-full w-full max-w-3xl flex-col bg-white shadow-xl dark:bg-slate-900 dark:shadow-black/40 sm:min-h-0 sm:rounded-2xl sm:dark:border sm:dark:border-white/10">
      <!-- Sticky close bar on mobile so the X is always reachable while
           scrolling long concepts; collapses to a corner button on sm+. -->
      <div class="sticky top-0 z-10 flex items-center justify-end border-b border-slate-100 bg-white/95 px-4 py-2 backdrop-blur dark:border-white/10 dark:bg-slate-900/95 sm:static sm:border-0 sm:bg-transparent sm:p-0 sm:backdrop-blur-none">
        <button
          type="button"
          class="inline-flex size-10 items-center justify-center rounded-full text-slate-600 transition hover:bg-slate-100 hover:text-slate-900 focus:outline-none focus-visible:ring-2 focus-visible:ring-sky-400 dark:text-slate-300 dark:hover:bg-white/10 dark:hover:text-slate-50 sm:absolute sm:end-4 sm:top-4 sm:size-9"
          :aria-label="t('concept.close')"
          @click="emit('close')"
        >
          <X class="size-5" :stroke-width="2.25" aria-hidden="true" />
        </button>
      </div>

      <div class="px-5 pb-8 pt-3 sm:p-6 md:p-8 sm:pt-6">
      <div class="flex flex-wrap items-center gap-2 pe-0 sm:gap-3 sm:pe-10">
        <h2 class="text-xl font-bold text-slate-800 dark:text-slate-100 sm:text-2xl md:text-3xl">{{ concept.title }}</h2>
        <DifficultyBadge :level="concept.difficulty_level" />
      </div>

      <div class="mt-4 flex flex-wrap items-center gap-2">
        <button
          type="button"
          :title="isRead ? t('concept.unread') : t('concept.read')"
          :aria-label="isRead ? t('concept.unread') : t('concept.read')"
          :aria-pressed="isRead"
          :class="[
            'inline-flex items-center gap-1.5 rounded-full border px-3 py-1.5 text-xs font-medium transition duration-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-300',
            isRead
              ? 'border-emerald-200 bg-emerald-50 text-emerald-700 hover:bg-emerald-100 dark:border-emerald-400/40 dark:bg-emerald-400/15 dark:text-emerald-300 dark:hover:bg-emerald-400/25'
              : 'border-slate-200 bg-white text-slate-600 hover:border-emerald-300 hover:text-emerald-700 dark:border-white/10 dark:bg-white/5 dark:text-slate-300 dark:hover:border-emerald-400/40 dark:hover:text-emerald-300',
          ]"
          @click="toggleRead"
        >
          <Check :class="['size-4 transition', isRead ? 'opacity-100' : 'opacity-60']" :stroke-width="2.5" aria-hidden="true" />
          <span>{{ isRead ? t('concept.read_done') : t('concept.read') }}</span>
        </button>

        <button
          type="button"
          :title="isBookmarked ? t('concept.remove_from_shelf') : t('concept.add_to_shelf')"
          :aria-label="isBookmarked ? t('concept.remove_from_shelf') : t('concept.add_to_shelf')"
          :aria-pressed="isBookmarked"
          :class="[
            'inline-flex items-center gap-1.5 rounded-full border px-3 py-1.5 text-xs font-medium transition duration-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-amber-300',
            isBookmarked
              ? 'border-amber-200 bg-amber-50 text-amber-700 hover:bg-amber-100 dark:border-amber-400/40 dark:bg-amber-400/15 dark:text-amber-300 dark:hover:bg-amber-400/25'
              : 'border-slate-200 bg-white text-slate-600 hover:border-amber-300 hover:text-amber-700 dark:border-white/10 dark:bg-white/5 dark:text-slate-300 dark:hover:border-amber-400/40 dark:hover:text-amber-300',
          ]"
          @click="toggleBookmark"
        >
          <Bookmark
            :class="['size-4 transition-transform duration-200', isBookmarked ? 'scale-110' : 'scale-100']"
            :stroke-width="2"
            :fill="isBookmarked ? 'currentColor' : 'none'"
            aria-hidden="true"
          />
          <span>{{ isBookmarked ? t('concept.saved') : t('concept.save_for_later') }}</span>
        </button>
      </div>

      <p v-if="concept.brief_summary" class="mt-4 text-sm leading-7 text-slate-700 dark:text-slate-300 sm:text-base sm:leading-8">
        {{ concept.brief_summary }}
      </p>

      <div v-if="concept.extended_content" class="mt-4">
        <button
          type="button"
          class="inline-flex items-center gap-1 text-sm font-medium text-sky-700 hover:underline dark:text-sky-300"
          :aria-expanded="showExtended"
          aria-controls="concept-extended-content"
          @click="showExtended = !showExtended"
        >
          <span>{{ showExtended ? t('concept.close_full_text') : t('concept.read_more') }}</span>
          <svg
            :class="['size-4 transition-transform duration-300 ease-out', showExtended ? 'rotate-180' : '']"
            viewBox="0 0 20 20"
            fill="currentColor"
            aria-hidden="true"
          >
            <path
              fill-rule="evenodd"
              d="M5.23 7.21a.75.75 0 011.06.02L10 11.06l3.71-3.83a.75.75 0 111.08 1.04l-4.25 4.39a.75.75 0 01-1.08 0L5.21 8.27a.75.75 0 01.02-1.06z"
              clip-rule="evenodd"
            />
          </svg>
        </button>
        <div
          id="concept-extended-content"
          :class="[
            'grid transition-[grid-template-rows] duration-300 ease-out',
            showExtended ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]',
          ]"
        >
          <div class="min-h-0 overflow-hidden">
            <div
              :class="[
                'mt-3 rounded-xl bg-slate-50 p-4 text-sm leading-8 text-slate-700 transition duration-300 ease-out dark:bg-white/5 dark:text-slate-300',
                showExtended ? 'translate-y-0 opacity-100' : '-translate-y-1 opacity-0',
              ]"
            >
              {{ concept.extended_content }}
            </div>
          </div>
        </div>
      </div>

      <section class="mt-6 border-t border-slate-200 pt-6 dark:border-white/10">
        <h3 class="mb-3 text-base font-bold text-slate-800 dark:text-slate-100">{{ t('concept.deep_dive') }}</h3>
        <ResourceList :resources="concept.resources" />
      </section>

      <section v-if="concept.prerequisites.length" class="mt-6">
        <h4 class="mb-2 text-sm font-semibold text-slate-700 dark:text-slate-300">{{ t('concept.prerequisites') }}</h4>
        <div class="flex flex-wrap gap-2">
          <button
            v-for="p in concept.prerequisites"
            :key="p.id"
            type="button"
            :class="chipClass(p)"
            @click="emit('navigate', p.slug)"
          >
            {{ p.title }}
          </button>
        </div>
      </section>

      <section v-if="concept.next_steps.length" class="mt-4">
        <h4 class="mb-2 text-sm font-semibold text-slate-700 dark:text-slate-300">{{ t('concept.next_steps') }}</h4>
        <div class="flex flex-wrap gap-2">
          <button
            v-for="n in concept.next_steps"
            :key="n.id"
            type="button"
            :class="chipClass(n)"
            @click="emit('navigate', n.slug)"
          >
            {{ n.title }} {{ forwardArrow }}
          </button>
        </div>
      </section>

      <section v-if="relatedConcepts.length" class="mt-4">
        <h4 class="mb-2 inline-flex items-center gap-1.5 text-sm font-semibold text-slate-700 dark:text-slate-300">
          <Sparkles class="size-3.5 text-fuchsia-500 dark:text-fuchsia-300" :stroke-width="2.5" aria-hidden="true" />
          {{ t('concept.related') }}
        </h4>
        <div class="flex flex-wrap gap-2">
          <button
            v-for="r in relatedConcepts"
            :key="r.id"
            type="button"
            :class="chipClass(r)"
            @click="emit('navigate', r.slug)"
          >
            {{ r.title }}
          </button>
        </div>
      </section>

      <!-- View count: bottom-start corner, muted so it reads as ambient
           metadata rather than competing with content. -->
      <div
        class="mt-8 flex items-center justify-start border-t border-slate-100 pt-4 text-xs text-slate-400 dark:border-white/10 dark:text-slate-500"
        :title="`${toPersianDigits(concept.views_count)} ${t('concept.views')}`"
      >
        <span class="inline-flex items-center gap-1.5">
          <Eye class="size-3.5" :stroke-width="2" aria-hidden="true" />
          <span class="font-medium tabular-nums">
            <span :key="concept.views_count" class="anim-count-pop inline-block">
              {{ toPersianDigits(concept.views_count) }}
            </span>
            <span class="ms-1">{{ t('concept.views') }}</span>
          </span>
        </span>
      </div>
      </div>
    </div>
  </div>
</template>
