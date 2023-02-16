import { createStore } from "vuex"
import defaultStore from '../../store'
import categories from './modules/categories'
import products from './modules/products'
import productImages from './modules/product_images'
import brands from './modules/brands'

const state = {
}

const getters = {
}

const mutations = {
}

const actions = {
}

const store = createStore({
    state,
    getters,
    mutations,
    actions,
    modules: {
        defaultStore,
        categories,
        products,
        productImages,
        brands
    }
})

export default store
