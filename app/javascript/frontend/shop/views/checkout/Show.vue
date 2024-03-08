<template>
  <section class="product-area shop-checkout-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <div class="section-title text-center">
            <h2 class="title">{{ $t('CHECKOUT.TITLE') }}</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-7">
          <div class="billing-info-wrap">
            <h3>{{ $t('CHECKOUT.DETAIL.TITLE') }}:</h3>
            <div class="row">
              <form @keydown.enter="onSubmit">
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.first_name.$error}">
                    <label>{{ $t('CHECKOUT.DETAIL.FORM.FIRST_NAME.LABEL') }} <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.first_name.$model" type="text">
                    <div v-for="(error, index) of v$.formData.first_name.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.last_name.$error}">
                    <label>{{ $t('CHECKOUT.DETAIL.FORM.LAST_NAME.LABEL') }} <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.last_name.$model" type="text">
                    <div v-for="(error, index) of v$.formData.last_name.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.patronymic.$error}">
                    <label>{{ $t('CHECKOUT.DETAIL.FORM.PATRONYMIC.LABEL') }} <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.patronymic.$model" type="text">
                    <div v-for="(error, index) of v$.formData.patronymic.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.phone.$error}">
                    <label>{{ $t('CHECKOUT.DETAIL.FORM.PHONE.LABEL') }} <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.phone.$model" type="tel" v-maska data-maska="+38(0##)###-##-##" placeholder="+38(0">
                    <div v-for="(error, index) of v$.formData.phone.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.email.$error}">
                    <label>{{ $t('CHECKOUT.DETAIL.FORM.EMAIL.LABEL') }} <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.email.$model" type="text">
                    <div v-for="(error, index) of v$.formData.email.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-select mb-20" :class="{'input-error': v$.formData.delivery.$error}">
                    <label>{{ $t('CHECKOUT.DETAIL.FORM.DELIVERY.LABEL') }} <abbr class="required" title="required">*</abbr></label>
                    <div class="select-style">
                      <select v-model="v$.formData.delivery.$model" class="select-active">
                        <option value="">{{ $t('CHECKOUT.DELIVERY.DEFAULT') }}:</option>
                        <option v-for="delivery in detailConstructor.deliveries"
                                :key="delivery"
                                :value="delivery">
                          {{ $t(`CHECKOUT.DELIVERY.${ delivery.toUpperCase() }`) }}
                        </option>
                      </select>
                      <div v-for="(error, index) of v$.formData.delivery.$errors" :key="index" class="input-errors">
                        <div class="error-msg">{{ error.$message }}</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-select mb-20" :class="{'input-error': v$.formData.pay_type.$error}">
                    <label>{{ $t('CHECKOUT.DETAIL.FORM.PAY_TYPE.LABEL') }} <abbr class="required" title="required">*</abbr></label>
                    <div class="select-style">
                      <select v-model="v$.formData.pay_type.$model" class="select-active">
                        <option selected value="">{{ $t('CHECKOUT.PAY_TYPE.DEFAULT') }}:</option>
                        <option v-for="pay_type in detailConstructor.pay_types"
                                :key="pay_type"
                                :value="pay_type">
                          {{ $t(`CHECKOUT.PAY_TYPE.${ pay_type.toUpperCase() }`) }}
                        </option>
                      </select>
                      <div v-for="(error, index) of v$.formData.pay_type.$errors" :key="index" class="input-errors">
                        <div class="error-msg">{{ error.$message }}</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div v-if="isDelivery" class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.city.$error}">
                    <label>{{ $t('CHECKOUT.DETAIL.FORM.CITY.LABEL') }} <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.city.$model" type="text">
                    <div v-for="(error, index) of v$.formData.city.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div v-if="isDelivery" class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.department_number.$error}">
                    <label>{{ $t('CHECKOUT.DETAIL.FORM.DEPARTMENT_NUMBER.LABEL') }} <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.department_number.$model" type="text">
                    <div v-for="(error, index) of v$.formData.department_number.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div class="additional-info-wrap">
              <label>{{ $t('CHECKOUT.DETAIL.FORM.NOTE.LABEL') }}</label>
              <textarea v-model="formData.note" :placeholder="$t('CHECKOUT.DETAIL.FORM.NOTE.PLACEHOLDER')" name="message"></textarea>
            </div>
          </div>
        </div>
        <div class="col-lg-5">
          <div class="your-order-area">
            <h3>{{ $t('CHECKOUT.ORDER.TITLE') }}:</h3>
            <div class="your-order-wrap">
              <div class="your-order-info-wrap">
                <div class="your-order-title">
                  <h4>{{ $t('CHECKOUT.ORDER.HEADER.PRODUCT') }} <span>{{ $t('CHECKOUT.ORDER.HEADER.TOTAL') }}</span></h4>
                </div>
                <div class="your-order-product">
                  <ul>
                    <li v-for="product in cartProducts" :key="product.id">
                      {{ product.name.ru }} × {{ product.quantity }} <span>{{ subTotalProduct(product) }} грн </span>
                    </li>
                  </ul>
                </div>
                <div class="your-order-total">
                  <h3>{{ $t('CHECKOUT.ORDER.HEADER.TOTAL_ALL') }} <span>{{ cartSum }} грн </span></h3>
                </div>
              </div>
            </div>
            <div class="place-order">
              <router-link @click="onSubmit" to="">
                {{ $t('CHECKOUT.ORDER.BUTTON.PLACE_ORDER') }}
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters } from "vuex"
import { vMaska } from "maska"
import FetchCartProductsMixin from '../cart/mixins/FetchCartProductsMixin'
import SubtotalProductsMixin from '../cart/mixins/SubtotalProductsMixin'
import CartSumMixin from '../cart/mixins//CartSumMixin'
import { helpers, required, minLength, maxLength, requiredIf } from '@vuelidate/validators'
import { emailRegexTemplate, toPhoneString, cart } from "../../helpers/utils"
import { useVuelidate } from "@vuelidate/core"

export default {
  name: 'CheckoutShow',
  directives: { maska: vMaska },
  mixins: [
    FetchCartProductsMixin,
    SubtotalProductsMixin,
    CartSumMixin
  ],
  setup: () => ({
    v$: useVuelidate()
  }),
  data: () => ({
    formData: {
      note: '',
      city: '',
      email: '',
      phone: '',
      pay_type: '',
      delivery: '',
      last_name: '',
      first_name: '',
      patronymic: '',
      department_number: ''
    }
  }),
  computed: {
    ...mapGetters([
      'cart',
      'user',
      'cartProducts',
      'detailConstructor'
    ]),
    isDelivery() {
      const deliveryMethods = ['novaya_pochta', 'ukrpochta']
      const result = deliveryMethods.includes(this.formData.delivery)
      if (!result) this.cleanDependentDelivery()

      return result
    }
  },
  validations() {
    return {
      formData: {
        first_name: {
          required, minLength: minLength(3)
        },
        last_name: {
          required, minLength: minLength(3)
        },
        patronymic: {
          required, minLength: minLength(3)
        },
        phone: {
          required, maxLength: maxLength(17),
          minLength: minLength(17)
        },
        city: {
          required: requiredIf(this.isDelivery),
          minLength: minLength(3)
        },
        department_number: {
          required: requiredIf(this.isDelivery)
        },
        email: {
          email: helpers.withMessage('Custom message for email rule.', helpers.regex(emailRegexTemplate)),
          required
        },
        pay_type: {
          required
        },
        delivery: {
          required
        }
      }
    }
  },
  watch: {
    user() {
      this.setFormData()
    }
  },
  created() {
    this.setFormData()
    this.$store.dispatch('fetchDetailConstructor')
  },
  methods: {
    setFormData() {
      if (!this.user) return

      const { email, phone, first_name, last_name, patronymic } = this.user
      this.formData = { ...this.formData, email, phone, first_name, last_name, patronymic }
    },
    onSubmit() {
      if (this.v$.$invalid) {
        this.v$.$touch()
        return
      }
      const formData = { ...this.formData, phone: toPhoneString(this.formData.phone) }
      if (!this.user) formData.line_items = this.cart.map(({ quantity, product_id }) => ({ quantity, product_id }))

      this.$store.dispatch('createOrders', formData)
      if (!this.user) cart.reset()

      this.$router.push('/')
    },
    cleanDependentDelivery() {
      this.formData.city = ''
      this.formData.department_number = ''
    }
  }
}
</script>
