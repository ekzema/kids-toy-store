import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
    products: {
        count: 0,
        items: []
    },
    product: {},
    detailConstructor: {}
}

export default {
    state,
    actions,
    getters,
    mutations
}
