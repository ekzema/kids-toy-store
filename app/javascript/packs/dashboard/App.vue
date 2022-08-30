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
      <div v-show="loader" class="spinner-block">
        <v-progress-circular
            class="spinner-loader"
            :width="5" :size=100
            indeterminate
            color="primary">
        </v-progress-circular>
      </div>
      <v-container fluid>
        <router-view></router-view>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import { mapGetters } from 'vuex'

export default {
  name: 'App',
  components: {
    HelloWorld,
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

  .spinner-block {
    margin: auto;
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 10000;
    background-color: white;
    opacity: 0.5;
    top: 0;
  }

  .spinner-loader {
    left: calc(50% - 50px);
    top: calc(50% - 50px);
  }

</style>
