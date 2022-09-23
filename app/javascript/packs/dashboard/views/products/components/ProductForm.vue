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
        :rules="requiredRules"
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
        :rules="requiredRules"
        variant="underlined"
        required
    ></v-textarea>
    <v-row justify="center"  v-for="(specification, index) in formData.specifications" :key="index">
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
import { mapGetters } from 'vuex'

export default {
  name: 'product-form',
  data: () => ({
    valid: false,
    requiredRules: [
      v => !!v || 'This field is required'
    ],
    formData: {
      name: '',
      description: '',
      specifications: []
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
      this.formData.specifications = []
    },
    resetValidation () {
      this.$refs.form.resetValidation()
    },
    setFormData() {
      this.formData = {
        name: this.product.name,
        description: this.product.description,
      }
    },
    addSpec() {
      this.formData.specifications.push({key: '', value: ''})
    },
    removeSpec(index) {
      this.formData.specifications.splice(index, 1)
    }
  },
  watch: {
    product() {
      this.setFormData()
    }
  }
}
</script>
