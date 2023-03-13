<template>
  <div class="text-center">
    <v-pagination
        class="pt-5"
        v-model="selectPage"
        :length="selectTotalPages"
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
  props: {
    page:{
      type: Number
    },
    totalPages: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
      selectPage: this.page,
      selectTotalPages: this.totalPages
    }
  },
  created () {
  },
  methods: {
    onPage() {
      this.$emit('update:page', this.selectPage)
    }
  }
}
</script>
