<template>
  <v-row justify="center">
    <v-col
        cols="12"
        sm="10"
        md="8"
        lg="6"
    >
      <v-sheet
          elevation="4"
          class="pa-4"
      >
      <h1 class="text-center mb-3">Create new category</h1>
      <category-form
          @submit-form="submitForm"
          btn-name="Create"
      />
      </v-sheet>
    </v-col>
  </v-row>
</template>

<script>
import CategoryForm from "./components/CategoryForm"

export default {
  name: 'CategoriesNew',
  components: {
    CategoryForm,
  },
  data: () => ({
  }),
  methods: {
    async submitForm(formData, fetchParentCategories) {
      await this.$store.dispatch('createCategory', formData)
      fetchParentCategories()
    }
  }
}
</script>
