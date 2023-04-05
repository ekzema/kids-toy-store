import { createApp } from 'vue'
import App from './App'
import router from './router/index.js'
import store from './store'
import Toast from "vue-toastification"
import "vue-toastification/dist/index.css"
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap'
import 'pe7-icon/dist/dist/pe-icon-7-stroke.min.css'
import 'font-awesome/css/font-awesome.css'
import '@popperjs/core'
import '@fancyapps/fancybox/dist/jquery.fancybox.min.css'
import 'aos/dist/aos.css'
import 'slicknav/dist/slicknav.min.css'
import 'swiper/css/swiper.min.css'
import 'slick-carousel/slick/slick.css'
import 'ionicons201/css/ionicons.min.css'
import 'animate.css/animate.min.css'
import './assets/css/style.css'
import'./assets/js/custom'

const toastConfig = {
  position: "top-right",
  maxToasts: 6,
  bodyClassName: ["font-size-class"],
  hideProgressBar: true
}

document.addEventListener('DOMContentLoaded', () => {
  createApp(App)
      .use(router)
      .use(store)
      .use(Toast, toastConfig)
      .mount('#app')
})
