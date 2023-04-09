<template>
  <div v-for="product in products" :key="product.id" class="col-lg-3 col-md-4 col-sm-6 wrap-item">
    <!-- Start Product Item -->
    <div class="product-item">
      <div class="product-thumb">
        <img :src="product.logo.pre_medium.url" alt="Image">
        <span v-if="user" @click="handleWashlist(product.id)" class="items-wishlist">
          <i v-if="product.wishlist" class="fa fa-heart"></i>
          <i v-else class="fa fa-heart-o"></i>
        </span>
        <span v-else @click="needLogin" class="items-wishlist">
          <i class="fa fa-heart-o"></i>
        </span>
        <div class="product-action">
          <a class="action-quick-view" href="shop-cart.html"><i class="ion-ios-cart"></i></a>
          <a class="action-quick-view" href="javascript:void(0)"><i class="ion-arrow-expand"></i></a>
        </div>
      </div>
      <div class="product-info">
        <div class="code">
          <span class="code">Код товара: {{ product.code }}</span>
        </div>
        <h4 class="title text-center">
          <router-link :to="{ name: 'ProductsShow', params: { id: product.slug } }">
            {{ product.name.ru }}
          </router-link>
        </h4>
        <div class="prices">
          <span class="price">{{ product.price }} грн</span>
        </div>
        <button @click="addToCart(product.id)">Add to cart</button>
      </div>
    </div>
    <!-- End Product Item -->
  </div>
</template>

<script>
import { mapGetters } from "vuex"
import NeedLoginToast from './NeedLoginToast.vue'
import { useToast } from "vue-toastification"
import { cart } from "../../../helpers/utils"

export default {
  setup: () => ({
    toast: useToast()
  }),
  computed: {
    ...mapGetters([
      'user',
      'products'
    ]),
  },
  watch: {
    '$route.params'() {
      this.fetchProductsByCategory()
    }
  },
  created() {
    this.$route.params.category ? this.fetchProductsByCategory() : this.fetchProducts()
  },
  methods: {
    fetchProducts(params = {}) {
      this.$store.dispatch('fetchProducts', params)
    },
    buildFilteredByCategory(category) {
      this.fetchProducts({categories: category})
    },
    fetchProductsByCategory() {
      const params = this.$route.params
      params.subcategory
        ? this.buildFilteredByCategory(params.subcategory)
        : this.buildFilteredByCategory(params.category)
    },
    handleWashlist(id) {
      this.$store.dispatch('createWishlists', { product_id: id })
    },
    needLogin() {
      this.toast.success({
        component: NeedLoginToast,
      }, {
        position: "bottom-center",
        icon: "fa fa-info-circle fa-2x"
      })
    },
    addToCart(id) {
      cart.add({ id, quantity: 1 })
      this.$store.commit('setCart', cart.get())
    }
  }
}
</script>
