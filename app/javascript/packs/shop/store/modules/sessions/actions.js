import Sessions from '../../../api/sessions'

const actions = {
    async createSession({ commit }, data) {
        try {
            const response = await Sessions.create(data)
            commit('setUser', { admin: response.admin })
            commit('setSuccessMessage', 'Welcome')

            return response.data
        } catch (error) {
            throw error
        }
    },
    async deleteSession({ commit }, { id, options }) {
        try {
            return await Sessions.delete(id, options)
        } catch (error) {
            commit('setErrorMessage')
        }
    },
}
export default actions
