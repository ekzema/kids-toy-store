import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
  orders:  {
    count: 0,
    items: []
  },
  order: {},
  parentCategories: []
}

export default {
  state,
  actions,
  mutations,
  getters
}
