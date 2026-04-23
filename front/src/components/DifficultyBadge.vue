<script setup lang="ts">
import { computed } from 'vue'
import type { DifficultyLevel } from '@/types'
import { DIFFICULTY_LABELS_FA } from '@/types'

const props = defineProps<{ level: DifficultyLevel }>()

const classes = computed(() => {
  const base = 'inline-flex items-center rounded-full px-3 py-1 text-xs font-medium'
  switch (props.level) {
    case 'beginner':    return `${base} bg-emerald-100 text-emerald-800 dark:bg-emerald-400/15 dark:text-emerald-300`
    case 'intermediate': return `${base} bg-sky-100 text-sky-800 dark:bg-sky-400/15 dark:text-sky-300`
    case 'advanced':    return `${base} bg-amber-100 text-amber-800 dark:bg-amber-400/15 dark:text-amber-300`
    case 'expert':      return `${base} bg-rose-100 text-rose-800 dark:bg-rose-400/15 dark:text-rose-300`
    default:            return `${base} bg-slate-100 text-slate-700 dark:bg-white/10 dark:text-slate-300`
  }
})
</script>

<template>
  <span :class="classes">{{ DIFFICULTY_LABELS_FA[level] }}</span>
</template>
