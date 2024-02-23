import Orders from '../../../api/orders'
import LineItems from '../../../api/lineItems'

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
  async updateLineItems({ commit }, data) {
    try {
      const { id, quantity } = data
      await LineItems.update(id, { quantity })
    } catch (error) {
      commit('setErrorMessage')
    }
  },
  async deleteLineItems({ commit }, { id, options }) {
    try {
      await LineItems.delete(id, options)
    } catch (error) {
      commit('setErrorMessage')
    }
  }
}

export default actions
