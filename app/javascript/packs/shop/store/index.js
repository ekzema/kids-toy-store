import { createStore } from "vuex"
import defaultStore from '../../store'
import registrations from './modules/registrations'

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
        registrations
    },
})

export default store
