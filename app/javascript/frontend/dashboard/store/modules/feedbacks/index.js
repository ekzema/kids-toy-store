import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
  feedbacks:  {
    count: 0,
    items: []
  },
  feedback: {},
}

export default {
  state,
  actions,
  mutations,
  getters
}
