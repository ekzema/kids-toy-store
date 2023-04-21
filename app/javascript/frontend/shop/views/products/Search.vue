<template>
  <section class="product-area product-style1-area">
    <div class="container">
      <div class="row">
        <div class="col-md-6 m-auto">
          <div class="section-title text-center" data-aos="fade-up" data-aos-duration="1000">
            <p class="title">Вы искали: "{{ $route.query.q }}"</p>
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
                        <list-products/>
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
import ListProducts from "./components/ListProducts"

export default {
  name: 'ProductsSearch',
  components: {
    ListProducts
  },
  watch: {
    '$route.query'(e) {
      this.fetchProducts({ ...e })
    }
  },
  created() {
    this.fetchProducts({ q: this.$route.query.q })
  },
  methods: {
    fetchProducts(params = {}) {
      if (!params.q) return this.$store.commit('clearProducts')
      this.$store.dispatch('fetchProducts', params)
    }
  }
}
</script>

<style scoped>
</style>
