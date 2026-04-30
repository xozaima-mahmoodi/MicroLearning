import { defineStore } from "pinia";
import { ref } from "vue";
import { getList } from "@/api/client";
import type { Category } from "@/types";

export const useCategoriesStore = defineStore("categories", () => {
  const list = ref<Category[]>([]);
  const loading = ref(false);

  async function fetchAll() {
    if (list.value.length) return list.value;
    loading.value = true;
    try {
      list.value = await getList<Category>("/categories");
      return list.value;
    } finally {
      loading.value = false;
    }
  }

  function reset() {
    list.value = [];
    loading.value = false;
  }

  return { list, loading, fetchAll, reset };
});
