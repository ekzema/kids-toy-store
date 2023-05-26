const mutations = {
    setCart(state, payload) {
        state.cart = payload.map(({ id: line_item_id, quantity, product_id }) => ({
            line_item_id,
            quantity,
            product_id
        }))
    },
    setCartProducts(state, payload) {
        state.cartProducts = state.cart.map(lineItem => {
            let updatedProduct = payload.find(p => p.id === lineItem.product_id)
            return updatedProduct ? {...updatedProduct, ...lineItem} : updatedProduct
        })
    }
}

export default mutations
