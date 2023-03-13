<template>
  <v-card flat>
    <v-row class="flex justify-end">
      <v-col
          cols="12"
          xs="12"
          sm="4"
          md="6"
          lg="3"
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
          md="6"
          lg="2"
      >
        <v-card-actions>
          <v-tooltip location="bottom">
            <template v-slot:activator="{ props }">
              <v-btn
                  @click="search"
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
          <slot></slot>
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
      this.$emit('search', this.selectedText)
    }
  }
}
</script>
