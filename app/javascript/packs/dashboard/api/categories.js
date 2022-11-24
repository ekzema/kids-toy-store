import MainApi from './mainApi'

class Categories extends MainApi {
    constructor() {
        super('categories')
    }

    parents(params) {
        this.api.loader = false
        return this.api.query('get', `${this.url}/parents`, {params: {...params}})
    }
}

export default new Categories()
