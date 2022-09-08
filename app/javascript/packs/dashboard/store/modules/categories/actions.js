import Categories from '../../../api/categories'

const actions = {
    async fetchCategories({ commit }, params) {
        try {
            const { data } = await Categories.get(params)
            commit('setCategories', data)
        } catch (error) {
            console.log(error, 'error')
        }
    },
    async fetchParentCategories({ commit }, params) {
        try {
            const { data } = await Categories.parents(params)
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
