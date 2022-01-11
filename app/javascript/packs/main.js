import { createApp } from 'vue'
import App from './app'
import router from './router/shop.js'
import store from './store/shop'
import axios from 'axios'
import VueAxios from 'vue-axios'
// import VueI18n from 'vue-i18n'

document.addEventListener('DOMContentLoaded', () => {
    createApp(App)
        .use(router, store)
        .mount('#app')
})



