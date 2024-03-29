<template>
  <search-panel class="custom-main-color" @search="search">
    <v-tooltip location="bottom">
      <template v-slot:activator="{ props }">
        <v-btn
            color="success"
            v-bind="props"
            size="x-large"
            variant="elevated"
            icon
            to="/dashboard/categories/new"
        >
          <v-icon>mdi-plus</v-icon>
        </v-btn>
      </template>
      <span>Add category</span>
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
        v-for="(category, index) in categories.items"
        :key="index"
    >
      <td>{{ category.name[language] }}</td>
      <td>{{ category.parent_name ? category.parent_name[language] : ''}}</td>
      <td class="d-flex justify-center">
        <v-btn
            icon
            variant="text"
            :to="'/dashboard/categories/edit/' + category.id"
        >
          <v-icon color="teal">mdi-pencil</v-icon>
        </v-btn>
        <v-btn
            icon
            variant="text"
            @click="handleDelete(category)">
          <v-icon color="pink">mdi-delete</v-icon>
        </v-btn>
      </td>
    </tr>
    </tbody>
  </v-table>

  <pagination v-if="totalPages > 1"
              v-model:page="page"
              :totalPages="totalPages"
  />

  <v-dialog v-model="dialog" max-width="400">
    <v-card>
      <v-card-text class="headline text-center">Delete <strong>{{ selectCategory.name[language] }}</strong> category?</v-card-text>
      <v-card-actions class="justify-center">
        <v-btn color="primary" @click="onCancel">Cancel</v-btn>
        <v-btn color="red" @click="onDelete">Delete</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import SearchPanel from '../../components/SearchPanel'
import Pagination from "../../components/Pagination.vue"
import { perPage } from "../../config"
import { mapGetters } from 'vuex'

export default {
  name: 'CategoriesIndex',
  components: {
    SearchPanel,
    Pagination
  },
  data: () => ({
    language: 'ua',
    selectCategory: {},
    dialog: false,
    searchText: '',
    page: 1,
    headers: [
      'Title',
      'Parent category',
      ''
    ],
  }),
  computed: {
    ...mapGetters([
      'categories'
    ]),
    totalPages() {
      return Math.ceil(this.categories.count / perPage)
    }
  },
  created () {
    this.fetchCategories()
  },
  methods: {
    fetchCategories(page) {
      const params = this.searchText ? {q: this.searchText} : {}
      if (page) params['page'] = page

      this.$store.dispatch('fetchCategories', params)
    },
    handleDelete(category) {
      this.selectCategory = category
      this.showDialog()
    },
    onCancel() {
      this.hideDialog()
    },
    async onDelete() {
      await this.deleteCategory()
      this.fetchCategories()
      this.hideDialog()
    },
    showDialog() {
      this.dialog = true
    },
    hideDialog() {
      this.dialog = false
    },
    async deleteCategory() {
      await this.$store.dispatch('deleteCategory', this.selectCategory.id)
    },
    search(text) {
      this.searchText = text
      this.fetchCategories()
    }
  },
  watch: {
    page() {
      this.fetchCategories(this.page)
    }
  }
}
</script>
