export default {
  name: 'pagination-mixin',
  data: () => ({
    page: null
  }),
  methods: {
    paginationEvent(page) {
      const query = { ...this.$route.query }
      query.page = page
      this.$router.replace({ query })

      this.page = page
    }
  }
}
