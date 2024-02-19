import { createStore } from "vuex"
import defaultStore from '../../store'
import categories from './modules/categories'
import products from './modules/products'
import productImages from './modules/product_images'
import brands from './modules/brands'
import orders from './modules/orders'

const state = {
    alert: {
        show: false,
        type: '',
        text: ''
    }
}

const getters = {
    alert: state => state.alert
}

const mutations = {
    resetAlert(state) {
        state.alert = { show: false, type: '', text: '' }
    },
    setErrorMessage(state, payload = 'Unknown error') {
        state.alert = { show: true, type: 'error', text: payload }
    },
    setSuccessMessage(state, payload = 'Ok') {
        state.alert = { show: true, type: 'success', text: payload }
    }
}

const actions = {
    resetAlert({commit}) {
        commit('resetAlert')
    }
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
        brands,
        orders
    }
})

export default store
