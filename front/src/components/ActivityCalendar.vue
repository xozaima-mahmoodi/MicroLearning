<script setup lang="ts">
import { computed, onMounted, ref } from "vue";
import { storeToRefs } from "pinia";
import { Flame, BookOpenCheck, CalendarRange } from "lucide-vue-next";
import { useActivityStore } from "@/stores/activity";
import { toPersianDigits } from "@/lib/numerals";

const activity = useActivityStore();
const { summary, loading } = storeToRefs(activity);

onMounted(() => {
  if (!summary.value) activity.fetchSummary();
});

// 26 weeks ≈ last 6 months. Wide enough to feel substantive, narrow enough
// to fit a sidebar without horizontal scrolling on mid-size screens.
const WEEKS = 26;

// Persian short weekday labels (Saturday → Friday). Persian week starts
// on Saturday but JS Date.getDay() uses Sunday=0; we map below.
const WEEKDAY_LABELS = ["ش", "ی", "د", "س", "چ", "پ", "ج"];
// Persian month names; index 0..11 maps to Gregorian months. Even though
// the calendar is Gregorian under the hood, the labels are Persianized
// (not Jalali names) since we group cells by Gregorian month boundaries.
const MONTH_LABELS = [
  "ژانویه", "فوریه", "مارس", "آوریل", "مه", "ژوئن",
  "ژوئیه", "اوت", "سپتامبر", "اکتبر", "نوامبر", "دسامبر",
];

function startOfWeekSat(d: Date): Date {
  // Anchor each cell column to a Saturday (Persian week start).
  const x = new Date(d);
  x.setHours(0, 0, 0, 0);
  const dayFromSat = (x.getDay() + 1) % 7; // Sat=0, Sun=1, ..., Fri=6
  x.setDate(x.getDate() - dayFromSat);
  return x;
}

function isoDate(d: Date): string {
  // Local-time ISO date (avoids the UTC-shift bug from toISOString).
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  return `${y}-${m}-${day}`;
}

const countsByDate = computed<Record<string, number>>(() => {
  const map: Record<string, number> = {};
  for (const d of summary.value?.days ?? []) map[d.date] = d.count;
  return map;
});

interface Cell {
  date: Date;
  iso: string;
  count: number;
  inRange: boolean;
}

const grid = computed<Cell[][]>(() => {
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const lastColStart = startOfWeekSat(today); // Saturday of current week
  const firstColStart = new Date(lastColStart);
  firstColStart.setDate(firstColStart.getDate() - (WEEKS - 1) * 7);

  const cols: Cell[][] = [];
  for (let w = 0; w < WEEKS; w++) {
    const colStart = new Date(firstColStart);
    colStart.setDate(colStart.getDate() + w * 7);
    const col: Cell[] = [];
    for (let d = 0; d < 7; d++) {
      const cellDate = new Date(colStart);
      cellDate.setDate(cellDate.getDate() + d);
      const iso = isoDate(cellDate);
      col.push({
        date: cellDate,
        iso,
        count: countsByDate.value[iso] ?? 0,
        inRange: cellDate <= today,
      });
    }
    cols.push(col);
  }
  return cols;
});

// Compute month labels: place a label above each column where the month
// changes from the prior column. Index keyed by column position.
const monthLabelByCol = computed<Record<number, string>>(() => {
  const out: Record<number, string> = {};
  let prevMonth = -1;
  grid.value.forEach((col, i) => {
    const m = col[0].date.getMonth();
    if (m !== prevMonth) {
      out[i] = MONTH_LABELS[m];
      prevMonth = m;
    }
  });
  return out;
});

// 5-step intensity scale (0 = empty). Tailwind class strings appear
// literally so the JIT picks them up.
function intensityClass(count: number, inRange: boolean): string {
  if (!inRange) return "bg-transparent";
  if (count <= 0) return "bg-slate-200/70 dark:bg-white/5";
  if (count === 1) return "bg-emerald-200 dark:bg-emerald-500/30";
  if (count === 2) return "bg-emerald-400 dark:bg-emerald-500/55";
  if (count <= 4) return "bg-emerald-500 dark:bg-emerald-400/75";
  return "bg-emerald-600 dark:bg-emerald-300";
}

const tooltip = ref<{ x: number; y: number; text: string } | null>(null);
const wrapperRef = ref<HTMLDivElement | null>(null);

function tooltipText(cell: Cell): string {
  const dateStr = cell.date.toLocaleDateString("fa-IR", {
    year: "numeric",
    month: "long",
    day: "numeric",
  });
  const body = cell.count > 0
    ? `${toPersianDigits(cell.count)} مفهوم مطالعه‌شده`
    : "بدون فعالیت";
  return `${toPersianDigits(dateStr)} — ${body}`;
}

function showTip(cell: Cell, e: MouseEvent) {
  if (!cell.inRange) return;
  const rect = wrapperRef.value?.getBoundingClientRect();
  if (!rect) return;
  tooltip.value = {
    x: e.clientX - rect.left,
    y: e.clientY - rect.top,
    text: tooltipText(cell),
  };
}
function hideTip() { tooltip.value = null; }

const totalConcepts = computed(() => summary.value?.total_concepts ?? 0);
const longestStreak = computed(() => summary.value?.longest_streak ?? 0);
const currentStreak = computed(() => summary.value?.current_streak ?? 0);
const hasAnyActivity = computed(() => (summary.value?.days ?? []).length > 0);
</script>

<template>
  <section
    class="anim-fade-in-up rounded-2xl border border-slate-200 bg-white/80 p-5 shadow-sm backdrop-blur-sm dark:border-white/10 dark:bg-white/5 dark:shadow-black/30 md:p-6"
  >
    <header class="mb-5 flex flex-wrap items-center justify-between gap-3">
      <div class="flex items-center gap-2">
        <CalendarRange class="size-5 text-emerald-600 dark:text-emerald-300" :stroke-width="2" aria-hidden="true" />
        <h2 class="text-base font-bold text-slate-800 dark:text-slate-100 md:text-lg">
          تقویم فعالیت
        </h2>
      </div>
      <div class="flex flex-wrap items-center gap-2 text-xs">
        <span class="inline-flex items-center gap-1.5 rounded-full border border-emerald-200 bg-emerald-50 px-2.5 py-1 font-medium text-emerald-700 dark:border-emerald-400/40 dark:bg-emerald-400/10 dark:text-emerald-300">
          <BookOpenCheck class="size-3.5" :stroke-width="2.5" aria-hidden="true" />
          {{ toPersianDigits(totalConcepts) }} مفهوم مطالعه‌شده
        </span>
        <span class="inline-flex items-center gap-1.5 rounded-full border border-amber-200 bg-amber-50 px-2.5 py-1 font-medium text-amber-700 dark:border-amber-400/40 dark:bg-amber-400/10 dark:text-amber-300">
          <Flame class="size-3.5" :stroke-width="2.5" aria-hidden="true" />
          طولانی‌ترین زنجیره: {{ toPersianDigits(longestStreak) }} روز
        </span>
        <span
          v-if="currentStreak > 0"
          class="inline-flex items-center gap-1.5 rounded-full border border-orange-200 bg-orange-50 px-2.5 py-1 font-medium text-orange-700 dark:border-orange-400/40 dark:bg-orange-400/10 dark:text-orange-300"
        >
          زنجیره فعلی: {{ toPersianDigits(currentStreak) }} روز
        </span>
      </div>
    </header>

    <div v-if="loading && !summary" class="py-6 text-center text-sm text-slate-500 dark:text-slate-400">
      در حال بارگذاری…
    </div>

    <div
      v-else-if="!hasAnyActivity"
      class="rounded-xl border border-dashed border-slate-300 bg-slate-50/60 px-4 py-6 text-center text-sm text-slate-500 dark:border-white/15 dark:bg-white/5 dark:text-slate-400"
    >
      هنوز فعالیتی ثبت نشده است. مفهومی را به‌عنوان «خوانده‌شد» علامت بزنید تا اینجا نمایان شود.
    </div>

    <div v-else ref="wrapperRef" class="relative" dir="rtl">
      <div class="overflow-x-auto pb-1">
        <div class="inline-flex flex-col gap-2">
          <!-- Month label row -->
          <div class="flex gap-[3px] ps-7">
            <div
              v-for="(_, ci) in grid"
              :key="`m-${ci}`"
              class="h-3 w-[12px] text-[10px] leading-3 text-slate-500 dark:text-slate-400"
            >
              <span v-if="monthLabelByCol[ci]" class="inline-block whitespace-nowrap">
                {{ monthLabelByCol[ci] }}
              </span>
            </div>
          </div>

          <!-- Grid: weekday labels + 26 columns of 7 days -->
          <div class="flex gap-[3px]">
            <div class="flex flex-col gap-[3px] pe-1">
              <div
                v-for="(label, di) in WEEKDAY_LABELS"
                :key="`wd-${di}`"
                class="flex h-[12px] w-5 items-center justify-end text-[10px] leading-3 text-slate-400 dark:text-slate-500"
              >
                <!-- Show only Sun/Tue/Thu to keep the column tidy -->
                <span v-if="di % 2 === 1">{{ label }}</span>
              </div>
            </div>

            <div
              v-for="(col, ci) in grid"
              :key="`c-${ci}`"
              class="flex flex-col gap-[3px]"
            >
              <div
                v-for="cell in col"
                :key="cell.iso"
                :class="[
                  'size-3 rounded-[3px] transition-transform duration-150',
                  intensityClass(cell.count, cell.inRange),
                  cell.inRange ? 'cursor-pointer hover:scale-125 hover:ring-1 hover:ring-emerald-400 dark:hover:ring-emerald-300' : '',
                ]"
                :aria-label="cell.inRange ? tooltipText(cell) : undefined"
                role="img"
                @mouseenter="showTip(cell, $event)"
                @mousemove="showTip(cell, $event)"
                @mouseleave="hideTip"
              />
            </div>
          </div>

          <!-- Legend -->
          <div class="mt-1 flex items-center justify-end gap-2 text-[10px] text-slate-500 dark:text-slate-400">
            <span>کمتر</span>
            <span class="size-3 rounded-[3px] bg-slate-200/70 dark:bg-white/5" />
            <span class="size-3 rounded-[3px] bg-emerald-200 dark:bg-emerald-500/30" />
            <span class="size-3 rounded-[3px] bg-emerald-400 dark:bg-emerald-500/55" />
            <span class="size-3 rounded-[3px] bg-emerald-500 dark:bg-emerald-400/75" />
            <span class="size-3 rounded-[3px] bg-emerald-600 dark:bg-emerald-300" />
            <span>بیشتر</span>
          </div>
        </div>
      </div>

      <!-- Floating tooltip — pointer-events:none so it never eats hover. -->
      <div
        v-if="tooltip"
        :style="{ top: `${tooltip.y - 38}px`, insetInlineStart: `${tooltip.x + 12}px` }"
        class="pointer-events-none absolute z-10 rounded-md bg-slate-900 px-2 py-1 text-[11px] font-medium text-white shadow-lg dark:bg-slate-100 dark:text-slate-900"
      >
        {{ tooltip.text }}
      </div>
    </div>
  </section>
</template>
