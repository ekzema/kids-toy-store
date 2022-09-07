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
        <v-form @submit.prevent="submitForm" ref="form">
          <h1 class="text-center mb-3">Edit category</h1>
          <v-text-field
              ref="name"
              v-model="formData.name"
              label="Name"
              variant="underlined"
              color="primary"
          ></v-text-field>
          <v-select
              v-model="formData.parent_id"
              label="Select parent category"
              variant="underlined"
              :items="parentCategories"
              item-value="id"
              item-title="name"
              color="primary"
          ></v-select>
          <v-btn type="submit" color="success">Create</v-btn>
        </v-form>
      </v-sheet>
    </v-col>
  </v-row>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'edit',
  data: () => ({
    formData: {
      name: '',
      parent_id: ''
    }
  }),
  computed: {
    ...mapGetters([
      'category',
      'parentCategories',
    ]),
  },
  created() {
    this.fetchParentCategories()
    this.fetchCategory()
  },
  methods: {
    async fetchParentCategories() {
      await this.$store.dispatch('fetchParentCategories')
    },
    async fetchCategory() {
      await this.$store.dispatch('fetchCategory', this.$route.params.id)
      this.setFormData()
    },
    async submitForm() {
      await this.updateCategories()
      this.fetchParentCategories()
    },
    async updateCategories() {
      const data = { id: this.$route.params.id, form: this.formData }
      await this.$store.dispatch('updateCategory', data)
    },
    clearForm() {
      Object.keys(this.formData).forEach(key => {
        this.formData[key] = ''
      })
    },
    setFormData() {
      this.formData.name = this.category.name
      this.formData.parent_id = this.category.parent_id
    }
  }
}
</script>
