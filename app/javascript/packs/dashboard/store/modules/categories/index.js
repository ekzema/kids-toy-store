import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
    categories: [],
    category: {},
    parentCategories: []
}

export default {
    state,
    actions,
    mutations,
    getters
}
