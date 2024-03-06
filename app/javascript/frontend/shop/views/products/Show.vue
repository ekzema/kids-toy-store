<template>
  <div class="wrapper page-shop-details-wrapper">
    <main class="main-content">
      <!--== Start Shop Area ==-->
      <section class="product-single-area">
        <div class="container">
          <div v-if="product" class="row">
            <div  class="col-sm-12 col-md-8 offset-md-2 col-lg-6 offset-lg-0">
              <div class="single-product-slider">
                <div class="single-product-thumb">
                  <div class="swiper-container single-product-thumb-slider">
                    <div  class="swiper-wrapper">
                      <div v-for="(image, index) in images" :key="index" class="swiper-slide zoom zoom-hover">
                        <div class="thumb-item">
                          <a class="lightbox-image" data-fancybox="gallery" :href="image.url">
                            <img :src="image.medium.url">
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div v-if="images.length > 1" class="single-product-nav">
                  <div class="swiper-container single-product-nav-slider">
                  <div v-if="picturesIsMany">
                      <div class="button-next"></div>
                      <div class="button-prev"></div>
                  </div>
                    <div class="swiper-wrapper">
                      <div v-for="(image, index) in images" :key="index" class="swiper-slide">
                        <div class="nav-item">
                          <img :src="image.thumb.url">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="single-product-info">
                <h4 class="title">{{product.name[language]}}</h4>
                <div class="prices">
                  <template v-if="product.discount_price">
                    <span class="price">{{ product.discount_price }} грн</span>
                    <span> – </span>
                  </template>
                  <span  :class="{ 'price-old': product.discount }" class="price">{{ product.price }} грн</span>
                  <div class="status" :class="product.status">
                    {{ $t(`PRODUCT.STATUS.${ product.status.toUpperCase() }`) }}
                  </div>
                </div>
                <div class="single-product-featured">
                  <ul>
                    <li><i class="fa fa-check"></i> Free Shipping</li>
                    <li><i class="fa fa-check"></i> Support 24/7</li>
                    <li><i class="fa fa-check"></i> Money Return</li>
                  </ul>
                </div>
                <p class="product-desc">{{product.description[language]}}</p>
                <div class="quick-product-action">
                  <div class="action-top">
                    <div v-if="!product.inCart" class="pro-qty">
                      <span class="inc qty-btn" @click="quantity++"><i class="fa fa-plus"></i></span>
                      <span class= "dec qty-btn" @click="quantity--"><i class="fa fa-minus"></i></span>
                      <input v-model="quantity" id="quantity" readonly type="text" title="Quantity" />
                    </div>
                    <button v-if="!product.inCart" class="btn btn-theme" :disabled="product.status === 'not_available' || product.status === 'on_the_way'" @click="addToCart(product, quantity)">
                      {{ $t('PRODUCT.BUTTON.BUY') }}
                    </button>
                    <span v-else class="btn btn-theme in-cart bold-text-cart">{{ $t('PRODUCT.BUTTON.IN_CART') }}</span>
                    <span v-if="user" class="item-wishlist" @click="handleWashlist(product.id)">
                      <i v-if="product.wishlist" class="fa fa-heart"></i>
                      <i v-else class="fa fa-heart-o"></i>
                    </span>
                    <span v-else class="item-wishlist" @click="needLogin">
                      <i class="fa fa-heart-o"></i>
                    </span>
                  </div>
                </div>
                <div class="widget">
                  <h3 class="title">{{ $t('PRODUCT.CODE') }}:</h3>
                  <div class="widget-tags">
                    <span>{{product.code}}</span>
                  </div>
                </div>
                <div class="widget">
                  <h3 class="title">{{ $t('PRODUCT.CATEGORIES') }}:</h3>
                  <div class="widget-tags">
                    <a href="blog.html">Toys.</a>
                    <a href="blog.html">Dresss</a>
                  </div>
                </div>
                <div class="widget">
                  <h3 class="title">{{ $t('PRODUCT.MADE_IN') }}:</h3>
                  <div class="widget-tags">
                    <a href="blog.html">{{ product.production_country }}</a>
                  </div>
                </div>
                <div class="widget">
                    <h3 class="title">{{ $t('PRODUCT.BRAND') }}:</h3>
                    <div class="widget-tags">
                        <a href="blog.html">{{product.brand.name}}</a>
                    </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="product-description-review">
                  <ul id="myTab" class="nav nav-tabs product-description-tab-menu" role="tablist">
                    <li class="nav-item" role="presentation">
                      <button id="product-aditional-tab" class="nav-link" data-bs-toggle="tab" data-bs-target="#infoProduct" type="button" role="tab" aria-selected="false">{{ $t('PRODUCT.TAB.SPEC') }}</button>
                    </li>
                    <li class="nav-item" role="presentation">
                      <button id="product-desc-tab" class="nav-link active" data-bs-toggle="tab" data-bs-target="#productDesc" type="button" role="tab" aria-controls="productDesc" aria-selected="true">{{ $t('PRODUCT.TAB.DESC') }}</button>
                    </li>
                  </ul>
                  <div id="myTabContent" class="tab-content product-description-tab-content">
                    <div id="infoProduct" class="tab-pane fade" role="tabpanel" aria-labelledby="product-aditional-tab">
                      <div class="product-info">
                        <div>
                          <span class="specTitle">{{ $t('PRODUCT.MADE_IN') }}: </span>
                          <span class="specDesc">{{ product.production_country }}</span>
                        </div>
                        <div>
                          <span class="specTitle">{{ $t('PRODUCT.BRAND') }}: </span>
                          <span class="specDesc">{{ product.brand.name }}</span>
                        </div>
                        <div v-for="(specification, index) in product.specifications[language]" :key="index">
                          <span class="specTitle">{{ specification.key }}: </span>
                          <span class="specDesc">{{ specification.value }}</span>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane fade show active" id="productDesc" role="tabpanel" aria-labelledby="product-desc-tab">
                      <div class="product-desc">
                        <p>{{ product.description[language] }}</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Swiper from "swiper"
import AddToCartMixin from './mixins/AddToCartMixin'
import WishlistMixin from "./mixins/WishlistMixin"

export default {
  name: 'ProductsShow',
  mixins: [AddToCartMixin, WishlistMixin],
  data: () => ({
    images: [],
    quantity: 1
  }),
  computed: {
    ...mapGetters([
      'user',
      'language'
    ]),
    picturesIsMany() {
      return this.images.length > 3
    },
    product() {
      const { product, cart } = this.$store.getters
      return product ? { ...product, inCart: cart?.some(cartItem => cartItem.product_id === product.id) } : null
    }
  },
  watch: {
    product(product) {
        if (product) {
          this.images = [this.product.logo, ...this.product.product_images.map(product_image => product_image.image )]
          this.$nextTick(() => {
              if (this.picturesIsMany) this.setSwiper()
          })
        }
    },
    quantity(value) {
      if (value < 1 || typeof value !== 'number') this.quantity = 1
    },
    '$route.params.id'() {
      this.$store.dispatch('fetchProduct', this.$route.params.id)
    }
  },
  async created() {
      await this.$store.dispatch('fetchProduct', this.$route.params.id)
      const headerMain = document.getElementById('header-main');
      if (headerMain)  headerMain.scrollIntoView({ behavior: 'smooth' });
  },
  methods: {
    setSwiper() {
      const ProductNav = new Swiper('.single-product-nav-slider', {
        spaceBetween: 11,
        slidesPerView: 3,
        freeMode: true,
        navigation: {
          nextEl: '.button-next',
          prevEl: '.button-prev',
          disabledClass: 'button-lock'
        },
      })

      new Swiper('.single-product-thumb-slider', {
        freeMode: true,
        effect: 'fade',
        fadeEffect: {
          crossFade: true,
        },
        thumbs: {
          swiper: ProductNav
        }
      })
    },
    inCart() {
      // eslint-disable-next-line no-undef
      return cart.some(cartItem => cartItem.product_id === obj.id)
    }
  }
}
</script>

<style scoped>
.product-info {
  padding: 51px 25px 50px;
}

.product-info .specTitle {
  color: #5f5f5f;
  font-weight: 500;
}

.product-info .specDesc {
  color: #9f9e9e;
}
</style>
