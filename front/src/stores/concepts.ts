import { defineStore } from "pinia";
import { ref } from "vue";
import { getList, getOne, postOne } from "@/api/client";
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

  async function recordView(slug: string) {
    // Optimistic bump so the number ticks immediately, then reconcile
    // with the authoritative count from the server.
    const cached = bySlug.value[slug];
    if (cached) {
      bySlug.value = { ...bySlug.value, [slug]: { ...cached, views_count: cached.views_count + 1 } };
    }
    try {
      const fresh = await postOne<Concept>(`/concepts/${slug}/view`);
      bySlug.value = { ...bySlug.value, [slug]: fresh };
      return fresh;
    } catch {
      // Roll back the optimistic bump if the request failed.
      if (cached) {
        bySlug.value = { ...bySlug.value, [slug]: cached };
      }
      return null;
    }
  }

  function reset() {
    bySlug.value = {};
    searchIndex.value = [];
    loading.value = false;
  }

  return { bySlug, searchIndex, loading, fetchBySlug, fetchSearchIndex, recordView, reset };
});
