import { createStore } from "vuex"
import categories from './modules/categories'

const state = {
    loader: false,
}

const getters = {
    loader: state => state.loader
}

const mutations = {
    setLoader(state, payload) {
        state.loader = payload
    }
}

const actions = {
    showLoader({ commit }) {
        commit('setLoader', true)
    },
    hideLoader({ commit }) {
        commit('setLoader', false)
    },
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
