<template>
  <div class="text-center">
    <v-pagination
        v-model="selectPage"
        class="pt-5"
        :length="selectTotalPages"
        :total-visible="6"
        active-color="primary"
        rounded="circle"
        @update:modelValue="onPage"
    ></v-pagination>
  </div>
</template>

<script>

export default {
  name: 'DashboardPagination',
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
      selectPage: this.formatPage(),
      selectTotalPages: this.totalPages
    }
  },
  watch: {
    page() {
      this.selectPage = this.formatPage()
    }
  },
  created () {
  },
  methods: {
    onPage() {
      this.$emit('paginationEvent', this.selectPage)
    },
    formatPage() {
      return parseInt(this.page) || 1
    }
  }
}
</script>
