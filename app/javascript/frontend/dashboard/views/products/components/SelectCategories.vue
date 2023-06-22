<template>
  <v-autocomplete
      v-model="selectedCategories"
      label="Select categories"
      :rules="requiredArrayRules"
      :items="detailConstructor.categories"
      multiple
      color="primary"
      item-value="id"
      item-title="name"
      variant="underlined"
      @update:modelValue="onSelect"
  >
    <template v-slot:chip="{ props, item }">
      <v-chip
          class="ma-1"
          v-bind="props"
          color="primary"
          closable
          size="default"
          variant="outlined"
      >
        <strong>{{ item.raw.name ? item.raw.name[language] : '' }}</strong>&nbsp;
        <span style="font-size: 11px">{{ item.raw.parent_name ? item.raw.parent_name[language] : 'parent' }}</span>
      </v-chip>
    </template>
    <template v-slot:item="{ props, item }">
      <v-list-item
          v-bind="props"
          :title="item.raw.name[language]"
          :subtitle="item.raw.group"
          color="primary"
      ></v-list-item>
    </template>
  </v-autocomplete>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'SelectCategories',
  props: ['language', 'categories'],
  data() {
    return {
      selectedCategories: [],
      requiredArrayRules: [
        v => (!!v && v.length > 0) || 'Please select a category.'
      ]
    }
  },
  computed: {
    ...mapGetters([
      'detailConstructor'
    ])
  },
  watch: {
    categories() {
      this.selectedCategories = this.categories
    }
  },
  created () {
  },
  methods: {
    onSelect() {
      this.$emit('update:categories', this.selectedCategories)
    }
  }
}
</script>
