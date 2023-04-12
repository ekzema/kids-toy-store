import LineItems from '../../../api/lineItems'

const actions = {
    async createLineItems({ commit }, payload) {
        try {
            const { data } = await LineItems.create(payload)
            console.log(data,'test')
            commit('setCart', data)
            commit('setSuccessMessage', 'Товар добавлен в корзину')

            return data
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}
export default actions
