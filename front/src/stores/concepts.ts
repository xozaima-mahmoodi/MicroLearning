import { defineStore } from "pinia";
import { ref } from "vue";
import { getList, getOne } from "@/api/client";
import type { Concept, ConceptSearchHit } from "@/types";

export const useConceptsStore = defineStore("concepts", () => {
  const bySlug = ref<Record<string, Concept>>({});
  const searchIndex = ref<ConceptSearchHit[]>([]);
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

  async function fetchSearchIndex() {
    if (searchIndex.value.length) return searchIndex.value;
    searchIndex.value = await getList<Omit<ConceptSearchHit, "id">>("/concepts");
    return searchIndex.value;
  }

  return { bySlug, searchIndex, loading, fetchBySlug, fetchSearchIndex };
});
