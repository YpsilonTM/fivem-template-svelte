/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {},
  plugins: [require('daisyui')],
  daisyui: {
    themes: [
      {
        worldz: {
          primary: '#91c745',
          secondary: '#6e38bb',
          accent: '#6e8b44',
          neutral: '#6b7280',
          'base-100': '#1f2937',
          'base-200': '#111827',
          'base-300': '#030712',
          info: '#5597ce',
          success: '#26c063',
          warning: '#d2b214',
          error: '#e55238',
        },
      },
    ],
  },
}
