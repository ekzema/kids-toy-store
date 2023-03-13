import MainApi from './mainApi'

class Brands extends MainApi {
    constructor() {
        super('brands')
    }
}

export default new Brands()
