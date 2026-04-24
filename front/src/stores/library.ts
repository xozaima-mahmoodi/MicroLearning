import { defineStore } from "pinia";
import { computed, ref, watch } from "vue";
import type { Concept } from "@/types";
import { useActivityStore } from "@/stores/activity";

export interface BookmarkEntry {
  slug: string;
  title: string;
  brief_summary: string | null;
  difficulty_level: Concept["difficulty_level"];
  domain_slug: string;
  domain_name: string;
  saved_at: number;
}

const READ_KEY = "ml.read.v1";
const BOOKMARKS_KEY = "ml.bookmarks.v1";

function loadReadSet(): Set<string> {
  try {
    const raw = localStorage.getItem(READ_KEY);
    if (!raw) return new Set();
    const parsed = JSON.parse(raw);
    return Array.isArray(parsed) ? new Set(parsed.filter((x) => typeof x === "string")) : new Set();
  } catch {
    return new Set();
  }
}

function loadBookmarks(): BookmarkEntry[] {
  try {
    const raw = localStorage.getItem(BOOKMARKS_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw);
    return Array.isArray(parsed) ? parsed : [];
  } catch {
    return [];
  }
}

export const useLibraryStore = defineStore("library", () => {
  const readSet = ref<Set<string>>(loadReadSet());
  const bookmarks = ref<BookmarkEntry[]>(loadBookmarks());

  watch(
    readSet,
    (s) => {
      try {
        localStorage.setItem(READ_KEY, JSON.stringify([...s]));
      } catch {
        /* quota or privacy mode — silent */
      }
    },
    { deep: true },
  );

  watch(
    bookmarks,
    (b) => {
      try {
        localStorage.setItem(BOOKMARKS_KEY, JSON.stringify(b));
      } catch {
        /* silent */
      }
    },
    { deep: true },
  );

  // Cross-tab sync: another tab toggling a bookmark or read flag should
  // be reflected here without requiring a refresh.
  if (typeof window !== "undefined") {
    window.addEventListener("storage", (e) => {
      if (e.key === READ_KEY) readSet.value = loadReadSet();
      else if (e.key === BOOKMARKS_KEY) bookmarks.value = loadBookmarks();
    });
  }

  function isRead(slug: string): boolean {
    return readSet.value.has(slug);
  }

  function toggleRead(slug: string) {
    // Replace the Set so Vue picks up the change — mutating in place
    // doesn't trigger the ref's reactivity.
    const next = new Set(readSet.value);
    const wasRead = next.has(slug);
    if (wasRead) next.delete(slug);
    else next.add(slug);
    readSet.value = next;

    // Only the unread → read transition counts as a study event. Un-marking
    // shouldn't retroactively erase activity history.
    if (!wasRead) {
      useActivityStore().recordRead(slug);
    }
  }

  function isBookmarked(slug: string): boolean {
    return bookmarks.value.some((b) => b.slug === slug);
  }

  function toggleBookmark(entry: Omit<BookmarkEntry, "saved_at">) {
    const idx = bookmarks.value.findIndex((b) => b.slug === entry.slug);
    if (idx >= 0) {
      bookmarks.value = bookmarks.value.filter((_, i) => i !== idx);
    } else {
      bookmarks.value = [{ ...entry, saved_at: Date.now() }, ...bookmarks.value];
    }
  }

  const bookmarksSorted = computed(() =>
    [...bookmarks.value].sort((a, b) => b.saved_at - a.saved_at),
  );

  return {
    readSet,
    bookmarks,
    bookmarksSorted,
    isRead,
    toggleRead,
    isBookmarked,
    toggleBookmark,
  };
});
