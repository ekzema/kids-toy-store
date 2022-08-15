import Conversation from '../../../api/categories'

const actions = {
    async fetchCategories({ commit }) {
        try {
            const response = await Conversation.get()
            const { data } = response.data
            commit('setCategories', data)
        } catch (error) {
            console.log(error, 'error')
        }
    }
}

export default actions
