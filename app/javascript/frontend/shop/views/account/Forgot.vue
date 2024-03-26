<template>
  <section class="login-register-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="login-register-content">
            <div class="login-register-title mb-30">
              <h2 class="text-center">{{ $t('ACCOUNT.FORGOT_PASSWORD.TITLE') }}</h2>
              <p class="text-center">{{ $t('ACCOUNT.FORGOT_PASSWORD.DESCRIPTION') }}</p>
            </div>
            <div class="login-register-style">
              <form ref="form" @submit.prevent="onSubmit">
                <div class="login-register-input" :class="{'input-error': v$.formData.email.$error}">
                  <input v-model="v$.formData.email.$model" type="text" :placeholder="$t('ACCOUNT.FORGOT_PASSWORD.FORM.EMAIL.PLACEHOLDER')">
                </div>
                <div v-for="(error, index) of v$.formData.email.$errors" :key="index">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="btn-style-3">
                  <button class="btn" type="submit">{{ $t('ACCOUNT.FORGOT_PASSWORD.FORM.SUBMIT') }}</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { helpers, required } from '@vuelidate/validators'
import { emailRegexTemplate } from "../../helpers/utils"
import { useVuelidate } from '@vuelidate/core'

export default {
  name: 'AccountForgot',
  setup: () => ({
    v$: useVuelidate()
  }),
  data: () => ({
    formData: {
      email: ''
    }
  }),
  validations() {
    return {
      formData: {
        email: {
          email: helpers.withMessage(this.$t('ACCOUNT.FORGOT_PASSWORD.FORM.EMAIL.VALIDATION.WRONG_FORMAT'), helpers.regex(emailRegexTemplate)),
          required: helpers.withMessage(this.$t('ACCOUNT.FORGOT_PASSWORD.FORM.EMAIL.VALIDATION.REQUIRED'), required)
        }
      }
    }
  },
  methods: {
    async onSubmit() {
      if (this.v$.$invalid) return this.v$.$touch()

      await this.$store.dispatch('createPassword', this.formData)
      this.formData.email = ''
      this.v$.$reset()
    }
  }
}
</script>
