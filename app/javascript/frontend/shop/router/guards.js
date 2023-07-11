import store from '../store'

const user = () => store.getters.user
const cart = () => store.getters.cart
export const login =  function (to, from, next) {
    if (user()) {
        next({ name: 'ProductsIndex' })
    } else {
        next()
    }
}

export const isCart = function (to, from, next) {
    if (cart().length) {
        next()
    } else {
        next({ name: 'ProductsIndex' })
    }
}
