<template>
  <div v-if="alert.show" class="text-center ma-2">
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
  name: 'DashboardAlert',
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
