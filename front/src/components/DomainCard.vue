<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink } from 'vue-router'
import type { Domain } from '@/types'
import { paletteFor, iconFor } from '@/lib/palette'

const props = defineProps<{
  domain: Domain
  categorySlug?: string | null
  index?: number
}>()

const linkTo = computed(() => ({
  name: 'domain' as const,
  params: { slug: props.domain.slug },
  query: props.categorySlug ? { from: props.categorySlug } : {},
}))

const palette = computed(() => paletteFor(props.domain.color))
const iconComponent = computed(() => iconFor(props.domain.icon))

// Stagger each card ~70ms after the previous one so the grid cascades in.
const animationDelay = computed(() => `${(props.index ?? 0) * 70}ms`)
</script>

<template>
  <RouterLink
    :to="linkTo"
    :style="{ animationDelay }"
    :class="[
      'anim-fade-in-up group block rounded-2xl border border-white/60 border-t-4 bg-white/70 p-6 shadow-md backdrop-blur-sm transition-all duration-300 ease-out hover:-translate-y-1 hover:scale-[1.02] hover:bg-white hover:shadow-xl focus:outline-none focus:ring-2 focus:ring-sky-400',
      palette.border,
      palette.glow,
    ]"
  >
    <div class="flex items-start gap-4">
      <div
        :class="[
          'flex size-14 shrink-0 items-center justify-center rounded-full ring-4 transition-transform duration-300 group-hover:scale-110',
          palette.iconBg,
          palette.ring,
        ]"
        aria-hidden="true"
      >
        <component :is="iconComponent" :class="['size-7', palette.iconText]" :stroke-width="2" />
      </div>

      <div class="min-w-0 flex-1">
        <h3
          :class="[
            'text-xl font-bold text-slate-800 transition-colors',
            palette.groupHoverAccent,
          ]"
        >
          {{ domain.name }}
        </h3>
        <p v-if="domain.description" class="mt-2 text-sm leading-7 text-slate-500">
          {{ domain.description }}
        </p>
      </div>
    </div>

    <div
      :class="[
        'mt-5 text-xs font-semibold opacity-0 transition-opacity duration-200 group-hover:opacity-100',
        palette.accentText,
      ]"
    >
      مشاهده مفاهیم ←
    </div>
  </RouterLink>
</template>
