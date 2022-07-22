<template>
  <v-app>
      <HelloWorld/>
  </v-app>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'

export default {
  name: 'App',

  components: {
    HelloWorld,
  },

  data: () => ({
    //
  }),
}
</script>

<style>
  html {
    overflow-y: auto !important;
  }
</style>
