import { createStore } from "vuex"
import { useToast } from 'vue-toastification'
import sessions from './modules/sessions'
import passwords from "./modules/passwords"
import defaultStore from '../../store'
import registrations from './modules/registrations'

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
        sessions,
        passwords,
        defaultStore,
        registrations,
    },
})

export default store
