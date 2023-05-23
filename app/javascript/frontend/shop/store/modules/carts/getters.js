const getters = {
    cart: state => state.cart,
    cartProducts: state => state.cartProducts,
    cartItemsCount: state => state.cart.reduce((acc, item) => acc + item.quantity, 0)
}

export default getters
