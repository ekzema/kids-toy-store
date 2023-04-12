import Users from '../../../api/users'

const actions = {
    async fetchUserInfo({ commit }) {
        try {
            const { data } = await Users.info()
            commit('setWishListCounter', data.wishlists_count)
            commit('setCart', data.line_items)
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}
export default actions
