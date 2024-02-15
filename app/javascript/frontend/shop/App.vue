<template>
  <!--== Start Preloader Content ==-->
  <div class="preloader-wrap">
    <div class="preloader">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!--== End Preloader Content ==-->
  <div class="wrapper home-default-wrapper">
    <app-header/>
    <main class="main-content">
      <router-view></router-view>
    </main>
    <app-footer v-if="footer" />
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import AppHeader from './components/app/Header'
import AppFooter from './components/app/Footer'
import { user } from '../helpers/utils'
import { cart } from './helpers/utils'

export default {
  components: {
    AppHeader,
    AppFooter
  },
  computed: {
    ...mapGetters([
      'loader',
      'footer'
    ]),
  },
  watch: {
    loader() {
      if (this.loader) {
        document.body.classList.remove('preloader-deactive')
        document.body.classList.add('overflow_hidden')
      } else {
        document.body.classList.add('preloader-deactive')
        document.body.classList.remove('overflow_hidden')
      }
    }
  },
  created() {
    this.$store.commit('setUser', user)
    if (user) this.$store.dispatch('fetchUserInfo')
    if (!user) this.$store.commit('setCart', cart.get())

    const lang = localStorage.getItem('language')
    if(lang) {
      this.$store.commit('setLanguage', lang)
      this.$i18n.locale = lang
    }

  }
}
</script>

<style scoped>
</style>
