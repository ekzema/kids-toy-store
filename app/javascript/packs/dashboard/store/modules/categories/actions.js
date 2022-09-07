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
    async updateCategory({ commit }, data) {
        try {
            return await Categories.update(data.id, data.form)
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
    },
    async fetchCategory({ commit }, id) {
        try {
            const { data } = await Categories.show(id)
            commit('setCategory', data)
        } catch (error) {
            console.log(error, 'error')
        }
    }
}

export default actions
