<template>
  <section class="product-area cart-page-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <div class="section-title text-center">
            <h2 class="title">{{ $t('CART.TITLE') }}</h2>
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
                  <th class="width-name">{{ $t('CART.HEADER.PRODUCT') }}</th>
                  <th class="width-price"> {{ $t('CART.HEADER.PRICE') }}</th>
                  <th class="width-quantity">{{ $t('CART.HEADER.QUANTITY') }}</th>
                  <th class="width-subtotal">{{ $t('CART.HEADER.TOTAL') }}</th>
                  <th class="width-remove"></th>
                </tr>
                </thead>
                <tbody v-if="cart?.length">
                <tr v-for="product in cartProducts" :key="product.id" >
                  <td class="product-thumbnail">
                    <router-link :to="{ name: 'ProductsShow', params: { id: product.slug }}">
                      <img :src="product.logo ? product.logo.thumb.url : ''" alt="Image">
                    </router-link>
                  </td>
                  <td class="product-name">
                    <h5>
                      <router-link :to="{ name: 'ProductsShow', params: { id: product.slug }}">
                        {{ product.name[language] }}
                      </router-link>
                    </h5>
                  </td>
                  <td class="product-price">
                    <template v-if="product.discount">
                      <div class="old-price">{{ product.price }}  грн</div>
                      <div class="price old-price-line">{{ product.discount_price }} грн</div>
                    </template>
                    <div v-else class="price">
                      {{ product.price }} грн
                    </div>
                  </td>
                  <td class="cart-quality">
                    <div class="product-details-quality">
                      <input @input="handleQuantity($event, product)" type="number" class="input-text qty text" step="1" min="1" max="100" name="quantity" :value="product.quantity" title="Qty" placeholder="">
                    </div>
                  </td>
                  <td class="product-total">{{ subTotalProduct(product) }} грн</td>
                  <td class="product-remove"><span @click="removeFromCart(product.line_item_id, product.id)"><i class="ion-ios-trash-outline"></i></span></td>
                </tr>
                </tbody>
              </table>
              <h3 v-if="!cart?.length" class="text-center">{{ $t('CART.EMPTY') }}</h3>
            </div>
          </div>
          <div class="cart-shiping-update-wrapper">
            <div class="cart-shiping-btn continure-btn">
              <router-link :to="{ name: 'ProductsIndex'}" class="btn btn-link">
                <i class="ion-ios-arrow-left"></i> {{ $t('CART.BUTTON.BACK') }}
              </router-link>
            </div>
            <div v-if="cart?.length" class="cart-shiping-btn update-btn">
              <div class="grand-total-wrap">
                <div class="grand-total-content">
                  <div class="grand-total">
                    <h4>{{ $t('CART.TOTAL_ALL') }}: <span>{{ cartSum }} грн</span></h4>
                  </div>
                </div>
                <div class="grand-total-btn">
                  <router-link class="btn btn-link" :to="{ name: 'CheckoutShow'}">
                    {{ $t('CART.BUTTON.CHECKOUT') }}
                  </router-link>
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
import { cart } from '../../helpers/utils'
import FetchCartProductsMixin from './mixins/FetchCartProductsMixin'
import SubtotalProductsMixin from './mixins/SubtotalProductsMixin'
import CartSumMixin from './mixins/CartSumMixin'

export default {
  name: 'CartShow',
  mixins: [
    FetchCartProductsMixin,
    SubtotalProductsMixin,
    CartSumMixin
  ],
  computed: {
    ...mapGetters([
      'cart',
      'user',
      'cartProducts',
      'language'
    ])
  },
  created() {
  },
  methods: {
    removeFromCart(id, productId) {
      if (id) {
        this.$store.dispatch('deleteLineItems', { id })
      } else {
        const index = cart.get().findIndex(obj => obj.product_id === productId)
        cart.remove(index)
      }
      this.$store.commit('removeFromCart', productId)
    },
    handleQuantity(e, product) {
      const { id, line_item_id } = product
      const quantity = e.target.value

      this.user ? this.$store.dispatch('updateLineItems', { id: line_item_id, quantity }) : this.updateLocalCart(id, quantity)
      this.$store.commit('updateQuantityItem', { productId: id, quantity })
    },
    updateLocalCart(id, quantity) {
      const index = cart.get().findIndex(item => item.product_id === id)
      cart.update(index, parseInt(quantity, 10))
    }
  }
}
</script>
