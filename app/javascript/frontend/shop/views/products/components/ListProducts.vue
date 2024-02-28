<template>
  <list-loader
      v-if="loader"
      :side-bar="sideBar"
  />
  <div v-else v-for="product in products.items" :key="product.id" :class="{'col-lg-3': !sideBar, 'col-lg-4': sideBar}" class="col-lg-3 col-md-4 col-sm-6 wrap-item">
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
          <span class="code">{{ $t('PRODUCT.CODE') }}: {{ product.code }}</span>
        </div>
        <h4 class="title text-center">
          <router-link :to="{ name: 'ProductsShow', params: { id: product.slug } }">
            {{ product.name[language] }}
          </router-link>
        </h4>
        <div class="prices">
          <template v-if="product.discount">
            <div class="old-price">{{ product.price }} <span class="currency">грн</span></div>
            <div class="price old-price-line">{{ product.discount_price }} <span class="currency">грн</span></div>
          </template>
          <div v-else class="price">{{ product.price }} <span class="currency">грн</span></div>
        </div>
        <div class="cart">
          <button v-if="!product.inCart" class="btn btn-theme" @click="addToCart(product)">
            <i class="pe-7s-cart"></i>
            {{ $t('PRODUCT.BUTTON.BUY') }}
          </button>
          <span v-else class="btn btn-theme in-cart">{{ $t('PRODUCT.BUTTON.IN_CART') }}</span>
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
import ProductsInCartMixin from '../mixins/ProductsInCartMixin'
import ListLoader from './ListLoader'

export default {
  name: 'ListProducts',
  components: { ListLoader },
  mixins: [AddToCartMixin, WishlistMixin, ProductsInCartMixin],
  props: ['sideBar'],
  computed: {
    ...mapGetters([
      'user',
      'loader',
      'language'
    ]),
  }
}
</script>
