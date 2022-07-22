<template>
  <v-navigation-drawer :rail="rail" permanent>
    <v-list density="compact" nav>
      <v-list-item prepend-icon="mdi-home-city" title="Home" value="home"></v-list-item>
      <v-list-item prepend-icon="mdi-account" title="My Account" value="account"></v-list-item>
      <v-list-item prepend-icon="mdi-account-group-outline" title="Users" value="users"></v-list-item>
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
    <v-container fluid style="outline: 1px solid green">
      <v-card style="outline: 1px solid red" fluid>
        dsds
      </v-card>

    </v-container>
  </v-main>
</template>

<script>
export default {
  name: 'App',
  data: () => ({
    rail: false,
    drawer: true,
    items: [
      { title: 'Home', icon: 'mdi-home-city' },
      { title: 'My Account', icon: 'mdi-account' },
      { title: 'Users', icon: 'mdi-account-group-outline' },
    ],
  }),
}
</script>
