<script setup lang="ts">
import { computed } from 'vue'
import type { Resource, ResourceType } from '@/types'
import { RESOURCE_TYPE_LABELS_FA } from '@/types'

const props = defineProps<{ resources: Resource[] }>()

const grouped = computed(() => {
  const map: Partial<Record<ResourceType, Resource[]>> = {}
  for (const r of props.resources) {
    (map[r.resource_type] ||= []).push(r)
  }
  return map
})

const TYPE_ICON: Record<ResourceType, string> = {
  book: '📚',
  article: '📰',
  video: '🎬',
  course: '🎓',
  paper: '📄',
}
</script>

<template>
  <div v-if="resources.length === 0" class="text-sm text-slate-500 dark:text-slate-400">
    هنوز منبعی ثبت نشده است.
  </div>
  <div v-else class="space-y-4">
    <section v-for="(items, type) in grouped" :key="type">
      <h5 class="mb-2 text-sm font-semibold text-slate-700 dark:text-slate-300">
        <span class="me-2">{{ TYPE_ICON[type as ResourceType] }}</span>
        {{ RESOURCE_TYPE_LABELS_FA[type as ResourceType] }}
      </h5>
      <ul class="space-y-2">
        <li
          v-for="r in items"
          :key="r.id"
          class="rounded-lg border border-slate-200 bg-slate-50 p-3 dark:border-white/10 dark:bg-white/5"
        >
          <a
            :href="r.link"
            target="_blank"
            rel="noopener noreferrer"
            class="text-sm font-medium text-sky-700 hover:underline dark:text-sky-300"
          >
            {{ r.title }}
          </a>
          <div v-if="r.author" class="mt-1 text-xs text-slate-500 dark:text-slate-400">{{ r.author }}</div>
        </li>
      </ul>
    </section>
  </div>
</template>
