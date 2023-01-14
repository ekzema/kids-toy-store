<template>
  <div class="text-center">
    <v-pagination
        class="pt-5"
        v-model="page"
        :length="6"
        rounded="circle"
        color="primary"
    ></v-pagination>
  </div>
</template>

<script>

export default {
  name: 'pagination',
  data: () => ({
    page: 1
  }),
  props: {

  },
  created () {
  },
  methods: {

  }
}
</script>
