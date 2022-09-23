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
          className="pa-4"
      >
        <h1 className="text-center mb-3">Edit product</h1>
        <product-form
            @submit-form="submitForm"
            btn-name="Update"
            :product="product"
        />
      </v-sheet>
    </v-col>
  </v-row>
</template>

<script>
import { mapGetters } from 'vuex'
import ProductForm from "./components/ProductForm"

export default {
  name: 'edit',
  components: {
    ProductForm,
  },
  data: () => ({}),
  computed: {
    ...mapGetters([
      'product',
    ]),
  },
  created() {
    this.fetchProduct()
  },
  methods: {
    async fetchProduct() {
      await this.$store.dispatch('fetchProduct', this.$route.params.id)
    },
    async submitForm(formData) {
      const data = { id: this.$route.params.id, form: formData }
      await this.$store.dispatch('updateProduct', data)
    }
  }
}
</script>
