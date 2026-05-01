<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink, RouterView, useRoute } from 'vue-router'
import { Bookmark, Home, Moon, Sun } from 'lucide-vue-next'
import { storeToRefs } from 'pinia'
import { useI18n } from 'vue-i18n'
import { useLibraryStore } from '@/stores/library'
import { useThemeStore } from '@/stores/theme'
import { useLocaleStore } from '@/stores/locale'
import BackButton from '@/components/BackButton.vue'
import LanguageSwitcher from '@/components/LanguageSwitcher.vue'
import { toPersianDigits } from '@/lib/numerals'

const { t } = useI18n()
const route = useRoute()
const showBack = computed(() => route.name !== 'home')

const library = useLibraryStore()
const { bookmarks } = storeToRefs(library)
const bookmarkCount = computed(() => bookmarks.value.length)

const themeStore = useThemeStore()
const { isDark } = storeToRefs(themeStore)

// Touch the locale store at setup so the html lang/dir/font stay in sync
// with the active locale even before the user opens the switcher.
useLocaleStore()
</script>

<template>
  <div class="bg-canvas relative min-h-screen overflow-x-hidden">

    <header class="relative border-b border-white/60 bg-white/70 backdrop-blur dark:border-white/10 dark:bg-slate-900/70">
      <div class="mx-auto flex max-w-6xl items-center justify-between gap-3 px-4 py-3 sm:px-6 sm:py-4 sm:gap-4">
        <RouterLink
          to="/"
          class="min-w-0 truncate text-[13px] font-semibold leading-snug text-slate-800 transition-colors hover:text-sky-700 dark:text-slate-100 dark:hover:text-sky-300 sm:text-sm md:text-base"
        >
          <!-- Short label on phones, full motto on tablet+ to keep the header
               from wrapping or pushing the action buttons off-screen. -->
          <span class="sm:hidden">{{ t('app.motto_short') }}</span>
          <span class="hidden sm:inline">{{ t('app.motto_full') }}</span>
        </RouterLink>

        <nav class="flex shrink-0 items-center gap-2 md:gap-3">
          <RouterLink
            to="/my-shelf"
            active-class="!border-amber-200 !bg-amber-50 !text-amber-700 dark:!border-amber-400/40 dark:!bg-amber-400/10 dark:!text-amber-300"
            class="group relative hidden items-center gap-1.5 rounded-full border border-white/60 bg-white/70 px-3 py-1.5 text-xs font-medium text-slate-700 backdrop-blur-sm transition duration-200 hover:border-amber-200 hover:bg-amber-50 hover:text-amber-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-amber-300 dark:border-white/10 dark:bg-white/5 dark:text-slate-300 dark:hover:border-amber-400/30 dark:hover:bg-amber-400/10 dark:hover:text-amber-300 md:inline-flex md:text-sm"
            :title="t('nav.your_personal_shelf')"
          >
            <Bookmark
              class="size-4 text-slate-500 transition-transform duration-200 group-hover:scale-110 group-hover:text-amber-600 dark:text-slate-400 dark:group-hover:text-amber-300"
              :stroke-width="2.25"
              aria-hidden="true"
            />
            <span>{{ t('nav.my_shelf') }}</span>
            <span
              v-if="bookmarkCount > 0"
              class="inline-flex min-w-[1.25rem] items-center justify-center rounded-full bg-amber-100 px-1.5 py-0.5 text-[10px] font-bold leading-none text-amber-700 tabular-nums dark:bg-amber-400/20 dark:text-amber-200"
            >
              {{ toPersianDigits(bookmarkCount) }}
            </span>
          </RouterLink>

          <LanguageSwitcher />

          <button
            type="button"
            :title="isDark ? t('nav.switch_to_light') : t('nav.switch_to_dark')"
            :aria-label="isDark ? t('nav.switch_to_light') : t('nav.switch_to_dark')"
            :aria-pressed="isDark"
            class="group relative inline-flex size-10 items-center justify-center overflow-hidden rounded-full border border-white/60 bg-white/70 text-slate-600 backdrop-blur-sm transition duration-300 hover:border-sky-200 hover:bg-sky-50 hover:text-sky-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-sky-300 dark:border-white/10 dark:bg-white/5 dark:text-slate-300 dark:hover:border-indigo-400/30 dark:hover:bg-indigo-400/10 dark:hover:text-indigo-200 sm:size-9"
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

    <main class="mx-auto max-w-6xl px-4 pt-6 pb-28 sm:px-6 sm:pt-8 sm:pb-12 md:py-10">
      <div v-if="showBack" class="mb-5 flex justify-start sm:mb-6">
        <BackButton />
      </div>
      <RouterView />
    </main>

    <footer class="hidden border-t border-slate-200 bg-white py-6 text-center text-xs text-slate-400 dark:border-white/10 dark:bg-slate-900/50 dark:text-slate-500 md:block">
      {{ t('app.footer') }}
    </footer>

    <!-- Mobile bottom navigation: fixed at the viewport bottom on phones,
         hidden on md+ where the header nav handles the same routes.
         pb-[env(safe-area-inset-bottom)] keeps it clear of iOS home bar. -->
    <nav
      class="fixed inset-x-0 bottom-0 z-40 border-t border-white/60 bg-white/90 backdrop-blur-md dark:border-white/10 dark:bg-slate-900/90 md:hidden"
      style="padding-bottom: env(safe-area-inset-bottom)"
      :aria-label="t('nav.main_navigation')"
    >
      <ul class="mx-auto flex max-w-md items-stretch justify-around">
        <li class="flex-1">
          <RouterLink
            to="/"
            active-class="!text-sky-700 dark:!text-sky-300"
            :aria-label="t('nav.home')"
            class="flex flex-col items-center justify-center gap-1 py-2.5 text-[11px] font-medium text-slate-500 transition-colors hover:text-sky-700 dark:text-slate-400 dark:hover:text-sky-300"
          >
            <Home class="size-5" :stroke-width="2.25" aria-hidden="true" />
            <span>{{ t('nav.home') }}</span>
          </RouterLink>
        </li>
        <li class="flex-1">
          <RouterLink
            to="/my-shelf"
            active-class="!text-amber-700 dark:!text-amber-300"
            :aria-label="t('nav.my_shelf')"
            class="relative flex flex-col items-center justify-center gap-1 py-2.5 text-[11px] font-medium text-slate-500 transition-colors hover:text-amber-700 dark:text-slate-400 dark:hover:text-amber-300"
          >
            <span class="relative">
              <Bookmark class="size-5" :stroke-width="2.25" aria-hidden="true" />
              <span
                v-if="bookmarkCount > 0"
                class="absolute -end-2 -top-1.5 inline-flex min-w-[1rem] items-center justify-center rounded-full bg-amber-500 px-1 text-[9px] font-bold leading-none text-white tabular-nums shadow-sm dark:bg-amber-400 dark:text-amber-950"
              >
                {{ toPersianDigits(bookmarkCount) }}
              </span>
            </span>
            <span>{{ t('nav.my_shelf') }}</span>
          </RouterLink>
        </li>
      </ul>
    </nav>
  </div>
</template>
