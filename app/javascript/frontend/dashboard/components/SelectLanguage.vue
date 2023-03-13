<template>
  <v-radio-group
      v-model="selectedLanguage"
      true-icon=""
      false-icon=""
      density="compact"
      row
      inline
      active-class="active"
      @update:modelValue="onSelectLang"
  >
    <v-radio
      v-for="lang in languages"
      :key="lang.code"
      :ref="lang.code"
      class="mx-2"
      :class="`edit_lang-${lang.code}`"
      :value="lang.code"
    ></v-radio>
  </v-radio-group>
</template>

<script type="text/ecmascript-6">

import '../assets/css/radio_lang.css'
import { languages } from '../config'

export default {
  name: 'SelectLanguage',
  props: ['language'],
  emits: ['update:language'],
  data() {
    return {
      languages: languages,
      selectedLanguage: this.language
    }
  },
  created () {
  },
  methods: {
    onSelectLang(event) {
      this.$emit('update:language', event)
    }
  }
}
</script>
