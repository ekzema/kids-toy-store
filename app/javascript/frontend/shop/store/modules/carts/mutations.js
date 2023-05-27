const mutations = {
    setCart(state, payload) {
        state.cart = payload.map(({ id: line_item_id, quantity, product_id }) => ({
            line_item_id,
            quantity,
            product_id
        }))
    },
    removeFromCart(state, payload) {
        state.cart = state.cart.filter(({ product_id }) => product_id !== payload)
    },
    setCartProducts(state, payload) {
        state.cartProducts = state.cart.reduce((acc, lineItem) => {
            const updatedProduct = payload.find(p => p.id === lineItem.product_id)
            if (updatedProduct) acc.push({...updatedProduct, ...lineItem})

            return acc
        }, [])
    }
}

export default mutations
