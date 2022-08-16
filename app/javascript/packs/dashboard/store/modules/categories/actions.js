import Categories from '../../../api/categories'

const actions = {
    async fetchCategories({ commit }) {
        try {
            const response = await Categories.get()
            const { data } = response.data
            commit('setCategories', data)
        } catch (error) {
            console.log(error, 'error')
        }
    },
    // async createCategory({ commit }, data) {
    //     try {
    //         const response = await Categories.create(data)
    //     } catch (error) {
    //         // Handle error
    //     }
    // }
}

export default actions
