<template>
  <v-row justify="center"  v-for="(specification, index) in specifications[language]" :key="index">
    <v-col
        cols="12"
        sm="3"
    >
      <v-text-field
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
          v-model="specification.value"
          :rules="requiredRules"
          label="Description"
          variant="underlined"
          color="primary"
          required
      >
        <template v-slot:append-inner>
          <img
              height="20"
              width="20"
              :src="require(`./../../../assets/img/${language}.svg`)"
          >
        </template>
      </v-text-field>
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
  <v-row>
    <v-col
        cols="12"
    >
      <v-spacer></v-spacer>
      <div class="text-right">
        Add specification
        <v-btn
            icon
            size="x-small"
            color="primary"
            @click="addSpec"
        >
          <v-icon dark>
            mdi-plus
          </v-icon>
        </v-btn>
      </div>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: 'Specifications',
  props: {
    specifications: {
      type: Object
    },
    language: {
      type: String
    }
  },
  data: () => ({
    requiredRules: [
      v => (!!v || v === 0)  || 'This field is required'
    ]
  }),
  created () {
  },
  methods: {
    addSpec() {
      if (!this.specifications[this.language]) this.specifications[this.language] = []
      this.specifications[this.language].push({key: '', value: ''})
    },
    removeSpec(index) {
      this.specifications[this.language].splice(index, 1)
    }
  }
}
</script>
