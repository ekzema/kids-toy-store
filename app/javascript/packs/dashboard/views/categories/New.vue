<template>
  <v-row justify="center">
    <v-col
        cols="12"
        sm="10"
        md="8"
        lg="6"
    >
      <v-form @submit.prevent="submitForm" ref="form">
        <h1 class="text-center mb-3">Create new category</h1>
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
    </v-col>
  </v-row>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'new',
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
    submitForm() {
      this.createCategories()
      this.clearForm()
    },
    createCategories() {
      this.$store.dispatch('createCategory', this.formData)
    },
    clearForm() {
      Object.keys(this.formData).forEach(key => {
        this.formData[key] = ''
      })
    }
  }
}
</script>
