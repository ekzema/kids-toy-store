const mutations = {
    setProducts (state, payload) {
        state.products = payload
    },
    setProduct(state, payload) {
        state.product = payload
    },
    setDetailConstructor(state, payload) {
        state.detailConstructor = payload
    }
}

export default mutations
