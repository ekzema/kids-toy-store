<template>
  <h3>Account Details</h3>
  <div class="account-details-form">
      <fieldset>
        <legend>Account</legend>
        <form action="#">
          <div class="single-input-item">
            <label for="first-name" class="required">First Name</label>
            <input v-model="formData.first_name" type="text" id="first-name" />
          </div>
          <div class="single-input-item">
            <label for="last-name" class="required">Last Name</label>
            <input type="text" id="last-name" />
          </div>
          <div class="single-input-item">
            <label for="patronymic" class="required">Patronymic</label>
            <input type="text" id="patronymic" />
          </div>
          <div class="single-input-item">
            <label for="email" class="required">Email Addres</label>
            <input type="email" id="email" />
          </div>
          <div class="single-input-item">
            <button class="check-btn sqr-btn">Update account</button>
          </div>
        </form>
      </fieldset>
    <fieldset>
      <legend>Password</legend>
      <form action="#">
        <div class="single-input-item">
          <label for="current-pwd" class="required">Current Password</label>
          <input type="password" id="current-pwd" />
        </div>
        <div class="row">
          <div class="col-lg-6">
            <div class="single-input-item">
              <label for="new-pwd" class="required">New Password</label>
              <input type="password" id="new-pwd" />
            </div>
          </div>
          <div class="col-lg-6">
            <div class="single-input-item">
              <label for="confirm-pwd" class="required">Confirm Password</label>
              <input type="password" id="confirm-pwd" />
            </div>
          </div>
        </div>
        <div class="single-input-item">
          <button class="check-btn sqr-btn">Change password</button>
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
      email: '',
      phone: '',
      last_name: '',
      first_name: '',
      patronymic: '',
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
      this.formData = { email, phone, first_name, last_name, patronymic }
    }
  }
}
</script>

<style scoped>

</style>
