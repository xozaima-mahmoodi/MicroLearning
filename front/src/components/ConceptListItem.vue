<script setup lang="ts">
import { computed } from 'vue'
import type { ConceptSummary, DifficultyLevel } from '@/types'
import DifficultyBadge from './DifficultyBadge.vue'

const props = defineProps<{ concept: ConceptSummary; index: number }>()
defineEmits<{ (e: 'open', slug: string): void }>()

type Tones = { node: string; ring: string; stripe: string }
const TONES: Record<DifficultyLevel, Tones> = {
  beginner:     { node: 'bg-emerald-500', ring: 'ring-emerald-100', stripe: 'bg-emerald-400' },
  intermediate: { node: 'bg-sky-500',     ring: 'ring-sky-100',     stripe: 'bg-sky-400' },
  advanced:     { node: 'bg-amber-500',   ring: 'ring-amber-100',   stripe: 'bg-amber-400' },
  expert:       { node: 'bg-rose-500',    ring: 'ring-rose-100',    stripe: 'bg-rose-400' },
}
const tones = computed<Tones>(() => TONES[props.concept.difficulty_level])
</script>

<template>
  <li class="relative grid grid-cols-[2.5rem_1fr] items-start gap-x-5 pb-8 last:pb-0">
    <!-- Timeline node -->
    <div class="relative z-10 flex justify-center pt-5">
      <div
        :class="[
          'flex size-10 items-center justify-center rounded-full text-sm font-bold text-white shadow-md ring-4 transition-transform',
          tones.node,
          tones.ring,
        ]"
      >
        {{ index + 1 }}
      </div>
    </div>

    <!-- Card -->
    <button
      type="button"
      class="group block overflow-hidden rounded-2xl border border-slate-200 bg-white text-start shadow-sm transition duration-200 hover:-translate-y-0.5 hover:border-slate-300 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-sky-400"
      @click="$emit('open', concept.slug)"
    >
      <div :class="['h-1.5 w-full', tones.stripe]" aria-hidden="true" />
      <div class="p-5">
        <div class="flex flex-wrap items-center gap-2">
          <h4 class="text-lg font-bold text-slate-800 transition-colors group-hover:text-sky-700">
            {{ concept.title }}
          </h4>
          <DifficultyBadge :level="concept.difficulty_level" />
        </div>
        <p v-if="concept.brief_summary" class="mt-2 text-sm leading-7 text-slate-600">
          {{ concept.brief_summary }}
        </p>
        <div class="mt-3 text-xs font-medium text-sky-700 opacity-0 transition-opacity duration-200 group-hover:opacity-100">
          جزئیات مفهوم ←
        </div>
      </div>
    </button>
  </li>
</template>
