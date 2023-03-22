import MainApi from './mainApi'

class Products extends MainApi {
    constructor() {
        super('products')
    }
}

export default new Products()
