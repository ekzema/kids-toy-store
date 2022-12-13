<template>
  <v-radio-group
      true-icon=""
      false-icon=""
      density="compact"
      v-model="language"
      row
      inline
      active-class="active"
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
  data: () => {
    return {
      languages: languages
    }
  },
  props: {
    defaultLang: {
      type: String,
      default: 'uk'
    },
    language: {
      type: String
    }
  },
  created () {
    this.language
  },
  watch: {
    language () {
      // this.$emit('lang-selected', this.language)
    }
  }
}
</script>
