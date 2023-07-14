<template>
  <div v-for="product in products" :key="product.id" :class="{'col-lg-3': !sideBar, 'col-lg-4': sideBar}" class="col-lg-3 col-md-4 col-sm-6 wrap-item">
    <!-- Start Product Item -->
    <div class="product-item">
      <div class="product-thumb">
        <img :src="product.logo.pre_medium.url" alt="Image">
        <span v-if="user" class="items-wishlist" @click="handleWashlist(product.id)">
          <i v-if="product.wishlist" class="fa fa-heart"></i>
          <i v-else class="fa fa-heart-o"></i>
        </span>
        <span v-else class="items-wishlist" @click="needLogin">
          <i class="fa fa-heart-o"></i>
        </span>
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
          <span class="price">{{ product.price }}</span><span class="currency">грн</span>
        </div>
        <div class="cart">
          <button v-if="!product.inCart" class="btn btn-theme" @click="addToCart(product)">
            <i class="pe-7s-cart"></i>
            Купить
          </button>
          <span v-else class="btn btn-theme in-cart">В корзине</span>
        </div>
      </div>
    </div>
    <!-- End Product Item -->
  </div>
</template>

<script>
import { mapGetters } from "vuex"
import AddToCartMixin from "../mixins/AddToCartMixin"
import WishlistMixin from "../mixins/WishlistMixin"
import ProductsInCartMixin from "../mixins/ProductsInCartMixin"

export default {
  name: 'ListProducts',
  mixins: [AddToCartMixin, WishlistMixin, ProductsInCartMixin],
  props: ['sideBar'],
  computed: {
    ...mapGetters([
      'user'
    ])
  }
}
</script>
