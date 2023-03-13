<template>
  <v-row class="ma-4">
    <v-col v-for="(value, index) in galleryPreviews" :key="index" class="wrapImg d-flex child-flex" cols="3">
      <v-img
          :src="value.blob ? value.blob : value.image.thumb.url"
          :lazy-src="lazyGallery"
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
      <v-btn
          icon
          variant="text"
          size="x-small"
          @click="removeImage(index)"
      >
        <v-icon color="pink">mdi-delete</v-icon>
      </v-btn>
    </v-col>
  </v-row>
  <v-file-input
      ref="gallery"
      @change="galleryOnChange"
      accept="image/*"
      variant="underlined"
      style="display: none"
  ></v-file-input>
  <div class="text-center">
    Add image
    <v-btn
        @click="triggerUpload('gallery')"
        icon
        size="x-small"
        color="primary"
    >
      <v-icon dark>
        mdi-panorama
      </v-icon>
    </v-btn>
  </div>
</template>

<script>
import UploadMixin from '../mixins/UploadMixin'

export default {
  name: 'gallery-uploader',
  mixins: [UploadMixin],
  data: () => ({
    lazyGallery: require('./../../../assets/img/lazy_image_160x80.jpg')
  }),
  props: {
    galleryPreviews: {
      type: Array
    }
  },
  created () {
  },
  methods: {
    async removeImage(index) {
      const image = this.galleryPreviews[index]
      if (image.id) await this.$store.dispatch('deleteProductImage', image.id)

      this.galleryPreviews.splice(index, 1)
    },
    galleryOnChange(event) {
      const image = this.fetchFile(event)
      this.galleryPreviews.push({
        origin: image,
        blob: this.preparePreview(image)
      })
    }
  }
}
</script>

<style scoped>
.wrapImg{
  position: relative;
}

.wrapImg:hover button {
  opacity: 1;
}

.wrapImg button {
  position: absolute;
  bottom: 10px;
  left: calc(50% - 20px);
  background-color: rgba(255,255,255, 0.6);
  opacity: 0;
  transition: .5s all;
  z-index: 999;
}
</style>
