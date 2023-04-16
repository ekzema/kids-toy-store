import MainApi from './mainApi'

class Products extends MainApi {
    constructor() {
        super('products')
    }

    autocomplete(params) {
        this.api.loader = false
        return this.api.query('get', `${this.url}/autocomplete`, { params: { ...params } })
    }
}

export default new Products()
