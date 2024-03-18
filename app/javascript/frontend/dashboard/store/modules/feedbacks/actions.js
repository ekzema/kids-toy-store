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
  async deleteFeedback({ commit }, id) {
    try {
      await Feedbacks.delete(id)
      commit('setSuccessMessage', 'Feedback deleted successfully')
    } catch (error) {
      commit('setErrorMessage')
    }
  },
}

export default actions
