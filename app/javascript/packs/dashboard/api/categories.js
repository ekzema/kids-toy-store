import MainApi from './mainApi'

class Categories extends MainApi {
    constructor() {
        super('categories')
    }

    parents() {
        return this.api.query('get', `${this.url}/parents`)
    }
}

export default new Categories();
