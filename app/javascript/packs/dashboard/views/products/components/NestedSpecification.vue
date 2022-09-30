<template>
  <v-row justify="center">
    <v-col
        cols="12"
        sm="3"
    >
      <v-text-field
          ref="specification_key"
          v-model="specification.key"
          :rules="requiredRules"
          label="Title"
          variant="underlined"
          color="primary"
          required
      ></v-text-field>
    </v-col>
    <v-col
        cols="12"
        sm="8"
    >
      <v-text-field
          ref="specification_value"
          v-model="specification.value"
          :rules="requiredRules"
          label="Description"
          variant="underlined"
          color="primary"
          required
      ></v-text-field>
    </v-col>
    <v-col
        cols="12"
        sm="1"
    >
      <v-btn
          icon
          variant="text"
          @click="removeSpec(index)">
        <v-icon color="pink">mdi-delete</v-icon>
      </v-btn>
    </v-col>
  </v-row>
</template>

<script>

export default {
  name: 'nested-specification',
  data: () => ({
  }),
  props: {
    specification: {
      type: Object,
      default: null
    }
  },
  created() {
  },
  methods: {

    removeSpec(index) {
      this.form.data.specifications.splice(index, 1)
    }
  },
  watch: {
  }
}
</script>
