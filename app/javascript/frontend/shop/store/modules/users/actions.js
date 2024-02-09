import Users from '../../../api/users'

const actions = {
    async fetchUserInfo({ commit }, params) {
        try {
            const { data } = await Users.info(params)
            const { id, email, phone, first_name, last_name, patronymic } = data

            commit('setWishListCounter', data.wishlists_count)
            commit('setCart', data.line_items)
            commit('updateUser', { id, email, phone, first_name, last_name, patronymic })

        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async updateAccount({ commit }, payload) {
        try {
            const { data } = await Users.updateAccount(payload)
            const { id, email, phone, first_name, last_name, patronymic } = data
            commit('updateUser', { id, email, phone, first_name, last_name, patronymic })
            commit('setSuccessMessage', 'Update successful')
        } catch (error) {
            commit('setErrorMessage')
        }
    },
    async changePassword({ commit }, payload) {
        try {
            await Users.changePassword(payload)
            commit('setSuccessMessage', 'Update successful')
            return true
        } catch (error) {
            const response = error.response
            if(response.status === 403) return commit('setErrorMessage', response.data.error)
            commit('setErrorMessage')
        }
    },
}
export default actions
