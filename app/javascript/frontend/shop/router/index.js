import { createRouter, createWebHistory } from 'vue-router'
import * as guards from'./guards'
import ProductsIndex from '../views/products/Index'
import ProductsSearch from '../views/products/Search'
import ProductsShow from "../views/products/Show"
import AccountNew from '../views/account/New'
import AccountLogin from '../views/account/Login'
import AccountForgot from '../views/account/Forgot'
import AccountPassword from '../views/account/Password'
import AccountConfirmation from '../views/account/Confirmation'
import WishlistShow from '../views/wishlist/Show'
import CartShow from '../views/cart/Show'
import CheckoutShow from '../views/checkout/Show'
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
      name: 'WishlistShow',
      path: '/wishlist',
      component: WishlistShow
    },
    {
      name: 'CartShow',
      path: '/cart',
      component: CartShow
    },
    {
      name: 'CheckoutShow',
      path: '/checkout',
      component: CheckoutShow
    },
    {
      name: 'Category',
      path: '/:category/:subcategory?',
      component: ProductsIndex
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
