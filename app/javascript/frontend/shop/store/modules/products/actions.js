import Products from '../../../api/products'

const actions = {
    async fetchProducts({ commit }, params) {
        try {
            const { data } = await Products.get(params)
            commit('setProducts', data)
        } catch (error) {
            commit('setErrorMessage')
        }
    },
}
export default actions
