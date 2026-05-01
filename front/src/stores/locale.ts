import { defineStore } from "pinia";
import { computed, ref, watch } from "vue";
import { i18n, LOCALE_STORAGE_KEY, SUPPORTED_LOCALES, type Locale } from "@/i18n";
import { setNumeralLocale } from "@/lib/numerals";
import { useCategoriesStore } from "@/stores/categories";
import { useConceptsStore } from "@/stores/concepts";
import { useDomainsStore } from "@/stores/domains";

function applyDocument(locale: Locale) {
  if (typeof document === "undefined") return;
  const root = document.documentElement;
  root.lang = locale;
  root.dir = locale === "fa" ? "rtl" : "ltr";
}

export const useLocaleStore = defineStore("locale", () => {
  const current = ref<Locale>(i18n.global.locale.value as Locale);

  // Keep the document attributes, vue-i18n locale, and number formatter in
  // lock-step so a single setLocale() call updates everything the UI reads.
  function syncSideEffects(loc: Locale) {
    i18n.global.locale.value = loc;
    setNumeralLocale(loc);
    applyDocument(loc);
  }
  syncSideEffects(current.value);

  const isRtl = computed(() => current.value === "fa");

  watch(current, (loc) => {
    syncSideEffects(loc);
    // Drop the per-locale snapshots we have cached (titles, summaries) so
    // the next view fetches fresh data in the new locale.
    useCategoriesStore().reset();
    useConceptsStore().reset();
    useDomainsStore().reset();
    try {
      localStorage.setItem(LOCALE_STORAGE_KEY, loc);
    } catch {
      /* private mode / quota — non-fatal */
    }
  });

  if (typeof window !== "undefined") {
    window.addEventListener("storage", (e) => {
      if (e.key !== LOCALE_STORAGE_KEY) return;
      const next = e.newValue;
      if (next && (next === "fa" || next === "en") && next !== current.value) {
        current.value = next;
      }
    });
  }

  function setLocale(loc: Locale) {
    if (!SUPPORTED_LOCALES.includes(loc)) return;
    current.value = loc;
  }

  function toggle() {
    current.value = current.value === "fa" ? "en" : "fa";
  }

  return { current, isRtl, setLocale, toggle };
});
