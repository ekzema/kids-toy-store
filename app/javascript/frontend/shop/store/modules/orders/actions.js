import Orders from '../../../api/orders'
import CheckoutToast from '../../../views/checkout/components/CheckoutToast.vue'

const actions = {
  async createOrders({ commit }, data) {
    try {
      await Orders.create(data)

      const message = { component: CheckoutToast }
      const options = { position: "bottom-center", timeout: 10000, icon: "fa fa-check fa-2x" }

      commit('resetCart')
      commit('setSuccessMessage', { message, options })
    } catch (error) {
      commit('setErrorMessage')
    }
  },
  async fetchOrders({ commit, dispatch }, params) {
    try {
      if (!params.page) dispatch('hideFooter')
      const { data, count } = await Orders.get(params)
      commit('setOrders', { items: data, count })
    } catch (error) {
      commit('setErrorMessage')
    }
  },
  async fetchOrder({ commit, dispatch }, id) {
    try {
      commit('clearOrder')
      dispatch('hideFooter')

      const { data } = await Orders.show(id)
      commit('setOrder', data)
    } catch (error) {
      commit('setErrorMessage')
    }
  },
  async fetchDetailConstructor({ commit }, params) {
    try {
      const { data } = await Orders.detailConstructor(params)
      commit('setDetailConstructor', data)
    } catch (error) {
      commit('setErrorMessage')
    }
  }
}
export default actions
