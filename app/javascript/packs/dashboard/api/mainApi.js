import apiClient from "../helpers/apiClient";

class MainApi {
    constructor(resource) {
        this.url = resource
        this.api = new apiClient()
    }

    get() {
        return this.api.query('get', this.url)
    }

    show(id) {
        // return axios.get(`${this.url}/${id}`)
    }

    create(data) {
        return this.api.query('post', this.url, data)
    }

    update(id, data) {
        // return axios.patch(`${this.url}/${id}`, data)
    }

    delete(id) {
        // return axios.delete(`${this.url}/${id}`)
    }
}

export default MainApi;
