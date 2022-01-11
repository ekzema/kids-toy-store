import { createApp } from 'vue'
import App from './app'
import router from './router/shop.js'
import store from './store/shop'

document.addEventListener('DOMContentLoaded', () => {
  createApp(App)
    .use(router, store)
    .mount('#app')
})
