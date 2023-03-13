const mutations = {
    setCategories (state, payload) {
        state.categories = payload
    },
    setParentCategories(state, payload) {
        state.parentCategories = payload
    },
    setCategory(state, payload) {
        state.category = payload
    }
}

export default mutations
