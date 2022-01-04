import { createApp } from 'vue'
import App from './app'
import router from './router/store.js'

document.addEventListener('DOMContentLoaded', () => {
    createApp(App)
        .use(router)
        .mount('#app')
})



