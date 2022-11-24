<template>
  <v-app>
    <v-navigation-drawer :rail="rail" permanent theme="dark">
      <v-list>
        <template v-for="item in drawerItems">
          <v-list-item
              :prepend-icon="item.icon"
              :title="item.title"
              :value="item.value"
              :to="item.path"
              :active="$route.path.includes(item.path) && item.path !== '/dashboard'"
          ></v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar color="primary">
      <v-app-bar-nav-icon @click="rail = !rail"></v-app-bar-nav-icon>
      <p>Dashboard</p>
      <v-spacer></v-spacer>
      <v-btn icon>
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </v-app-bar>
    <v-main class="custom-main-color">
      <div v-show="loader" class="spinner-block">
      </div>
      <v-container fluid>
        <v-progress-circular
            v-show="loader"
            class="spinner-loader"
            :width="5" :size=100
            indeterminate
            color="primary">
        </v-progress-circular>
        <router-view></router-view>
      </v-container>
    </v-main>
    <alert />
  </v-app>
</template>

<script>
import Alert from './components/Alert'
import { mapGetters } from 'vuex'

export default {
  name: 'App',
  components: {
    Alert,
  },
  computed: {
    ...mapGetters([
      'loader'
    ]),
  },
  data: () => ({
    rail: false,
    drawer: true,
    drawerItems: [
      {
        title: 'home',
        value: 'primary',
        icon: 'mdi-home-city-outline',
        path: '/dashboard'
      },
      {
        title: 'Products',
        value: 'Products',
        icon: 'mdi-duck',
        path: '/dashboard/products'
      },
      {
        title: 'Categories',
        value: 'categories',
        icon: 'mdi-sticker-text-outline',
        path: '/dashboard/categories'
      }
    ]
  }),
}
</script>

<style>
  html {
    overflow-y: auto !important;
  }
</style>
