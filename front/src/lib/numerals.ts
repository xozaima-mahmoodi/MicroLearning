const PERSIAN_DIGITS = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"];

export function toPersianDigits(n: number | string): string {
  return String(n).replace(/[0-9]/g, (d) => PERSIAN_DIGITS[Number(d)]);
}
