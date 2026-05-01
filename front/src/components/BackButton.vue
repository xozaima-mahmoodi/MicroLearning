<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter, type LocationQueryRaw } from 'vue-router'
import { ArrowRight, ArrowLeft } from 'lucide-vue-next'
import { useI18n } from 'vue-i18n'
import { storeToRefs } from 'pinia'
import { useLocaleStore } from '@/stores/locale'

const props = withDefaults(defineProps<{ label?: string }>(), { label: '' })
const { t } = useI18n()
const { isRtl } = storeToRefs(useLocaleStore())

const labelText = computed(() => props.label || t('nav.back'))
// In RTL the right-pointing chevron visually leads back to the previous
// page; in LTR the left-pointing one does the same. Pick by direction.
const Icon = computed(() => (isRtl.value ? ArrowRight : ArrowLeft))

const route = useRoute()
const router = useRouter()

function goBack() {
  // 1. Modal-aware: if a concept modal is open, close it and stop.
  //    We `replace` so history isn't polluted with the pre-close URL.
  if (route.query.concept) {
    const { concept: _drop, ...rest } = route.query
    router.replace({ query: rest as LocationQueryRaw })
    return
  }

  // 2. Hierarchical: each named route knows its parent.
  //    Domain → Categories (carrying the originating category so
  //    the accordion restores the panel the user came from).
  if (route.name === 'domain') {
    const from = typeof route.query.from === 'string' ? route.query.from : null
    router.push({
      name: 'home',
      query: from ? { category: from } : {},
    })
    return
  }

  // My Shelf is a top-level destination — back goes home.
  if (route.name === 'my-shelf') {
    router.push({ name: 'home' })
    return
  }

  // Fallback (should not fire — button is hidden on home).
  router.push({ name: 'home' })
}
</script>

<template>
  <button
    type="button"
    :aria-label="labelText"
    class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-white px-4 py-2 text-sm font-medium text-slate-700 shadow-sm transition duration-200 hover:-translate-y-0.5 hover:border-sky-400 hover:bg-sky-50 hover:text-sky-700 focus:outline-none focus:ring-2 focus:ring-sky-400 dark:border-white/10 dark:bg-white/5 dark:text-slate-300 dark:shadow-black/30 dark:hover:border-sky-400/60 dark:hover:bg-sky-400/10 dark:hover:text-sky-300"
    @click="goBack"
  >
    <component :is="Icon" class="size-4" :stroke-width="2.25" aria-hidden="true" />
    <span>{{ labelText }}</span>
  </button>
</template>
