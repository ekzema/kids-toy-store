export default {
  name: 'CartSumMixin',
  computed: {
    cartSum() {
      return this.$store.getters.cartProducts.reduce((accumulator, item) => {
        return accumulator + (item.price * item.quantity)
      }, 0)
    }
  }
}
