<template>
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
    <v-text-field
        ref="name"
        v-model="formData.name[language]"
        :rules="nameRules"
        label="Name"
        variant="underlined"
        color="primary"
        required
    ></v-text-field>
    <v-select
        v-model="formData.parent_id"
        label="Select parent category"
        variant="underlined"
        :items="parentCategories"
        item-value="id"
        color="primary"
        :disabled="formData.is_parent"
    >
      <template v-slot:item="{ props, item }">
        <v-list-item
            v-bind="props"
            :title="item.raw.name[language]"
        />
      </template>
      <template v-slot:selection="{ item }">
        {{item.raw.name ? item.raw.name[language] : ''}}
      </template>
    </v-select>
    <v-btn type="submit" color="success">{{ btnName }}</v-btn>
  </v-form>
</template>

<script>
import { mapGetters } from 'vuex'
import SelectLanguage from '../../../components/SelectLanguage'
import { languages } from '../../../config'

export default {
  name: 'category-form',
  components: {
    SelectLanguage,
  },
  data: () => ({
    language: 'ua',
    valid: false,
    nameRules: [
      v => !!v || 'Name is required'
    ],
    formData: {
      name: {},
      parent_id: null,
      is_parent: false
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
      await this.checkValidDataLang()

      const { valid } = await this.$refs.form.validate()
      if (!valid) return

      await this.$emit('submitForm', this.formData, () => this.fetchParentCategories())
      if (!this.category) this.clearForm()
    },
    clearForm() {
      this.$refs.form.reset()
      this.formData.name = {}
      this.language = 'ua'
    },
    setFormData() {
      this.formData = {
        name: this.category.name,
        parent_id: this.category.parent_id,
        is_parent: this.category.is_parent
      }
    },
    checkValidDataLang() {
      languages.some(language => {
        if (!this.formData.name[language.code]) {
          this.language = language.code
          return true
        }
      })
    }
  },
  watch: {
    category() {
      this.setFormData()
    }
  }
}
</script>
