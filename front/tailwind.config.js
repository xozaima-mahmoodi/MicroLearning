/** @type {import('tailwindcss').Config} */
export default {
  darkMode: "class",
  content: ["./index.html", "./src/**/*.{vue,ts,tsx,js,jsx}"],
  theme: {
    extend: {
      fontFamily: {
        // RTL/Persian face. Used as the default body font.
        vazir: ["Vazirmatn", "system-ui", "sans-serif"],
        // LTR/English face. Activated via `html[lang="en"] body { font-family ... }`
        // in main.css so the swap follows the document language without
        // touching every component.
        sans: ["Inter", "system-ui", "sans-serif"],
      },
    },
  },
  plugins: [],
}
