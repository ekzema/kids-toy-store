import Passwords from '../../../api/passwords'
import CreatePasswordToast from '../../../views/account/components/CreatePasswordToast'

const actions = {
    async createPassword({ commit }, data) {
        try {
            await Passwords.create(data)

            const message = { component: CreatePasswordToast, props: { email: data.email } }
            const options = { position: "bottom-center", timeout: 7000, icon: "fa fa-check fa-2x" }
            commit('setSuccessMessage', { message: message, options: options })
        } catch (error) {
            if (error.response.status === 404) {
                commit('setErrorMessage', 'ACCOUNT.FORGOT_PASSWORD.ERROR.USER_NOT_FOUND')
            } else {
                commit('setErrorMessage')
            }
        }
    },
    async updatePassword({ commit }, data) {
        const { token, password, password_confirmation } = data
        try {
            await Passwords.update(token, { password: { password, password_confirmation }})
        } catch (error) {
            throw error
        }
    }
}
export default actions
