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
import orders from './modules/orders'
import feedbacks from './modules/feedbacks'
import { createI18n } from 'vue-i18n'
import i18nMessages from '../i18n'
import { defaultLang } from '../config'

const i18n = createI18n({
    locale: defaultLang,
    messages: i18nMessages
})

const toast = useToast()

const state = {
}

const getters = {
}

const actions = {
}

const mutations = {
    setI18nLocale() {
        i18n.global.locale = defaultStore.state.language
    },
    setErrorMessage(state, payload = 'Unknown error') {
        this.commit('setI18nLocale')
        toast.error(i18n.global.t(payload))
    },
    setSuccessMessage(state, payload = 'Ok') {
        this.commit('setI18nLocale')

        if (typeof payload === 'object') {
            toast.success(payload.message, payload.options)
        } else {
            toast.success(i18n.global.t(payload))
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
        orders,
        sessions,
        products,
        wishlists,
        feedbacks,
        passwords,
        categories,
        defaultStore,
        registrations,
    },
})

export default store
