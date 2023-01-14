<template>
  <div class="text-center">
    <v-pagination
        class="pt-5"
        v-model="page"
        :length="100"
        :total-visible="6"
        @update:modelValue="onPage"
        rounded="circle"
        active-color="primary"
    ></v-pagination>
  </div>
</template>

<script>

export default {
  name: 'pagination',
  data: () => ({
  }),
  props: {
    page:{
      type: Number
    }
  },
  created () {
  },
  methods: {
    onPage() {
      this.$emit('update:page', this.page)
    }
  }
}
</script>
