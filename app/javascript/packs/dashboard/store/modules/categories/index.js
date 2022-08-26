import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
    loader: false,
    categories: [],
    prentCategories: []
}

export default {
    state,
    actions,
    mutations,
    getters
}
