import MainApi from './mainApi'

class Categories extends MainApi {
    constructor() {
        super('categories')
    }

    parents(params) {
        return this.api.query('get', `${this.url}/parents`, {params: {...params}})
    }
}

export default new Categories();
