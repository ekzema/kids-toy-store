class Api {
    constructor(resource) {
        this.url = resource
        this.api = null
    }

    get(params, options = {}) {
        return this.api.query('get', this.url, {params: {...params}}, options)
    }

    show(id, options = {}) {
        return this.api.query('get', `${this.url}/${id}`, null, options)
    }

    create(data, options = {}) {
        return this.api.query('post', this.url, data, options)
    }

    update(id, data, options = {}) {
        return this.api.query('put', `${this.url}/${id}`, data, options)
    }

    delete(id, options = {}) {
        return this.api.query('delete', `${this.url}/${id}`, null, options)
    }
}

export default Api
