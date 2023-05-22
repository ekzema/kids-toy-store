import LineItems from '../../../api/lineItems'
import Products from '../../../api/products'

const actions = {
    async createLineItems({ commit }, payload) {
        try {
            const { data } = await LineItems.create(payload)
            commit('setCart', data)

            return data
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async fetchCartProducts({ commit }, params) {
        try {
            const { data } = await Products.get(params)
            console.log(data,'test')
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}
export default actions
