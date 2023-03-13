const mutations = {
    setBrands(state, payload) {
        state.brands = payload
    },
    clearBrands(state) {
        state.brands = []
    }
}

export default mutations
