const state = {
    loader: false,
    user: null
}

const getters = {
    loader: state => state.loader,
    user: state => state.user
}

const mutations = {
    setLoader(state, payload) {
        state.loader = payload
    },
    setUser(state, payload) {
        state.user = payload
    },
    updateUser(state, payload) {
        state.user = { ...state.user, ...payload }
    }
}

const actions = {
    showLoader({ commit }) {
        commit('setLoader', true)
    },
    hideLoader({ commit }) {
        commit('setLoader', false)
    },
    clearUser({ commit }) {
        commit('setUser', null)
        delete localStorage.user
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}
