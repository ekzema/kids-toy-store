import ProductImages from '../../../api/product_images'

const actions = {
    async deleteProductImage({ commit }, id) {
        try {
            await ProductImages.delete(id)
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}

export default actions
