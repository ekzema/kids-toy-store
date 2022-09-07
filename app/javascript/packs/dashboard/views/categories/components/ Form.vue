<template>

</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'form',
  data: () => ({
    formData: {
      name: '',
      parent_id: ''
    }
  }),
  computed: {
    ...mapGetters([
      'categories',
      'parentCategories'
    ]),
  },
  created() {
    this.fetchParentCategories()
  },
  methods: {
    fetchParentCategories() {
      this.$store.dispatch('fetchParentCategories')
    },
    async submitForm() {
      await this.createCategories()
      this.clearForm()
      this.fetchParentCategories()
    },
    async createCategories() {
      await this.$store.dispatch('createCategory', this.formData)
    },
    clearForm() {
      Object.keys(this.formData).forEach(key => {
        this.formData[key] = ''
      })
    }
  }
}
</script>
