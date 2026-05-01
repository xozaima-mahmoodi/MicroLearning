import { createI18n } from "vue-i18n";
import en from "./locales/en.json";
import fa from "./locales/fa.json";

export type Locale = "fa" | "en";

export const SUPPORTED_LOCALES: readonly Locale[] = ["fa", "en"] as const;

const STORAGE_KEY = "ml.locale.v1";

function readStored(): Locale | null {
  try {
    const v = localStorage.getItem(STORAGE_KEY);
    return v === "fa" || v === "en" ? v : null;
  } catch {
    return null;
  }
}

// Resolves the initial locale at import time so the i18n instance and the
// document attributes (set by the inline bootstrap in index.html) stay in
// sync from the very first paint.
function initialLocale(): Locale {
  const stored = readStored();
  if (stored) return stored;
  if (typeof navigator !== "undefined") {
    const tag = navigator.language?.toLowerCase() ?? "fa";
    if (tag.startsWith("en")) return "en";
  }
  return "fa";
}

export const i18n = createI18n({
  legacy: false,
  globalInjection: true,
  locale: initialLocale(),
  fallbackLocale: "fa",
  messages: { en, fa },
});

export const LOCALE_STORAGE_KEY = STORAGE_KEY;
