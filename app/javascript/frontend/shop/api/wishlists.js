import MainApi from './mainApi'

class Wishlists extends MainApi {
    constructor() {
        super('wishlists')
    }
}

export default new Wishlists()
