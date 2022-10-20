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
    async createProduct({ commit }, data) {
        try {
            await Products.create(data)
            commit('setSuccessMessage', 'Product created successfully')
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async updateProduct({ commit }, data) {
        try {
            const response = await Products.update(data.id, data.form)
            commit('setProduct', response.data)
            commit('setSuccessMessage', 'Product updated successfully')
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async deleteProduct({ commit }, id) {
        try {
            await Products.delete(id)
            commit('setSuccessMessage', 'Product deleted successfully')
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
    }
}

export default actions
