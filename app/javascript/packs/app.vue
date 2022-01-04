<template>
    <p>{{ message }}</p>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Store!"
    }
  },
  created () {
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
