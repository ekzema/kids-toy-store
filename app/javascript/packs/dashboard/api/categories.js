import ApiClient from './apiClient'
import axios from 'axios'

class Categories extends ApiClient {
    constructor() {
        super('categories')
    }

    async parents() {
        const { data } = await axios.get(`${this.url}/parents`)
        return data
    }
}

export default new Categories();
