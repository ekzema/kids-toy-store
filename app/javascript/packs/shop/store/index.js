import { createStore } from "vuex"
import { useToast } from 'vue-toastification'
import defaultStore from '../../store'
import registrations from './modules/registrations'
import sessions from './modules/sessions'

const toast = useToast()

const state = {
    user: null
}

const getters = {
    user: state => state.user,
}

const mutations = {
    setUser(state, payload) {
        state.user = payload
    },
    setErrorMessage(state, payload = 'Unknown error') {
        toast.error(payload, {
            position: "top-right",
            maxToasts: 6
        })
    },
    setSuccessMessage(state, payload = 'Ok') {

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
