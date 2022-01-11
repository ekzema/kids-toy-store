import { createApp } from 'vue'
import App from './app'
import router from './router/shop.js'
import store from './store/shop'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap'

document.addEventListener('DOMContentLoaded', () => {
  createApp(App)
    .use(router, store)
    .mount('#app')
})
