import Categories from '../../../api/categories'

const actions = {
    async fetchCategories({ commit }, params) {
        try {
            const { data } = await Categories.get(params)
            commit('setCategories', data)
        } catch (error) {
            commit('setErrorMessage')
        }
    },
}
export default actions
