<template>
  <section class="login-register-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-7">
          <div class="login-register-content login-register-pl">
            <div class="login-register-title mb-30">
              <h2 class="text-center">Register</h2>
              <p>Create new account today to reap the benefits of a personalized shopping experience. </p>
            </div>
            <div class="login-register-style">
              <form ref="form" @submit.prevent="onSubmit">
                <div class="login-register-input" :class="{'input-error': v$.formData.email.$error}">
                  <input type="text" v-model="v$.formData.email.$model" placeholder="E-mail address">
                  <div v-if="spinner" class="input-spinner spinner-border-sm spinner-border" role="status">
                    <span class="visually-hidden">Loading...</span>
                  </div>
                </div>
                <div v-for="(error, index) of v$.formData.email.$errors" :key="index">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="login-register-input" :class="{'input-error': v$.formData.password.$error}">
                  <input type="password" v-model="v$.formData.password.$model" placeholder="Password">
                </div>
                <div class="input-errors" v-for="(error, index) of v$.formData.password.$errors" :key="index">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="login-register-input" :class="{'input-error': v$.formData.password_confirmation.$error}">
                  <input type="password" v-model="v$.formData.password_confirmation.$model" placeholder="Password confirmation">
                </div>
                <div class="input-errors" v-for="(error, index) of v$.formData.password_confirmation.$errors" :key="index">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="login-register-paragraph">
                  <p>Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our <a href="#">privacy policy.</a></p>
                </div>
                <div class="btn-style-3">
                  <button class="btn" type="submit">Register</button>
                </div>
              </form>
              <div class="register-benefits">
                <h3>Sign up today and you will be able to :</h3>
                <p>The Loke Buyer Protection has you covered from click to delivery. Sign up <br>or sign in and you will be able to:</p>
                <ul>
                  <li><i class="pe-7s-check icons"></i> Speed your way through checkout</li>
                  <li><i class="pe-7s-check icons"></i> Track your orders easily</li>
                  <li><i class="pe-7s-check icons"></i> Keep a record of all your purchases</li>
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
import { emailRegex, emailRegexTemplate } from "../../config"
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
  validations () {
    return {
      formData: {
        email: {
          email: helpers.withMessage('Custom message for email rule.', helpers.regex(emailRegexTemplate)),
          required,
          isUnique: helpers.withAsync(this.isUnique),
        },
        password: { required, minLength: minLength(6) },
        password_confirmation: {
          required,
          sameAsPassword: helpers.withMessage('Custom message for password_confirmation rule.', sameAs(this.formData.password))
        }
      }
    }
  },
  methods: {
    async isUnique (value) {
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
        bad_domain: 'Email has a domain that cannot be verified.',
        unique: 'This email already exists'
      }
      if (response.valid) this.v$.formData.email.$reset()
      if (!response.valid) this.v$.formData.email.isUnique.$message = errorMessages[response.type]

      return response.valid
    },
    async onSubmit () {
      if (this.v$.$invalid) {
        this.v$.$touch()
        return
      }
      await this.$store.dispatch('createRegistration', this.formData)
      this.resetForm()
    },
    resetForm () {
      Object.keys(this.formData).forEach((key) => {
        this.formData[key] = ''
      })
      this.v$.$reset()
    }
  }
}
</script>

<style scoped>
.input-spinner {
  position: absolute;
  top: 17px;
  right: 15px;
  color: #f379a7;
}
</style>
