<template>
  <h1 class="text-center mb-3">Edit feedback</h1>
    <v-sheet
        border="md"
        class="pa-6 mx-auto"
    >
      <h4 class="text-h5 font-weight-bold mb-4">{{ feedback.subject }}</h4>
      <span class="mb-8"><strong>Name: </strong>{{ feedback.name }}</span><br>
      <span class="mb-8"><strong>Email: </strong>{{ feedback.email }}</span><br>
      <span class="mb-8"><strong>Message: </strong>{{ feedback.message }}</span>
      <div>
        <v-switch
            :model-value="feedback.moderation"
            color="primary"
            :label="feedback.moderation ? 'Mark unread' : 'Mark read'"
            @update:model-value="onModeration"
        ></v-switch>
      </div>
    </v-sheet>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'FeedbacksEdit',
  data: () => ({
  }),
  computed: {
    ...mapGetters([
        'feedback'
    ])
  },
  created () {
    this.fetchFeedback()
  },
  methods: {
    fetchFeedback() {
      this.$store.dispatch('fetchFeedback', this.$route.params.id)
    },
    onModeration(e) {
      const payload = { id: this.feedback.id, form: { moderation: e } }
      this.$store.dispatch('updateFeedback', payload)
    }
  }
}
</script>

<style scoped>
</style>
