<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink } from 'vue-router'
import { CheckCircle2 } from 'lucide-vue-next'
import type { Domain } from '@/types'
import { paletteFor, iconFor } from '@/lib/palette'
import { useConceptsStore } from '@/stores/concepts'
import { useLibraryStore } from '@/stores/library'
import { toPersianDigits } from '@/lib/numerals'

const props = defineProps<{
  domain: Domain
  categorySlug?: string | null
  index?: number
}>()

const linkTo = computed(() => ({
  name: 'domain' as const,
  params: { slug: props.domain.slug },
  query: props.categorySlug ? { from: props.categorySlug } : {},
}))

const palette = computed(() => paletteFor(props.domain.color))
const iconComponent = computed(() => iconFor(props.domain.icon))

const conceptsStore = useConceptsStore()
const library = useLibraryStore()

// Slug list for this domain — derived from the global search index that
// HomeView fetches once. Empty until the index lands; the progress block
// hides itself in that case so we don't render misleading "0 از 0".
const domainConceptSlugs = computed(() => {
  return conceptsStore.searchIndex
    .filter((c) => c.domain_slug === props.domain.slug)
    .map((c) => c.slug)
})

const totalConcepts = computed(() => domainConceptSlugs.value.length)
const readCount = computed(() =>
  domainConceptSlugs.value.reduce((n, s) => n + (library.isRead(s) ? 1 : 0), 0),
)
const progressPercent = computed(() =>
  totalConcepts.value === 0 ? 0 : Math.round((readCount.value / totalConcepts.value) * 100),
)
const isComplete = computed(() => totalConcepts.value > 0 && readCount.value === totalConcepts.value)

const animationDelay = computed(() => `${(props.index ?? 0) * 70}ms`)
</script>

<template>
  <RouterLink
    :to="linkTo"
    :style="{ animationDelay }"
    :class="[
      'anim-fade-in-up group block rounded-2xl border border-white/60 border-t-4 bg-white/70 p-6 shadow-md backdrop-blur-sm transition-all duration-300 ease-out hover:-translate-y-1 hover:scale-[1.02] hover:bg-white hover:shadow-xl focus:outline-none focus:ring-2 focus:ring-sky-400',
      palette.border,
      palette.glow,
    ]"
  >
    <div class="flex items-start gap-4">
      <div
        :class="[
          'flex size-14 shrink-0 items-center justify-center rounded-full ring-4 transition-transform duration-300 group-hover:scale-110',
          palette.iconBg,
          palette.ring,
        ]"
        aria-hidden="true"
      >
        <component :is="iconComponent" :class="['size-7', palette.iconText]" :stroke-width="2" />
      </div>

      <div class="min-w-0 flex-1">
        <h3
          :class="[
            'text-xl font-bold text-slate-800 transition-colors',
            palette.groupHoverAccent,
          ]"
        >
          {{ domain.name }}
        </h3>
        <p v-if="domain.description" class="mt-2 text-sm leading-7 text-slate-500">
          {{ domain.description }}
        </p>
      </div>
    </div>

    <div v-if="totalConcepts > 0" class="mt-5">
      <div class="flex items-center justify-between text-xs font-medium">
        <span :class="isComplete ? 'text-emerald-700' : 'text-slate-500'">
          <CheckCircle2 v-if="isComplete" class="me-1 inline size-3.5" :stroke-width="2.5" aria-hidden="true" />
          {{ toPersianDigits(readCount) }} از {{ toPersianDigits(totalConcepts) }} مفهوم خوانده شده
        </span>
        <span :class="['font-semibold tabular-nums', isComplete ? 'text-emerald-700' : palette.accentText]">
          {{ toPersianDigits(progressPercent) }}٪
        </span>
      </div>
      <div class="mt-2 h-1.5 w-full overflow-hidden rounded-full bg-slate-200/70">
        <div
          :class="[
            'h-full rounded-full transition-all duration-500 ease-out',
            isComplete ? 'bg-emerald-500' : palette.iconBgSolid,
          ]"
          :style="{ width: `${progressPercent}%` }"
          aria-hidden="true"
        />
      </div>
    </div>

    <div
      :class="[
        'mt-4 text-xs font-semibold opacity-0 transition-opacity duration-200 group-hover:opacity-100',
        palette.accentText,
      ]"
    >
      مشاهده مفاهیم ←
    </div>
  </RouterLink>
</template>
