<template>
  <h3>Order show</h3>
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
            </tr>
            </thead>
            <tbody v-if="[].length">
            <tr v-for="product in []" :key="product.id" >
              <td class="product-thumbnail">
                <router-link :to="{ name: 'ProductsShow', params: { id: product.slug }}">
                  <img :src="product.logo ? product.logo.thumb.url : ''" alt="Image">
                </router-link>
              </td>
              <td class="product-name">
                <h5><a href="shop-single-product.html">{{ product.name.ru }}</a></h5>
              </td>
              <td class="product-price"><span class="amount">{{ product.price }} грн</span></td>
              <td class="cart-quality">
                <div class="product-details-quality">
                  <input @input="handleQuantity($event, product)" type="number" class="input-text qty text" step="1" min="1" max="100" name="quantity" :value="product.quantity" title="Qty" placeholder="">
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
          <a class="btn btn-link" href="shop.html"><i class="ion-ios-arrow-left"></i> Назад</a>
        </div>
        <div class="cart-shiping-btn update-btn">
          <div class="grand-total-wrap">
            <div class="grand-total-content">
              <div class="grand-total">
                <h4>Всего: <span>100 грн</span></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'OrderShow',
  computed: {
    ...mapGetters([
        'order'
    ]),
  },
  created() {
    this.fetchOrder()
  },
  methods: {
    fetchOrder() {
      this.$store.dispatch('fetchOrder', this.$route.params.id)
    }
  }
}
</script>

<style scoped>
.width-price {
  min-width: 50px !important;
}

.width-quantity{
  min-width: 50px !important;
}


</style>
