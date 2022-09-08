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
      <Form
          @submit-form="submitForm"
          btn-name="Create"
      />
      </v-sheet>
    </v-col>
  </v-row>
</template>

<script>
import Form from "./components/ Form";

export default {
  name: 'new',
  components: {
    Form,
  },
  data: () => ({
  }),
  methods: {
    async submitForm(formData) {
      await this.$store.dispatch('createCategory', formData)
    }
  }
}
</script>
