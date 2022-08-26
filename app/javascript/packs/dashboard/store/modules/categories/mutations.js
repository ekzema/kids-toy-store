const mutations = {
    setCategories (state, payload) {
        state.categories = payload
    },
    setParentCategories(state, payload) {
        state.prentCategories = payload
    }
}

export default mutations
