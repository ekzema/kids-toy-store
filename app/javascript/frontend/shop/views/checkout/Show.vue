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
              <div class="col-12">
                <div class="billing-info mb-20">
                  <label>First name <abbr class="required" title="required">*</abbr></label>
                  <input v-model="formData.first_name" type="text">
                </div>
              </div>
              <div class="col-12">
                <div class="billing-info mb-20">
                  <label>Last name <abbr class="required" title="required">*</abbr></label>
                  <input v-model="formData.last_name" type="text">
                </div>
              </div>
              <div class="col-12">
                <div class="billing-info mb-20">
                  <label>Patronymic <abbr class="required" title="required">*</abbr></label>
                  <input v-model="formData.patronymic" type="text">
                </div>
              </div>
              <div class="col-12">
                <div class="billing-info mb-20">
                  <label>Phone <abbr class="required" title="required">*</abbr></label>
                  <input type="text">
                </div>
              </div>
              <div class="col-12">
                <div class="billing-info mb-20">
                  <label>Email Address <abbr class="required" title="required">*</abbr></label>
                  <input type="text">
                </div>
              </div>
              <div class="col-12">
                <div class="billing-select mb-20">
                  <label>Payment method <abbr class="required" title="required">*</abbr></label>
                  <div class="select-style">
                    <select class="select-active">
                      <option>Приват банк</option>
                      <option>Наложеный платеж</option>
                      <option>Другой способ оплаты</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="billing-select mb-20">
                  <label>Delivery <abbr class="required" title="required">*</abbr></label>
                  <div class="select-style">
                    <select class="select-active">
                      <option>Новая почта</option>
                      <option>Укрпочта</option>
                      <option>Самовывоз</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="billing-info mb-20">
                  <label>Address <abbr class="required" title="required">*</abbr></label>
                  <input class="billing-address" placeholder="House number and street name" type="text">
                </div>
              </div>
              <div class="col-12">
                <div class="billing-info mb-20">
                  <label>Department number <abbr class="required" title="required">*</abbr></label>
                  <input type="text">
                </div>
              </div>
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
                    <li>Brother Hoodies in Grey × 4 <span>$140.00 </span></li>
                    <li>Enjoy The Rest T-Shirt × 1 <span>$39.59 </span></li>
                  </ul>
                </div>
                <div class="your-order-total">
                  <h3>Total <span>$617.59 </span></h3>
                </div>
              </div>
            </div>
            <div class="place-order">
              <a href="#/">Place Order</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  name: 'CheckoutShow',
  computed: {
    ...mapGetters([
        'user'
    ])
  },
  data: () => ({
    formData: {}
  }),
  watch: {
    user() {
      const { email, phone, first_name, last_name, patronymic } = this.user
      this.formData = { email, phone, first_name, last_name, patronymic }
    }
  },
  created() {
  },
  methods: {
    onSubmit() {
      //TODO save form
    }
  }
}
</script>
