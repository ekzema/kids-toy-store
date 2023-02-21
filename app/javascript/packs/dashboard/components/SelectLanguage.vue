<template>
  <v-radio-group
      true-icon=""
      false-icon=""
      density="compact"
      v-model="selectedLanguage"
      row
      inline
      active-class="active"
      @update:modelValue="onSelectLang"
  >
    <v-radio
      class="mx-2"
      v-for="lang in languages"
      :key="lang.code"
      :class="`edit_lang-${lang.code}`"
      :value="lang.code"
      :ref="lang.code"
    ></v-radio>
  </v-radio-group>
</template>

<script type="text/ecmascript-6">

import '../assets/css/radio_lang.css'
import { languages } from '../config'

export default {
  name: 'select-language',
  props: ['language'],
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
