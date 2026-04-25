<script setup lang="ts">
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { Bookmark, BookmarkX, Check } from 'lucide-vue-next'
import { storeToRefs } from 'pinia'
import { useLibraryStore } from '@/stores/library'
import { toPersianDigits } from '@/lib/numerals'
import DifficultyBadge from '@/components/DifficultyBadge.vue'
import ActivityCalendar from '@/components/ActivityCalendar.vue'

const router = useRouter()
const library = useLibraryStore()
const { bookmarksSorted } = storeToRefs(library)

const stagger = (i: number) => `${i * 60}ms`

const totalCount = computed(() => bookmarksSorted.value.length)
const readInShelfCount = computed(() =>
  bookmarksSorted.value.reduce((n, b) => n + (library.isRead(b.slug) ? 1 : 0), 0),
)

function open(slug: string, domainSlug: string) {
  router.push({
    name: 'domain',
    params: { slug: domainSlug },
    query: { concept: slug },
  })
}

function remove(slug: string) {
  const entry = bookmarksSorted.value.find((b) => b.slug === slug)
  if (entry) {
    library.toggleBookmark({
      slug: entry.slug,
      title: entry.title,
      brief_summary: entry.brief_summary,
      difficulty_level: entry.difficulty_level,
      domain_slug: entry.domain_slug,
      domain_name: entry.domain_name,
    })
  }
}

function formatDate(ts: number): string {
  const d = new Date(ts)
  // Persian (Iran) locale gives a Jalali-friendly date string.
  return toPersianDigits(
    d.toLocaleDateString('fa-IR', { year: 'numeric', month: 'long', day: 'numeric' }),
  )
}
</script>

<template>
  <section>
    <div class="anim-fade-in-up mb-8 text-center md:mb-12 md:text-start">
      <div class="mb-3 inline-flex items-center justify-center gap-2 rounded-full border border-amber-200 bg-amber-50 px-3 py-1 text-xs font-semibold text-amber-700 dark:border-amber-400/40 dark:bg-amber-400/10 dark:text-amber-300">
        <Bookmark class="size-3.5" :stroke-width="2.5" :fill="'currentColor'" aria-hidden="true" />
        <span>قفسه‌ی شخصی شما</span>
      </div>
      <h1 class="text-3xl font-extrabold leading-tight tracking-tight text-slate-900 dark:text-slate-100 sm:text-4xl md:text-5xl">
        قفسه من
      </h1>
      <p class="mx-auto mt-3 max-w-2xl text-sm leading-7 text-slate-600 dark:text-slate-400 sm:text-base sm:leading-8 md:mx-0 md:text-lg">
        مفاهیمی که ذخیره کرده‌اید تا بعداً بازگردید و عمیق‌تر مطالعه کنید.
      </p>

      <div
        v-if="totalCount > 0"
        class="mt-6 flex flex-wrap items-center justify-center gap-3 text-sm text-slate-600 dark:text-slate-400 md:justify-start"
      >
        <span class="inline-flex items-center gap-1.5 rounded-full border border-slate-200 bg-white/70 px-3 py-1 font-medium backdrop-blur-sm dark:border-white/10 dark:bg-white/5 dark:text-slate-300">
          <Bookmark class="size-3.5 text-amber-600 dark:text-amber-300" :stroke-width="2.5" :fill="'currentColor'" aria-hidden="true" />
          {{ toPersianDigits(totalCount) }} مفهوم ذخیره‌شده
        </span>
        <span class="inline-flex items-center gap-1.5 rounded-full border border-emerald-200 bg-emerald-50 px-3 py-1 font-medium text-emerald-700 dark:border-emerald-400/40 dark:bg-emerald-400/10 dark:text-emerald-300">
          <Check class="size-3.5" :stroke-width="3" aria-hidden="true" />
          {{ toPersianDigits(readInShelfCount) }} از {{ toPersianDigits(totalCount) }} خوانده‌ شده
        </span>
      </div>
    </div>

    <!-- Activity heat map — shown whether or not bookmarks exist, since
         a user can mark concepts read without bookmarking. -->
    <div class="mb-8 md:mb-10">
      <ActivityCalendar />
    </div>

    <!-- Empty state -->
    <div
      v-if="totalCount === 0"
      class="anim-fade-in-up mx-auto max-w-md rounded-2xl border border-dashed border-amber-200 bg-amber-50/60 p-10 text-center backdrop-blur-sm dark:border-amber-400/30 dark:bg-amber-400/5"
    >
      <div class="mx-auto flex size-14 items-center justify-center rounded-full bg-amber-100 dark:bg-amber-400/15">
        <BookmarkX class="size-7 text-amber-600 dark:text-amber-300" :stroke-width="2" aria-hidden="true" />
      </div>
      <p class="mt-4 text-base font-semibold text-slate-700 dark:text-slate-200">قفسه‌ی شما خالی است</p>
      <p class="mt-1 text-sm leading-7 text-slate-500 dark:text-slate-400">
        روی آیکون <span class="inline-flex translate-y-0.5 px-0.5"><Bookmark class="size-3.5 text-amber-600 dark:text-amber-300" :stroke-width="2.5" /></span>
        کنار هر مفهوم بزنید تا اینجا ذخیره شود.
      </p>
      <RouterLink
        to="/"
        class="mt-5 inline-flex items-center gap-2 rounded-full bg-amber-500 px-4 py-2 text-sm font-semibold text-white shadow-sm transition hover:bg-amber-600 focus:outline-none focus:ring-2 focus:ring-amber-300 dark:bg-amber-500/90 dark:hover:bg-amber-500"
      >
        کاوش در دسته‌ها
      </RouterLink>
    </div>

    <!-- Bookmarked list -->
    <ul v-else class="grid gap-4 sm:gap-5 md:grid-cols-2 xl:grid-cols-3">
      <li
        v-for="(b, i) in bookmarksSorted"
        :key="b.slug"
        :style="{ animationDelay: stagger(i) }"
        :class="[
          'anim-fade-in-up group relative overflow-hidden rounded-2xl border bg-white shadow-sm transition duration-200 hover:-translate-y-0.5 hover:shadow-lg dark:bg-white/10 dark:shadow-black/30',
          library.isRead(b.slug)
            ? 'border-emerald-200 dark:border-emerald-400/30'
            : 'border-slate-200 hover:border-amber-300 dark:border-white/10 dark:hover:border-amber-400/40',
        ]"
      >
        <button
          type="button"
          :class="[
            'block w-full text-start transition focus:outline-none focus:ring-2 focus:ring-sky-400',
            library.isRead(b.slug) ? 'opacity-80' : 'opacity-100',
          ]"
          @click="open(b.slug, b.domain_slug)"
        >
          <div :class="['h-1.5 w-full', library.isRead(b.slug) ? 'bg-emerald-400' : 'bg-amber-400']" aria-hidden="true" />
          <div class="p-4 pe-14 sm:p-5">
            <div class="text-xs font-medium text-slate-500 dark:text-slate-400">
              {{ b.domain_name }}
            </div>
            <div class="mt-1 flex flex-wrap items-center gap-2">
              <h3 :class="['text-base font-bold transition-colors group-hover:text-sky-700 dark:group-hover:text-sky-300 sm:text-lg', library.isRead(b.slug) ? 'text-slate-600 dark:text-slate-400' : 'text-slate-800 dark:text-slate-100']">
                {{ b.title }}
              </h3>
              <DifficultyBadge :level="b.difficulty_level" />
              <span
                v-if="library.isRead(b.slug)"
                class="inline-flex items-center gap-1 rounded-full bg-emerald-50 px-2 py-0.5 text-[11px] font-medium text-emerald-700 dark:bg-emerald-400/15 dark:text-emerald-300 sm:text-xs"
              >
                <Check class="size-3" :stroke-width="3" aria-hidden="true" />
                خوانده‌ شد
              </span>
            </div>
            <p v-if="b.brief_summary" class="mt-2 text-xs leading-6 text-slate-600 dark:text-slate-400 sm:text-sm sm:leading-7">
              {{ b.brief_summary }}
            </p>
            <div class="mt-2 text-[11px] text-slate-400 dark:text-slate-500 sm:mt-3 sm:text-xs">
              ذخیره‌شده در {{ formatDate(b.saved_at) }}
            </div>
          </div>
        </button>

        <button
          type="button"
          title="حذف از ذخیره‌شده‌ها"
          aria-label="حذف از ذخیره‌شده‌ها"
          class="absolute end-2 top-2 inline-flex size-10 items-center justify-center rounded-full border border-amber-200 bg-amber-50 text-amber-600 transition duration-200 hover:bg-amber-100 hover:text-amber-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-amber-300 dark:border-amber-400/40 dark:bg-amber-400/15 dark:text-amber-300 dark:hover:bg-amber-400/25 sm:end-3 sm:top-3 sm:size-9"
          @click.stop="remove(b.slug)"
        >
          <Bookmark class="size-4" :stroke-width="2" :fill="'currentColor'" aria-hidden="true" />
        </button>
      </li>
    </ul>
  </section>
</template>
