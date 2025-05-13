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
import AccountMain from '../views/account/Main'
import AccountDashboard from '../views/account/Dashboard'
import OrdersIndex from '../views/account/orders/Index'
import OrdersShow from '../views/account/orders/Show'
import AccountDetails from '../views/account/AccountDetails'
import ContactShow from '../views/contact/Show'
import AboutShow from '../views/about/Show'
import PageNotFound from '../../errors/PageNotFound'

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
      component: CartShow,
      beforeEnter: guards.isCart
    },
    {
      name: 'CheckoutShow',
      path: '/checkout',
      component: CheckoutShow,
      beforeEnter: guards.isCart
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
      beforeEnter: guards.notLoggedIn
    },
    {
      name: 'AccountLogin',
      path: '/account/login',
      component: AccountLogin,
      beforeEnter: guards.notLoggedIn
    },
    {
      name: 'AccountForgot',
      path: '/account/forgot',
      component: AccountForgot,
      beforeEnter: guards.notLoggedIn
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
      beforeEnter: guards.notLoggedIn
    },
    {
      name: 'ContactShow',
      path: '/contact',
      component: ContactShow
    },
    {
      name: 'AboutShow',
      path: '/about',
      component: AboutShow
    },
    {
      name: 'AccountMain',
      path: '/account',
      component: AccountMain,
      beforeEnter: guards.login,
      children: [
        {
          name: 'AccountDashboard',
          path: '/account',
          component: AccountDashboard,
        },
        {
          name: 'OrdersIndex',
          path: 'orders',
          component: OrdersIndex
        },
        {
          name: 'OrdersShow',
          path: 'orders/:id',
          component: OrdersShow
        },
        {
          name: 'AccountDetails',
          path: 'details',
          component: AccountDetails
        }
      ],
    },
    {
      name: 'PageNotFound',
      path: '/:pathMatch(.*)*',
      component: PageNotFound
    }
  ]
})

export default router
