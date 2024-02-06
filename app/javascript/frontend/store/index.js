const state = {
    loader: false,
    previewLoader: false,
    user: null,
    footer: true
}

const getters = {
    loader: state => state.loader,
    user: state => state.user,
    footer: state => state.footer
}

const mutations = {
    setLoader(state, payload) {
        state.loader = payload
    },
    setFooter(state, payload) {
        state.footer = payload
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
    },
    hideFooter({ commit }) {
        commit('setFooter', false)
    },
    showFooter({ commit }) {
        commit('setFooter', true)
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}
