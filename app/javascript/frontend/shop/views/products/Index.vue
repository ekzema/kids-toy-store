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
            <div id="myTabContent" class="tab-content" data-aos="fade-up" data-aos-duration="1300">
              <div id="our-features" class="tab-pane fade show active" role="tabpanel" aria-labelledby="our-features-tab">
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
// import MainSlider from './components/Slider'
import ListProducts from "./components/ListProducts"

export default {
  name: 'ProductsIndex',
  components: {
    // MainSlider,
    ListProducts
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
    }
  }
}
</script>
