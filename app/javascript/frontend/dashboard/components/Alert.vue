<template>
  <div class="text-center ma-2" v-if="alert.show">
    <v-snackbar
        :timeout="5000"
        :model-value="true"
        :color="alert.type"
        @update:modelValue="hideAlert"
    >
      {{ alert.text }}
      <template v-slot:actions>
        <v-btn
            variant="text"
            @click="hideAlert"
        >
          Close
        </v-btn>
      </template>
    </v-snackbar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'alert',
  data: () => ({
  }),
  computed: {
    ...mapGetters([
      'alert'
    ]),
  },
  methods: {
    hideAlert() {
      this.$store.dispatch('resetAlert')
    }
  }
}
</script>
