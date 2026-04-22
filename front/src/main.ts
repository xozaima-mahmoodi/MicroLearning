import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { router } from '@/router'

import '@fontsource/vazirmatn/400.css'
import '@fontsource/vazirmatn/500.css'
import '@fontsource/vazirmatn/700.css'
import '@/assets/styles/main.css'

import App from './App.vue'

createApp(App)
  .use(createPinia())
  .use(router)
  .mount('#app')
