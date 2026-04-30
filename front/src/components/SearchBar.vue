<script setup lang="ts">
import { computed, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import { Search, X } from 'lucide-vue-next'

const model = defineModel<string>({ default: '' })

const { t } = useI18n()

const props = withDefaults(defineProps<{ placeholder?: string }>(), { placeholder: '' })

const placeholderText = computed(() => props.placeholder || t('search.placeholder'))
const clearLabel = computed(() => t('search.clear'))

const inputRef = ref<HTMLInputElement | null>(null)

defineExpose({
  focus: () => inputRef.value?.focus(),
})

function clear() {
  model.value = ''
  inputRef.value?.focus()
}
</script>

<template>
  <div class="relative">
    <div class="pointer-events-none absolute inset-y-0 start-4 flex items-center">
      <Search class="size-5 text-slate-400 dark:text-slate-500" :stroke-width="2" aria-hidden="true" />
    </div>

    <input
      ref="inputRef"
      v-model="model"
      type="search"
      :placeholder="placeholderText"
      :aria-label="placeholderText"
      class="w-full rounded-2xl border border-white/60 bg-white/70 py-3 ps-11 pe-12 text-sm text-slate-700 shadow-md backdrop-blur-md transition placeholder:text-slate-400 focus:border-sky-300 focus:bg-white focus:outline-none focus:ring-4 focus:ring-sky-200/60 dark:border-white/10 dark:bg-white/5 dark:text-slate-100 dark:shadow-black/30 dark:placeholder:text-slate-500 dark:focus:border-sky-400/60 dark:focus:bg-white/10 dark:focus:ring-sky-500/20 sm:py-3.5 sm:ps-12 sm:pe-24 sm:text-base"
    >

    <div class="absolute inset-y-0 end-3 flex items-center gap-2">
      <button
        v-if="model"
        type="button"
        class="rounded-full p-1.5 text-slate-400 transition hover:bg-slate-100 hover:text-slate-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-sky-400 dark:text-slate-400 dark:hover:bg-white/10 dark:hover:text-slate-200"
        :aria-label="clearLabel"
        @click="clear"
      >
        <X class="size-4" :stroke-width="2.25" />
      </button>

      <kbd
        v-else
        class="hidden rounded-md border border-slate-200 bg-white/80 px-2 py-0.5 font-mono text-xs font-medium text-slate-500 shadow-sm dark:border-white/10 dark:bg-white/5 dark:text-slate-400 md:inline"
        aria-hidden="true"
      >/</kbd>
    </div>
  </div>
</template>
