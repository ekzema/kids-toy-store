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
      <td>{{ feedback.id }}</td>
      <td>{{ feedback.name }}</td>
      <td>{{ feedback.subject || ''}}</td>
      <td>{{ feedback.message }}</td>
      <td><v-icon icon="mdi-check" :color="feedback.moderation ? 'light-blue-darken-2' : 'grey'"></v-icon></td>
      <td class="d-flex justify-center">
        <v-btn
            icon
            variant="text"
            :to="{ name: 'FeedbacksEdit', params: { id: feedback.id }}"
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

  <pagination v-if="totalPages > 1"
              :page="page"
              :total-pages="totalPages"
              @pagination-event="paginationEvent"
  />

  <v-dialog v-model="dialog" max-width="400">
    <v-card>
      <v-card-text class="headline text-center">Are you sure you want to delete the feedback?</v-card-text>
      <v-card-actions class="justify-center">
        <v-btn color="primary" @click="onCancel">Cancel</v-btn>
        <v-btn color="red" @click="onDelete">Delete</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapGetters } from 'vuex'
import Pagination from '../../components/Pagination'
import { perPage } from '../../config'
import PaginationMixin from '../../mixins/paginationMixin'

export default {
  name: 'FeedbacksIndex',
  components: {
    Pagination
  },
  mixins: [PaginationMixin],
  data: () => ({
    dialog: false,
    selectFeedback: {},
    headers: [
      'ID',
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
    totalPages() {
      return Math.ceil(this.feedbacks.count / perPage)
    }
  },
  watch: {
    '$route.params'() {
      if (!this.$route.query.page) this.page = null
      this.fetchFeedbacks()
    }
  },
  created () {
    if (this.$route.query.page ) this.page = this.$route.query.page
    this.fetchFeedbacks()
  },
  methods: {
    showDialog() {
      this.dialog = true
    },
    hideDialog() {
      this.dialog = false
    },
    onCancel() {
      this.hideDialog()
    },
    async onDelete() {
      await this.deleteFeedback()
      this.fetchFeedbacks()
      this.hideDialog()
    },
    fetchFeedbacks() {
      const params = {}
      if (this.page) params.page = this.page

      this.$store.dispatch('fetchFeedbacks', params)
    },
    async handleDelete(feedback) {
      this.selectFeedback = feedback
      this.showDialog()
    },
    async deleteFeedback() {
      await this.$store.dispatch('deleteFeedback', this.selectFeedback.id)
    },
  },
}
</script>
