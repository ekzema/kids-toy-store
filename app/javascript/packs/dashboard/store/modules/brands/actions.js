import Brands from '../../../api/brands'

const actions = {
    async fetchBrands({ commit }, params) {
        try {
            const { data } = await Brands.get(params)
            commit('setBrands', data)
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}

export default actions
