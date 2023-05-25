const mutations = {
    setCart(state, payload) {
        state.cart = payload
    },
    setCartProducts(state, payload) {
        state.cartProducts = state.cart.map(product => {
            const updatedProduct = payload.find(p => p.id === product.product_id)
            return updatedProduct ? { ...updatedProduct, ...product } : updatedProduct
        })
    }
}

export default mutations
