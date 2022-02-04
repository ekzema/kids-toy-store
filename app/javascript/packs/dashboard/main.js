import { createApp } from 'vue'
import App from './App'
import vuetify from "./plugins/vuetify"

document.addEventListener('DOMContentLoaded', () => {
    createApp(App)
        .use(vuetify)
        .mount('#app')
})
