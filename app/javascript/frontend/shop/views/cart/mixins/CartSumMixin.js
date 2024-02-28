export default {
  name: 'CartSumMixin',
  computed: {
    cartSum() {
      return this.$store.getters.cartProducts.reduce((accumulator, item) => {
        const price = item.discount ? item.discount_price : item.price

        return accumulator + (price * item.quantity)
      }, 0)
    }
  }
}
