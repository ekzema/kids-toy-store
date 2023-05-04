<template>
  <section class="product-area product-style1-area">
    <div class="container">
      <div class="row">
        <div class="col-md-6 m-auto">
          <div v-if="!isCategoryName" class="section-title text-center" data-aos="fade-up" data-aos-duration="1000">
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
                      <div v-if="isCategoryName" class="row">
                        <div class="col-lg-9 order-0 order-lg-1">
                          <div class="row">
                            <list-products :side-bar="isCategoryName" />
                          </div>
                        </div>
                        <side-bar/>
                      </div>
                      <div v-else class="row">
                        <list-products :side-bar="isCategoryName" />
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
import SideBar from './components/SideBar'

export default {
  name: 'ProductsIndex',
  components: {
    // MainSlider,
    ListProducts,
    SideBar
  },
  computed: {
    isCategoryName() {
      return this.$route.name === 'Category'
    }
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
      this.fetchProducts({ categories: category, ...this.$route.query })
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
