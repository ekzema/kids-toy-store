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
  <select-language
      class="d-flex flex-row-reverse"
      v-model:language="language"
  />
  <v-form
      @submit.prevent="submitForm"
      ref="form"
      v-model="valid"
      lazy-validation
  >
    <v-autocomplete
        label="Select categories"
        v-model="form.data.categories"
        :rules="requiredArrayRules"
        :items="detailConstructor.categories"
        variant="underlined"
        item-title="name"
        item-value="id"
        color="primary"
        multiple
    >
      <template v-slot:chip="{ props, item }">
        <v-chip
            class="ma-1"
            v-bind="props"
            color="primary"
            closable
            size="default"
            variant="outlined"
        >
          <strong>{{ item.raw.name ? item.raw.name[language] : '' }}</strong>&nbsp;
          <span style="font-size: 11px">{{ item.raw.parent_name ? item.raw.parent_name[language] : 'parent' }}</span>
        </v-chip>
      </template>
      <template v-slot:item="{ props, item }">
        <v-list-item
            v-bind="props"
            :title="item.raw.name[language]"
            :subtitle="item.raw.group"
            color="primary"
        ></v-list-item>
      </template>
    </v-autocomplete>
    <v-text-field
        ref="name"
        v-model="form.data.name[language]"
        :rules="requiredRules"
        label="Name"
        variant="underlined"
        color="primary"
        required
    ></v-text-field>
    <v-textarea
        ref="description"
        v-model="form.data.description[language]"
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
            v-model.number="form.data.code"
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
            :rules="requiredRules"
            label="Select product status"
            variant="underlined"
            :items="detailConstructor.statuses"
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
          md="6"
          lg="6"
      >
        <v-select
            v-model="form.data.for_gender"
            :rules="requiredRules"
            label="Select gender"
            variant="underlined"
            :items="detailConstructor.genders"
            item-value="id"
            item-title="title"
            color="primary"
        ></v-select>
      </v-col>
      <v-col
          cols="12"
          xs="12"
          sm="6"
          md="6"
          lg="6"
      >
        <v-select
            v-model="form.data.for_age"
            :rules="requiredRules"
            label="Select age children"
            variant="underlined"
            :items="detailConstructor.age"
            color="primary"
        >
          <template v-slot:item="{ props, item }">
            <v-list-item
                v-bind="props"
                :title="item.raw + '+'"
            />
          </template>
          <template v-slot:selection="{ item }">
            {{ item.raw + '+' }}
          </template>
        </v-select>
      </v-col>
    </v-row>
    <v-row>
      <v-col
          cols="12"
          xs="12"
          sm="6"
          md="6"
          lg="6"
      >
        <v-select
            v-model="form.data.production_country"
            :rules="requiredRules"
            label="Select country of manufacture"
            variant="underlined"
            :items="detailConstructor.countries"
            item-value="id"
            item-title="title"
            color="primary"
        ></v-select>
      </v-col>
      <v-col
          cols="12"
          xs="12"
          sm="6"
          md="6"
          lg="6"
      >
        <v-combobox
            ref="name"
            v-model="form.data.brand"
            :items="brands"
            @update:modelValue="setBrands"
            label="Brand"
            variant="underlined"
            item-title="name"
            color="primary"
            required
        ></v-combobox>
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
import { mapGetters } from 'vuex'
import { uniqNumber } from '../../../helpers/utils'
import SelectLanguage from '../../../components/SelectLanguage'
import { languages } from '../../../config'

export default {
  name: 'product-form',
  components: {
    SelectLanguage,
  },
  data: () => ({
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
    requiredArrayRules: [
      v => v.length > 0 || 'Please select a category.'
    ],
    language: 'uk',
    form: {
      data: {
        new: false,
        code: '',
        name: {},
        price: 0,
        brand: null,
        status: null,
        for_age: null,
        visible: false,
        discount: false,
        for_gender: null,
        categories: [],
        description: {},
        discount_price: 0,
        specifications: [],
        production_country: null
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
    ...mapGetters([
      'detailConstructor',
      'brands'
    ])
  },
  created() {
    this.$store.dispatch('fetchDetailConstructor')
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
      await this.checkValidDataLang()

      const { valid } = await this.$refs.form.validate()
      if(!valid) return

      const formData = new FormData()
      Object.keys(this.form.data).forEach(key => {
        if(key === 'specifications') return formData.append(`product[${key}]`, JSON.stringify(this.form.data[key]))
        if(key === 'categories') return this.setCategories(formData)
        if(key === 'description') return formData.append(`product[${key}]`, JSON.stringify(this.form.data[key]))
        if(key === 'name') return formData.append(`product[${key}]`, JSON.stringify(this.form.data[key]))
        if(key === 'brand') return this.setBrand(formData)

        formData.append(`product[${key}]`, this.form.data[key])
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
      this.form.data.status = this.product.status
      this.form.data.for_age = this.product.for_age
      this.form.data.visible = this.product.visible
      this.form.data.discount = this.product.discount
      this.form.data.for_gender = this.product.for_gender
      this.form.data.categories = this.prepareCategories()
      this.form.data.description = this.product.description
      this.form.data.discount_price = this.product.discount_price
      this.form.data.specifications = this.product.specifications ? this.product.specifications : []
      this.form.data.production_country = this.product.production_country

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
    },
    prepareCategories() {
      return this.product.product_categories.map(product_category => product_category.category_id);
    },
    setCategories(formData) {
      if(this.product && this.product.product_categories.length) {
        this.product.product_categories.forEach(product_category => {
          if(!this.form.data.categories.some(category => category === product_category.category_id)) {
            let uniqIndex = uniqNumber()
            formData.append(`product[product_categories_attributes][${uniqIndex}][id]`, product_category.id)
            formData.append(`product[product_categories_attributes][${uniqIndex}][_destroy]`, true)
          }
        })

        this.form.data.categories.forEach(category => {
          if(!this.prepareCategories().some(prepareCategory => prepareCategory === category)) {

            formData.append(`product[product_categories_attributes][${uniqNumber()}][category_id]`, category)
          }
        })
      } else {
        this.form.data.categories.forEach((category, index) => {
          formData.append(`product[product_categories_attributes][${index}][category_id]`, category)
        })
      }
    },
    setBrand(formData) {
      {{typeof this.form.data.brand}}
    },
    checkValidDataLang() {
      languages.some(language => {
        if(!this.form.data.name[language.code] || !this.form.data.description[language.code]) {
          this.language = language.code
          return true
        }
      })
    },
    setBrands(text) {
      text.length
          ? this.$store.dispatch('fetchBrands', {q: text})
          : this.$store.dispatch('clearBrands')
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
