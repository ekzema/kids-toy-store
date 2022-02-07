<template>
  <v-app>
    <v-navigation-drawer
        color="grey-darken-2"
        absolute
        permanent
        v-model="drawer"
        temporary
        >
    </v-navigation-drawer>
    <v-app-bar
        color="blue-darken-2"
    >

      <v-app-bar-nav-icon  class="text-white" color="blue-darken-2" @click="drawer=false"></v-app-bar-nav-icon>

      <v-app-bar-title class="text-white">Dashboard</v-app-bar-title>

      <v-spacer></v-spacer>

      <v-btn icon class="text-white" color="blue-darken-2">
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </v-app-bar>
    <v-main>
      <v-card></v-card>
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'HelloWorld',

  data: () => ({
    drawer: true,
    ecosystem: [
      {
        text: 'vuetify-loader',
        href: 'https://github.com/vuetifyjs/vuetify-loader',
      },
      {
        text: 'github',
        href: 'https://github.com/vuetifyjs/vuetify',
      },
      {
        text: 'awesome-vuetify',
        href: 'https://github.com/vuetifyjs/awesome-vuetify',
      },
    ],
    importantLinks: [
      {
        text: 'Chat',
        href: 'https://community.vuetifyjs.com',
      },
      {
        text: 'Made with Vuetify',
        href: 'https://madewithvuejs.com/vuetify',
      },
      {
        text: 'Twitter',
        href: 'https://twitter.com/vuetifyjs',
      },
      {
        text: 'Articles',
        href: 'https://medium.com/vuetify',
      },
    ],
    whatsNext: [
      {
        text: 'Explore components',
        href: 'https://vuetifyjs.com',
      },
      {
        text: 'Roadmap',
        href: 'https://vuetifyjs.com/introduction/roadmap/',
      },
      {
        text: 'Frequently Asked Questions',
        href: 'https://vuetifyjs.com/getting-started/frequently-asked-questions',
      },
    ],
  }),
}
</script>
