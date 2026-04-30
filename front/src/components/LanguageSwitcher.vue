<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { storeToRefs } from 'pinia'
import { Languages } from 'lucide-vue-next'
import { useLocaleStore } from '@/stores/locale'

const { t } = useI18n()
const locale = useLocaleStore()
const { current } = storeToRefs(locale)

// Two-pill toggle: the inactive label is the action's effect ("switch to X"),
// the active one is shown for orientation. Keeping both labels visible avoids
// the ambiguity of a single-icon toggle in a bilingual UI.
const items = [
  { code: 'fa' as const, short: 'فا', long: 'فارسی' },
  { code: 'en' as const, short: 'EN', long: 'English' },
]

const ariaLabel = computed(() => t('nav.switch_language'))
</script>

<template>
  <div
    class="inline-flex items-center gap-0.5 rounded-full border border-white/60 bg-white/70 p-0.5 text-xs font-semibold text-slate-600 backdrop-blur-sm dark:border-white/10 dark:bg-white/5 dark:text-slate-300"
    role="group"
    :aria-label="ariaLabel"
  >
    <Languages class="ms-1.5 size-3.5 text-slate-400 dark:text-slate-500" :stroke-width="2.25" aria-hidden="true" />
    <button
      v-for="item in items"
      :key="item.code"
      type="button"
      :aria-pressed="current === item.code"
      :class="[
        'inline-flex items-center justify-center rounded-full px-2.5 py-1 leading-none transition duration-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-sky-300',
        current === item.code
          ? 'bg-sky-600 text-white shadow-sm dark:bg-sky-500'
          : 'text-slate-600 hover:text-sky-700 dark:text-slate-300 dark:hover:text-sky-300',
      ]"
      :title="item.long"
      @click="locale.setLocale(item.code)"
    >
      {{ item.short }}
    </button>
  </div>
</template>
