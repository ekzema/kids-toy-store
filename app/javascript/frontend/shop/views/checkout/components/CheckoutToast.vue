<template>
  <div class="container wrap-toast">
    <h3>Успех!</h3>
    <span>Ваш заказ Принят!</span><br>
    <span>Ждите звонка от нашего мэнеджера.</span>
  </div>
</template>

<script>

export default {
  name: 'CheckoutToast',
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
