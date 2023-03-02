import Registrations from '../../../api/registrations'
import ConfirmationToast from '../../../views/account/components/ConfirmationToast.vue'

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
            await Registrations.create(data)

            const message = { component: ConfirmationToast, props: { email: data.email } }
            const options = { position: "bottom-center", timeout: 10000, icon: "fa fa-check fa-2x" }
            commit('setSuccessMessage', { message, options })
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
