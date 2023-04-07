<template>
  <section class="login-register-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="login-register-content">
            <div class="login-register-title mb-30">
              <h2 class="text-center">Forgot</h2>
              <p class="text-center">If you forgot your password, leave your email from the account and wait for instructions to reset the password for it.. </p>
            </div>
            <div class="login-register-style">
              <form ref="form" @submit.prevent="onSubmit">
                <div class="login-register-input" :class="{'input-error': v$.formData.email.$error}">
                  <input type="text" v-model="v$.formData.email.$model" placeholder="Email address">
                </div>
                <div v-for="(error, index) of v$.formData.email.$errors" :key="index">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="btn-style-3">
                  <button class="btn" type="submit">Send</button>
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
import { useToast } from "vue-toastification"

export default {
  name: 'AccountForgot',
  setup: () => ({
    v$: useVuelidate(),
    toast: useToast()
  }),
  components: {
  },
  data: () => ({
    formData: {
      email: ''
    }
  }),
  validations () {
    return {
      formData: {
        email: {
          email: helpers.withMessage('Custom message for email rule.', helpers.regex(emailRegexTemplate)),
          required
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
