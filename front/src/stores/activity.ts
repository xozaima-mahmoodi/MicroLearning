import { defineStore } from "pinia";
import { ref } from "vue";
import { http } from "@/api/client";

export interface ActivityDay {
  date: string; // ISO YYYY-MM-DD
  count: number;
}

export interface ActivitySummary {
  range: { from: string; to: string };
  days: ActivityDay[];
  total_concepts: number;
  longest_streak: number;
  current_streak: number;
}

export const useActivityStore = defineStore("activity", () => {
  const summary = ref<ActivitySummary | null>(null);
  const loading = ref(false);

  async function fetchSummary(): Promise<void> {
    loading.value = true;
    try {
      const { data } = await http.get<ActivitySummary>("/activities");
      summary.value = data;
    } finally {
      loading.value = false;
    }
  }

  // Fire-and-forget: marking-as-read should never block the UI on a network
  // round trip. Errors are swallowed; the next fetchSummary will reconcile.
  async function recordRead(conceptSlug: string): Promise<void> {
    try {
      await http.post("/activities", { concept_slug: conceptSlug });
      // Optimistically bump today's bucket so the calendar updates without
      // a refetch. The next fetchSummary will provide authoritative state.
      const today = new Date().toISOString().slice(0, 10);
      if (!summary.value) return;
      const idx = summary.value.days.findIndex((d) => d.date === today);
      if (idx >= 0) {
        const next = [...summary.value.days];
        next[idx] = { ...next[idx], count: next[idx].count + 1 };
        summary.value = { ...summary.value, days: next };
      } else {
        summary.value = {
          ...summary.value,
          days: [...summary.value.days, { date: today, count: 1 }],
        };
      }
    } catch {
      /* silent — calendar will reconcile on next load */
    }
  }

  return { summary, loading, fetchSummary, recordRead };
});
