const mutations = {
  setOrders(state, payload) {
    state.orders = payload
  },
  setOrder(state, payload) {
    state.order = payload
  },
  clearOrder(state) {
    state.order = {}
  }
}

export default mutations
