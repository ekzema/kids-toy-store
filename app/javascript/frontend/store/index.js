const state = {
    loader: false,
    footer: true,
    user: null
}

const getters = {
    loader: state => state.loader,
    footer: state => state.footer,
    user: state => state.user
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
    showFooter({ commit }) {
        commit('setFooter', true)
    },
    hideFooter({ commit }) {
        commit('setFooter', false)
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
