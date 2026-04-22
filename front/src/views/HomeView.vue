<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { storeToRefs } from 'pinia'
import { useRoute, useRouter } from 'vue-router'
import { useCategoriesStore } from '@/stores/categories'
import DomainCard from '@/components/DomainCard.vue'
import { ChevronDown } from 'lucide-vue-next'
import { paletteFor, iconFor } from '@/lib/palette'

const route = useRoute()
const router = useRouter()
const store = useCategoriesStore()
const { list, loading } = storeToRefs(store)

const expandedSlug = ref<string | null>(null)

function toggle(slug: string) {
  expandedSlug.value = expandedSlug.value === slug ? null : slug
  router.replace({
    query: expandedSlug.value ? { category: expandedSlug.value } : {},
  })
}

// Stagger-in delay for each category row; reused for domain cards inside a panel.
const stagger = (i: number) => `${i * 80}ms`

// Expose helpers to the template without needing per-item refs.
const paletteOf = computed(() => (color: string | null) => paletteFor(color))
const iconOf = computed(() => (name: string | null) => iconFor(name))

onMounted(async () => {
  await store.fetchAll()
  const fromQuery = typeof route.query.category === 'string' ? route.query.category : null
  const known = fromQuery && list.value.some((c) => c.slug === fromQuery)
  expandedSlug.value = known ? fromQuery : (list.value[0]?.slug ?? null)
})
</script>

<template>
  <section>
    <div class="mb-12 text-center md:mb-16 md:text-start">
      <h1 class="text-4xl font-extrabold leading-tight tracking-tight text-slate-900 md:text-6xl">
        نقشه دانش
      </h1>
      <p class="mx-auto mt-4 max-w-2xl text-base leading-8 text-slate-500 md:mx-0 md:text-lg">
        یک دسته را انتخاب کنید تا حوزه‌های آن آشکار شود و سپس از حوزه دلخواه، نقشه مفاهیم را دنبال کنید.
      </p>
    </div>

    <div v-if="loading && list.length === 0" class="text-slate-500">در حال بارگذاری…</div>

    <ul v-else class="space-y-6">
      <li
        v-for="(cat, i) in list"
        :key="cat.id"
        :style="{ animationDelay: stagger(i) }"
        :class="[
          'anim-fade-in-up overflow-hidden rounded-3xl border border-white/60 bg-white/70 shadow-md backdrop-blur-sm transition-shadow duration-300',
          expandedSlug === cat.slug ? 'shadow-xl' : '',
        ]"
      >
        <button
          type="button"
          class="group flex w-full items-center justify-between gap-5 px-6 py-6 text-start transition hover:bg-white/80 focus:outline-none focus:ring-2 focus:ring-sky-400 md:px-8 md:py-7"
          :aria-expanded="expandedSlug === cat.slug"
          :aria-controls="`category-panel-${cat.slug}`"
          @click="toggle(cat.slug)"
        >
          <div class="flex items-center gap-5">
            <div
              :class="[
                'flex size-16 shrink-0 items-center justify-center rounded-full ring-4 transition-transform duration-300 group-hover:scale-110',
                paletteOf(cat.color).iconBg,
                paletteOf(cat.color).ring,
              ]"
              aria-hidden="true"
            >
              <component
                :is="iconOf(cat.icon)"
                :class="['size-8', paletteOf(cat.color).iconText]"
                :stroke-width="2"
              />
            </div>

            <div class="flex flex-col">
              <h2
                :class="[
                  'text-2xl font-extrabold tracking-tight text-slate-900 transition-colors md:text-3xl',
                  paletteOf(cat.color).groupHoverAccent,
                ]"
              >
                {{ cat.title }}
              </h2>
              <span class="mt-1 text-sm text-slate-500">
                {{ cat.domains.length }} حوزه
              </span>
            </div>
          </div>

          <ChevronDown
            :class="[
              'size-7 shrink-0 text-slate-400 transition-transform duration-300 ease-out',
              expandedSlug === cat.slug ? 'rotate-180' : '',
              expandedSlug === cat.slug ? paletteOf(cat.color).iconText : '',
            ]"
            aria-hidden="true"
          />
        </button>

        <div
          :id="`category-panel-${cat.slug}`"
          :class="[
            'grid transition-[grid-template-rows] duration-300 ease-out',
            expandedSlug === cat.slug ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]',
          ]"
        >
          <div class="min-h-0 overflow-hidden">
            <div
              :class="[
                'border-t border-white/60 px-6 py-8 transition duration-300 ease-out md:px-8 md:py-10',
                expandedSlug === cat.slug ? 'translate-y-0 opacity-100' : '-translate-y-1 opacity-0',
              ]"
            >
              <div
                v-if="cat.domains.length === 0"
                class="rounded-2xl border border-dashed border-slate-300 bg-white/60 p-8 text-center text-slate-500"
              >
                هنوز حوزه‌ای در این دسته ثبت نشده است.
              </div>
              <div
                v-else
                class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3"
              >
                <DomainCard
                  v-for="(d, di) in cat.domains"
                  :key="d.id"
                  :domain="d"
                  :category-slug="cat.slug"
                  :index="di"
                />
              </div>
            </div>
          </div>
        </div>
      </li>
    </ul>

    <div
      v-if="!loading && list.length === 0"
      class="rounded-2xl border border-dashed border-slate-300 bg-white/60 p-8 text-center text-slate-500"
    >
      هنوز دسته‌ای ثبت نشده است.
    </div>
  </section>
</template>
