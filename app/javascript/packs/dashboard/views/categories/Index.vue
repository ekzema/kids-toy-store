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
          Edit | Delete
        </td>
      </tr>
      </tbody>
    </v-table>
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
    }
  }
}
</script>
