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

    </tbody>
  </v-table>
</template>

<script>
import Pagination from "../../components/Pagination.vue"
import { mapGetters } from 'vuex'

export default {
  name: 'OrdersIndex',
  components: {
    Pagination
  },
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
    ])
  },
  created () {
    this.fetchOrders()
  },
  methods: {
    fetchOrders(page) {
      const params = this.searchText ? { q: this.searchText } : {}
      if (page) params['page'] = page

      this.$store.dispatch('fetchOrders', params)
    },
  }
}
</script>
