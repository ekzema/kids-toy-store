<template>
  <div v-for="iteration in 20" :key="iteration" :class="{'col-lg-3': !sideBar, 'col-lg-4': sideBar}" class="col-lg-3 col-md-4 col-sm-6 wrap-item">
    <div class="product-item">
      <div class="product-thumb">
        <ContentLoader  height=200 width=200 primary-color="#eaeced" secondary-color="#ffffff">
          <rect width="200" height="200" />
        </ContentLoader>
      </div>
      <div class="product-info">
        <ContentLoader  height=150 width=200 primary-color="#eaeced" secondary-color="#ffffff">
          <rect width="100" height="15" />
          <rect y="40" width="200" height="15" />
          <rect y="65"  width="170" height="15" />
          <rect y="90"  width="140" height="15" />
          <rect y="120"  width="78" height="30" />
          <rect x="122" y="120" width="78" height="30" />
        </ContentLoader>
      </div>
    </div>
  </div>
</template>

<script>
import { ContentLoader } from 'vue-content-loader'

export default {
  name: 'ListLoader',
  components: { ContentLoader },
  props: ['sideBar']
}
</script>

<style scoped>
.product-info {
  margin-left: 4px;
}
</style>
