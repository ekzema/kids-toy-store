<template>
  <div class="container wrap-toast">
    <h3>Congratulations!</h3>
    <span> A link to confirm your registration has been sent to your email: <strong>{{ email }}</strong></span>
  </div>
</template>

<script>

export default {
  name: 'ConfirmationToast',
  props: ['email'],
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
</style>
