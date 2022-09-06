<template>
  <search-panel class="custom-main-color">
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
<!--  <h1>Categories page</h1>-->
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
          v-for="(category, index) in categories"
          :key="index"
      >
        <td>{{ category.name }}</td>
        <td>{{ category.parent_name }}</td>
        <td>
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
  <v-dialog v-model="dialog">
    <v-card>
      <v-card-text class="headline">Delete <strong>{{ selectCategory.name }}</strong> category?</v-card-text>
      <v-card-actions class="justify-center">
        <v-btn color="primary" @click="onCancel">Cancel</v-btn>
        <v-btn color="red" @click="onDelete">Delete</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import SearchPanel from '../../components/SearchPanel'
import { mapGetters } from 'vuex'

export default {
  name: 'index',
  components: {
    SearchPanel,
  },
  data: () => ({
    selectCategory: {},
    dialog: false,
    headers: [
      'Title',
      'Parent category',
      'Actions'
    ],
  }),
  computed: {
    ...mapGetters([
      'categories'
    ]),
  },
  created () {
    this.fetchCategories()
  },
  methods: {
    fetchCategories() {
      this.$store.dispatch('fetchCategories')
    },
    handleDelete(category) {
      this.selectCategory = category
      this.showDialog()
    },
    onCancel() {
      this.hideDialog()
    },
    onDelete() {
      this.deleteCategory()
      this.fetchCategories()
      this.hideDialog()
    },
    showDialog() {
      this.dialog = true
    },
    hideDialog() {
      this.dialog = false
    },
    deleteCategory() {
      this.$store.dispatch('deleteCategory', this.selectCategory.id)
    }
  }
}
</script>
