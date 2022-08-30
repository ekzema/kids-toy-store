const mutations = {
    setCategories (state, payload) {
        state.categories = payload
    },
    setParentCategories(state, payload) {
        state.parentCategories = payload
    }
}

export default mutations
