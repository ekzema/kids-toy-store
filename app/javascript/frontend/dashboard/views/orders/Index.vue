<template>
  <v-table class="tr-odd elevation-4">
    <thead>
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
        v-for="(order, index) in orders.items"
        :key="index"
    >
      <td>{{ order.id }}</td>
      <td>{{ order.full_name }}</td>
      <td>{{ order.status }}</td>
      <td>{{ order.amount }} грн</td>
      <td>{{ formattedDate(order.created_at) }}</td>
      <td class="d-flex justify-center">
        <v-btn
            icon
            variant="text"
            :to="{ name: 'OrdersEdit', params: { id: order.id }}"
        >
          <v-icon color="teal">mdi-pencil</v-icon>
        </v-btn>
      </td>
    </tr>
    </tbody>
  </v-table>

  <pagination v-if="totalPages > 1"
              :page="page"
              :total-pages="totalPages"
              @pagination-event="paginationEvent"
  />
</template>

<script>
import Pagination from '../../components/Pagination'
import { mapGetters } from 'vuex'
import { perPage } from '../../config'
import PaginationMixin from '../../mixins/paginationMixin'

export default {
  name: 'OrdersIndex',
  components: {
    Pagination
  },
  mixins: [PaginationMixin],
  data: () => ({
    searchText: '',
    headers: [
      'ID',
      'Full name',
      'Status',
      'Total',
      'Date',
      ''
    ],
  }),
  computed: {
    ...mapGetters([
      'orders'
    ]),
    totalPages() {
      return Math.ceil(this.orders.count / perPage)
    }
  },
  watch: {
    '$route.params'() {
      if (!this.$route.query.page) this.page = null
      this.fetchOrders()
    }
  },
  created () {
    if (this.$route.query.page ) this.page = this.$route.query.page
    this.fetchOrders()
  },
  methods: {
    fetchOrders() {
      const params = this.searchText ? { q: this.searchText } : {}
      if (this.page) params.page = this.page

      this.$store.dispatch('fetchOrders', params)
    },
    formattedDate(date) {
      const objectDateTime = new Date(date)

      let formattedDate = objectDateTime.toLocaleDateString('uk-UA', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
      }).replace(/'.'/g, '-')

      const formattedTime = objectDateTime.toLocaleTimeString('it-IT', { hour: "2-digit", minute: "2-digit" })
      return `${formattedDate} ${formattedTime}`
    }
  }
}
</script>
