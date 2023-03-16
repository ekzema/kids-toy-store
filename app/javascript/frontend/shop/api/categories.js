import MainApi from './mainApi'

class Categories extends MainApi {
    constructor() {
        super('categories')
    }
}

export default new Categories()
