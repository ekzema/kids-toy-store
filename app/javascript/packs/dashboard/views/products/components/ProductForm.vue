<template>
  <v-img
      :src="form.logoPreview ? form.logoPreview : form.defaultLogo"
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
    <v-row justify="center"  v-for="(specification, index) in form.data.specifications" :key="index">
      <v-col
          cols="12"
          sm="3"
      >
        <v-text-field
            ref="specification_key"
            v-model="specification.key"
            :rules="requiredRules"
            label="Title"
            variant="underlined"
            color="primary"
            required
        ></v-text-field>
      </v-col>
      <v-col
          cols="12"
          sm="8"
      >
        <v-text-field
            ref="specification_value"
            v-model="specification.value"
            :rules="requiredRules"
            label="Description"
            variant="underlined"
            color="primary"
            required
        ></v-text-field>
      </v-col>
      <v-col
          cols="12"
          sm="1"
      >
        <v-btn
            icon
            variant="text"
            @click="removeSpec(index)">
          <v-icon color="pink">mdi-delete</v-icon>
        </v-btn>
      </v-col>
    </v-row>
    <v-row>
      <v-col
          cols="12"
      >
        <v-spacer></v-spacer>
        <div class="text-right">
        Add specification
        <v-btn
            icon
            size="x-small"
            color="primary"
            @click="addSpec"
        >
          <v-icon dark>
            mdi-plus
          </v-icon>
        </v-btn>
        </div>
      </v-col>
    </v-row>
    <v-btn type="submit" color="success">{{ btnName }}</v-btn>
  </v-form>
</template>

<script>

export default {
  name: 'product-form',
  data: () => ({
    valid: false,
    requiredRules: [
      v => !!v || 'This field is required'
    ],
    form: {
      data: {
        logo: '',
        name: '',
        description: '',
        specifications: []
      },
      defaultLogo: require('./../../../assets/img/quickadd_300X300.png'),
      logoPreview: ''
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

      this.form.logoPreview = this.form.data.logo ? URL.createObjectURL(this.form.data.logo) : ''
    },
    async submitForm() {
      if(!this.valid) return

      const formData = new FormData()
      if(this.form.data.specifications.length) formData.append('product[specifications]', JSON.stringify(this.form.data.specifications))
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
      this.form.logoPreview = ''
    },
    setFormData() {
      this.form.data = {
        name: this.product.name,
        description: this.product.description,
        specifications: this.product.specifications ? this.product.specifications : []
      }
      this.form.logoPreview = this.product.logo.thumb.url
    },
    addSpec() {
      this.form.data.specifications.push({key: '', value: ''})
    },
    removeSpec(index) {
      this.form.data.specifications.splice(index, 1)
    }
  },
  watch: {
    product() {
      this.setFormData()
    }
  }
}
</script>
