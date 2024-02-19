import { createRouter, createWebHistory } from 'vue-router'
import MainIndex from '../views/main/Index'
import PageNotFound from "../../errors/PageNotFound"
import CategoriesIndex from "../views/categories/Index"
import CategoriesNew from "../views/categories/New"
import CategoriesEdit from "../views/categories/Edit"
import ProductsIndex from "../views/products/Index"
import ProductsNew from "../views/products/New"
import ProductsEdit from "../views/products/Edit"
import Settings from "../views/settings/Index"
import Orders from "../views/orders/Index.vue"
import store from '../store'

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            name: 'MainIndex',
            path: '/dashboard',
            component: MainIndex
        },
        {
            name: 'CategoriesIndex',
            path: '/dashboard/categories',
            component: CategoriesIndex
        },
        {
            name: 'CategoriesNew',
            path: '/dashboard/categories/new',
            component: CategoriesNew
        },
        {
            name: 'CategoriesEdit',
            path: '/dashboard/categories/edit/:id',
            component: CategoriesEdit
        },
        {
            name: 'PageNotFound',
            path: '/:pathMatch(.*)*',
            component: PageNotFound
        },
        {
            name: 'ProductsIndex',
            path: '/dashboard/products',
            component: ProductsIndex
        },
        {
            name: 'ProductsNew',
            path: '/dashboard/products/new',
            component: ProductsNew
        },
        {
            name: 'ProductsEdit',
            path: '/dashboard/products/edit/:id',
            component: ProductsEdit
        },
        {
            name: 'Orders',
            path: '/dashboard/orders',
            component: Orders
        },
        {
            name: 'Settings',
            path: '/dashboard/settings',
            component: Settings
        }
    ]
})

router.beforeEach((to, from, next) => {
    const user = store.getters.user
    if (!user || !user.admin) {
        !user ? window.location.href = window.location.href = '/account/login' : window.location.href = '/'
    } else {
        next()
    }
})

export default router
