import Users from '../../../api/users'

const actions = {
    async fetchUserInfo({ commit }, params) {
        try {
            const { data } = await Users.info(params)
            const { email, phone, first_name, last_name, patronymic } = data

            commit('setWishListCounter', data.wishlists_count)
            commit('setCart', data.line_items)
            commit('updateUser', { email, phone, first_name, last_name, patronymic })

        } catch (error) {
            commit('setErrorMessage')
        }
    }
}
export default actions
