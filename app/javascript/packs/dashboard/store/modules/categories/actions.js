import Categories from '../../../api/categories'

const actions = {
    async fetchCategories({ commit }) {
        try {
            const { data } = await Categories.get()
            commit('setCategories', data)
        } catch (error) {
            console.log(error, 'error')
        }
    },
    async createCategory({ commit }, data) {
        try {
            const response = await Categories.create(data)
        } catch (error) {
            console.log(error, 'error')
        }
    }
}

export default actions
