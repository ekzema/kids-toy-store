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
        mdi-panorama
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
    <v-autocomplete
        label="Select categories"
        v-model="selectPeople"
        :items="people"
        variant="underlined"
        item-title="name"
        item-value="name"
        color="primary"
        multiple
    >
      <template v-slot:chip="{ props, item }">
        <v-chip
            class="ma-1"
            v-bind="props"
            :text="item.raw.name"
            color="primary"
            closable
            size="default"
            variant="outlined"
        >
          <strong>{{ item.raw.name }}</strong>&nbsp;
          <span style="font-size: 11px">{{ item.raw.group }}</span>
        </v-chip>
      </template>
      <template v-slot:item="{ props, item }">
        <v-list-item
            v-bind="props"
            :title="item.raw.name"
            :subtitle="item.raw.group"
            color="primary"
        ></v-list-item>
      </template>
    </v-autocomplete>
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
    <v-row>
      <v-col
          cols="12"
          xs="12"
          sm="6"
          md="6"
          lg="6"
      >
        <v-text-field
            v-model="form.data.code"
            :rules="codeRules"
            label="Product code"
            type="number"
            variant="underlined"
            color="primary"
            required
        ></v-text-field>
      </v-col>
      <v-col
          cols="12"
          xs="12"
          sm="6"
          md="6"
          lg="6"
      >
        <v-select
            v-model="form.data.status"
            label="Select parent category"
            variant="underlined"
            :items="form.status_items"
            item-value="id"
            item-title="title"
            color="primary"
        ></v-select>
      </v-col>
    </v-row>
    <v-row>
      <v-col
          cols="12"
          xs="12"
          sm="6"
          md="4"
          lg="4"
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
      </v-col>
      <v-col
          cols="12"
          xs="12"
          sm="6"
          md="4"
          lg="4"
      >
        <v-switch
            v-model="form.data.new"
            hide-details
            color="primary"
            label="New"
        ></v-switch>
      </v-col>
      <v-col
          cols="12"
          xs="12"
          sm="6"
          md="4"
          lg="4"
      >
        <v-switch
            class="d-flex justify-left"
            v-model="form.data.visible"
            hide-details
            color="primary"
            label="Visible"
        ></v-switch>
      </v-col>
    </v-row>
    <v-row>
      <v-col
          cols="12"
          xs="12"
          sm="4"
          md="4"
          lg="4"
      >
        <v-text-field
            v-model="form.data.discount_price"
            label="Discount price"
            type="number"
            variant="underlined"
            color="primary"
            required
        ></v-text-field>
      </v-col>
      <v-col
          cols="12"
          xs="12"
          sm="8"
          md="8"
          lg="8"
      >
        <v-switch
            v-model="form.data.discount"
            hide-details
            color="primary"
            label="Discount"
        ></v-switch>
      </v-col>
    </v-row>
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
    people: [
      { name: 'Sandra Adams', group: 'Group 1' },
      { name: 'Ali Connors', group: 'Group 1' },
      { name: 'Trevor Hansen', group: 'Group 1' },
      { name: 'Tucker Smith', group: 'Group 1' },
      { name: 'Britta Holt', group: 'Group 2' },
      { name: 'Jane Smith ', group: 'Group 2' },
      { name: 'John Smith', group: 'Group 2' },
      { name: 'Sandra Williams', group: 'Group 2' },
    ],
    selectPeople: [],
    valid: false,
    requiredRules: [
      v => !!v || 'This field is required'
    ],
    priceRules: [
        v => !!v  || 'This field is required',
        v => v > 100 || 'Price cannot be less than 100'
    ],
    codeRules: [
      v => !!v  || 'This field is required',
      v => v.toString().length > 3 || 'Number length must be >= 4'
    ],
    form: {
      data: {
        new: false,
        code: '',
        name: '',
        price: 0,
        status: false,
        visible: false,
        discount: false,
        description: '',
        discount_price: 0,
        specifications: []
      },
      status_items: [],
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
      this.form.data.code = this.product.code
      this.form.data.name = this.product.name
      this.form.data.price = this.product.price
      this.form.data.status = this.product.status.current
      this.form.data.visible = this.product.visible
      this.form.data.discount = this.product.discount
      this.form.data.description = this.product.description
      this.form.data.discount_price = this.product.discount_price
      this.form.data.specifications = this.product.specifications ? this.product.specifications : []

      this.form.status_items = this.product.status.items
      this.form.previews.logo = this.product.logo.thumb.url
      this.form.previews.gallery = [...this.product.product_images]
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
