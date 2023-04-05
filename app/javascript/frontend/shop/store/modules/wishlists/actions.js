import Wishlists from '../../../api/wishlists'

const actions = {
    async createWishlists({ commit }, payload) {
        try {
            const { data } = await Wishlists.create(payload)
            const msg = data.wishlist ? 'Товар добавлен в список желаний.' : 'Товар удалён из списка желаний.'
            commit('setWishlist', data)
            commit('setSuccessMessage', msg)

            return data
        } catch (error) {
            commit('setErrorMessage')
        }
    }
}
export default actions
