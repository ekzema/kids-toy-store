import Sessions from '../../../api/sessions'

const actions = {
    async createSession({ commit }, data) {
        try {
            const response = await Sessions.create(data)
            commit('setUser', { admin: response.admin })
            commit('setSuccessMessage', 'Welcome')

            return response
        } catch (error) {
            if (error.response.status === 404) {
                commit('setErrorMessage', 'Invalid email or password.')
            } else {
                commit('setErrorMessage')
            }
            return error
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
