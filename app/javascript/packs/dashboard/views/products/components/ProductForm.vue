<template>
  <v-img
      :src="form.previews.logo ? form.previews.logo : form.defaultLogo"
      @click="triggerUpload('logo')"
      max-height="200"
  ></v-img>
  <v-file-input
      ref="logo"
      @change="logoOnChange"
      accept="image/*"
      label="Logo"
      variant="underlined"
      style="display: none"
  ></v-file-input>
  <v-form
      @submit.prevent="submitForm"
      ref="form"
      v-model="valid"
      lazy-validation
  >
    <v-text-field
        ref="name"
        v-model="form.data.name"
        :rules="requiredRules"
        label="Name"
        variant="underlined"
        color="primary"
        required
    ></v-text-field>
    <v-textarea
        ref="description"
        v-model="form.data.description"
        label="Description"
        color="primary"
        :rules="requiredRules"
        variant="underlined"
        required
    ></v-textarea>
     <nested-specification
         v-model:specifications="form.data.specifications"
     />
    <v-btn type="submit" color="success">{{ btnName }}</v-btn>
  </v-form>
</template>

<script>
import NestedSpecification from "./NestedSpecification";

export default {
  name: 'product-form',
  components: {
    NestedSpecification,
  },
  data: () => ({
    valid: false,
    requiredRules: [
      v => !!v || 'This field is required'
    ],
    form: {
      data: {
        name: '',
        description: '',
        specifications: []
      },
      defaultLogo: require('./../../../assets/img/quickadd_300X300.png'),
      previews: {
        logo: ''
      }
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
  created() {
  },
  methods: {
    triggerUpload(input) {
      this.$refs[input].click()
    },
    logoOnChange(event) {
      this.form.data.logo =
          event.target.files[0] && event.target.files[0].type.includes("image/")
              ? event.target.files[0]
              : ''

      this.form.previews.logo = this.form.data.logo ? URL.createObjectURL(this.form.data.logo) : ''
    },
    async submitForm() {
      if(!this.valid) return

      const formData = new FormData()
      Object.keys(this.form.data).forEach(key => {
        if(Array.isArray(this.form.data[key])) {
          if(this.form.data[key].length) formData.append(`product[${key}]`, JSON.stringify(this.form.data[key]))
        } else {
          formData.append(`product[${key}]`, this.form.data[key])
        }
      })

      await this.$emit('submitForm', formData)
      if(!this.product) this.clearForm()
    },
    clearForm() {
      this.$refs.form.reset()
      this.form.data.specifications = []
      this.form.data.logo = ''
      this.form.previews.logo = ''
    },
    setFormData() {
      this.form.data.name = this.product.name
      this.form.data.description = this.product.description
      this.form.data.specifications = this.product.specifications ? this.product.specifications : []
      this.form.previews.logo = this.product.logo.thumb.url
    }
  },
  watch: {
    product() {
      this.setFormData()
    }
  }
}
</script>
