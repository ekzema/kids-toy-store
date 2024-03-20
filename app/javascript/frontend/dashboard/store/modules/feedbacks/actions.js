import Feedbacks from '../../../api/feedbacks'

const actions = {
  async fetchFeedbacks({ commit }, params) {
    try {
      const { data, count } = await Feedbacks.get(params)
      commit('setFeedbacks', { items: data, count: count })
    } catch (error) {
      commit('setErrorMessage')
    }
  },
  async fetchFeedback({ commit }, id) {
    try {
      const { data } = await Feedbacks.show(id)
      commit('setFeedback', data)
    } catch (error) {
      commit('setErrorMessage')
    }
  },
  async updateFeedback({ commit }, data) {
    try {
      const response = await Feedbacks.update(data.id, data.form)
      commit('setFeedback', response.data)
      commit('setSuccessMessage', 'Feedback updated successfully')
    } catch (error) {
      commit('setErrorMessage')
    }
  },
  async deleteFeedback({ commit }, id) {
    try {
      await Feedbacks.delete(id)
      commit('setSuccessMessage', 'Feedback deleted successfully')
    } catch (error) {
      commit('setErrorMessage')
    }
  }
}

export default actions
