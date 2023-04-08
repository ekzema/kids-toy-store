const getters = {
    cart: state => state.cart,
    cartItemsCount: state => state.cart.length
}

export default getters
