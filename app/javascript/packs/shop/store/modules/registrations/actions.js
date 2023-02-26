import Registrations from '../../../api/registrations'

const actions = {
    async checkEmail({ commit }, params) {
        try {
            const { data } = await Registrations.check_email(params)
            return data
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async createRegistration({ commit }, data) {
        try {
            return await Registrations.create(data)
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async confirmationRegistration({ commit }, data) {
        try {
            return await Registrations.confirmation(data)
        } catch (error) {
            return error.response.data
        }
    }
}
export default actions
