import actions from './actions'
import getters from './getters'
import mutations from './mutations'
const state = {
  orders: {
    count: 0,
    items: []
  },
  order: {},
  detailConstructor: {}
}

export default {
  state,
  actions,
  getters,
  mutations
}
