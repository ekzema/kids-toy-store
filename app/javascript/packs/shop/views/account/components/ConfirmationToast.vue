<template>
  <div class="container">
    <h3>Congratulations!</h3>
    <span> A link to confirm your registration has been sent to your email: <strong>{{email}}</strong></span>
  </div>
</template>

<script>

export default {
  name: 'confirmation-toast',

  data: () => ({

  }),
  props: ['email'],
  computed: {

  },
  created() {
  },
  methods: {

  }
}
</script>

<style scoped>
h3 {
  color: white;
  font-size: 18px;
}

span {
  font-size: 18px;
}


</style>
