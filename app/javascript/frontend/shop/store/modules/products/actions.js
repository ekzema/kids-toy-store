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
    async fetchProduct({ commit }, id) {
        try {
            const { data } = await Products.show(id)
            commit('setProduct', data)
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async productsAutocomplete({ commit }, params) {
        try {
            const { data } = await Products.autocomplete(params)
            commit('setProductsAutocomplete', data)
        } catch (error) {
            console.log('Unknown error')
        }
    }
}
export default actions
