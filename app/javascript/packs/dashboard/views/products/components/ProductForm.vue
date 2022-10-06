<template>
  <v-img
      :src="form.previews.logo"
      @click="triggerUpload('logo')"
      max-height="200"
  >
    <template v-slot:placeholder>
      <v-row class="fill-height ma-0" align="center" justify="center">
        <v-progress-circular
            indeterminate
            color="grey lighten-5"
        ></v-progress-circular>
      </v-row>
    </template>
  </v-img>
  <v-file-input
      ref="logo"
      @change="logoOnChange"
      accept="image/*"
      label="Logo"
      variant="underlined"
      style="display: none"
  ></v-file-input>
<!--  Start gallery-->
  <v-row class="ma-4">
    <v-col v-for="(value, index) in form.previews.gallery" :key="index" class="d-flex child-flex" cols="3">
      <v-img
          :src="value.blob"
          :lazy-src="form.previews.lazy.gallery"
      >
        <template v-slot:placeholder>
          <v-row class="fill-height ma-0" align="center" justify="center">
            <v-progress-circular
                indeterminate
                color="grey lighten-5"
            ></v-progress-circular>
          </v-row>
        </template>
      </v-img>
    </v-col>
  </v-row>
  <v-file-input
      ref="gallery"
      @change="galleryOnChange"
      accept="image/*"
      variant="underlined"
      style="display: none"
  ></v-file-input>
  <div class="text-center">
    Add image
    <v-btn
        @click="triggerUpload('gallery')"
        icon
        size="x-small"
        color="primary"
    >
      <v-icon dark>
        mdi-plus
      </v-icon>
    </v-btn>
  </div>
<!--  End gallery-->
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
        name: '',
        description: '',
        specifications: []
      },
      previews: {
        lazy: {
          gallery: require('./../../../assets/img/lazy_image_160x80.jpg')
        },
        logo: '',
        gallery: []
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
  computed: {
  },
  created() {
  },
  methods: {
    triggerUpload(input) {
      this.$refs[input].click()
    },
    logoOnChange(event) {
      this.form.data.logo = this.fetchFile(event)
      this.form.previews.logo = this.form.data.logo ? this.preparePreview(this.form.data.logo) : ''
    },
    galleryOnChange(event) {
      const image = this.fetchFile(event)
        this.form.previews.gallery.push({
          origin: image,
          blob: this.preparePreview(image)
        })
    },
    async submitForm() {
      if(this.specIsError()) return

      const formData = new FormData()
      Object.keys(this.form.data).forEach(key => {
        if(Array.isArray(this.form.data[key])) {
          formData.append(`product[${key}]`, JSON.stringify(this.form.data[key]))
        } else {
          formData.append(`product[${key}]`, this.form.data[key])
        }
      })

      this.form.previews.gallery.forEach((value, index) => {
        formData.append(`product[product_images_attributes][${index}][image]`, value.origin)
      })

      // formData.append('product[product_images_attributes][0][image]', this.form.data.logo)
      await this.$emit('submitForm', formData)
      if(!this.product) this.clearForm()
    },
    clearForm() {
      this.$refs.form.reset()
      this.form.data.specifications = []
      this.form.data.logo = ''
      this.form.previews.logo = ''
      this.form.previews.gallery = []
    },
    setFormData() {
      this.form.data.name = this.product.name
      this.form.data.description = this.product.description
      this.form.data.specifications = this.product.specifications ? this.product.specifications : []
      this.form.previews.logo = this.product.logo.thumb.url
    },
    addSpec() {
      this.form.data.specifications.push({key: '', value: ''})
    },
    removeSpec(index) {
      this.form.data.specifications.splice(index, 1)
    },
    specIsError() {
      return this.form.data.specifications.some(item => !item.key || !item.value)
    },
    preparePreview(image) {
      return URL.createObjectURL(image)
    },
    fetchFile(event) {
      return event.target.files[0] && event.target.files[0].type.includes("image/")
          ? event.target.files[0]
          : ''
    }
  },
  watch: {
    product() {
      this.setFormData()
    }
  }
}
</script>
