import Users from '../../../api/users'

const actions = {
    async fetchUserInfo({ commit }, params) {
        try {
            const { data } = await Users.info(params)
            commit('setWishListCounter', data.wishlists_count)
            commit('setCart', data.line_items)
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}
export default actions
