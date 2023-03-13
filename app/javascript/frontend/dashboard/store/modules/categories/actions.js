import Categories from '../../../api/categories'

const actions = {
    async fetchCategories({ commit }, params) {
        try {
            const { data, count } = await Categories.get(params)
            commit('setCategories', { items: data, count: count })
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async fetchParentCategories({ commit }, params) {
        try {
            const { data } = await Categories.parents(params)
            commit('setParentCategories', data)
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async createCategory({ commit }, data) {
        try {
            await Categories.create(data)
            commit('setSuccessMessage', 'Category created successfully')
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async updateCategory({ commit }, data) {
        try {
            await Categories.update(data.id, data.form)
            commit('setSuccessMessage', 'Category updated successfully')
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async deleteCategory({ commit }, id) {
        try {
            await Categories.delete(id)
            commit('setSuccessMessage', 'Category deleted successfully')
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async fetchCategory({ commit }, id) {
        try {
            const { data } = await Categories.show(id)
            commit('setCategory', data)
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}

export default actions
