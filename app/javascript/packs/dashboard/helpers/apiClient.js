import { baseUrl } from '../config'
import axios from 'axios'
import store from '../store'

class ApiClient {
    constructor() {
        this.defaultLoader = true
        this.loader = this.defaultLoader
        this.axios = axios.create({
            baseURL: baseUrl
        })
    }

    async query(method, url, payload = null) {
        let timeoutID = setTimeout(() => {
            if (this.loader) store.dispatch('showLoader')
        }, 100)
        try {
            const { data } = await this.axios[method](url, payload)
            this.loader = this.defaultLoader

            return data
        } finally {
            clearTimeout(timeoutID)
            store.dispatch('hideLoader')
        }
    }
}

export default ApiClient
