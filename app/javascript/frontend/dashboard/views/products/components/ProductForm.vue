<template>
  <logo-uploader
      v-model:logo="form.data.logo"
      v-model:preview="form.previews.logo"
  />
  <gallery-uploader
      v-model:galleryPreviews="form.previews.gallery"
  />
  <select-language
      v-model:language="language"
      class="d-flex flex-row-reverse"
  />
  <v-form
      ref="form"
      v-model="valid"
      lazy-validation
      @submit.prevent="submitForm"
  >
    <select-categories
        v-model:language="language"
        v-model:categories="form.data.categories"
    />
    <v-text-field
        ref="name"
        v-model="form.data.name[language]"
        :rules="requiredRules"
        label="Name"
        variant="underlined"
        color="primary"
        required
    >
      <template #append-inner>
          <img
              height="20"
              width="20"
              :src="require(`./../../../assets/img/${language}.svg`)"
          >
      </template>
    </v-text-field>
    <v-textarea
        ref="description"
        v-model="form.data.description[language]"
        label="Description"
        color="primary"
        :rules="requiredRules"
        variant="underlined"
        required
    >
      <template #append-inner>
        <img
             class="mt-8"
             height="20"
             width="20"
             :src="require(`./../../../assets/img/${language}.svg`)"
        >
      </template>
    </v-textarea>
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
        <select-age
            v-model:for_age="form.data.for_age"
        />
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
            v-model="form.data.brand"
            :items="brands"
            required
            color="primary"
            item-title="name"
            variant="underlined"
            label="Brand"
            @update:modelValue="setBrands"
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
            v-model.number="form.data.price"
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
            v-model="form.data.visible"
            class="d-flex justify-left"
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
            v-model.number="form.data.discount_price"
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
    <specifications
        v-model:specifications="form.data.specifications"
        :language="language"
    />
    <v-btn type="submit" color="success">{{ btnName }}</v-btn>
  </v-form>
</template>

<script>
import { mapGetters } from 'vuex'
import { uniqNumber } from '../../../helpers/utils'
import SelectLanguage from '../../../components/SelectLanguage'
import LogoUploader from "./LogoUploader.vue"
import GalleryUploader from "./GalleryUploader"
import SelectCategories from "./SelectCategories.vue"
import SelectAge from "./SelectAge.vue"
import Specifications from "./Specifications.vue"
import { languages } from '../../../config'

export default {
  name: 'ProductForm',
  components: {
    GalleryUploader,
    SelectLanguage,
    LogoUploader,
    SelectCategories,
    SelectAge,
    Specifications
  },
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
  emits: ['submitForm'],
  data: () => ({
    valid: false,
    requiredRules: [
      v => (!!v || v === 0)  || 'This field is required'
    ],
    priceRules: [
        v => !!v  || 'This field is required',
        v => v > 100 || 'Price cannot be less than 100'
    ],
    codeRules: [
      v => !!v  || 'This field is required',
      v => v.toString().length > 3 || 'Number length must be >= 4'
    ],
    language: 'ua',
    form: {
      data: {
        new: false,
        logo: '',
        code: '',
        name: {},
        price: 0,
        brand: '',
        status: null,
        for_age: null,
        visible: false,
        discount: false,
        for_gender: null,
        categories: null,
        description: {},
        discount_price: 0,
        specifications: {},
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
  computed: {
    ...mapGetters([
      'detailConstructor',
      'brands'
    ])
  },
  watch: {
    product() {
      this.setFormData()
    }
  },
  created() {
    this.$store.dispatch('fetchDetailConstructor')
  },
  methods: {
    async submitForm() {
      await this.checkValidDataLang()

      const { valid } = await this.$refs.form.validate()
      if (!valid) return

      const formData = new FormData()
      Object.keys(this.form.data).forEach(key => {
        if (key === 'specifications') return formData.append(`product[${key}]`, JSON.stringify(this.form.data[key]))
        if (key === 'description') return formData.append(`product[${key}]`, JSON.stringify(this.form.data[key]))
        if (key === 'categories') return this.setCategories(formData)
        if (key === 'brand') return this.setBrand(formData)
        if (key === 'name') return formData.append(`product[${key}]`, JSON.stringify(this.form.data[key]))
        if (key === 'logo' && this.form.data[key].length === 0) return

        formData.append(`product[${key}]`, this.form.data[key])
      })

      this.form.previews.gallery.forEach((value, index) => {
        if (value.blob)
          formData.append(`product[product_images_attributes][${index}][image]`, value.origin)
      })

      await this.$emit('submitForm', formData)
      if (!this.product) this.clearForm()
    },
    clearForm() {
      this.$refs.form.reset()

      this.form.data.logo = ''
      this.form.data.name = {}
      this.form.data.description = {}
      this.form.data.categories = null
      this.form.data.specifications = []

      this.form.previews.logo = ''
      this.form.previews.gallery = []
      this.language = 'ua'
    },
    setFormData() {
      this.form.data.new = this.product.new
      this.form.data.code = this.product.code
      this.form.data.name = this.product.name
      this.form.data.price = this.product.price
      this.form.data.brand = this.product.brand
      this.form.data.status = this.product.status
      this.form.data.for_age = this.product.for_age
      this.form.data.visible = this.product.visible
      this.form.data.discount = this.product.discount
      this.form.data.for_gender = this.product.for_gender
      this.form.data.categories = this.prepareCategories()
      this.form.data.description = this.product.description
      this.form.data.discount_price = this.product.discount_price
      this.form.data.specifications = this.product.specifications ? this.product.specifications : {}
      this.form.data.production_country = this.product.production_country

      this.form.previews.logo = this.product.logo.medium.url
      this.form.previews.gallery = [...this.product.product_images]
    },
    prepareCategories() {
      return this.product.product_categories.map(product_category => product_category.category_id)
    },
    setCategories(formData) {
      if (this.product && this.product.product_categories.length) {
        this.product.product_categories.forEach(product_category => {
          if (!this.form.data.categories.some(category => category === product_category.category_id)) {
            let uniqIndex = uniqNumber()
            formData.append(`product[product_categories_attributes][${uniqIndex}][id]`, product_category.id)
            formData.append(`product[product_categories_attributes][${uniqIndex}][_destroy]`, true)
          }
        })

        this.form.data.categories.forEach(category => {
          if (!this.prepareCategories().some(prepareCategory => prepareCategory === category)) {

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
      typeof this.form.data.brand === 'object'
          ? formData.append('product[brand_id]', this.form.data.brand.id)
          : formData.append('brand', this.form.data.brand)
    },
    checkValidDataLang() {
      languages.some(language => {
        if (!this.form.data.name[language.code] || !this.form.data.description[language.code]) {
          this.language = language.code
          return true
        }
      })
    },
    setBrands(text) {
      !text || !text.length
          ? this.$store.dispatch('clearBrands')
          : this.$store.dispatch('fetchBrands', { q: text })
    }
  }
}
</script>

<style scoped>
</style>
