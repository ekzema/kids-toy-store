<template>
  <v-table class="tr-odd elevation-4">
    <thead>
    <tr>
      <th v-for="(header, index) in headers"
          :key="index"
          class="text-left">
        {{ header }}
      </th>
    </tr>
    </thead>
    <tbody>
    <tr
        v-for="(feedback, index) in feedbacks.items"
        :key="index"
    >
      <td>{{ feedback.name }}</td>
      <td>{{ feedback.subject || ''}}</td>
      <td>{{ feedback.message }}</td>
      <td>{{ feedback.moderation }}</td>
      <td class="d-flex justify-center">
        <v-btn
            icon
            variant="text"
            :to="'/dashboard/categories/edit/' + feedback.id"
        >
          <v-icon color="teal">mdi-pencil</v-icon>
        </v-btn>
        <v-btn
            icon
            variant="text"
            @click="handleDelete(feedback)">
          <v-icon color="pink">mdi-delete</v-icon>
        </v-btn>
      </td>
    </tr>
    </tbody>
  </v-table>

  <v-dialog v-model="dialog" max-width="400">
    <v-card>
      <v-card-text class="headline text-center">Delete <strong>{{ selectCategory.name[language] }}</strong> category?</v-card-text>
      <v-card-actions class="justify-center">
        <v-btn color="primary" @click="onCancel">Cancel</v-btn>
        <v-btn color="red" @click="onDelete">Delete</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'FeedbacksIndex',
  components: {
  },
  data: () => ({
    headers: [
      'Name',
      'Subject',
      'Message',
      'Moderation',
      ''
    ]
  }),
  computed: {
    ...mapGetters([
        'feedbacks'
    ]),
  },
  created () {
    this.fetchFeedbacks()
  },
  methods: {
    fetchFeedbacks() {
      const params = {}

      this.$store.dispatch('fetchFeedbacks', params)
    },
    handleDelete(feedback) {
      console.log('delete', feedback)
    },
  },
}
</script>
