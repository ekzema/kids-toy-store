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
        {{ header }}
      </th>
    </tr>
    </thead>
    <tbody>
    <tr
        v-for="(product, index) in products.items"
        :key="index"
    >
      <td>{{ product.id }}</td>
      <td>{{ product.name[language] }}</td>
      <td>{{ product.description[language].substring(0, 150) + '...' }}</td>
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
      v-model:page="page"
      :totalPages="totalPages"
  />
</template>

<script>
import SearchPanel from '../../components/SearchPanel'
import Pagination from "../../components/Pagination.vue"
import { PerPage } from "../../helpers/utils"
import { mapGetters } from 'vuex'

export default {
  name: 'index',
  components: {
    SearchPanel,
    Pagination
  },
  data: () => ({
    language: 'uk',
    selectProduct: {},
    dialog: false,
    searchText: '',
    page: 1,
    headers: [
      'ID',
      'Title',
      'Description',
      ''
    ],
  }),
  computed: {
    ...mapGetters([
      'products'
    ]),
    totalPages() {
      return Math.ceil(this.products.count / PerPage)
    }
  },
  created () {
    this.fetchProducts()
  },
  methods: {
    fetchProducts(page) {
      const params = this.searchText ? {q: this.searchText} : {}
      if (page) params['page'] = page

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
    }
  },
  watch: {
    page() {
      this.fetchProducts(this.page)
    }
  }
}
</script>
