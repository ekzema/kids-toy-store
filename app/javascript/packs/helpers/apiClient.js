import axios from 'axios'

class ApiClient {
    constructor(store, baseUrl) {
        this.defaultLoader = true
        this.loader = this.defaultLoader
        this.store = store

        this.axios = axios.create({
            baseURL: baseUrl
        })
    }

    async query(method, url, payload = null) {
        const res = await this.store
        const store = res.default

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
