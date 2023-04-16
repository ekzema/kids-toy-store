<template>
  <div v-if="product" class="wrapper page-shop-details-wrapper">
    <main class="main-content">
      <!--== Start Shop Area ==-->
      <section class="product-single-area">
        <div class="container">
          <div class="row">
            <div class="col-sm-12 col-md-8 offset-md-2 col-lg-6 offset-lg-0">
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
                <h4 class="title">{{product.name.ru}}</h4>
                <div class="prices">
                  <span class="price">{{product.price}} грн</span>
                </div>
                <div class="single-product-featured">
                  <ul>
                    <li><i class="fa fa-check"></i> Free Shipping</li>
                    <li><i class="fa fa-check"></i> Support 24/7</li>
                    <li><i class="fa fa-check"></i> Money Return</li>
                  </ul>
                </div>
                <p class="product-desc">{{product.description.ru}}</p>
                <div class="quick-product-action">
                  <div class="action-top">
                    <div v-if="!product.inCart" class="pro-qty">
                      <span @click="quantity++" class="inc qty-btn"><i class="fa fa-plus"></i></span>
                      <span @click="quantity--" class= "dec qty-btn"><i class="fa fa-minus"></i></span>
                      <input v-model="quantity" readonly type="text" id="quantity" title="Quantity" />
                    </div>
                    <button v-if="!product.inCart" @click="addToCart(product, quantity)" class="btn btn-theme">Add to Cart</button>
                    <span v-else class="btn btn-theme in-cart bold-text-cart">В корзине</span>
                    <span v-if="user" @click="handleWashlist(product.id)" class="item-wishlist">
                      <i v-if="product.wishlist" class="fa fa-heart"></i>
                      <i v-else class="fa fa-heart-o"></i>
                    </span>
                    <span v-else @click="needLogin" class="item-wishlist">
                      <i class="fa fa-heart-o"></i>
                    </span>
                  </div>
                </div>
                <div class="widget">
                  <h3 class="title">Код товара:</h3>
                  <div class="widget-tags">
                    <span>{{product.code}}</span>
                  </div>
                </div>
                <div class="widget">
                  <h3 class="title">Categories:</h3>
                  <div class="widget-tags">
                    <a href="blog.html">Toys.</a>
                    <a href="blog.html">Dresss</a>
                  </div>
                </div>
                <div class="widget">
                  <h3 class="title">Производитель:</h3>
                  <div class="widget-tags">
                    <a href="blog.html">{{product.production_country}}</a>
                  </div>
                </div>
                <div class="widget">
                    <h3 class="title">Брэнд:</h3>
                    <div class="widget-tags">
                        <a href="blog.html">{{product.brand.name}}</a>
                    </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="product-description-review">
                  <ul class="nav nav-tabs product-description-tab-menu" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                      <button class="nav-link" id="product-aditional-tab" data-bs-toggle="tab" data-bs-target="#commentProduct" type="button" role="tab" aria-selected="false">Information</button>
                    </li>
                    <li class="nav-item" role="presentation">
                      <button class="nav-link active" id="product-desc-tab" data-bs-toggle="tab" data-bs-target="#productDesc" type="button" role="tab" aria-controls="productDesc" aria-selected="true">Description</button>
                    </li>
                  </ul>
                  <div class="tab-content product-description-tab-content" id="myTabContent">
                    <div class="tab-pane fade" id="commentProduct" role="tabpanel" aria-labelledby="product-aditional-tab">
                      <div class="product-desc">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed utlo perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                      </div>
                    </div>
                    <div class="tab-pane fade show active" id="productDesc" role="tabpanel" aria-labelledby="product-desc-tab">
                      <div class="product-desc">
                        <p>{{ product.description.ru }}</p>
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
    ]),
    picturesIsMany () {
      return this.images.length > 3
    },
    product() {
      const { product, cart } = this.$store.getters
      return product ? { ...product, inCart: cart.some(cartItem => cartItem.product_id === product.id) } : null
    }
  },
  watch: {
      product (product) {
          if (product) {
            this.images = [this.product.logo, ...this.product.product_images.map(product_image => product_image.image )]
            this.$nextTick(() => {
                if (this.picturesIsMany) this.setSwiper()
            })
          }
      },
    quantity(value) {
      if (value < 1 || typeof value !== 'number') this.quantity = 1
    }
  },
  async created() {
      await this.$store.dispatch('fetchProduct', this.$route.params.id)
  },
  methods: {
    setSwiper () {
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
