<template>
  <v-img
      :src="form.previews.logo ? form.previews.logo : form.previews.defaultLogo"
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
    <v-col v-for="(value, index) in form.previews.gallery" :key="index" class="wrapImg d-flex child-flex" cols="3">
      <v-img
          :src="value.blob ? value.blob : value.image.thumb.url"
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
      <v-btn
          icon
          variant="text"
          size="x-small"
          @click="removeImage(index)"
      >
        <v-icon color="pink">mdi-delete</v-icon>
      </v-btn>
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
        v-model="form.data.price"
        :rules="priceRules"
        label="Price"
        type="number"
        variant="underlined"
        color="primary"
        required
    ></v-text-field>
    <v-row class="justify-center align-center">
      <v-col
          class="justify-center align-center"
          cols="12"
          xs="12"
          sm="8"
          md="6"
          lg="4"
      >
        <v-switch
            v-model="form.data.new"
            hide-details
            color="primary"
            :label="`New: ${form.data.new ? 'on' : 'off'}`"
        ></v-switch>
      </v-col>
      <v-col
          cols="12"
          xs="12"
          sm="8"
          md="6"
          lg="4"
      >
        <v-switch
            v-model="form.data.visible"
            hide-details
            color="primary"
            :label="`Visible: ${form.data.visible ? 'on' : 'off'}`"
        ></v-switch>
      </v-col>
      <v-col
          cols="12"
          xs="12"
          sm="8"
          md="6"
          lg="4"
      >
        <v-switch
            v-model="form.data.discount"
            hide-details
            color="primary"
            :label="`Discount: ${form.data.discount ? 'on' : 'off'}`"
        ></v-switch>
      </v-col>
    </v-row>
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
    priceRules: [
        v => !!v  || 'This field is required',
        v => v > 100 || 'Price cannot be less than 100'
    ],
    form: {
      data: {
        new: false,
        name: '',
        price: 0,
        visible: false,
        discount: false,
        description: '',
        specifications: []
      },
      previews: {
        lazy: {
          gallery: require('./../../../assets/img/lazy_image_160x80.jpg')
        },
        defaultLogo: require('./../../../assets/img/logo_default.png'),
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
      const { valid } = await this.$refs.form.validate()
      if(!valid) return

      const formData = new FormData()
      Object.keys(this.form.data).forEach(key => {
        if(Array.isArray(this.form.data[key])) {
          formData.append(`product[${key}]`, JSON.stringify(this.form.data[key]))
        } else {
          formData.append(`product[${key}]`, this.form.data[key])
        }
      })

      this.form.previews.gallery.forEach((value, index) => {
        if(value.blob)
          formData.append(`product[product_images_attributes][${index}][image]`, value.origin)
      })

      await this.$emit('submitForm', formData)
      if(!this.product) this.clearForm()
    },
    clearForm() {
      this.$refs.form.reset()

      this.form.data.logo = ''
      this.form.previews.logo = ''
      this.form.previews.gallery = []
      this.form.data.specifications = []
    },
    setFormData() {
      this.form.data.new = this.product.new
      this.form.data.name = this.product.name
      this.form.data.price = this.product.price
      this.form.data.visible = this.product.visible
      this.form.data.discount = this.product.discount
      this.form.previews.logo = this.product.logo.thumb.url
      this.form.data.description = this.product.description
      this.form.previews.gallery = [...this.product.product_images]
      this.form.data.specifications = this.product.specifications ? this.product.specifications : []
    },
    addSpec() {
      this.form.data.specifications.push({key: '', value: ''})
    },
    removeSpec(index) {
      this.form.data.specifications.splice(index, 1)
    },
    preparePreview(image) {
      return URL.createObjectURL(image)
    },
    fetchFile(event) {
      return event.target.files[0] && event.target.files[0].type.includes("image/")
          ? event.target.files[0]
          : ''
    },
    async removeImage(index) {
      const image = this.form.previews.gallery[index]
      if (image.id) await this.$store.dispatch('deleteProductImage', image.id)

      this.form.previews.gallery.splice(index, 1)
    }
  },
  watch: {
    product() {
      this.setFormData()
    }
  }
}
</script>

<style scoped>
.wrapImg{
  position: relative;
}

.wrapImg:hover button {
  opacity: 1;
}

.wrapImg button {
  position: absolute;
  bottom: 10px;
  left: calc(50% - 20px);
  background-color: rgba(255,255,255, 0.6);
  opacity: 0;
  transition: .5s all;
  z-index: 999;
}
</style>
