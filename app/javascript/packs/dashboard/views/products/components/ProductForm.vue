<template>
  <v-form
      @submit.prevent="submitForm"
      ref="form"
      v-model="valid"
      lazy-validation
  >
    <v-text-field
        ref="name"
        v-model="formData.name"
        :rules="nameRules"
        label="Name"
        variant="underlined"
        color="primary"
        required
    ></v-text-field>
    <v-textarea
        ref="description"
        v-model="formData.description"
        label="Description"
        color="primary"
        :rules="descriptionRules"
        variant="underlined"
        required
    ></v-textarea>
    <v-btn type="submit" color="success">{{ btnName }}</v-btn>
  </v-form>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'product-form',
  data: () => ({
    valid: false,
    nameRules: [
      v => !!v || 'Name is required'
    ],
    descriptionRules: [
      v => !!v || 'Name is required'
    ],
    formData: {
      name: '',
      description: ''
    }
  }),
  props: {
    btnName: {
      type: String,
      default: 'Save'
    },
    product: {
      type: Object,
      default: null
    }
  },
  computed: {
    ...mapGetters([
    ]),
  },
  created() {
  },
  methods: {
    async submitForm() {
      if(!this.valid) return

      await this.$emit('submitForm', this.formData)
      if(!this.product) this.clearForm()
    },
    clearForm() {
      this.$refs.form.reset()
    },
    setFormData() {
      this.formData = {
        name: this.product.name,
        description: this.product.description,
      }
    }
  },
  watch: {
    product() {
      this.setFormData()
    }
  }
}
</script>
