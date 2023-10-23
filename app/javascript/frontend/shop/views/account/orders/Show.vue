<template>
  <h3>Order show</h3>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'OrderShow',
  computed: {
    ...mapGetters([
    ]),
  },
  created() {
    this.fetchOrder()
  },
  methods: {
    fetchOrder() {
      this.$store.dispatch('fetchOrder', this.$route.params.id)
    }
  }
}
</script>

<style scoped>

</style>
