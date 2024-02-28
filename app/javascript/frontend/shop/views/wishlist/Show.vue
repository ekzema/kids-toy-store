<template>
  <!--== Start Wishlist Area Wrapper ==-->
  <section class="product-area wishlist-page-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <div class="section-title text-center">
            <h2 class="title">Wishlist</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <form action="#">
            <div class="wishlist-table-content">
              <div class="table-content table-responsive">
                <table>
                  <thead>
                  <tr>
                    <th class="width-remove"></th>
                    <th class="width-thumbnail"></th>
                    <th class="width-name">Товар</th>
                    <th class="width-price"> Цена </th>
                    <th class="width-stock-status"> Статус </th>
                    <th class="width-wishlist-cart"></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="product in products.items" :key="product.id">
                    <td @click="handleWashlist(product.id)" class="product-remove"><span>×</span></td>
                    <td class="product-thumbnail">
                      <router-link :to="{ name: 'ProductsShow', params: { id: product.slug }}">
                        <img :src="product.logo.thumb.url" alt="Image">
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
                    <td class="stock-status">
                      <span>{{ product.status }}</span>
                    </td>
                    <td class="wishlist-cart">
                      <router-link v-if="!product.inCart" to="" @click="addToCart(product)">
                        <i class="pe-7s-cart"></i>
                        Купить
                      </router-link>
                      <router-link v-else to="" class="in-cart">
                        В корзине
                      </router-link>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <!--== End Wishlist Area Wrapper ==-->
</template>

<script>
import AddToCartMixin from '../products/mixins/AddToCartMixin'
import ProductsInCartMixin from '../products/mixins/ProductsInCartMixin'
import { mapGetters } from "vuex"
import {languages} from "../../../dashboard/config";

export default {
  name: 'WishlistShow',
  mixins: [AddToCartMixin, ProductsInCartMixin],
  computed: {
    ...mapGetters([
      'user',
      'language'
    ])
  },
  data: () => ({
  }),
  created() {
    this.$store.dispatch('fetchWishlists')
  },
  methods: {
    languages() {
      return languages
    },
    handleWashlist(id) {
      this.$store.dispatch('deleteWishlists', { product_id: id })
    }
  }
}
</script>

<style scoped>
.in-cart {
  background-color: #95b3e0 !important;
}
</style>
