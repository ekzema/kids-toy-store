<template>
  <h3>{{ $t('ACCOUNT.DETAILS.TITLE') }}</h3>
  <div class="account-details-form">
      <fieldset>
        <legend>{{ $t('ACCOUNT.DETAILS.USER_INFO.FIELDSET') }}</legend>
        <form @submit.prevent="updateAccount">
          <div class="single-input-item">
            <label for="first-name" class="required">{{ $t('ACCOUNT.DETAILS.USER_INFO.FORM.FIRST_NAME') }}</label>
            <input v-model="formData.account.first_name" type="text" id="first-name" />
          </div>
          <div class="single-input-item">
            <label for="last-name" class="required">{{ $t('ACCOUNT.DETAILS.USER_INFO.FORM.LAST_NAME') }}</label>
            <input v-model="formData.account.last_name" type="text" id="last-name" />
          </div>
          <div class="single-input-item">
            <label for="patronymic" class="required">{{ $t('ACCOUNT.DETAILS.USER_INFO.FORM.PATRONYMIC') }}</label>
            <input v-model="formData.account.patronymic" type="text" id="patronymic" />
          </div>
          <div class="single-input-item">
            <label for="email" class="required">{{ $t('ACCOUNT.DETAILS.USER_INFO.FORM.EMAIL') }}</label>
            <input v-model="formData.account.email" type="email" id="email" />
          </div>
          <div class="single-input-item">
            <button type="submit" class="check-btn sqr-btn">Update account</button>
          </div>
        </form>
      </fieldset>
    <fieldset>
      <legend>{{ $t('ACCOUNT.DETAILS.PASSWORD.FIELDSET') }}</legend>
      <form @submit.prevent="changePassword">
        <div class="single-input-item">
          <label for="current-pwd" class="required">{{ $t('ACCOUNT.DETAILS.PASSWORD.FORM.CURRENT_PASSWORD') }}</label>
          <input v-model="formData.password.current_password" type="password" id="current-pwd" />
        </div>
        <div class="row">
          <div class="col-lg-6">
            <div class="single-input-item">
              <label for="new-pwd" class="required">{{ $t('ACCOUNT.DETAILS.PASSWORD.FORM.NEW_PASSWORD') }}</label>
              <input v-model="formData.password.password" type="password" id="new-pwd" />
            </div>
          </div>
          <div class="col-lg-6">
            <div class="single-input-item">
              <label for="confirm-pwd" class="required">{{ $t('ACCOUNT.DETAILS.PASSWORD.FORM.CONFIRM_PASSWORD') }}</label>
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
    async changePassword() {
      const response = await this.$store.dispatch('changePassword', { password: this.formData.password })
      if(response) this.resetFormPassword()
    },
    resetFormPassword() {
      this.formData.password = {
        current_password: '',
        password: '',
        password_confirmation: ''
      };

    }
  }
}
</script>

<style scoped>

</style>
