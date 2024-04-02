<template>
  <search-panel @search="search" class="custom-main-color">
    <v-tooltip location="bottom">
      <template v-slot:activator="{ props }">
        <v-btn
            color="success"
            v-bind="props"
            size="x-large"
            variant="elevated"
            icon
            to="/dashboard/products/new"
        >
          <v-icon>mdi-plus</v-icon>
        </v-btn>
      </template>
      <span>Add product</span>
    </v-tooltip>
  </search-panel>

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
        v-for="(product, index) in products.items"
        :key="index"
    >
      <td>{{ product.id }}</td>
      <td>
        <v-img
            :src="product.logo.small.url"
        ></v-img>
      </td>
      <td>{{ product.name[language] }}</td>
      <td>{{ product.description[language].substring(0, 150) + '...' }}</td>
      <td>{{ product.status }}</td>
      <td class="d-flex justify-center">
        <v-btn
            icon
            variant="text"
            :to="'/dashboard/products/edit/' + product.id"
        >
          <v-icon color="teal">mdi-pencil</v-icon>
        </v-btn>
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

  <v-dialog v-model="dialog" max-width="400">
    <v-card>
      <v-card-text class="headline text-center">Delete <strong>{{ selectProduct.name[language] }}</strong> product?</v-card-text>
      <v-card-actions class="justify-center">
        <v-btn color="primary" @click="onCancel">Cancel</v-btn>
        <v-btn color="red" @click="onDelete">Delete</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
  <pagination v-if="totalPages > 1"
      :page="page"
      :total-pages="totalPages"
      @pagination-event="paginationEvent"
  />
</template>

<script>
import SearchPanel from '../../components/SearchPanel'
import Pagination from '../../components/Pagination'
import { perPage } from "../../config"
import { mapGetters } from 'vuex'
import PaginationMixin from '../../mixins/paginationMixin'

export default {
  name: 'ProductsIndex',
  components: {
    SearchPanel,
    Pagination
  },
  mixins: [PaginationMixin],
  data: () => ({
    language: 'ua',
    selectProduct: {},
    dialog: false,
    status: null,
    searchText: '',
    headers: [
      'ID',
      'Logo',
      'Title',
      'Description',
      'Status',
      ''
    ],
  }),
  computed: {
    ...mapGetters([
      'products',
      'detailConstructor'
    ]),
    totalPages() {
      return Math.ceil(this.products.count / perPage)
    },
    statuses() {
      return this.status ? [{ id: null, title: 'All statuses' }, ...this.detailConstructor.statuses] : this.detailConstructor.statuses
    }
  },
  watch: {
    '$route.params'() {
      if (!this.$route.query.page) this.page = null
      if (!this.$route.query.status) this.status = null
      this.fetchProducts()
    }
  },
  created () {
    if (this.$route.query.page ) this.page = this.$route.query.page
    if (this.$route.query.status ) this.status = this.$route.query.status

    this.$store.dispatch('fetchDetailConstructor')
    this.fetchProducts()
  },
  methods: {
    fetchProducts() {
      const params = this.searchText ? {q: this.searchText} : {}
      if (this.status) params.status = this.status
      if (this.page) params.page = this.page

      this.$store.dispatch('fetchProducts', params)
    },
    handleDelete(product) {
      this.selectProduct = product
      this.showDialog()
    },
    onCancel() {
      this.hideDialog()
    },
    async onDelete() {
      await this.deleteProduct()
      this.fetchProducts()
      this.hideDialog()
    },
    showDialog() {
      this.dialog = true
    },
    hideDialog() {
      this.dialog = false
    },
    async deleteProduct() {
      await this.$store.dispatch('deleteProduct', this.selectProduct.id)
    },
    search(text) {
      this.searchText = text
      this.fetchProducts()
    },
    onStatus() {
      if (!this.status) return this.cleanStatus()

      const currentPath = this.$route.path
      const newPath = `${currentPath}?status=${this.status}`

      this.$router.push(newPath)
      this.fetchProducts()
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
