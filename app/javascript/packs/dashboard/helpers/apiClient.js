import { baseUrl } from '../config'
import axios from 'axios'
import store from '../store'

class ApiClient {
    constructor(loader = true) {
        this.loader = loader
        this.axios = axios.create({
            baseURL: baseUrl
        })
    }

    async query(method, url, payload = null) {
        if (this.loader) store.dispatch('showLoader')

        const { data } = await this.axios[method](url, payload)
        if (this.loader) store.dispatch('hideLoader')

        return data
    }
}

export default ApiClient
