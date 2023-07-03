import Orders from '../../../api/orders'
import CheckoutToast from '../../../views/checkout/components/CheckoutToast.vue'

const actions = {
  async createOrders({ commit }, data) {
    try {
      await Orders.create(data)

      const message = { component: CheckoutToast }
      const options = { position: "bottom-center", timeout: 10000, icon: "fa fa-check fa-2x" }

      commit('setSuccessMessage', { message, options })
    } catch (error) {
      commit('setErrorMessage')
    }
  }
}
export default actions
