<template>
  <search-panel>
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
  <h1>Categories page</h1>
</template>

<script>
import SearchPanel from '../../components/SearchPanel'

export default {
  name: 'index',
  components: {
    SearchPanel,
  },
  data: () => ({
  }),
  mounted() {
    this.fetchCategories()
  },
  methods: {
    fetchCategories() {
      this.$store.dispatch('fetchCategories')
      console.log(this.$store.getters.fetchCategdsdsories, 'test')
    }
  }
}
</script>
