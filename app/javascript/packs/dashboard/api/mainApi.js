import apiClient from "../helpers/apiClient";

class MainApi {
    constructor(resource) {
        this.url = resource
        this.api = new apiClient()
    }

    get(params) {
        return this.api.query('get', this.url, {params: {...params}})
    }

    show(id) {
        return this.api.query('get', `${this.url}/${id}`)
    }

    create(data) {
        return this.api.query('post', this.url, data)
    }

    update(id, data) {
        return this.api.query('put', `${this.url}/${id}`, data)
    }

    delete(id) {
        return this.api.query('delete', `${this.url}/${id}`)
    }
}

export default MainApi
