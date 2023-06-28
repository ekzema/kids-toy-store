export default {
  name: 'SubtotalProductsMixin',
  methods: {
    subTotalProduct(product) {
      const quantity = product.quantity || 1
      return  product.price * quantity
    }
  }
}
