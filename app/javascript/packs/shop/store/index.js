import { createStore } from "vuex"
import defaultStore from '../../store'
import registrations from './modules/registrations'
import sessions from './modules/sessions'

const state = {
    user: null
}

const getters = {
    user: state => state.user,
}

const mutations = {
    setUser(state, payload) {
        state.user = payload
    }
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
        registrations,
        sessions
    },
})

export default store
