<template>
  <div class="container wrap-toast">
    <h3>Success!</h3>
    <span>Your password has been successfully reset.</span><br>
    <span>Now you can try logging into your account again.</span>
  </div>
</template>

<script>

export default {
  name: 'update-password-toast',
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
