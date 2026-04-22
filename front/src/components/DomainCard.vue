<script setup lang="ts">
import { RouterLink } from 'vue-router'
import type { Domain } from '@/types'

defineProps<{ domain: Domain }>()
</script>

<template>
  <RouterLink
    :to="{ name: 'domain', params: { slug: domain.slug } }"
    class="group block rounded-2xl border border-slate-200 bg-white p-6 shadow-sm transition hover:border-sky-400 hover:shadow-md"
  >
    <h3 class="text-xl font-bold text-slate-800 group-hover:text-sky-700">
      {{ domain.name }}
    </h3>
    <p v-if="domain.description" class="mt-3 text-sm leading-7 text-slate-600">
      {{ domain.description }}
    </p>
    <div class="mt-4 text-xs font-medium text-sky-700 group-hover:underline">
      مشاهده مفاهیم ←
    </div>
  </RouterLink>
</template>
