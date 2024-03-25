<template>
  <section class="login-register-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-7">
          <div class="login-register-content login-register-pl">
            <div class="login-register-title mb-30">
              <h2 class="text-center">{{ $t('ACCOUNT.REGISTRATION.TITLE') }}</h2>
              <p>{{ $t('ACCOUNT.REGISTRATION.DESCRIPTION') }}</p>
            </div>
            <div class="login-register-style">
              <form ref="form" @submit.prevent="onSubmit">
                <div class="login-register-input" :class="{'input-error': v$.formData.email.$error}">
                  <input id="input-email" v-model="v$.formData.email.$model" type="text" :placeholder="$t('ACCOUNT.REGISTRATION.FORM.EMAIL.PLACEHOLDER')">
                  <div v-if="spinner" class="input-spinner spinner-border-sm spinner-border" role="status">
                    <span class="visually-hidden">Loading...</span>
                  </div>
                </div>
                <div v-for="(error, index) of v$.formData.email.$errors" :key="index">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="login-register-input" :class="{'input-error': v$.formData.password.$error}">
                  <input v-model="v$.formData.password.$model" type="password" :placeholder="$t('ACCOUNT.REGISTRATION.FORM.PASSWORD.PLACEHOLDER')">
                </div>
                <div v-for="(error, index) of v$.formData.password.$errors" :key="index" class="input-errors">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="login-register-input" :class="{'input-error': v$.formData.password_confirmation.$error}">
                  <input v-model="v$.formData.password_confirmation.$model" type="password" :placeholder="$t('ACCOUNT.REGISTRATION.FORM.PASSWORD_CONFIRMATION.PLACEHOLDER')">
                </div>
                <div v-for="(error, index) of v$.formData.password_confirmation.$errors" :key="index" class="input-errors">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="btn-style-3">
                  <button class="btn" type="submit">{{ $t('ACCOUNT.REGISTRATION.FORM.SUBMIT') }}</button>
                </div>
              </form>
              <div class="register-benefits">
                <h3>{{ $t('ACCOUNT.REGISTRATION.BENEFITS.TITLE') }}:</h3>
                <ul>
                  <li><i class="pe-7s-check icons"></i>{{ $t('ACCOUNT.REGISTRATION.BENEFITS.SPEED') }}</li>
                  <li><i class="pe-7s-check icons"></i>{{ $t('ACCOUNT.REGISTRATION.BENEFITS.TRACK') }}</li>
                  <li><i class="pe-7s-check icons"></i>{{ $t('ACCOUNT.REGISTRATION.BENEFITS.RECORD') }}</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { helpers, required, minLength, sameAs } from '@vuelidate/validators'
import { emailRegex, emailRegexTemplate } from "../../helpers/utils"
import { useVuelidate } from '@vuelidate/core'

export default {
  name: 'AccountNew',
  components: {
  },
  setup: () => ({
    v$: useVuelidate()
  }),
  data: () => ({
    formData: {
      email: '',
      password: '',
      password_confirmation: ''
    },
    timer: null,
    spinner: false
  }),
  validations() {
    return {
      formData: {
        email: {
          email: helpers.withMessage(this.$t('ACCOUNT.REGISTRATION.FORM.EMAIL.VALIDATION.WRONG_FORMAT'), helpers.regex(emailRegexTemplate)),
          required: helpers.withMessage(this.$t('ACCOUNT.REGISTRATION.FORM.EMAIL.VALIDATION.REQUIRED'), required),
          isUnique: helpers.withAsync(this.isUnique),
        },
        password: {
          required: helpers.withMessage(this.$t('ACCOUNT.REGISTRATION.FORM.PASSWORD.VALIDATION.REQUIRED'), required),
          minLength: helpers.withMessage(this.$t('ACCOUNT.REGISTRATION.FORM.PASSWORD.VALIDATION.MIN_LENGTH'), minLength(6))
        },
        password_confirmation: {
          required: helpers.withMessage(this.$t('ACCOUNT.REGISTRATION.FORM.PASSWORD_CONFIRMATION.VALIDATION.REQUIRED'), required),
          sameAsPassword: helpers.withMessage(this.$t('ACCOUNT.REGISTRATION.FORM.PASSWORD_CONFIRMATION.VALIDATION.NOT_MATCH'), sameAs(this.formData.password))
        }
      }
    }
  },
  methods: {
    async isUnique(value) {
      if (!emailRegex.test(value)) return true
      if (this.timer) {
        clearTimeout(this.timer)
        this.timer = null
      }
      this.spinner = true
      const response = await new Promise((resolve) => {
        this.timer = setTimeout(() => {
          resolve(this.$store.dispatch('checkEmail', {email: value}))
        }, 800)
      })
      this.spinner = false
      const errorMessages = {
        bad_domain: this.$t('ACCOUNT.REGISTRATION.FORM.EMAIL.VALIDATION.BAD_DOMAIN'),
        unique: this.$t('ACCOUNT.REGISTRATION.FORM.EMAIL.VALIDATION.UNIQUE')
      }
      if (response.valid) this.v$.formData.email.$reset()
      if (!response.valid) this.v$.formData.email.isUnique.$message = errorMessages[response.type]

      return response.valid
    },
    async onSubmit() {
      if (this.v$.$invalid) {
        this.v$.$touch()
        return
      }
      await this.$store.dispatch('createRegistration', this.formData)
      this.resetForm()
    },
    resetForm() {
      Object.keys(this.formData).forEach((key) => {
        this.formData[key] = ''
      })
      this.v$.$reset()
    }
  }
}
</script>

<style scoped>
.login-register-style form .input-spinner {
  position: absolute;
  top: 17px;
  right: 15px;
  color: #f379a7;
}
</style>
