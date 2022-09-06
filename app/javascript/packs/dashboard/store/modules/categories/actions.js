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
    async fetchParentCategories({ commit }) {
        try {
            const { data } = await Categories.parents()
            commit('setParentCategories', data)
        } catch (error) {
            console.log(error, 'error')
        }
    },
    async createCategory({ commit }, data) {
        try {
            return await Categories.create(data)
        } catch (error) {
            console.log(error, 'error')
        }
    },
    async deleteCategory({ commit }, id) {
        try {
            return await Categories.delete(id)
        } catch (error) {
            console.log(error, 'error')
        }
    }
}

export default actions
