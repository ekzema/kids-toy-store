<template>
  <v-img
      :src="preview ? preview : defaultLogo"
      @click="triggerUpload('logo')"
      max-height="200"
  >
    <template v-slot:placeholder>
      <v-row class="fill-height ma-0" align="center" justify="center">
        <v-progress-circular
            indeterminate
            color="grey lighten-5"
        ></v-progress-circular>
      </v-row>
    </template>
  </v-img>
  <v-file-input
      ref="logo"
      @change="logoOnChange"
      accept="image/*"
      label="Logo"
      variant="underlined"
      style="display: none"
  ></v-file-input>
</template>

<script>
export default {
  name: 'logo-uploader',
  data: () => ({
    defaultLogo: require('./../../../assets/img/logo_default.png')
  }),
  props: {
    logo: {
      type: [String, Object]
    },
    preview: {
      type: [String, Object]
    }
  },
  created () {
  },
  methods: {
    triggerUpload(input) {
      this.$refs[input].click()
    },
    logoOnChange(event) {
      const logo = this.fetchFile(event)
      const preview = logo ? this.preparePreview(logo) : ''

      this.$emit('update:logo', logo)
      this.$emit('update:preview', preview)
    },
    preparePreview(image) {
      return URL.createObjectURL(image)
    },
    fetchFile(event) {
      return event.target.files[0] && event.target.files[0].type.includes("image/")
          ? event.target.files[0]
          : ''
    }
  }
}
</script>
