export default {
  name: 'ProductsInCartMixin',
  computed: {
    products() {
      const { products, cart } = this.$store.getters
      return products.map(obj => {
        return { ...obj, inCart: cart.some(cartItem => cartItem.product_id === obj.id) }
      })
    }
  }
}
