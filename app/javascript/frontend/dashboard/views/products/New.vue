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
      <h1 class="text-center mb-3">Create new product</h1>
      <product-form
          @submit-form="submitForm"
          btn-name="Create"
      />
      </v-sheet>
    </v-col>
  </v-row>
</template>

<script>
import ProductForm from "./components/ProductForm"

export default {
  name: 'new',
  components: {
    ProductForm,
  },
  data: () => ({
  }),
  methods: {
    async submitForm(formData) {
      await this.$store.dispatch('createProduct', formData)
    }
  }
}
</script>
