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
  name: 'category-form',
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
    },
    category: {
      type: Object,
      default: null
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
    async fetchParentCategories() {
      const params = this.category ? { id: this.$route.params.id } : {}
      await this.$store.dispatch('fetchParentCategories', params)
    },
    async submitForm() {
      await this.$emit('submitForm', this.formData)
      await this.fetchParentCategories()
      if(!this.category) this.clearForm()
    },
    clearForm() {
      Object.keys(this.formData).forEach(key => {
        this.formData[key] = ''
      })
    },
    setFormData() {
      this.formData = {
        name: this.category.name,
        parent_id: this.category.parent_id
      }
    }
  },
  watch: {
    category() {
      this.setFormData()
    }
  }
}
</script>
