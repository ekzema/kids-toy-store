<template>
  <section class="login-register-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-7">
          <div class="login-register-content login-register-pl">
            <div class="login-register-title mb-30">
              <h2 class="text-center">Password reset</h2>
            </div>
            <div class="login-register-style">
              <form ref="form" @submit.prevent="onSubmit">
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
                <div class="btn-style-3">
                  <button class="btn" type="submit">Reset</button>
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
import { helpers, required, minLength, sameAs } from '@vuelidate/validators'
import UpdatePasswordToast from './components/UpdatePasswordToast'
import { useVuelidate } from '@vuelidate/core'
import { useToast } from "vue-toastification"

export default {
  name: 'AccountPassword',
  components: {
  },
  setup: () => ({
    v$: useVuelidate(),
    toast: useToast()
  }),
  data: () => ({
    formData: {
      password: '',
      password_confirmation: '',
    }
  }),
  validations () {
    return {
      formData: {
        password: { required, minLength: minLength(6) },
        password_confirmation: {
          required,
          sameAsPassword: helpers.withMessage('Custom message for password_confirmation rule.', sameAs(this.formData.password))
        }
      }
    }
  },
  methods: {
    async onSubmit() {
      if (this.v$.$invalid) {
        this.v$.$touch()
        return
      }

      try {
        await this.$store.dispatch('updatePassword', { token: this.$route.query.token, ...this.formData })

        this.toast.success({
          component: UpdatePasswordToast,
          props: { email: this.formData.email }
        }, {
          position: "bottom-center",
          icon: "fa fa-check fa-2x"
        })

        this.$router.push({ name: 'AccountLogin' })
      } catch (error) {
        if (error.response.status === 404) {
          this.$store.commit('setErrorMessage', 'Invalid or expired token.')
        } else {
          this.$store.commit('setErrorMessage')
        }

        this.resetForm()
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

<style scoped>
</style>
