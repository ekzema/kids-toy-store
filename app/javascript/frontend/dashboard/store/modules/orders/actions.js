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
  async updateOrder({ commit }, data) {
    try {
      const response = await Orders.update(data.id, data.form)
      commit('setOrder', response.data)
      commit('setSuccessMessage', 'Order updated successfully')
    } catch (error) {
      commit('setErrorMessage')
    }
  },
  async fetchOrderDetailConstructor({ commit }, params) {
    try {
      const { data } = await Orders.detailConstructor(params)
      commit('setOrderDetailConstructor', data)
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
      commit('setSuccessMessage', 'The product has been removed from the order')
    } catch (error) {
      commit('setErrorMessage')
    }
  }
}

export default actions
