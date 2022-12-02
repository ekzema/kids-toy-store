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
        <h1 class="text-center mb-3">Edit category</h1>
        <category-form
            @submit-form="submitForm"
            btn-name="Update"
            :category="category"
        />
      </v-sheet>
    </v-col>
  </v-row>
</template>

<script>
import { mapGetters } from 'vuex'
import CategoryForm from "./components/CategoryForm";

export default {
  name: 'edit',
  components: {
    CategoryForm,
  },
  data: () => ({
  }),
  computed: {
    ...mapGetters([
      'category',
    ]),
  },
  created() {
    this.fetchCategory()
  },
  methods: {
    async fetchCategory() {
      await this.$store.dispatch('fetchCategory', this.$route.params.id)
    },
    async submitForm(formData, _fetchParentCategories) {
      const data = { id: this.$route.params.id, form: formData }
      await this.$store.dispatch('updateCategory', data)
    }
  }
}
</script>
