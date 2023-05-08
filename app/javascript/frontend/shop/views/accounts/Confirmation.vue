<template>
  <section class="login-register-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="login-register-content">
            <div class="login-register-title mb-30">
              <h2 class="text-center">Confirmation</h2>
              <p v-if="!status" class="text-center"> Please
                <router-link :to="{ name: 'AccountsNew'}">
                  register
                </router-link>
              </p>
              <p v-if="status === 'success'" class="text-center">Congratulations. You have confirmed your registration and can now
                <router-link :to="{ name: 'AccountsLogin'}">
                  login
                </router-link>
                to your account.
              </p>
              <p v-if="status === 'error'" class="text-center"><strong>Oops</strong> something went wrong. Try to
                <router-link :to="{ name: 'AccountsNew'}">
                  register
                </router-link>
                again.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'AccountsConfirmation',
  components: {
  },
  data: () => ({
    status: ''
  }),
  created() {
    this.confirmationRegistration()
  },
  methods: {
    async confirmationRegistration() {
      const response = await this.$store.dispatch('confirmationRegistration', { token: this.$route.query.token })
      response.success ? this.status = 'success' : this.status = 'error'
    }
  }
}
</script>
