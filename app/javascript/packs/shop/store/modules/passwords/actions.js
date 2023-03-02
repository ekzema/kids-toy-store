import Passwords from '../../../api/passwords'
import Categories from "../../../../dashboard/api/categories";

const actions = {
    async createPassword({ commit }, data) {
        try {
            await Passwords.create(data)

            const message = 'Instructions for resetting your password have been sent to your email.'
            const options = { position: "bottom-center", timeout: 7000, icon: "fa fa-info fa-2x" }
            commit('setSuccessMessage', { message: message, options: options })
        } catch (error) {
            if (error.response.status === 404) {
                commit('setErrorMessage', 'No user found with this email')
            } else {
                commit('setErrorMessage')
            }
        }
    },
    async updatePassword({ commit }, data) {
        try {
            await Passwords.update(data.id, data.form)
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}
export default actions
