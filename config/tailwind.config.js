const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.jsx',
  ],
  important: true,
  theme: {
    extend: {
      backgroundImage: {
        'custom-bg': "url('/assets/capture.png')"
      },
      animation: {
        'bg-slide': 'bg 10s infinite linear',
      },
      keyframes: {
        bg: {
          '0%': {
            backgroundPosition: '0 0',
          },
          '100%': {
            backgroundPosition: '360px -360px',
          },
        },
      },
      backgroundColor: {
        'custom-blue': '#3B82F6',
      },
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
