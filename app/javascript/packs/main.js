import { createApp } from 'vue'
import App from './App'
import router from './router/shop.js'
import store from './store/shop'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap'
import 'pe7-icon/dist/scss/pe-icon-7-stroke'
import 'font-awesome/css/font-awesome.css'
import './assets/css/style.css'

document.addEventListener('DOMContentLoaded', () => {
  createApp(App)
    .use(router, store)
    .mount('#app')
})
