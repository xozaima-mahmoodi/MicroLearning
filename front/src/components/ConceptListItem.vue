<script setup lang="ts">
import { computed } from 'vue'
import { Bookmark, Check } from 'lucide-vue-next'
import type { ConceptSummary, DifficultyLevel } from '@/types'
import { useLibraryStore } from '@/stores/library'
import DifficultyBadge from './DifficultyBadge.vue'

const props = defineProps<{
  concept: ConceptSummary
  index: number
  domainSlug: string
  domainName: string
}>()
defineEmits<{ (e: 'open', slug: string): void }>()

type Tones = { node: string; ring: string; stripe: string }
const TONES: Record<DifficultyLevel, Tones> = {
  beginner:     { node: 'bg-emerald-500', ring: 'ring-emerald-100', stripe: 'bg-emerald-400' },
  intermediate: { node: 'bg-sky-500',     ring: 'ring-sky-100',     stripe: 'bg-sky-400' },
  advanced:     { node: 'bg-amber-500',   ring: 'ring-amber-100',   stripe: 'bg-amber-400' },
  expert:       { node: 'bg-rose-500',    ring: 'ring-rose-100',    stripe: 'bg-rose-400' },
}
const tones = computed<Tones>(() => TONES[props.concept.difficulty_level])

const library = useLibraryStore()
const isRead = computed(() => library.isRead(props.concept.slug))
const isBookmarked = computed(() => library.isBookmarked(props.concept.slug))

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
</script>

<template>
  <li class="relative grid grid-cols-[2rem_1fr] items-start gap-x-3 pb-6 last:pb-0 sm:grid-cols-[2.5rem_1fr] sm:gap-x-5 sm:pb-8">
    <!-- Timeline node -->
    <div class="relative z-10 flex justify-center pt-4 sm:pt-5">
      <div
        :class="[
          'flex size-8 items-center justify-center rounded-full text-xs font-bold text-white shadow-md ring-4 transition-transform sm:size-10 sm:text-sm',
          isRead ? 'bg-emerald-500 ring-emerald-100' : `${tones.node} ${tones.ring}`,
        ]"
      >
        <Check v-if="isRead" class="size-4 sm:size-5" :stroke-width="3" aria-hidden="true" />
        <span v-else>{{ index + 1 }}</span>
      </div>
    </div>

    <!-- Card -->
    <div
      :class="[
        'group relative overflow-hidden rounded-2xl border bg-white shadow-sm transition duration-200 hover:-translate-y-0.5 hover:shadow-lg dark:bg-white/10 dark:shadow-black/30',
        isRead
          ? 'border-emerald-200 dark:border-emerald-400/30'
          : 'border-slate-200 hover:border-slate-300 dark:border-white/10 dark:hover:border-white/20',
      ]"
    >
      <button
        type="button"
        :class="[
          'block w-full text-start transition focus:outline-none focus:ring-2 focus:ring-sky-400',
          isRead ? 'opacity-75' : 'opacity-100',
        ]"
        @click="$emit('open', concept.slug)"
      >
        <div :class="['h-1.5 w-full', isRead ? 'bg-emerald-400' : tones.stripe]" aria-hidden="true" />
        <div class="p-4 pe-14 sm:p-5">
          <div class="flex flex-wrap items-center gap-2">
            <h4 :class="['text-base font-bold transition-colors group-hover:text-sky-700 dark:group-hover:text-sky-300 sm:text-lg', isRead ? 'text-slate-600 dark:text-slate-400' : 'text-slate-800 dark:text-slate-100']">
              {{ concept.title }}
            </h4>
            <DifficultyBadge :level="concept.difficulty_level" />
            <span
              v-if="isRead"
              class="inline-flex items-center gap-1 rounded-full bg-emerald-50 px-2 py-0.5 text-[11px] font-medium text-emerald-700 dark:bg-emerald-400/15 dark:text-emerald-300 sm:text-xs"
              title="این مفهوم را خوانده‌اید"
            >
              <Check class="size-3" :stroke-width="3" aria-hidden="true" />
              خوانده‌ شد
            </span>
          </div>
          <p v-if="concept.brief_summary" class="mt-2 text-xs leading-6 text-slate-600 dark:text-slate-400 sm:text-sm sm:leading-7">
            {{ concept.brief_summary }}
          </p>
          <div class="mt-2 text-[11px] font-medium text-sky-700 opacity-100 transition-opacity duration-200 group-hover:opacity-100 dark:text-sky-300 sm:mt-3 sm:text-xs sm:opacity-0">
            جزئیات مفهوم ←
          </div>
        </div>
      </button>

      <button
        type="button"
        :title="isBookmarked ? 'حذف از ذخیره‌شده‌ها' : 'افزودن به ذخیره‌شده‌ها'"
        :aria-label="isBookmarked ? 'حذف از ذخیره‌شده‌ها' : 'افزودن به ذخیره‌شده‌ها'"
        :aria-pressed="isBookmarked"
        :class="[
          'absolute end-2 top-2 inline-flex size-10 items-center justify-center rounded-full border transition duration-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-amber-300 sm:end-3 sm:top-3 sm:size-9',
          isBookmarked
            ? 'border-amber-200 bg-amber-50 text-amber-600 hover:bg-amber-100 dark:border-amber-400/40 dark:bg-amber-400/15 dark:text-amber-300 dark:hover:bg-amber-400/25'
            : 'border-slate-200 bg-white text-slate-400 hover:border-amber-300 hover:text-amber-600 dark:border-white/10 dark:bg-white/5 dark:text-slate-400 dark:hover:border-amber-400/40 dark:hover:text-amber-300',
        ]"
        @click.stop="toggleBookmark"
      >
        <Bookmark
          :class="['size-4 transition-transform duration-200', isBookmarked ? 'scale-110' : 'scale-100']"
          :stroke-width="2"
          :fill="isBookmarked ? 'currentColor' : 'none'"
          aria-hidden="true"
        />
      </button>
    </div>
  </li>
</template>
