import { createRouter, createWebHistory } from 'vue-router'
import MainIndex from '../views/main/Index'

const router = createRouter({
    history: createWebHistory(),
    routes: [
        { path: '/dashboard', component: MainIndex }
    ]
})

export default router
