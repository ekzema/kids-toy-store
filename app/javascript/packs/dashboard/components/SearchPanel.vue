<template>
  <v-card flat>
    <v-row align="center">
      <v-col
          cols="12"
          xs="12"
          sm="4"
          md="7"
          lg="8"
      >
        <v-card-text>
          <v-text-field
              v-model="selectedText"
              label="Search by name"
              prepend-icon="search"
              @keyup.enter="search"
              variant="underlined"
              color="primary"
          >
          </v-text-field>
        </v-card-text>
      </v-col>
      <v-col
          cols="12"
          xs="12"
          sm="8"
          md="5"
          lg="4"
      >
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-tooltip top>
            <template v-slot:activator="{ props }">
              <v-btn
                  color="secondary-dark-blue"
                  v-bind="props"
                  size="x-large"
                  variant="elevated"
                  icon
              >
                <v-icon>mdi-magnify</v-icon>
              </v-btn>
            </template>
            <span>Search</span>
          </v-tooltip>
        </v-card-actions>
      </v-col>
    </v-row>
  </v-card>

</template>

<script>
export default {
  name: 'SearchPanel',
  data: () => ({
    selectedText: ''
  }),
  methods: {
    search () {
      console.log('test search')
    }
  }
}
</script>
