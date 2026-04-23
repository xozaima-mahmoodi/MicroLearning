import { defineStore } from "pinia";
import { computed, ref, watch } from "vue";

export type Theme = "light" | "dark";

const STORAGE_KEY = "ml.theme.v1";

function readStored(): Theme | null {
  try {
    const v = localStorage.getItem(STORAGE_KEY);
    return v === "light" || v === "dark" ? v : null;
  } catch {
    return null;
  }
}

function systemPrefersDark(): boolean {
  if (typeof window === "undefined" || !window.matchMedia) return false;
  return window.matchMedia("(prefers-color-scheme: dark)").matches;
}

function applyTheme(t: Theme) {
  if (typeof document === "undefined") return;
  const root = document.documentElement;
  root.classList.toggle("dark", t === "dark");
  // color-scheme hints native form controls + scrollbars to match.
  root.style.colorScheme = t;
}

// Resolve the initial theme synchronously so the store never flashes
// the wrong class after Vue mounts. `index.html` also runs an inline
// bootstrap before Vue loads, but this is the canonical source of truth.
function initialTheme(): Theme {
  const stored = readStored();
  if (stored) return stored;
  return systemPrefersDark() ? "dark" : "light";
}

export const useThemeStore = defineStore("theme", () => {
  const theme = ref<Theme>(initialTheme());
  applyTheme(theme.value);

  const isDark = computed(() => theme.value === "dark");

  watch(theme, (t) => {
    applyTheme(t);
    try {
      localStorage.setItem(STORAGE_KEY, t);
    } catch {
      /* silent: privacy mode or quota */
    }
  });

  // Track the OS preference only while the user has NOT expressed a
  // preference — once they toggle, we stop deferring to the system.
  if (typeof window !== "undefined" && window.matchMedia) {
    const mq = window.matchMedia("(prefers-color-scheme: dark)");
    mq.addEventListener("change", (e) => {
      if (readStored()) return;
      theme.value = e.matches ? "dark" : "light";
    });
  }

  // Cross-tab sync.
  if (typeof window !== "undefined") {
    window.addEventListener("storage", (e) => {
      if (e.key !== STORAGE_KEY) return;
      const next = readStored();
      if (next && next !== theme.value) theme.value = next;
    });
  }

  function toggle() {
    theme.value = theme.value === "dark" ? "light" : "dark";
  }

  function setTheme(t: Theme) {
    theme.value = t;
  }

  return { theme, isDark, toggle, setTheme };
});
