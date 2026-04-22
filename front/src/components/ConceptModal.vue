<script setup lang="ts">
import { ref, watch } from 'vue'
import type { Concept, ConceptSummary } from '@/types'
import DifficultyBadge from './DifficultyBadge.vue'
import ResourceList from './ResourceList.vue'

const props = defineProps<{ concept: Concept }>()
const emit = defineEmits<{
  (e: 'close'): void
  (e: 'navigate', slug: string): void
}>()

const showExtended = ref(false)

watch(() => props.concept.slug, () => { showExtended.value = false })

function chipClass(_c: ConceptSummary) {
  return 'inline-flex items-center rounded-full border border-slate-200 bg-white px-3 py-1 text-xs font-medium text-slate-700 transition hover:border-sky-400 hover:text-sky-700'
}

function onBackdropClick(e: MouseEvent) {
  if (e.target === e.currentTarget) emit('close')
}
</script>

<template>
  <div
    class="fixed inset-0 z-50 flex items-start justify-center overflow-y-auto bg-slate-900/50 p-4 backdrop-blur-sm md:p-10"
    @click="onBackdropClick"
  >
    <div class="relative w-full max-w-3xl rounded-2xl bg-white p-6 shadow-xl md:p-8">
      <button
        type="button"
        class="absolute end-4 top-4 inline-flex size-8 items-center justify-center rounded-full text-slate-500 hover:bg-slate-100 hover:text-slate-800"
        aria-label="بستن"
        @click="emit('close')"
      >
        ×
      </button>

      <div class="flex flex-wrap items-center gap-3">
        <h2 class="text-2xl font-bold text-slate-800">{{ concept.title }}</h2>
        <DifficultyBadge :level="concept.difficulty_level" />
      </div>

      <p v-if="concept.brief_summary" class="mt-4 text-base leading-8 text-slate-700">
        {{ concept.brief_summary }}
      </p>

      <div v-if="concept.extended_content" class="mt-4">
        <button
          type="button"
          class="inline-flex items-center gap-1 text-sm font-medium text-sky-700 hover:underline"
          :aria-expanded="showExtended"
          aria-controls="concept-extended-content"
          @click="showExtended = !showExtended"
        >
          <span>{{ showExtended ? 'بستن متن کامل' : 'بیشتر بخوانید' }}</span>
          <svg
            :class="['size-4 transition-transform duration-300 ease-out', showExtended ? 'rotate-180' : '']"
            viewBox="0 0 20 20"
            fill="currentColor"
            aria-hidden="true"
          >
            <path
              fill-rule="evenodd"
              d="M5.23 7.21a.75.75 0 011.06.02L10 11.06l3.71-3.83a.75.75 0 111.08 1.04l-4.25 4.39a.75.75 0 01-1.08 0L5.21 8.27a.75.75 0 01.02-1.06z"
              clip-rule="evenodd"
            />
          </svg>
        </button>
        <div
          id="concept-extended-content"
          :class="[
            'grid transition-[grid-template-rows] duration-300 ease-out',
            showExtended ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]',
          ]"
        >
          <div class="min-h-0 overflow-hidden">
            <div
              :class="[
                'mt-3 rounded-xl bg-slate-50 p-4 text-sm leading-8 text-slate-700 transition duration-300 ease-out',
                showExtended ? 'translate-y-0 opacity-100' : '-translate-y-1 opacity-0',
              ]"
            >
              {{ concept.extended_content }}
            </div>
          </div>
        </div>
      </div>

      <section class="mt-6 border-t border-slate-200 pt-6">
        <h3 class="mb-3 text-base font-bold text-slate-800">مطالعه عمیق</h3>
        <ResourceList :resources="concept.resources" />
      </section>

      <section v-if="concept.prerequisites.length" class="mt-6">
        <h4 class="mb-2 text-sm font-semibold text-slate-700">پیش‌نیازها</h4>
        <div class="flex flex-wrap gap-2">
          <button
            v-for="p in concept.prerequisites"
            :key="p.id"
            type="button"
            :class="chipClass(p)"
            @click="emit('navigate', p.slug)"
          >
            {{ p.title }}
          </button>
        </div>
      </section>

      <section v-if="concept.next_steps.length" class="mt-4">
        <h4 class="mb-2 text-sm font-semibold text-slate-700">گام‌های بعدی</h4>
        <div class="flex flex-wrap gap-2">
          <button
            v-for="n in concept.next_steps"
            :key="n.id"
            type="button"
            :class="chipClass(n)"
            @click="emit('navigate', n.slug)"
          >
            {{ n.title }} ←
          </button>
        </div>
      </section>
    </div>
  </div>
</template>
