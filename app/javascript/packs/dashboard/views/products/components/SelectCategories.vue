<template>
  <v-autocomplete
      label="Select categories"
      v-model="selectedCategories"
      :rules="requiredArrayRules"
      :items="detailConstructor.categories"
      @update:modelValue="onSelect"
      variant="underlined"
      item-title="name"
      item-value="id"
      color="primary"
      multiple
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
  name: 'select-categories',
  props: ['language', 'categories'],
  data() {
    return {
      selectedCategories: [],
      requiredArrayRules: [
        v => (!!v && v.length > 0) || 'Please select a category.'
      ]
    }
  },
  created () {
  },
  methods: {
    onSelect() {
      this.$emit('update:categories', this.selectedCategories)
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
  }
}
</script>
