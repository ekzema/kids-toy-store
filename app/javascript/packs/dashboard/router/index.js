import { createRouter, createWebHistory } from 'vue-router'
import MainIndex from '../views/main/Index'
import PageNotFound from "../../errors/PageNotFound";
import CategoriesIndex from "../views/categories/Index";

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
            name: 'PageNotFound',
            path: '/:pathMatch(.*)*',
            component: PageNotFound
        }
    ]
})

export default router
