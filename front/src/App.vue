<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink, RouterView, useRoute } from 'vue-router'
import BackButton from '@/components/BackButton.vue'

const route = useRoute()
const showBack = computed(() => route.name !== 'home')
</script>

<template>
  <div class="bg-canvas relative min-h-screen overflow-x-hidden">

    <header class="relative border-b border-white/60 bg-white/70 backdrop-blur">
      <div class="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
        <RouterLink
          to="/"
          class="text-sm font-semibold leading-snug text-slate-800 transition-colors hover:text-sky-700 md:text-base"
        >
          یادگیری خرد؛ برای ذهنی که می‌خواهد کلان ببیند
        </RouterLink>
        <nav class="hidden text-xs text-slate-500 md:block md:text-sm">ساختاریافته بیاموز، عمیق درک کن</nav>
      </div>
    </header>

    <main class="mx-auto max-w-6xl px-6 py-10">
      <div v-if="showBack" class="mb-6 flex justify-start">
        <BackButton />
      </div>
      <RouterView />
    </main>

    <footer class="border-t border-slate-200 bg-white py-6 text-center text-xs text-slate-400">
      هوشمندانه‌تر بیاموز
    </footer>
  </div>
</template>
