<template>
  <v-select
      v-model="for_age"
      :rules="requiredRules"
      label="Select age children"
      variant="underlined"
      :items="detailConstructor.age"
      @update:modelValue="onSelect"
      color="primary"
  >
    <template v-slot:item="{ props, item }">
      <v-list-item
          v-bind="props"
          :title="item.raw + '+'"
      />
    </template>
    <template v-slot:selection="{ item }">
      {{ item.raw + '+' }}
    </template>
  </v-select>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'select-agr',
  data: () => ({
    requiredRules: [
      v => (!!v || v === 0)  || 'This field is required'
    ],
  }),
  props: {
    for_age: {
      type: Number
    }
  },
  created () {
  },
  methods: {
    onSelect() {
      this.$emit('update:for_age', this.for_age)
    }
  },
  computed: {
    ...mapGetters([
      'detailConstructor'
    ])
  }
}
</script>
