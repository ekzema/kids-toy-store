import Sessions from '../../../api/sessions'

const actions = {
    async createSession({ commit }, data) {
        try {
            const response = await Sessions.create(data)
            commit('setUser', { admin: response.admin })
            commit('setSuccessMessage', 'ACCOUNT.LOGIN.SUCCESS')

            return response.data
        } catch (error) {
            throw error
        }
    },
    async deleteSession({ commit }, { id, options }) {
        try {
            await Sessions.delete(id, options)
        } catch (error) {
            commit('setErrorMessage')
        }
    },
}
export default actions
