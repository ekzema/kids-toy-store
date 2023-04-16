import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
    products: [],
    product: null,
    wishListCounter: 0,
    productsAutocomplete: []
}

export default {
    state,
    actions,
    getters,
    mutations,
}
