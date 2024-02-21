import Orders from '../../../api/orders'

const actions = {
  async fetchOrders({ commit }, params) {
    try {
      const { data, count } = await Orders.get(params)
      commit('setOrders', { items: data, count: count })
    } catch (error) {
      commit('setErrorMessage')
    }
  },
  async fetchOrder({ commit }, id) {
    try {
      const { data } = await Orders.show(id)
      commit('setOrder', data)
    } catch (error) {
      commit('setErrorMessage')
    }
  },
}

export default actions
