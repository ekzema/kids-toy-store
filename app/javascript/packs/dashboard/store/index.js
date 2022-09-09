import { createStore } from "vuex"
import categories from './modules/categories'

const state = {
    loader: false,
    alert: {
        show: false,
        type: '',
        text: ''
    }
}

const getters = {
    loader: state => state.loader,
    alert: state => state.alert
}

const mutations = {
    setLoader(state, payload) {
        state.loader = payload
    },
    setErrorMessage(state, payload = 'Unknown error') {
        state.alert = { show: true, type: 'error', text: payload }
    },
    setSuccessMessage(state, payload = 'Ok') {
        state.alert = { show: true, type: 'success', text: payload }
    },
    resetAlert(state) {
        state.alert = { show: false, type: '', text: '' }
    }

}

const actions = {
    showLoader({ commit }) {
        commit('setLoader', true)
    },
    hideLoader({ commit }) {
        commit('setLoader', false)
    },
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
        categories,
    },
});

export default store;
