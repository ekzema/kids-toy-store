const state = {
    loader: false
}

const getters = {
    loader: state => state.loader,
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
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}
