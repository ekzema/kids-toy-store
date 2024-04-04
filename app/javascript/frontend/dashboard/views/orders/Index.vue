<template>
  <v-table class="tr-odd elevation-4">
    <thead>
    <tr>
      <th v-for="(header, index) in headers"
          :key="index"
          class="text-left">
        <v-select
            v-if="header === 'Status'"
            v-model="status"
            @update:modelValue="onStatus"
            class="statusWrap"
            placeholder="Status"
            density="compact"
            :items="statuses"
            item-value="id"
            item-title="title"
            variant="underlined"
        ></v-select>
        <span v-else>{{ header }}</span>
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
    status: null,
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
    ...mapGetters({
      orders: 'orders',
      detailConstructor: 'orderDetailConstructor'
    }),
    totalPages() {
      return Math.ceil(this.orders.count / perPage)
    },
    statuses() {
      return this.status ? [{ id: null, title: 'All statuses' }, ...this.detailConstructor.statuses] : this.detailConstructor.statuses
    }
  },
  watch: {
    '$route.params'() {
      if (!this.$route.query.page) this.page = null
      if (!this.$route.query.status) this.status = null

      this.fetchOrders()
    }
  },
  created () {
    if (this.$route.query.page ) this.page = this.$route.query.page
    if (this.$route.query.status ) this.status = this.$route.query.status
    this.fetchOrders()
    this.$store.dispatch('fetchOrderDetailConstructor')
  },
  methods: {
    fetchOrders() {
      const params = this.searchText ? { q: this.searchText } : {}
      if (this.status) params.status = this.status
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
    },
    onStatus() {
      if (!this.status) return this.cleanStatus()

      const currentPath = this.$route.path
      const newPath = `${currentPath}?status=${this.status}`

      this.$router.push(newPath)
      this.fetchOrders()
    },
    cleanStatus() {
      const query = { ...this.$route.query }
      delete query.status

      this.$router.replace({ query })
    }
  }
}
</script>

<style scoped>
.statusWrap {
  width: 130px;
  height: 40px;
}

.statusWrap input::placeholder {
  opacity: 1;
}
</style>
