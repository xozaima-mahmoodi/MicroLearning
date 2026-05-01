<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

const props = withDefaults(defineProps<{ message?: string }>(), { message: '' })
const { t } = useI18n()

const text = computed(() => props.message || t('loading.default'))
</script>

<template>
  <div
    class="anim-fade-in-up flex items-center justify-center py-16"
    role="status"
    aria-live="polite"
  >
    <div class="flex items-center gap-3">
      <span class="relative flex size-2.5">
        <span
          class="absolute inline-flex h-full w-full animate-ping rounded-full bg-sky-400 opacity-75 motion-reduce:animate-none"
          aria-hidden="true"
        />
        <span class="relative inline-flex size-2.5 rounded-full bg-sky-500" aria-hidden="true" />
      </span>
      <p class="animate-pulse text-base font-medium text-slate-500 motion-reduce:animate-none dark:text-slate-400 md:text-lg">
        {{ text }}
      </p>
    </div>
  </div>
</template>
