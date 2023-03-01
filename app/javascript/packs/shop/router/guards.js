import store from '../store'

const user = () => store.getters.user
export const login =  function (to, from, next) {
    if (user()) {
        next({ name: 'HomeIndex' })
    } else {
        next()
    }
}
