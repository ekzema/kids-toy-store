<template>
  <div class="container">
    <span> Instructions for resetting your password have been sent to your email: <strong>{{ email }}</strong></span>
  </div>
</template>

<script>

export default {
  name: 'CreatePasswordToast',
  props: ['email'],
}
</script>

<style scoped>
span {
  font-size: 18px;
}
</style>
