import { createRouter, createWebHistory } from 'vue-router'
import * as guards from'./guards'
import HomeIndex from '../views/home/Index'
import AccountNew from '../views/account/New.vue'
import AccountLogin from '../views/account/Login.vue'
import AccountForgot from '../views/account/Forgot.vue'
import AccountPassword from '../views/account/Password.vue'
import AccountConfirmation from '../views/account/Confirmation.vue'
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
      component: AccountNew,
      beforeEnter: guards.login
    },
    {
      name: 'AccountLogin',
      path: '/account/login',
      component: AccountLogin,
      beforeEnter: guards.login
    },
    {
      name: 'AccountForgot',
      path: '/account/forgot',
      component: AccountForgot,
      beforeEnter: guards.login
    },
    {
      name: 'AccountConfirmation',
      path: '/account/confirmation',
      component: AccountConfirmation
    },
    {
      name: 'AccountPassword',
      path: '/account/password',
      component: AccountPassword,
      beforeEnter: guards.login
    },
    {
      name: 'PageNotFound',
      path: '/:pathMatch(.*)*',
      component: PageNotFound
    }
  ]
})

export default router
