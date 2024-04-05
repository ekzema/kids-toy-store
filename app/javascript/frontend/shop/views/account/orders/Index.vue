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
      <tr v-for="order in orders.items" :key="order.id" class="orderWrap">
        <td>{{ order.id }}</td>
        <td>{{ formattedDate(order.created_at) }}</td>
        <td :class="order.status">{{ $t(`ACCOUNT.ORDERS.STATUS.${ order.status.toUpperCase() }`) }}</td>
        <td>{{ order.amount }} грн</td>
        <td>
          <router-link class="check-btn sqr-btn order-more" :to="{ name: 'OrdersShow', params: { id: order.id } }">
            {{ $t('ACCOUNT.ORDERS.LIST.HEADER.ACTION.MORE') }}
          </router-link>
        </td>
      </tr>
      </tbody>
    </table>
    <pagination
        v-show="showPagination"
        :page="page"
        :total-items="orders.count"
        @pagination-event="paginationEvent"
    />
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Pagination from '../../../components/Pagination'
import { perPage } from '../../../config'

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: 'Orders',
  components: {
    Pagination
  },
  data() {
    return {
      page: null
    }
  },
  computed: {
    ...mapGetters([
      'orders'
    ]),
    showPagination() {
      return this.orders.count > perPage
    }
  },
  watch: {
    '$route.params'() {
      if (!this.$route.query.page) this.page = null
      this.fetchOrders()
    }
  },
  created() {
    if (this.$route.query.page) this.page = Number(this.$route.query.page)
    this.fetchOrders()
  },
  methods: {
    formattedDate(date) {
      let formatted = new Date(date).toLocaleDateString('uk-UA', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
      })
      return formatted.replace(/'.'/g, '-')
    },
    fetchOrders() {
      const params = this.page ? { page: this.page } : {}
      this.$store.dispatch('fetchOrders', params)
    },
    paginationEvent(page) {
      const currentPath = this.$route.path;
      const newPath = `${currentPath}?page=${page}`

      this.$router.push(newPath)
      this.page = Number(page)
    }
  }
}
</script>

<style scoped>

</style>
