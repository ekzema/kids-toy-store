import { createApp } from 'vue'
import App from './App'
import router from './router/index.js'
import store from './store'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap'
import 'pe7-icon/dist/scss/pe-icon-7-stroke'
import 'font-awesome/css/font-awesome.css'
import '@popperjs/core'
import 'fancybox/dist/css/jquery.fancybox.css'
import 'aos/dist/aos.css'
import 'slicknav/dist/slicknav.min.css'
import 'swiper/swiper.min.css'
import 'slick-carousel/slick/slick.css'
import 'ionicons201/css/ionicons.min.css'
import 'animate.css/animate.min.css'
import './assets/css/style.css'
import'./assets/js/custom'

document.addEventListener('DOMContentLoaded', () => {
  createApp(App)
    .use(router, store)
    .mount('#app')
})
