<template>
  <h3>{{ $t('ACCOUNT.ORDERS.TITLE') }}</h3>
  <div class="myaccount-table table-responsive text-center">
    <table class="table table-bordered">
      <thead class="thead-light">
      <tr>
        <th>№</th>
        <th>{{ $t('ACCOUNT.ORDERS.LIST.HEADER.DATE') }}</th>
        <th>{{ $t('ACCOUNT.ORDERS.LIST.HEADER.STATUS') }}</th>
        <th>{{ $t('ACCOUNT.ORDERS.LIST.HEADER.TOTAL') }}</th>
        <th></th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="order in orders" :key="order.id">
        <td>{{ order.id }}</td>
        <td>{{ formattedDate(order.created_at) }}</td>
        <td>{{ order.status }}</td>
        <td>{{ order.amount }} грн</td>
        <td>
          <router-link class="check-btn sqr-btn order-more" :to="{ name: 'OrdersShow', params: { id: order.id } }">
            {{ $t('ACCOUNT.ORDERS.LIST.HEADER.ACTION.MORE') }}
          </router-link>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: 'Orders',
  computed: {
    ...mapGetters([
      'orders'
    ]),
  },
  created() {
    this.fetchOrders()
  },
  methods: {
    formattedDate(date) {
      let formatted = new Date(date).toLocaleDateString('uk-UA', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
      })
      return formatted.replace(/'.'/g, '-');
    },
    fetchOrders() {
      this.$store.dispatch('fetchOrders')
    }
  }
}
</script>

<style scoped>

</style>
