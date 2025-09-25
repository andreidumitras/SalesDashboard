/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        cardDark: "#00138D",
        cardLight: "#001DDD",
        textDark: "#000B53",
        textLight: "#00138D",
        buttonDark: "#0010BF",
        buttonLight: "#008BEF",
        websiteBg: "#00011A",
        sidebarDark: "#000119",
        sidebarLight: "#00067F",
      },
    },
  },
  plugins: [],
};