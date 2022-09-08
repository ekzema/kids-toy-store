<template>
  <v-form @submit.prevent="submitForm" ref="form">
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
    <v-btn type="submit" color="success">{{ btnName }}</v-btn>
  </v-form>
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
  props: {
    btnName: {
      type: String,
      default: 'Save'
    }
  },
  computed: {
    ...mapGetters([
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
      await this.$emit('submitForm', this.formData)
      this.clearForm()
      this.fetchParentCategories()
    },
    clearForm() {
      Object.keys(this.formData).forEach(key => {
        this.formData[key] = ''
      })
    }
  }
}
</script>
