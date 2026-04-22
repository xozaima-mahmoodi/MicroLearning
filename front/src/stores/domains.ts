import { defineStore } from "pinia";
import { ref } from "vue";
import { getList, getOne } from "@/api/client";
import type { Domain, ConceptSummary } from "@/types";

export const useDomainsStore = defineStore("domains", () => {
  const list = ref<Domain[]>([]);
  const bySlug = ref<Record<string, Domain>>({});
  const conceptsBySlug = ref<Record<string, ConceptSummary[]>>({});
  const loading = ref(false);

  async function fetchAll() {
    if (list.value.length) return list.value;
    loading.value = true;
    try {
      list.value = await getList<Domain>("/domains");
      list.value.forEach((d) => (bySlug.value[d.slug] = d));
      return list.value;
    } finally {
      loading.value = false;
    }
  }

  async function fetchBySlug(slug: string) {
    if (bySlug.value[slug]) return bySlug.value[slug];
    const d = await getOne<Domain>(`/domains/${slug}`);
    bySlug.value[slug] = d;
    return d;
  }

  async function fetchConcepts(slug: string) {
    if (conceptsBySlug.value[slug]) return conceptsBySlug.value[slug];
    const cs = await getList<ConceptSummary>(`/domains/${slug}/concepts`);
    conceptsBySlug.value[slug] = cs;
    return cs;
  }

  return { list, bySlug, conceptsBySlug, loading, fetchAll, fetchBySlug, fetchConcepts };
});
