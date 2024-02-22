const mutations = {
  setOrders (state, payload) {
    state.orders = payload
  },
  setOrder (state, payload) {
    state.order = payload
  },
  updateQuantityItem(state, { productId, quantity }) {
    const product = state.order.products.find(product => product.id === productId)
    if (product) product.quantity = quantity
  }
}

export default mutations
