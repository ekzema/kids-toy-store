import { createRouter, createWebHistory } from 'vue-router'
import HomeIndex from '../views/home/Index'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: HomeIndex }
  ]
})

export default router
