import ApiClient from './apiClient'

class Categories extends ApiClient {
    constructor() {
        super('categories')
    }
}

export default new Categories();
