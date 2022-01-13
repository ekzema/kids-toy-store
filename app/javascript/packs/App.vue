<template>
  <div class="wrapper home-default-wrapper">
    <app-header/>
    <router-view></router-view>
    <app-footer/>
  </div>
</template>

<script>
import AppHeader from './components/app/Header'
import AppFooter from './components/app/Footer'

export default {
  data () {
    {
    }
  },
  components: {
    AppHeader,
    AppFooter
  },
  created () {
  }
}
</script>

<style scoped>
</style>
