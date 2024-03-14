import { createApp } from 'vue'
import App from './App'
import router from './router/index.js'
import store from './store'
import Toast from 'vue-toastification'
import { createI18n } from 'vue-i18n'
import i18n from './i18n'
import { defaultLang } from './config'
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
import './assets/js/custom'
import 'vue-awesome-paginate/dist/style.css'
import VueAwesomePaginate from 'vue-awesome-paginate'

const toastConfig = {
  position: "top-right",
  maxToasts: 6,
  bodyClassName: ["font-size-class"],
  hideProgressBar: true
}

const i18nConfig = createI18n({
  locale: defaultLang,
  messages: i18n,
});

document.addEventListener('DOMContentLoaded', () => {
  createApp(App)
      .use(router)
      .use(store)
      .use(VueAwesomePaginate)
      .use(Toast, toastConfig)
      .use(i18nConfig)
      .mount('#app')
})
