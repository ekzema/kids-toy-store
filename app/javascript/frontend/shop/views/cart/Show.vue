<template>
  <section class="product-area cart-page-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <div class="section-title text-center">
            <h2 class="title">Cart</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="cart-table-wrap">
            <div class="cart-table table-responsive">
              <table>
                <thead>
                <tr>
                  <th class="width-thumbnail"></th>
                  <th class="width-name">Product</th>
                  <th class="width-price"> Price</th>
                  <th class="width-quantity">Quantity</th>
                  <th class="width-subtotal">Subtotal</th>
                  <th class="width-remove"></th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="product in cartProducts" :key="product.id" >
                  <td class="product-thumbnail">
                    <router-link :to="{ name: 'ProductsShow', params: { id: product.slug }}">
                      <img :src="product.logo ? product.logo.thumb.url : ''" alt="Image">
                    </router-link>
                  </td>
                  <td class="product-name">
                    <h5><a href="shop-single-product.html">Jigsaw Puzzles For Kids</a></h5>
                  </td>
                  <td class="product-price"><span class="amount">{{ product.price }} грн</span></td>
                  <td class="cart-quality">
                    <div class="product-details-quality">
                      <input @input="handleQuantity" type="number" class="input-text qty text" step="1" min="1" max="100" name="quantity" :value="product.quantity" title="Qty" placeholder="">
                    </div>
                  </td>
                  <td class="product-total"><span>{{ subTotalProduct(product) }} грн</span></td>
                  <td class="product-remove"><span @click="removeFromCart(product.line_item_id, product.id)"><i class="ion-ios-trash-outline"></i></span></td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="cart-shiping-update-wrapper">
            <div class="cart-shiping-btn continure-btn">
              <a class="btn btn-link" href="shop.html"><i class="ion-ios-arrow-left"></i> Назад к покупкам</a>
            </div>
            <div class="cart-shiping-btn update-btn">
              <div class="grand-total-wrap">
                <div class="grand-total-content">
                  <div class="grand-total">
                    <h4>Всего: <span>185грн</span></h4>
                  </div>
                </div>
                <div class="grand-total-btn">
                  <a class="btn btn-link" href="shop-checkout.html">Оформить заказ</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'CartShow',
  computed: {
    ...mapGetters([
      'cart',
      'user',
      'cartProducts'
    ])
  },
  data: () => ({
  }),
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
      const ids = this.cart.map(obj => obj.product_id).join(',')
      this.$store.dispatch('fetchCartProducts', { cart_products: ids })
    },
    subTotalProduct(product) {
      const quantity = product.quantity || 1
      return  product.price * quantity
    },
    removeFromCart(id, productId) {
      if(id) this.$store.dispatch('deleteLineItems', { id })
      this.$store.commit('removeFromCart', productId)
    },
    handleQuantity() {
console.log('dsdsd','test')
    }
  }
}
</script>
