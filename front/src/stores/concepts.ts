import { defineStore } from "pinia";
import { ref } from "vue";
import { getOne } from "@/api/client";
import type { Concept } from "@/types";

export const useConceptsStore = defineStore("concepts", () => {
  const bySlug = ref<Record<string, Concept>>({});
  const loading = ref(false);

  async function fetchBySlug(slug: string) {
    if (bySlug.value[slug]) return bySlug.value[slug];
    loading.value = true;
    try {
      const c = await getOne<Concept>(`/concepts/${slug}`);
      bySlug.value[slug] = c;
      return c;
    } finally {
      loading.value = false;
    }
  }

  return { bySlug, loading, fetchBySlug };
});
