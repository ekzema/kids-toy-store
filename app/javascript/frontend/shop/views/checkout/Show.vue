<template>
  <section class="product-area shop-checkout-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <div class="section-title text-center">
            <h2 class="title">Checkout</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-7">
          <div class="billing-info-wrap">
            <h3>Billing Details</h3>
            <div class="row">
              <form @keydown.enter="onSubmit">
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.first_name.$error}">
                    <label>First name <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.first_name.$model" type="text">
                    <div v-for="(error, index) of v$.formData.first_name.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.last_name.$error}">
                    <label>Last name <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.last_name.$model" type="text">
                    <div v-for="(error, index) of v$.formData.last_name.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.patronymic.$error}">
                    <label>Patronymic <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.patronymic.$model" type="text">
                    <div v-for="(error, index) of v$.formData.patronymic.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.phone.$error}">
                    <label>Phone <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.phone.$model" type="tel" v-maska data-maska="+38(0##)###-##-##" placeholder="+38(0">
                    <div v-for="(error, index) of v$.formData.phone.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.email.$error}">
                    <label>Email Address <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.email.$model" type="text">
                    <div v-for="(error, index) of v$.formData.email.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-select mb-20" :class="{'input-error': v$.formData.delivery.$error}">
                    <label>Delivery <abbr class="required" title="required">*</abbr></label>
                    <div class="select-style">
                      <select v-model="v$.formData.delivery.$model" class="select-active">
                        <option disabled value="">Выберите способ доставки:</option>
                        <option value="self_delivery">Самовывоз</option>
                        <option value="novaya_pochta">Новая почта</option>
                        <option value="ukrpochta">Укрпочта</option>
                      </select>
                      <div v-for="(error, index) of v$.formData.delivery.$errors" :key="index" class="input-errors">
                        <div class="error-msg">{{ error.$message }}</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="billing-select mb-20" :class="{'input-error': v$.formData.pay_type.$error}">
                    <label>Payment method <abbr class="required" title="required">*</abbr></label>
                    <div class="select-style">
                      <select v-model="v$.formData.pay_type.$model" class="select-active">
                        <option disabled value="">Выберите способ оплаты:</option>
                        <option value="privat_bank">Приват банк</option>
                        <option value="cash_on_delivery">Наложеный платеж</option>
                        <option value="other_payment_method">Другой способ оплаты</option>
                      </select>
                      <div v-for="(error, index) of v$.formData.pay_type.$errors" :key="index" class="input-errors">
                        <div class="error-msg">{{ error.$message }}</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div v-if="isDelivery" class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.city.$error}">
                    <label>City <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.city.$model" type="text">
                    <div v-for="(error, index) of v$.formData.city.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
                <div v-if="isDelivery" class="col-12">
                  <div class="billing-info mb-20" :class="{'input-error': v$.formData.department_number.$error}">
                    <label>Department number <abbr class="required" title="required">*</abbr></label>
                    <input v-model="v$.formData.department_number.$model" type="text">
                    <div v-for="(error, index) of v$.formData.department_number.$errors" :key="index" class="input-errors">
                      <div class="error-msg">{{ error.$message }}</div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div class="additional-info-wrap">
              <label>Order notes (optional)</label>
              <textarea placeholder="Notes about your order, e.g. special notes for delivery. " name="message"></textarea>
            </div>
          </div>
        </div>
        <div class="col-lg-5">
          <div class="your-order-area">
            <h3>Your order</h3>
            <div class="your-order-wrap">
              <div class="your-order-info-wrap">
                <div class="your-order-title">
                  <h4>Product <span>Subtotal</span></h4>
                </div>
                <div class="your-order-product">
                  <ul>
                    <li v-for="product in cartProducts" :key="product.id">
                      {{ product.name.ru }} × {{ product.quantity }} <span>{{ subTotalProduct(product) }} грн </span>
                    </li>
                  </ul>
                </div>
                <div class="your-order-total">
                  <h3>Total <span>{{ cartSum }} грн </span></h3>
                </div>
              </div>
            </div>
            <div class="place-order">
              <router-link @click="onSubmit" to="">
                Place Order
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
import {helpers, required, minLength, maxLength, requiredIf} from '@vuelidate/validators'
import {emailRegexTemplate, toPhoneString} from "../../helpers/utils"
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
      'cartProducts'
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
  },
  methods: {
    setFormData() {
      if (!this.user) return

      const { email, phone, first_name, last_name, patronymic } = this.user
      this.formData = { email, phone, first_name, last_name, patronymic }
    },
    onSubmit() {
      if (this.v$.$invalid) {
        this.v$.$touch()
        return
      }
      const formData = { ...this.formData, phone: toPhoneString(this.formData.phone) }
      if (!this.user) formData.line_items = this.cart.map(({ quantity, product_id }) => ({ quantity, product_id }))

      this.$store.dispatch('createOrders', formData)
    },
    cleanDependentDelivery() {
      this.formData.city = ''
      this.formData.department_number = ''
    }
  }
}
</script>
