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
  },
  removeFromOrder(state, payload) {
    state.order.products = state.order.products.filter(({ id }) => id !== payload)
  },
  setOrderDetailConstructor(state, payload) {
    state.orderDetailConstructor = payload
  }
}

export default mutations
