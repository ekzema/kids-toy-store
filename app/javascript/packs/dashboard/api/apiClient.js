import { baseUrl } from '../config'
import axios from 'axios'

class ApiClient {
    constructor(resource) {
        this.url = `${baseUrl}/${resource}`
    }

    get() {
        return axios.get(this.url)
    }

    show(id) {
        return axios.get(`${this.url}/${id}`)
    }

    create(data) {
        return axios.post(this.url, data)
    }

    update(id, data) {
        return axios.patch(`${this.url}/${id}`, data)
    }

    delete(id) {
        return axios.delete(`${this.url}/${id}`)
    }
}

export default ApiClient;
