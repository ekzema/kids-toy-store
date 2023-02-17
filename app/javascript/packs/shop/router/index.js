import { createRouter, createWebHistory } from 'vue-router'
import HomeIndex from '../views/home/Index'
import AccountNew from '../views/account/New.vue'
import AccountLogin from '../views/account/Login.vue'
import PageNotFound from "../../errors/PageNotFound.vue"

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      name: 'HomeIndex',
      path: '/',
      component: HomeIndex
    },
    {
      name: 'AccountNew',
      path: '/account/new',
      component: AccountNew
    },
    {
      name: 'AccountLogin',
      path: '/account/login',
      component: AccountLogin
    },
    {
      name: 'PageNotFound',
      path: '/:pathMatch(.*)*',
      component: PageNotFound
    }
  ]
})

export default router
