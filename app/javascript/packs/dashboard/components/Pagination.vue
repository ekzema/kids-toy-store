<template>
  <div class="text-center">
    <v-pagination
        class="pt-5"
        v-model="page"
        :length="totalPages"
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
    },
    totalPages: {
      type: Number,
      default: 0
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
