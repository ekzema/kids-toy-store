<template>
  <v-table>
    <thead class="order-table-thead">
    <tr>
      <th v-for="(header, index) in headers"
          :key="index"
          class="text-left">
        {{ header }}
      </th>
    </tr>
    </thead>
    <tbody>
    <tr
        v-for="(product, index) in order.products"
        :key="index"
    >
      <td>
        <v-img
            :src="product.logo.thumb.url" class="order-product-logo"
        ></v-img>
      </td>
      <td>
        {{ product.name[language] }}
      </td>
      <td>{{ product.price }}</td>
      <td>x{{ product.quantity }}</td>
      <td>{{ product.price * product.quantity }}</td>
    </tr>
    </tbody>
  </v-table>
  <v-footer
      color="transparent"
      class="justify-space-between text-body-2 mt-4 px-0"
  >
    <div class="order-note">
      <p>
        <strong>Note: </strong>
        <span>{{ order.note }}</span>
      </p>
    </div>
    <div class="grand-total-wrap">
      <div class="grand-total-content">
        <div class="grand-total">
          <h4>Total: <span>{{ order.amount }} грн</span></h4>
          <hr>
        </div>
        <div class="order-info">
          <p>Delivery: <span>{{ order.delivery }}</span></p>
          <p v-if="order.city">City: <span>{{ order.city }}</span></p>
          <p v-if="order.department_number">Department: <span>{{ order.department_number }}</span></p>
          <p>Payment: <span>{{ order.pay_type }}</span></p>
        </div>
      </div>
    </div>
  </v-footer>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'OrdersEdit',
  data: () => ({
    language: 'ua',
    headers: [
      '',
      'Product',
      'Price',
      'Quantity',
      'Subtotal'
    ],
  }),
  computed: {
    ...mapGetters([
      'order'
    ])
  },
  created () {
    this.fetchOrder()
  },
  methods: {
    fetchOrder() {
      this.$store.dispatch('fetchOrder', this.$route.params.id)
    }
  }
}
</script>

<style scoped>
.order-product-logo {
  margin: 10px;
  width: 80px;
}

.order-table-thead {
  color: white !important;
  background-color: #f3f3f3;
}
.v-table--density-default > .v-table__wrapper > table > thead > tr > th {
  //color: white;
}

.grand-total-wrap {
  min-width: 200px;
  max-width: 250px;
  padding: 10px;
  margin-left: auto;
  background-color: white;
}

.grand-total-wrap .grand-total-content .grand-total {
  margin-bottom: 10px;
}

.order-note {
  padding: 10px;
  margin-right: 10px;
  margin-bottom:  auto;
  background-color: white;
  width: 100%;
}
</style>
