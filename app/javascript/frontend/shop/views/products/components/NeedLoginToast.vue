<template>
  <div class="container wrap-toast">
    <h3>Need to login!</h3>
    <span>You must be <span @click="loginPage">logged</span> in to add a product to your wish list.</span><br>
  </div>
</template>

<script>
import router from '../../../router'

export default {
  name: 'NeedLoginToast',
  methods: {
    loginPage () {
      router.push({ name: 'AccountLogin'})
    }
  }
}
</script>

<style scoped>
.wrap-toast h3 {
  color: white !important;
  font-size: 18px;
}

span {
  font-size: 18px;
}

span span {
  cursor: pointer;
  font-weight: bold;
  text-decoration: underline;
}
</style>
