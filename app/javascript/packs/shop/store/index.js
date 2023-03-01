import { createStore } from "vuex"
import { useToast } from 'vue-toastification'
import defaultStore from '../../store'
import registrations from './modules/registrations'
import sessions from './modules/sessions'

const toast = useToast()

const state = {
}

const getters = {
}

const mutations = {
    setErrorMessage(state, payload = 'Unknown error') {
        toast.error(payload)
    },
    setSuccessMessage(state, payload = 'Ok') {
        toast.success(payload)
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
