import Vue from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import App from '../app'

const router = createRouter({
    history: createWebHistory(),
    routes: [
            { path: '/', component: App }
        ]
})

export default router
