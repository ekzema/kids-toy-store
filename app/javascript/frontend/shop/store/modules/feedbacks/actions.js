import Feedbacks from '../../../api/feedbacks'

const actions = {
  async createFeedbacks({ commit }, data) {
    try {
      await Feedbacks.create(data)
      commit('setSuccessMessage', 'CONTACT.FORM.SENT_SUCCESSFULLY')
    } catch (error) {
      commit('setErrorMessage')
    }
  }
}
export default actions
