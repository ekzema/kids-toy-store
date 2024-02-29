export default {
  name: 'pagination-mixin',
  data: () => ({
    page: null
  }),
  methods: {
    paginationEvent(page) {
      const currentPath = this.$route.path
      const newPath = `${currentPath}?page=${page}`

      this.$router.push(newPath)
      this.page = page
    }
  }
}
