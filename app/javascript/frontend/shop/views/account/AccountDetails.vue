<template>
  <h3>Account Details</h3>
  <div class="account-details-form">
      <fieldset>
        <legend>Account</legend>
        <form @submit.prevent="updateAccount">
          <div class="single-input-item">
            <label for="first-name" class="required">First Name</label>
            <input v-model="formData.account.first_name" type="text" id="first-name" />
          </div>
          <div class="single-input-item">
            <label for="last-name" class="required">Last Name</label>
            <input v-model="formData.account.last_name" type="text" id="last-name" />
          </div>
          <div class="single-input-item">
            <label for="patronymic" class="required">Patronymic</label>
            <input v-model="formData.account.patronymic" type="text" id="patronymic" />
          </div>
          <div class="single-input-item">
            <label for="email" class="required">Email Addres</label>
            <input v-model="formData.account.email" type="email" id="email" />
          </div>
          <div class="single-input-item">
            <button type="submit" class="check-btn sqr-btn">Update account</button>
          </div>
        </form>
      </fieldset>
    <fieldset>
      <legend>Password</legend>
      <form @submit.prevent="changePassword">
        <div class="single-input-item">
          <label for="current-pwd" class="required">Current Password</label>
          <input v-model="formData.password.current_password" type="password" id="current-pwd" />
        </div>
        <div class="row">
          <div class="col-lg-6">
            <div class="single-input-item">
              <label for="new-pwd" class="required">New Password</label>
              <input v-model="formData.password.password" type="password" id="new-pwd" />
            </div>
          </div>
          <div class="col-lg-6">
            <div class="single-input-item">
              <label for="confirm-pwd" class="required">Confirm Password</label>
              <input v-model="formData.password.password_confirmation" type="password" id="confirm-pwd" />
            </div>
          </div>
        </div>
        <div class="single-input-item">
          <button type="submit" class="check-btn sqr-btn">Change password</button>
        </div>
      </form>
    </fieldset>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'AccountDetails',
  data: () => ({
    formData: {
      account: {
        email: '',
        phone: '',
        last_name: '',
        first_name: '',
        patronymic: '',
      },
      password: {
        current_password: '',
        password: '',
        password_confirmation: ''
      }
    }
  }),
  computed: {
    ...mapGetters([
      'user'
    ])
  },
  watch: {
    user() {
      this.setFormData()
    }
  },
  created() {
    this.setFormData()
  },
  methods: {
    async setFormData() {
      if (!this.user) return
      const { email, phone, first_name, last_name, patronymic } = await this.user
      this.formData.account = { email, phone, first_name, last_name, patronymic }
    },
    updateAccount() {
      this.$store.dispatch('updateAccount', this.formData.account)
    },
    changePassword() {
      this.$store.dispatch('changePassword', this.formData.password)
    }
  }
}
</script>

<style scoped>

</style>
