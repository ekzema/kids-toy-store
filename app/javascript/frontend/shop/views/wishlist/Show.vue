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
                    <th class="width-stock-status"> Status </th>
                    <th class="width-wishlist-cart"></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="product in products" :key="product.id">
                    <td class="product-remove"><a href="#">×</a></td>
                    <td class="product-thumbnail">
                      <router-link :to="{ name: 'ProductsShow', params: { id: product.id }}">
                        <img :src="product.logo.small.url" alt="Image">
                      </router-link>
                    </td>
                    <td class="product-name">
                      <h5>
                        <router-link :to="{ name: 'ProductsShow', params: { id: product.id }}">
                          {{ product.name.ru }}
                        </router-link>
                      </h5>
                    </td>
                    <td class="product-price"><span class="amount">{{ product.price }} грн</span></td>
                    <td class="stock-status">
                      <span>{{ product.status }}</span>
                    </td>
                    <td class="wishlist-cart"><a href="shop-cart.html">Add to Cart</a></td>
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
import { mapGetters } from 'vuex'

export default {
  name: 'WishlistShow',
  computed: {
    ...mapGetters([
      'products'
    ]),
  },
  data: () => ({
  }),
  created() {
    this.$store.dispatch('fetchWishlists')
  },
  methods: {}
}
</script>
