<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink, RouterView, useRoute } from 'vue-router'
import { Bookmark } from 'lucide-vue-next'
import { storeToRefs } from 'pinia'
import { useLibraryStore } from '@/stores/library'
import BackButton from '@/components/BackButton.vue'
import { toPersianDigits } from '@/lib/numerals'

const route = useRoute()
const showBack = computed(() => route.name !== 'home')

const library = useLibraryStore()
const { bookmarks } = storeToRefs(library)
const bookmarkCount = computed(() => bookmarks.value.length)
</script>

<template>
  <div class="bg-canvas relative min-h-screen overflow-x-hidden">

    <header class="relative border-b border-white/60 bg-white/70 backdrop-blur">
      <div class="mx-auto flex max-w-6xl items-center justify-between gap-4 px-6 py-4">
        <RouterLink
          to="/"
          class="text-sm font-semibold leading-snug text-slate-800 transition-colors hover:text-sky-700 md:text-base"
        >
          یادگیری خرد؛ برای ذهنی که می‌خواهد کلان ببیند
        </RouterLink>

        <nav class="flex items-center gap-3">
          <RouterLink
            to="/my-shelf"
            active-class="!border-amber-200 !bg-amber-50 !text-amber-700"
            class="group relative inline-flex items-center gap-1.5 rounded-full border border-white/60 bg-white/70 px-3 py-1.5 text-xs font-medium text-slate-700 backdrop-blur-sm transition duration-200 hover:border-amber-200 hover:bg-amber-50 hover:text-amber-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-amber-300 md:text-sm"
            :title="'قفسه‌ی شخصی شما'"
          >
            <Bookmark
              class="size-4 text-slate-500 transition-transform duration-200 group-hover:scale-110 group-hover:text-amber-600"
              :stroke-width="2.25"
              aria-hidden="true"
            />
            <span>قفسه من</span>
            <span
              v-if="bookmarkCount > 0"
              class="inline-flex min-w-[1.25rem] items-center justify-center rounded-full bg-amber-100 px-1.5 py-0.5 text-[10px] font-bold leading-none text-amber-700 tabular-nums"
            >
              {{ toPersianDigits(bookmarkCount) }}
            </span>
          </RouterLink>
        </nav>
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
