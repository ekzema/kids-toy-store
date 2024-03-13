import Feedbacks from '../../../api/feedbacks'

const actions = {
  async createFeedbacks({ commit }, data) {
    try {
      await Feedbacks.create(data)
      commit('setSuccessMessage', 'Your message has been sent')
    } catch (error) {
      commit('setErrorMessage')
    }
  }
}
export default actions
