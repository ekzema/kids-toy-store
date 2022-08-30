import { createStore } from "vuex"
import categories from './modules/categories'

const state = {
    loader: false,
}

const getters = {
    loader: state => state.loader
}

const mutations = {
    showLoader(state) {
        state.loader = true
    },
    hideLoader(state) {
        state.loader = false
    }
}

const store = createStore({
    state,
    getters,
    mutations,
    modules: {
        categories,
    },
});

export default store;
