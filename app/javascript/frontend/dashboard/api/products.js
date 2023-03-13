import MainApi from './mainApi'

class Products extends MainApi {
    constructor() {
        super('products')
    }

    detailConstructor(params) {
        this.api.loader = false
        return this.api.query('get', `${this.url}/detail_constructor`, {params: {...params}})
    }
}

export default new Products()
