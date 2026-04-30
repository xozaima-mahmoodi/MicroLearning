const PERSIAN_DIGITS = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"];

// Module-level so every caller sees the active locale without having to
// import the Pinia store. The locale store updates this on locale change.
let activeLocale: "fa" | "en" = "fa";

export function setNumeralLocale(locale: "fa" | "en"): void {
  activeLocale = locale;
}

export function toPersianDigits(n: number | string): string {
  const s = String(n);
  if (activeLocale === "en") return s;
  return s.replace(/[0-9]/g, (d) => PERSIAN_DIGITS[Number(d)]);
}
