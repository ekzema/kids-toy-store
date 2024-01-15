import store from '../store'

const user = () => store.getters.user
const cart = () => store.getters.cart
export const notLoggedIn =  function (to, from, next) {
    if (user()) {
        next({ name: 'ProductsIndex' })
    } else {
        next()
    }
}

export const login =  function (to, from, next) {
    if (user()) {
        next()
    } else {
        next({ name: 'AccountLogin' })
    }
}

export const isCart = function (to, from, next) {
    if (cart() === null || cart().length) {
        next()
    } else {
        next({ name: 'ProductsIndex' })
    }
}
