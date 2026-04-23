<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink, RouterView, useRoute } from 'vue-router'
import { Bookmark, Moon, Sun } from 'lucide-vue-next'
import { storeToRefs } from 'pinia'
import { useLibraryStore } from '@/stores/library'
import { useThemeStore } from '@/stores/theme'
import BackButton from '@/components/BackButton.vue'
import { toPersianDigits } from '@/lib/numerals'

const route = useRoute()
const showBack = computed(() => route.name !== 'home')

const library = useLibraryStore()
const { bookmarks } = storeToRefs(library)
const bookmarkCount = computed(() => bookmarks.value.length)

const themeStore = useThemeStore()
const { isDark } = storeToRefs(themeStore)
</script>

<template>
  <div class="bg-canvas relative min-h-screen overflow-x-hidden">

    <header class="relative border-b border-white/60 bg-white/70 backdrop-blur dark:border-white/10 dark:bg-slate-900/70">
      <div class="mx-auto flex max-w-6xl items-center justify-between gap-4 px-6 py-4">
        <RouterLink
          to="/"
          class="text-sm font-semibold leading-snug text-slate-800 transition-colors hover:text-sky-700 dark:text-slate-100 dark:hover:text-sky-300 md:text-base"
        >
          یادگیری خرد؛ برای ذهنی که می‌خواهد کلان ببیند
        </RouterLink>

        <nav class="flex items-center gap-2 md:gap-3">
          <RouterLink
            to="/my-shelf"
            active-class="!border-amber-200 !bg-amber-50 !text-amber-700 dark:!border-amber-400/40 dark:!bg-amber-400/10 dark:!text-amber-300"
            class="group relative inline-flex items-center gap-1.5 rounded-full border border-white/60 bg-white/70 px-3 py-1.5 text-xs font-medium text-slate-700 backdrop-blur-sm transition duration-200 hover:border-amber-200 hover:bg-amber-50 hover:text-amber-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-amber-300 dark:border-white/10 dark:bg-white/5 dark:text-slate-300 dark:hover:border-amber-400/30 dark:hover:bg-amber-400/10 dark:hover:text-amber-300 md:text-sm"
            :title="'قفسه‌ی شخصی شما'"
          >
            <Bookmark
              class="size-4 text-slate-500 transition-transform duration-200 group-hover:scale-110 group-hover:text-amber-600 dark:text-slate-400 dark:group-hover:text-amber-300"
              :stroke-width="2.25"
              aria-hidden="true"
            />
            <span>قفسه من</span>
            <span
              v-if="bookmarkCount > 0"
              class="inline-flex min-w-[1.25rem] items-center justify-center rounded-full bg-amber-100 px-1.5 py-0.5 text-[10px] font-bold leading-none text-amber-700 tabular-nums dark:bg-amber-400/20 dark:text-amber-200"
            >
              {{ toPersianDigits(bookmarkCount) }}
            </span>
          </RouterLink>

          <button
            type="button"
            :title="isDark ? 'تغییر به حالت روشن' : 'تغییر به حالت شب'"
            :aria-label="isDark ? 'تغییر به حالت روشن' : 'تغییر به حالت شب'"
            :aria-pressed="isDark"
            class="group relative inline-flex size-9 items-center justify-center overflow-hidden rounded-full border border-white/60 bg-white/70 text-slate-600 backdrop-blur-sm transition duration-300 hover:border-sky-200 hover:bg-sky-50 hover:text-sky-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-sky-300 dark:border-white/10 dark:bg-white/5 dark:text-slate-300 dark:hover:border-indigo-400/30 dark:hover:bg-indigo-400/10 dark:hover:text-indigo-200"
            @click="themeStore.toggle"
          >
            <Sun
              :class="[
                'absolute size-4 transition-all duration-500 ease-out',
                isDark ? 'translate-y-3 rotate-90 opacity-0' : 'translate-y-0 rotate-0 opacity-100',
              ]"
              :stroke-width="2.25"
              aria-hidden="true"
            />
            <Moon
              :class="[
                'absolute size-4 transition-all duration-500 ease-out',
                isDark ? 'translate-y-0 rotate-0 opacity-100' : '-translate-y-3 -rotate-90 opacity-0',
              ]"
              :stroke-width="2.25"
              aria-hidden="true"
            />
          </button>
        </nav>
      </div>
    </header>

    <main class="mx-auto max-w-6xl px-6 py-10">
      <div v-if="showBack" class="mb-6 flex justify-start">
        <BackButton />
      </div>
      <RouterView />
    </main>

    <footer class="border-t border-slate-200 bg-white py-6 text-center text-xs text-slate-400 dark:border-white/10 dark:bg-slate-900/50 dark:text-slate-500">
      هوشمندانه‌تر بیاموز
    </footer>
  </div>
</template>
