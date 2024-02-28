export default {
  name: 'SubtotalProductsMixin',
  methods: {
    subTotalProduct(product) {
      const quantity = product.quantity || 1
      const price = product.discount ? product.discount_price : product.price

      return  price * quantity
    }
  }
}
