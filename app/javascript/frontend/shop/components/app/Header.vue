<template>
  <header class="header-wrapper">
    <div class="header-top">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
            <div class="header-info-left">
              <p>Free Returns and Free Shipping</p>
            </div>
          </div>
          <div class="col-xs-12 col-sm-7 col-md-8 col-lg-8 sm-pl-0 xs-pl-15 header-top-right">
            <div class="header-info">
              <a href="tel://+00123456789"><i class="fa fa-phone"></i> +00 123 456 789</a>
              <a href="mailto://demo@example.com"><i class="fa fa-envelope"></i> demo@example.com</a>
              <router-link v-if="user" :to="{ name: 'AccountDashboard'}">
                <i class="fa fa-user"></i> Account
              </router-link>
              <div class="wrap-account" v-if="!user">
                <router-link :to="{ name: 'AccountNew'}">
                  <i class="fa fa-user-plus"></i> Sign up
                </router-link>
                <router-link :to="{ name: 'AccountLogin'}">
                  <i class="fa fa-sign-in"></i> Login
                </router-link>
              </div>
              <router-link to="" @click="logout" v-else><i class="fa fa-sign-out"></i> Logout</router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="header-middle">
      <div class="container">
        <div class="row row-gutter-0 align-items-center">
          <div class="col-12">
            <div class="header-align">
              <div class="header-align-left">
                <div class="header-logo-area">
                  <router-link :to="{ name: 'ProductsIndex'}">
                      <img class="logo-main" src="./../../assets/img/logo.png" alt="Logo" />
                      <img class="logo-light" src="./../../assets/img/logo.png" alt="Logo" />
                  </router-link>
                </div>
              </div>
              <div class="header-align-center">
                <div class="header-search-box">
                  <form @submit.prevent="submitSearchForm">
                    <div class="form-input-item">
                      <label for="search" class="sr-only">Search Everything</label>
                      <input v-model="searchText" class="search-input" type="text" placeholder="Search Everything" @blur="handleBlur">
                      <button type="submit" class="disable-cleaner search-button btn-src">
                        <div v-if="spinner" class="input-spinner spinner-border-sm spinner-border" role="status">
                          <span class="visually-hidden">Loading...</span>
                        </div>
                        <i v-else class="pe-7s-search"></i>
                      </button>
                    </div>
                  </form>
                  <ul v-if="productsAutocomplete && productsAutocomplete.items.length" class="autocomplete">
                    <li class="text-center">
                      <b>Показано:</b>  {{ showingAutocomplete }} из {{ productsAutocomplete.found }}
                    </li>
                    <li v-for="(product, index) in productsAutocomplete.items" :key="index">
                      <router-link class="disable-cleaner search-link" :to="{ name: 'ProductsShow', params: { id: product.slug } }" @click="resetSearch">
                        <img :src="product.logo.url">
                        <span class="search-item-title">{{ product.name.ru }} </span>
                      </router-link>
                      <div class="wrap-price text-center">
                        <span class="search-item-price">{{ product.price }}</span>
                        <span class="search-item-currency">грн</span>
                      </div>
                    </li>
                    <li v-if="productsAutocomplete.found > productsAutocomplete.show" class="text-center">
                      <a href="#">Покаазать все результаты</a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="header-align-right">
                <div class="header-action-area">
                  <div class="header-action-wishlist">
                    <button class="btn-wishlist" @click="onWishlist">
                      <span v-if="showWishlist" class="cart-wishlist-count">{{ wishListCounter }}</span>
                      <i class="pe-7s-like"></i>
                    </button>
                  </div>
                  <div class="header-action-cart">
                    <button class="btn-cart cart-icon" @click="onCart">
                      <span v-if="cartItemsCount" class="cart-count">{{ cartItemsCount }}</span>
                      <i class="pe-7s-shopbag"></i>
                    </button>
                  </div>
                  <button class="btn-menu d-md-none">
                    <i class="ion-navicon"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="header-area header-default sticky-header">
      <div class="container">
        <div class="row row-gutter-0 align-items-center">
          <div class="col-4 col-sm-6 col-lg-4">
            <div ref="menu" class="menu">
              <button class="menu__btn" @click="closeMenu" @mouseover="menu('add')">
                <span class="menu__burger"><span></span></span><span class="menu__text">Каталог товаров</span>
              </button>
              <div class="menu__wrapper">
                <div v-for="category in categories" :key="category.id" class="menu__item">
                  <div class="wrap_menu_head">
                    <router-link class="menu__head" :to="{ name: 'Category', params: { category: category.slug }}" @click="menu('remove')">
                      {{ category.name.ru }}
                      <div v-if="category.subcategories.length" class="sub_button"></div>
                    </router-link>
                    <span v-if="category.subcategories.length" @click="openSubMenu" class="next_button">
                      ещё &#10132;
                    </span>
                  </div>
                  <div v-if="category.subcategories.length" class="menu__body">
                    <div class="menu__back" @click="closeSubMenu">
                      &larr; назад
                    </div>
                    <ul class="menu__list menu__list_1">
                      <li v-for="subcategory in category.subcategories" :key="subcategory.id">
                        <router-link
                            :to="{ name: 'Category', params: { category: category.slug, subcategory: subcategory.slug }}"
                            :title="subcategory.name.ru"
                            class="menu__link"
                            @click="menu('remove')">
                          {{ subcategory.name.ru }}
                        </router-link>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="header__bg"></div>
            </div>
          </div>
          <div class="col-lg-6 sticky-md-none">
            <div class="header-navigation-area d-none d-md-block">
              <ul class="main-menu nav position-relative">
                <li><a href="contact.html">Main page</a></li>
                <li><a href="contact.html">Contact</a></li>
                <li><a href="contact.html">About</a></li>
                <li><a href="contact.html">Blogs</a></li>
                <li><a href="contact.html">Stock</a></li>
              </ul>
            </div>
          </div>
          <div class="col-8 col-sm-6 col-lg-2">
            <div class="header-action-area">
              <div class="header-action-search">
                <button class="btn-search btn-search-menu">
                  <i class="pe-7s-search"></i>
                </button>
              </div>
              <div class="header-action-login">
                <button class="btn-login" onclick="window.location.href='login-register.html'">
                  <i class="pe-7s-users"></i>
                </button>
              </div>
              <div class="header-action-wishlist">
                <button class="btn-wishlist" @click="onWishlist">
                  <span v-if="showWishlist" class="cart-wishlist-count">{{ wishListCounter }}</span>
                  <i class="pe-7s-like"></i>
                </button>
              </div>
              <div class="header-action-cart">
                <button class="btn-cart cart-icon" @click="onCart">
                  <span v-if="cartItemsCount" class="cart-count">{{ cartItemsCount }}</span>
                  <i class="pe-7s-shopbag"></i>
                </button>
              </div>
              <button class="btn-menu d-lg-none">
                <i class="ion-navicon"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--== Start Side Menu ==-->
    <aside class="off-canvas-wrapper">
      <div class="off-canvas-inner">
        <div class="off-canvas-overlay d-none"></div>
        <!-- Start Off Canvas Content Wrapper -->
        <div class="off-canvas-content">
          <!-- Off Canvas Header -->
          <div class="off-canvas-header">
            <div class="close-action">
              <button class="btn-close"><i class="pe-7s-close"></i></button>
            </div>
          </div>

          <div class="off-canvas-item">
            <!-- Start Mobile Menu Wrapper -->
            <div class="res-mobile-menu">
              <!-- Note Content Auto Generate By Jquery From Main Menu -->
            </div>
            <!-- End Mobile Menu Wrapper -->
          </div>
          <!-- Off Canvas Footer -->
          <div class="off-canvas-footer"></div>
        </div>
        <!-- End Off Canvas Content Wrapper -->
      </div>
    </aside>
    <!--== End Side Menu ==-->
  </header>
</template>

<script>
import { mapGetters } from 'vuex'
import { cart } from '../../helpers/utils'

export default {
  name: 'AppHeader',
  data: () => ({
    searchText: '',
    timer: null,
    spinner: false
  }),
  computed: {
    ...mapGetters([
      'user',
      'categories',
      'cartItemsCount',
      'wishListCounter',
      'productsAutocomplete'
    ]),
    showWishlist() {
      return this.user && this.wishListCounter
    },
    showingAutocomplete() {
      if (!this.productsAutocomplete) return

      const { show, found } = this.productsAutocomplete

      return show > found ? found : show
    }
  },
  watch: {
    searchText(value) {
      if (this.timer) this.clearTimer()
      if (!value) {
        this.clearTimer()
        this.clearAutocomplete()
        this.spinner = false

        return
      }
      this.timer = setTimeout(() => {
        const setSpinner = setTimeout(() => this.spinner = true, 100)

        this.$store.dispatch('productsAutocomplete', { q: value }).then(() => {
          clearTimeout(setSpinner)
          this.spinner = false
        })
      }, 800)
    }
  },
  created() {
    this.$store.dispatch('fetchCategories')

    const params = new URLSearchParams(window.location.search)
    const q = params.get('q')
    if (q) this.searchText = q
  },
  methods: {
   async logout() {
     await this.$store.dispatch('deleteSession', { id: '', options: { fullResponse: true }})
     this.$store.dispatch('clearUser')
     this.$store.commit('setCart', cart.get())
    },
    menu(type) {
      const menu = this.$refs.menu
      type === 'remove' ? menu.classList.remove("menu") : menu.classList.add('menu')
    },
    closeMenu() {
      const bg = document.querySelector('.header__bg')
      if (window.getComputedStyle(bg).visibility === 'visible') this.menu('remove')
    },
    openSubMenu(event) {
      event.target.parentElement.parentElement.classList.add('open')
    },
    closeSubMenu(event) {
      event.target.parentElement.parentElement.classList.remove('open')
    },
    resetSearch() {
      this.clearAutocomplete()
      this.searchText = ''
    },
    handleBlur(e) {
      if (e.relatedTarget && ~e.relatedTarget.className.indexOf('disable-cleaner')) return
      this.resetSearch()
    },
    clearAutocomplete() {
      this.$store.commit('setProductsAutocomplete', null)
    },
    clearTimer() {
      clearTimeout(this.timer)
      this.timer = null
    },
    submitSearchForm() {
      this.clearAutocomplete()
      this.$router.push({ name: 'ProductsSearch', query: { q: this.searchText } })
    },
    onWishlist() {
      this.$router.push({ name: 'WishlistShow' })
    },
    onCart() {
      this.$router.push({ name: 'CartShow' })
    }
  }
}
</script>

<style scoped>
  .input-spinner {
    position: absolute;
    font-size: 10px;
    top: 14px;
    right: 14px;
    color: white;
  }

  .wrap-account {
    padding-left: 20px;
    margin-left: 19px;
  }
</style>
