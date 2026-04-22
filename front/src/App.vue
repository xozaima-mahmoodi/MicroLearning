<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <div class="min-h-screen bg-slate-50">
    <header class="border-b border-slate-200 bg-white">
      <div class="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
        <RouterLink to="/" class="text-xl font-bold text-slate-800 hover:text-sky-700">
          نقشه دانش علوم اجتماعی
        </RouterLink>
        <nav class="text-sm text-slate-500">یادگیری خرد و ساختاریافته</nav>
      </div>
    </header>

    <main class="mx-auto max-w-6xl px-6 py-10">
      <RouterView />
    </main>

    <footer class="border-t border-slate-200 bg-white py-6 text-center text-xs text-slate-400">
      ساخته شده برای یادگیری عمیق علوم اجتماعی
    </footer>
  </div>
</template>
