import { createRouter, createWebHistory } from 'vue-router'
import * as guards from'./guards'
import ProductsIndex from '../views/products/Index'
import ProductsSearch from '../views/products/Search'
import ProductsShow from "../views/products/Show"
import AccountsNew from '../views/accounts/New'
import AccountsLogin from '../views/accounts/Login'
import AccountsForgot from '../views/accounts/Forgot'
import AccountsPassword from '../views/accounts/Password'
import AccountsConfirmation from '../views/accounts/Confirmation'
import PageNotFound from "../../errors/PageNotFound"

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      name: 'ProductsIndex',
      path: '/',
      component: ProductsIndex
    },
    {
      name: 'ProductsSearch',
      path: '/search',
      component: ProductsSearch
    },
    {
      name: 'ProductsShow',
      path: '/product/:id',
      component: ProductsShow
    },
    {
      name: 'Category',
      path: '/:category/:subcategory?',
      component: ProductsIndex
    },
    {
      name: 'AccountsNew',
      path: '/accounts/new',
      component: AccountsNew,
      beforeEnter: guards.login
    },
    {
      name: 'AccountsLogin',
      path: '/accounts/login',
      component: AccountsLogin,
      beforeEnter: guards.login
    },
    {
      name: 'AccountsForgot',
      path: '/accounts/forgot',
      component: AccountsForgot,
      beforeEnter: guards.login
    },
    {
      name: 'AccountsConfirmation',
      path: '/accounts/confirmation',
      component: AccountsConfirmation
    },
    {
      name: 'AccountsPassword',
      path: '/accounts/password',
      component: AccountsPassword,
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
