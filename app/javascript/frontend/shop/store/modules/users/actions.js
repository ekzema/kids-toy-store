import Users from '../../../api/users'

const actions = {
    async fetchUserInfo({ commit }) {
        try {
            const { data } = await Users.info()
            commit('setWishListCounter', data.wishlists_count)
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}
export default actions
