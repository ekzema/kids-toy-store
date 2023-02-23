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
              <form @submit.prevent="onSubmit">
                <div class="login-register-input" :class="{'input-error': v$.form.email.$error}">
                  <input type="text" v-model="v$.form.email.$model" placeholder="E-mail address">
                  <div v-for="(error, index) of v$.form.email.$errors" :key="index">
                    <span class="error-msg">{{ error.$message }}</span>
                  </div>
                </div>
                <div class="login-register-input" :class="{'input-error': v$.form.password.$error}">
                  <input type="password" v-model="v$.form.password.$model" placeholder="Password">
                </div>
                <div class="input-errors" v-for="(error, index) of v$.form.password.$errors" :key="index">
                  <div class="error-msg">{{ error.$message }}</div>
                </div>
                <div class="login-register-input" :class="{'input-error': v$.form.password_confirmation.$error}">
                  <input type="password" v-model="v$.form.password_confirmation.$model" placeholder="Password confirmation">
                </div>
                <div class="input-errors" v-for="(error, index) of v$.form.password_confirmation.$errors" :key="index">
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
import { helpers, email, required, minLength, sameAs } from '@vuelidate/validators'
import { useVuelidate } from '@vuelidate/core'
export default {
  name: 'new',
  components: {
  },
  setup: () => ({ v$: useVuelidate() }),
  data: () => ({
    form: {
      email: '',
      password: '',
      password_confirmation: ''
    }
  }),
  validations () {
    return {
      form: {
        email: {
          email: helpers.withMessage('Custom message for email rule.', email),
          required
        },
        password: { required, minLength: minLength(6) },
        password_confirmation: {
          required,
          sameAsPassword: helpers.withMessage('Custom message for password_confirmation rule.', sameAs(this.form.password) )
        }
      }
    }
  },
  methods: {
    onSubmit() {
      if (this.v$.$invalid) {
        this.v$.$touch()
        return
      }

    }
  }
}
</script>
