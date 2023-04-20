const mutations = {
    setProducts(state, payload) {
        state.products = payload
    },
    setProduct(state, payload) {
        state.product = payload
    },
    setWishListCounter(state, payload) {
        state.wishListCounter = payload
    },
    setWishlist(state, payload) {
        if (state.product) state.product.wishlist = payload.wishlist
        state.products = state.products.map((obj) => {
            if (obj.id === payload.product_id) return {...obj, wishlist: payload.wishlist}
            return obj
        })
    },
    setProductsAutocomplete(state, payload = null) {
        state.productsAutocomplete = payload
    }
}

export default mutations
