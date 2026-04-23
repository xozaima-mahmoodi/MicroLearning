<script setup lang="ts">
import { ref } from 'vue'
import { Search, X } from 'lucide-vue-next'

const model = defineModel<string>({ default: '' })

withDefaults(defineProps<{ placeholder?: string }>(), {
  placeholder: 'جستجو در دسته‌ها، حوزه‌ها و مفاهیم…',
})

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
      <Search class="size-5 text-slate-400" :stroke-width="2" aria-hidden="true" />
    </div>

    <input
      ref="inputRef"
      v-model="model"
      type="search"
      :placeholder="placeholder"
      :aria-label="placeholder"
      class="w-full rounded-2xl border border-white/60 bg-white/70 py-3.5 ps-12 pe-24 text-base text-slate-700 shadow-md backdrop-blur-md transition placeholder:text-slate-400 focus:border-sky-300 focus:bg-white focus:outline-none focus:ring-4 focus:ring-sky-200/60"
    >

    <div class="absolute inset-y-0 end-3 flex items-center gap-2">
      <button
        v-if="model"
        type="button"
        class="rounded-full p-1.5 text-slate-400 transition hover:bg-slate-100 hover:text-slate-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-sky-400"
        aria-label="پاک‌سازی جستجو"
        @click="clear"
      >
        <X class="size-4" :stroke-width="2.25" />
      </button>

      <kbd
        v-else
        class="hidden rounded-md border border-slate-200 bg-white/80 px-2 py-0.5 font-mono text-xs font-medium text-slate-500 shadow-sm md:inline"
        aria-hidden="true"
      >/</kbd>
    </div>
  </div>
</template>
