<template>
  <v-select
      v-model="selectedAge"
      :rules="requiredRules"
      label="Select age children"
      variant="underlined"
      :items="detailConstructor.age"
      color="primary"
      @update:modelValue="onSelect"
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
  name: 'SelectAga',
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
  // eslint-disable-next-line vue/order-in-components
  computed: {
    ...mapGetters([
      'detailConstructor'
    ])
  },
  // eslint-disable-next-line vue/order-in-components
  watch: {
    for_age() {
      this.selectedAge = this.for_age
    }
  }
}
</script>
