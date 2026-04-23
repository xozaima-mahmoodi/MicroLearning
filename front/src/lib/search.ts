// Persian text has well-known visual variants that should be treated as
// identical when searching. Without this, typing the Arabic ك would fail to
// match a Persian ک in the data, which surprises users.
export function normalize(input: string): string {
  return input
    .toLowerCase()
    .replace(/ي/g, "ی")  // Arabic ي → Persian ی
    .replace(/ك/g, "ک")  // Arabic ك → Persian ک
    .replace(/‌/g, " ")        // ZWNJ (half-space) → space
    .replace(/\s+/g, " ")
    .trim();
}

export function matches(haystack: string | null | undefined, needle: string): boolean {
  if (!haystack || !needle) return false;
  return normalize(haystack).includes(needle);
}
