<template>
  <section class="contact-area">
    <div class="container">
      <div class="contact-page-wrap">
        <div class="row">
          <div class="col-lg-10 m-auto">
            <div class="contact-info-items text-center">
              <div class="row row-gutter-80">
                <div class="col-sm-6 col-md-4">
                  <div class="contact-info-item">
                    <div class="icon">
                      <img class="icon-img" src="./../../assets/img/icons/5.png" alt="Icon">
                    </div>
                    <h2>{{ $t('CONTACT.ADDRESS') }}</h2>
                    <div class="content">
                      <p>Your address goes here</p>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="contact-info-item mt-xs-30">
                    <div class="icon">
                      <img class="icon-img" src="./../../assets/img/icons/6.png" alt="Icon">
                    </div>
                    <h2>{{ $t('CONTACT.PHONE') }}</h2>
                    <div class="content">
                      <a href="tel://+00123456789">+ 00 123 456 789</a>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="contact-info-item mt-sm-30">
                    <div class="icon">
                      <img class="icon-img" src="./../../assets/img/icons/7.png" alt="Icon">
                    </div>
                    <h2>{{ $t('CONTACT.EMAIL') }}</h2>
                    <div class="content">
                      <a href="mailto://demo@example.com">demo@example.com</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-10 m-auto">
            <div class="contact-form">
              <form ref="form" class="contact-form-wrapper" id="contact-form" @submit.prevent="onSubmit">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="section-title">
                      <h2 class="title">{{ $t('CONTACT.TITLE') }}</h2>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group" :class="{'input-error': v$.formData.name.$error}">
                          <input v-model="v$.formData.name.$model" class="form-control" type="text" :placeholder="$t('CONTACT.FORM.NAME.PLACEHOLDER') + ' *'">
                          <div v-for="(error, index) of v$.formData.name.$errors" :key="index" class="input-errors">
                            <div class="error-msg">{{ error.$message }}</div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group" :class="{'input-error': v$.formData.email.$error}">
                          <input class="form-control" type="email" v-model="v$.formData.email.$model" :placeholder="$t('CONTACT.FORM.EMAIL.PLACEHOLDER') + ' *'">
                          <div v-for="(error, index) of v$.formData.email.$errors" :key="index" class="input-errors">
                            <div class="error-msg">{{ error.$message }}</div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group">
                          <input class="form-control" v-model="formData.subject" type="text" :placeholder="$t('CONTACT.FORM.SUBJECT.PLACEHOLDER')">
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group" :class="{'input-error': v$.formData.message.$error}">
                          <textarea class="form-control" v-model="v$.formData.message.$model" :placeholder="$t('CONTACT.FORM.MESSAGE.PLACEHOLDER') + ' *'"></textarea>
                          <div v-for="(error, index) of v$.formData.message.$errors" :key="index" class="input-errors">
                            <div class="error-msg">{{ error.$message }}</div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group text-center">
                          <button class="btn btn-theme" type="submit" >{{ $t('CONTACT.FORM.SUBMIT') }}</button>
                        </div>
                      </div>
                    </div>
                  </div>
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
import { mapGetters } from 'vuex'
import { emailRegexTemplate } from '../../helpers/utils'
import { helpers, required } from '@vuelidate/validators'
import { useVuelidate } from "@vuelidate/core";

export default {
  name: 'ContactShow',
  setup: () => ({
    v$: useVuelidate()
  }),
  computed: {
    ...mapGetters([
    ])
  },
  data: () => ({
    formData: {
      name: '',
      email: '',
      subject: '',
      message: '',
    }
  }),
  validations() {
    return {
      formData: {
        name: {
          required: helpers.withMessage(this.$t('CONTACT.FORM.NAME.VALIDATION.REQUIRED'), required)
        },
        email: {
          email: helpers.withMessage(this.$t('CONTACT.FORM.EMAIL.VALIDATION.WRONG_FORMAT'), helpers.regex(emailRegexTemplate)),
          required: helpers.withMessage(this.$t('CONTACT.FORM.EMAIL.VALIDATION.REQUIRED'), required)
        },
        message: {
          required: helpers.withMessage(this.$t('CONTACT.FORM.MESSAGE.VALIDATION.REQUIRED'), required)
        }
      }
    }
  },
  created() {
  },
  methods: {
    async onSubmit() {
      if (this.v$.$invalid) {
        this.v$.$touch()
        return
      }

      await this.$store.dispatch('createFeedbacks', this.formData)
      this.resetForm()
    },
    resetForm() {
      const formData = this.formData
      formData.name = ''
      formData.email = ''
      formData.subject = ''
      formData.message = ''

      this.v$.formData.$reset()
    }
  }
}
</script>

