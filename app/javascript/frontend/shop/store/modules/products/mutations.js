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
        state.products.items = state.products.items.map((obj) => {
            if (obj.id === payload.product_id) return {...obj, wishlist: payload.wishlist}
            return obj
        })
    },
    setProductsAutocomplete(state, payload = null) {
        state.productsAutocomplete = payload
    },
    clearProducts(state) {
        state.products = {
            count: 0,
            items: []
        }
    },
    deleteProductById(state, id) {
        const indexToDelete = state.products.items.findIndex(obj => obj.id === id)
        if (indexToDelete !== -1) state.products.items.splice(indexToDelete, 1)
    }
}

export default mutations
