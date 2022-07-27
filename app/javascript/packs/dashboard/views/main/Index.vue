<template>
  <h1>Main page</h1>
</template>

<script>
import config from "../../config"

export default {
  name: 'App',
  data: () => ({
  }),
  created() {
    console.log(config.baseUrl,'test')
  }
}
</script>
