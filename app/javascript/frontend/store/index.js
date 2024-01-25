const state = {
    loader: false,
    previewLoader: false,
    user: null
}

const getters = {
    loader: state => state.loader,
    previewLoader: state => state.previewLoader,
    user: state => state.user
}

const mutations = {
    setLoader(state, payload) {
        state.loader = payload
    },
    setPreviewLoader(state, payload) {
        state.previewLoader = payload
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
    showPreviewLoader({ commit }) {
        commit('setPreviewLoader', true)
    },
    hidePreviewLoader({ commit }) {
        commit('setPreviewLoader', false)
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
