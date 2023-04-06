const mutations = {
    setProducts (state, payload) {
        state.products = payload
    },
    setProduct(state, payload) {
        state.product = payload
    },
    setWishListCounter (state, payload) {
        state.wishListCounter = payload
    },
    setWishlist (state, payload) {
        state.products = state.products.map((obj) => {
            if (obj.id === payload.product_id) return {...obj, wishlist: payload.wishlist}
            return obj
        })
    }
}

export default mutations
