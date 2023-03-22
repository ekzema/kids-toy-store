<template>
  <section class="product-area product-style1-area">
    <div class="container">
      <div class="row">
        <div class="col-md-6 m-auto">
          <div class="section-title text-center" data-aos="fade-up" data-aos-duration="1000">
            <h2 class="title">New Products</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="product-tab-content">
            <div class="tab-content" id="myTabContent" data-aos="fade-up" data-aos-duration="1300">
              <div class="tab-pane fade show active" id="our-features" role="tabpanel" aria-labelledby="our-features-tab">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="product">
                      <div class="row">
                        <div v-for="product in products" :key="product.id"  class="col-lg-3 col-md-4 col-sm-6 wrap-item">
                          <!-- Start Product Item -->
                          <div class="product-item">
                            <div class="product-thumb">
                              <img :src="product.logo.pre_medium.url" alt="Image">
                              <div class="product-action">
                                <a class="action-quick-view" href="shop-cart.html"><i class="ion-ios-cart"></i></a>
                                <a class="action-quick-view" href="javascript:void(0)"><i class="ion-arrow-expand"></i></a>
                                <a class="action-quick-view" href="shop-wishlist.html"><i class="ion-heart"></i></a>
                              </div>
                            </div>
                            <div class="product-info">
                              <div class="code">
                                <span class="code">Код товара: {{product.code}}</span>
                              </div>
                              <h4 class="title text-center"><a href="shop-single-product.html">{{product.name.ru}}</a></h4>
                              <div class="prices">
                                <span class="price">{{product.price}} грн</span>
                              </div>
                            </div>
                          </div>
                          <!-- End Product Item -->
                        </div>
                      </div>
                    </div>
                  </div>
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
import {mapGetters} from "vuex";

export default {
  data () {
  },
  created() {
    this.$store.dispatch('fetchProducts')
  },
  methods: {
  },
  computed: {
    ...mapGetters([
      'products'
    ]),
  },
}
</script>
