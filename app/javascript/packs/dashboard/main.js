import { createApp } from 'vue'
import App from './App'
import router from './router'
import vuetify from "./plugins/vuetify"

document.addEventListener('DOMContentLoaded', () => {
    createApp(App)
        .use(vuetify)
        .use(router)
        .mount('#app')
})
