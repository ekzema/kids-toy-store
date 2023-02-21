<template>
  <v-select
      v-model="selectedAge"
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
  props: ['for_age'],
  data() {
    return {
      selectedAge: '',
      requiredRules: [
        v => (!!v || v === 0)  || 'This field is required'
      ],
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
  },
  watch: {
    for_age() {
      this.selectedAge = this.for_age
    }
  }
}
</script>
