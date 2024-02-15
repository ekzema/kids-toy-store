<template>
  <section class="product-area product-style1-area">
    <div class="container">
      <div class="row">
        <div class="col-md-6 m-auto">
          <div v-if="!isCategoryName" class="section-title text-center">
            <h2 class="title">{{ $t('MAIN.TITLE.LATEST_PRODUCTS') }}</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="product-tab-content">
            <div id="myTabContent" class="tab-content">
              <div id="our-features" class="tab-pane fade show active" role="tabpanel" aria-labelledby="our-features-tab">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="product">
                      <div v-if="isCategoryName" class="row">
                        <div class="col-lg-9 order-0 order-lg-1">
                          <div class="row">
                            <div v-if="currentCategory" class="section-title text-center">
                              <h2 class="title">{{ currentCategory.name[language] }}</h2>
                            </div>
                            <list-products :side-bar="isCategoryName" />
                            <pagination
                                v-show="showPagination"
                                :page="page"
                                :total-items="products.count"
                                @pagination-event="paginationEvent"
                            />
                          </div>
                        </div>
                        <side-bar/>
                      </div>
                      <div v-else class="row">
                        <list-products :side-bar="isCategoryName" />
                        <pagination
                            v-show="showPagination"
                            :page="page"
                            :total-items="products.count"
                            @pagination-event="paginationEvent"
                        />
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
import ListProducts from './components/ListProducts'
import SideBar from './components/SideBar'
import { mapGetters } from 'vuex'
import ProductsInCartMixin from './mixins/ProductsInCartMixin'
import Pagination from '../../components/Pagination'
import { perPage } from '../../config'

export default {
  name: 'ProductsIndex',
  components: {
    // MainSlider,
    ListProducts,
    SideBar,
    Pagination
  },
  mixins: [ProductsInCartMixin],
  data() {
    return {
      page: null
    }
  },
  computed: {
    ...mapGetters([
      'language',
      'categories'
    ]),
    isCategoryName() {
      return this.$route.name === 'Category'
    },
    currentCategory() {
      const { category, subcategory } = this.$route.params

      return subcategory
        ? this.categories.flatMap(obj => obj.subcategories).find(sub => sub.slug === subcategory)
        : this.categories.find(obj => obj.slug === category)
    },
    showPagination() {
      return this.products.count > perPage
    }
  },
  watch: {
    '$route.params'() {
      if (!this.$route.query.page) this.page = null
      this.fetchProductsByCategory()
    }
  },
  created() {
    if (this.$route.query.page ) this.page = this.$route.query.page
    this.$route.params.category ? this.fetchProductsByCategory() : this.fetchProducts()
  },
  methods: {
    fetchProducts(params = {}) {
      if (this.page) params.page = this.page
      this.$store.dispatch('fetchProducts', params)
    },
    buildFilteredByCategory(category) {
      const params = { categories: category, ...this.$route.query }
      if (this.page) params.page = this.page
      this.fetchProducts(params)
    },
    fetchProductsByCategory() {
      const params = this.$route.params
      if (this.page) params.page = this.page

      params.subcategory
        ? this.buildFilteredByCategory(params.subcategory)
        : this.buildFilteredByCategory(params.category)
    },
    paginationEvent(page) {
      const currentPath = this.$route.path;
      const newPath = `${currentPath}?page=${page}`

      this.$router.push(newPath)
      this.page = page
    }
  }
}
</script>
