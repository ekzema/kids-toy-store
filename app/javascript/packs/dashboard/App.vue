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
    <v-main>
      <v-container fluid>
        <router-view></router-view>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'

export default {
  name: 'App',
  components: {
    HelloWorld,
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
        title: 'My Account',
        value: 'account',
        icon: 'mdi-account-outline',
        path: '/dashboard/dsdsd'
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
