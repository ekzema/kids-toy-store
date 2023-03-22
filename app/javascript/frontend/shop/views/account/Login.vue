<template>
  <section class="login-register-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="login-register-content">
            <div class="login-register-title mb-30">
              <h2 class="text-center">Login</h2>
              <p class="text-center">Welcome back! Please enter your email and password to login. </p>
            </div>
            <div class="login-register-style">
              <form ref="form" @submit.prevent="onSubmit">
                <div class="login-register-input" :class="{'input-error': v$.formData.email.$error}">
                  <input type="text" v-model="v$.formData.email.$model" placeholder="Email address">
                </div>
                <div v-for="(error, index) of v$.formData.email.$errors" :key="index">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="login-register-input" :class="{'input-error': v$.formData.password.$error}">
                  <input type="password" v-model="v$.formData.password.$model" placeholder="Password">
                  <div class="forgot">
                    <router-link :to="{ name: 'AccountForgot'}">Forgot?</router-link>
                  </div>
                </div>
                <div class="input-errors" v-for="(error, index) of v$.formData.password.$errors" :key="index">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="btn-style-3">
                  <button class="btn" type="submit">Login</button>
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
import { useVuelidate } from '@vuelidate/core'
import { emailRegexTemplate } from "../../config"

export default {
  name: 'login',
  components: {
  },
  setup: () => ({ v$: useVuelidate() }),
  data: () => ({
    formData: {
      email: '',
      password: '',
    }
  }),
  validations () {
    return {
      formData: {
        email: {
          email: helpers.withMessage('Custom message for email rule.', helpers.regex(emailRegexTemplate)),
          required,
        },
        password: { required }
      }
    }
  },
  methods: {
    async onSubmit() {
      if (this.v$.$invalid) return this.v$.$touch()

      try {
        const response = await this.$store.dispatch('createSession', this.formData)
        localStorage.user = JSON.stringify(response)
        this.$store.commit('setUser', response)

        this.resetForm()
        this.$router.push('/')
      } catch (error) {
        if (error.response.status === 404) {
          this.$store.commit('setErrorMessage', 'Invalid email or password.')
        } else {
          this.$store.commit('setErrorMessage')
        }
      }
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