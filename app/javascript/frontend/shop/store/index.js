import { createStore } from "vuex"
import { useToast } from 'vue-toastification'
import sessions from './modules/sessions'
import passwords from "./modules/passwords"
import defaultStore from '../../store'
import registrations from './modules/registrations'
import categories from './modules/categories'
import products from './modules/products'
import wishlists from './modules/wishlists'
import users from './modules/users'
import carts from './modules/carts'

const toast = useToast()

const state = {
}

const getters = {
}

const actions = {
}


const mutations = {
    setErrorMessage(state, payload = 'Unknown error') {
        toast.error(payload)
    },
    setSuccessMessage(state, payload = 'Ok') {
        if (typeof payload === 'object') {
            toast.success(payload.message, payload.options)
        } else {
            toast.success(payload)
        }
    }
}

const store = createStore({
    state,
    getters,
    actions,
    mutations,
    modules: {
        carts,
        users,
        sessions,
        products,
        wishlists,
        passwords,
        categories,
        defaultStore,
        registrations,
    },
})

export default store
