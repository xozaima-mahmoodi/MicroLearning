<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink } from 'vue-router'
import {
  Brain,
  Users,
  Landmark,
  TrendingUp,
  Globe,
  BookOpen,
  type LucideIcon,
} from 'lucide-vue-next'
import type { Domain } from '@/types'

const props = defineProps<{ domain: Domain }>()

const ICON_MAP: Record<string, LucideIcon> = {
  brain: Brain,
  users: Users,
  landmark: Landmark,
  'trending-up': TrendingUp,
  globe: Globe,
}

type Palette = { iconText: string; iconBg: string; border: string; ring: string }

const COLOR_MAP: Record<string, Palette> = {
  'violet-500':  { iconText: 'text-violet-600',  iconBg: 'bg-violet-50',  border: 'border-t-violet-500',  ring: 'ring-violet-100' },
  'sky-500':     { iconText: 'text-sky-600',     iconBg: 'bg-sky-50',     border: 'border-t-sky-500',     ring: 'ring-sky-100' },
  'rose-500':    { iconText: 'text-rose-600',    iconBg: 'bg-rose-50',    border: 'border-t-rose-500',    ring: 'ring-rose-100' },
  'emerald-500': { iconText: 'text-emerald-600', iconBg: 'bg-emerald-50', border: 'border-t-emerald-500', ring: 'ring-emerald-100' },
  'amber-500':   { iconText: 'text-amber-600',   iconBg: 'bg-amber-50',   border: 'border-t-amber-500',   ring: 'ring-amber-100' },
}

const FALLBACK: Palette = {
  iconText: 'text-slate-600',
  iconBg:   'bg-slate-100',
  border:   'border-t-slate-400',
  ring:     'ring-slate-100',
}

const palette = computed<Palette>(() =>
  (props.domain.color && COLOR_MAP[props.domain.color]) || FALLBACK,
)

const iconComponent = computed<LucideIcon>(() =>
  (props.domain.icon && ICON_MAP[props.domain.icon]) || BookOpen,
)
</script>

<template>
  <RouterLink
    :to="{ name: 'domain', params: { slug: domain.slug } }"
    :class="[
      'group block rounded-2xl border border-slate-200 border-t-4 bg-white p-6 shadow-sm transition duration-200 hover:-translate-y-0.5 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-sky-400',
      palette.border,
    ]"
  >
    <div class="flex items-start gap-4">
      <div
        :class="[
          'flex size-12 shrink-0 items-center justify-center rounded-xl ring-4 transition-transform duration-200 group-hover:scale-105',
          palette.iconBg,
          palette.ring,
        ]"
        aria-hidden="true"
      >
        <component :is="iconComponent" :class="['size-6', palette.iconText]" :stroke-width="2" />
      </div>

      <div class="min-w-0 flex-1">
        <h3 class="text-xl font-bold text-slate-800 transition-colors group-hover:text-sky-700">
          {{ domain.name }}
        </h3>
        <p v-if="domain.description" class="mt-2 text-sm leading-7 text-slate-600">
          {{ domain.description }}
        </p>
      </div>
    </div>

    <div class="mt-4 text-xs font-medium text-sky-700 opacity-0 transition-opacity duration-200 group-hover:opacity-100">
      مشاهده مفاهیم ←
    </div>
  </RouterLink>
</template>
