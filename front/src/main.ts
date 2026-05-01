import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { router } from '@/router'
import { i18n } from '@/i18n'

import '@fontsource/vazirmatn/400.css'
import '@fontsource/vazirmatn/500.css'
import '@fontsource/vazirmatn/700.css'
import '@fontsource/inter/400.css'
import '@fontsource/inter/500.css'
import '@fontsource/inter/700.css'
import '@/assets/styles/main.css'

import App from './App.vue'

createApp(App)
  .use(createPinia())
  .use(router)
  .use(i18n)
  .mount('#app')
