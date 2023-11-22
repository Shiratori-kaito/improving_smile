const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.jsx',
  ],
  theme: {
    extend: {
      backgroundImage: {
        'custom-bg': "url('capture.png')"
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
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
