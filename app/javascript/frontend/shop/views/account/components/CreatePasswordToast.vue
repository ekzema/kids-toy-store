<template>
  <div class="container">
    <span> Instructions for resetting your password have been sent to your email: <strong>{{email}}</strong></span>
  </div>
</template>

<script>

export default {
  name: 'create-password-toast',
  props: ['email'],
}
</script>

<style scoped>
h3 {
  color: white !important;
  font-size: 18px;
}

span {
  font-size: 18px;
}
</style>
