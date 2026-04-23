/** @type {import('tailwindcss').Config} */
export default {
  darkMode: "class",
  content: ["./index.html", "./src/**/*.{vue,ts,tsx,js,jsx}"],
  theme: {
    extend: {
      fontFamily: {
        vazir: ["Vazirmatn", "system-ui", "sans-serif"],
      },
    },
  },
  plugins: [],
}
