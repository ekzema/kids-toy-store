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
        try {
            if (this.loader) store.dispatch('showLoader')
            const { data } = await this.axios[method](url, payload)

            return data
        } finally {
            if (this.loader) store.dispatch('hideLoader')
        }
    }
}

export default ApiClient
