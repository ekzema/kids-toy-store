import Registrations from '../../../api/registrations'

const actions = {
    async checkEmail({ commit }, params) {
        try {
            const { data } = await Registrations.check_email(params)
            return data
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}

export default actions
