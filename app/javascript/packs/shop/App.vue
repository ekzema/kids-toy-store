<template>
  <div class="wrapper home-default-wrapper">
    <app-header/>
    <main class="main-content">
      <router-view></router-view>
    </main>
    <app-footer/>
  </div>
</template>

<script>
import AppHeader from './components/app/Header'
import AppFooter from './components/app/Footer'
import { user } from './config'

export default {
  components: {
    AppHeader,
    AppFooter
  },
  data () {
    {
    }
  },
  created () {
    this.$store.commit('setUser', user)
  }
}
</script>

<style scoped>
</style>
