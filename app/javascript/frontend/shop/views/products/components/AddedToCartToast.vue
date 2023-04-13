<template>
  <div class="container wrap-toast">
    <h3 class="text-center">Товар добавлен в корзину!</h3>
    <img :src="product.logo.small.url" alt=""><span> {{ product.name.ru }}</span>
  </div>
</template>

<script>

export default {
  name: 'AddedToCartToast',
  props: ['product'],
}
</script>

<style scoped>
.wrap-toast h3 {
  color: white !important;
  font-size: 18px;
  font-weight: bold;
}

.wrap-toast img {
  margin-right: 10px;
}

span {
  font-size: 18px;
}
</style>
