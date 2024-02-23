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
      <td>
        <v-responsive
            class="mx-auto quantity-res"
            max-width="50"
        >
          <v-text-field
              @input="handleQuantity($event, product)"
              :model-value="product.quantity"
              type="number"
              variant="underlined"
              color="primary"
              max="99"
              min="1"
          >
            <template v-slot:prepend>
              <span class="quantity-x">x</span>
            </template>
          </v-text-field>
        </v-responsive>
      </td>
      <td>{{ product.price * product.quantity }}</td>
      <td>
        <v-btn
            icon
            variant="text"
            @click="handleDelete(product)">
          <v-icon color="pink">mdi-delete</v-icon>
        </v-btn>
      </td>
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
          <h4>Total: <span>{{ orderSum }} грн</span></h4>
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
  <v-dialog v-model="dialog" max-width="400">
    <v-card>
      <v-card-text class="headline text-center">Delete <strong>{{ selectProduct.name[language] }}</strong> product?</v-card-text>
      <v-card-actions class="justify-center">
        <v-btn color="primary" @click="onCancel">Cancel</v-btn>
        <v-btn color="red" @click="onDelete">Delete</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'OrdersEdit',
  data: () => ({
    language: 'ua',
    selectProduct: {},
    dialog: false,
    headers: [
      '',
      'Product',
      'Price',
      'Quantity',
      'Subtotal',
      ''
    ],
  }),
  computed: {
    ...mapGetters([
      'order'
    ]),
    orderSum() {
      return this.$store.getters.order.products?.reduce((accumulator, item) => {
        return accumulator + (item.price * item.quantity)
      }, 0)
    }
  },
  created () {
    this.fetchOrder()
  },
  methods: {
    fetchOrder() {
      this.$store.dispatch('fetchOrder', this.$route.params.id)
    },
    handleQuantity(e, product) {
      const { id, line_item_id } = product
      const quantity = e.target.value
      this.$store.dispatch('updateLineItems', { id: line_item_id, quantity })
      this.$store.commit('updateQuantityItem', { productId: id, quantity })
    },
    handleDelete(product) {
      this.selectProduct = product
      this.showDialog()
    },
    onCancel() {
      this.hideDialog()
    },
    async onDelete() {
      await this.deleteLineItem()
      this.hideDialog()
    },
    showDialog() {
      this.dialog = true
    },
    hideDialog() {
      this.dialog = false
    },
    async deleteLineItem() {
      await this.$store.dispatch('deleteLineItems', { id: this.selectProduct.line_item_id })
      this.$store.commit('removeFromOrder', this.selectProduct.id)
    },
  }
}
</script>

<style scoped>
.order-product-logo {
  margin: 10px;
  width: 80px;
}

.order-table-thead {
  background-color: #f3f3f3;
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

.quantity-x {
  padding: 0;
  margin-top: 70%;
}

.quantity-res .v-input__prepend{
  margin-inline-end: 7px;
}
</style>
