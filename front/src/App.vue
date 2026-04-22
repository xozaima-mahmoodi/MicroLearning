<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink, RouterView, useRoute } from 'vue-router'
import BackButton from '@/components/BackButton.vue'

const route = useRoute()
const showBack = computed(() => route.name !== 'home')
</script>

<template>
  <div class="relative min-h-screen overflow-x-hidden bg-gradient-to-br from-slate-50 via-white to-blue-50">
    <!-- Soft decorative blobs add depth without competing with content. -->
    <div
      class="pointer-events-none absolute -top-32 -end-32 h-72 w-72 rounded-full bg-sky-200/40 blur-3xl"
      aria-hidden="true"
    />
    <div
      class="pointer-events-none absolute top-1/3 -start-40 h-80 w-80 rounded-full bg-violet-200/30 blur-3xl"
      aria-hidden="true"
    />

    <header class="relative border-b border-white/60 bg-white/70 backdrop-blur">
      <div class="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
        <RouterLink to="/" class="text-xl font-bold text-slate-800 transition-colors hover:text-sky-700">
          نقشه دانش علوم اجتماعی
        </RouterLink>
        <nav class="text-sm text-slate-500">یادگیری خرد و ساختاریافته</nav>
      </div>
    </header>

    <main class="mx-auto max-w-6xl px-6 py-10">
      <div v-if="showBack" class="mb-6 flex justify-start">
        <BackButton />
      </div>
      <RouterView />
    </main>

    <footer class="border-t border-slate-200 bg-white py-6 text-center text-xs text-slate-400">
      ساخته شده برای یادگیری عمیق علوم اجتماعی
    </footer>
  </div>
</template>
