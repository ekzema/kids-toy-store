export default {
  name: 'FetchCartProductsMixin',
  watch: {
    'cart.length'() {
      this.fetchCartProducts()
    }
  },
  created() {
    this.fetchCartProducts()
  },
  methods: {
    fetchCartProducts() {
      if (!this.cart.length) return this.$store.commit('setCartProducts', [])

      const ids = this.cart.map(obj => obj.product_id).join(',')
      this.$store.dispatch('fetchCartProducts', { cart_products: ids })
    }
  }
}
