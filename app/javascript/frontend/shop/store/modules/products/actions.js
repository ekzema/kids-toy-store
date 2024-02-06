import Products from '../../../api/products'

const actions = {
    async fetchProducts({ commit, dispatch }, params) {
        dispatch('hideFooter')
        commit('clearProducts')
        try {
            const { data, count } = await Products.get(params)
            commit('setProducts', { items: data, count })
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async fetchProduct({ commit, dispatch }, id) {
        dispatch('hideFooter')
        try {
            const { data } = await Products.show(id)
            commit('setProduct', data)
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async productsAutocomplete({ commit }, params) {
        try {
            const { data, show, found } = await Products.autocomplete(params)
            commit('setProductsAutocomplete', { items: data, show, found })
        } catch (error) {
            console.log('Unknown error')
        }
    }
}
export default actions
