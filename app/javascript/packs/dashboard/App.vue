<template>
  <v-app>
    <v-navigation-drawer :rail="rail" permanent theme="dark">
      <v-list>
        <template v-for="item in drawerItems">
          <v-list-item :prepend-icon="item.icon" :title="item.title" :value="item.value" :to="item.path"></v-list-item>
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
        icon: 'mdi-home-city',
        path: '/dsdsd'
      },
      {
        title: 'My Account',
        value: 'account',
        icon: 'mdi-account',
        path: '/dashboard'
      },
      {
        title: 'Users',
        value: 'users',
        icon: 'mdi-account-group-outline',
        path: '/dsdsd'
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
