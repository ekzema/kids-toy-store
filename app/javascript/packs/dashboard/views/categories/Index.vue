<template>
  <h1>{{categories[0].name}}</h1>
  <p v-for="(value, index) in categories" :key="index">{{value.name}}</p>
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
import { mapGetters } from 'vuex'

export default {
  name: 'index',
  components: {
    SearchPanel,
  },
  data: () => ({
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
