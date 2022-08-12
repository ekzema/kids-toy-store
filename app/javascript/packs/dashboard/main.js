import { createApp } from 'vue'
import store from './store'
import App from './App'
import router from './router'
import vuetify from "./plugins/vuetify"
import './assets/css/style.css'

document.addEventListener('DOMContentLoaded', () => {
    createApp(App)
        .use(vuetify)
        .use(router)
        .use(store)
        .mount('#app')
})
