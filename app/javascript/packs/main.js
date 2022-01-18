import { createApp } from 'vue'
import App from './App'
import router from './router/shop.js'
import store from './store/shop'
import'./assets/js/custom'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap'
import 'pe7-icon/dist/scss/pe-icon-7-stroke'
import 'font-awesome/css/font-awesome.css'
import '@popperjs/core'
import 'fancybox'
import 'aos'
import 'slicknav/dist/slicknav.min.css'
import 'swiper/swiper.min.css'
import 'slick-carousel/slick/slick.css'
import 'ionicons201/css/ionicons.min.css'
import './assets/css/style.css'

document.addEventListener('DOMContentLoaded', () => {
  createApp(App)
    .use(router, store)
    .mount('#app')
})
