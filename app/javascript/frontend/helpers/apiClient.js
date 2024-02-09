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

    async query(method, url, payload = null, options = {}) {
        const res = await this.store
        const store = res.default
        const user = store.getters.user
        const footer = store.getters.footer
        if (user && user.access_token) {
            const expires_at = new Date(user.access_expires_at)
            if (new Date().getTime() > expires_at.getTime()) {
                store.dispatch('clearUser')
            } else {
                this.axios.defaults.headers.common['Authorization'] = user.access_token
            }
        }

        let timeoutID = setTimeout(() => {
            if (this.loader) store.dispatch('showLoader')
        }, 500)
        try {
            const response = await this.axios[method](url, payload)
            this.loader = this.defaultLoader

            return options['fullResponse'] ? response : response.data
        } catch (error) {
            if (error.response.status === 401) {
                store.dispatch('clearUser')
                window.location = '/'

                return
            }
            throw error
        } finally {
            clearTimeout(timeoutID)
            store.dispatch('hideLoader')
            if (!footer) store.dispatch('showFooter')
        }
    }
}

export default ApiClient
