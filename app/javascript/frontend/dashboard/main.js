import { createApp } from 'vue'
import store from './store'
import App from './App'
import router from './router'
import vuetify from "./plugins/vuetify"
import './assets/css/style.css'

// eslint-disable-next-line no-undef
globalThis.__VUE_OPTIONS_API__ = true
// eslint-disable-next-line no-undef
globalThis.__VUE_PROD_DEVTOOLS__ = false

document.addEventListener('DOMContentLoaded', () => {
    createApp(App)
        .use(vuetify)
        .use(router)
        .use(store)
        .mount('#app')
})
