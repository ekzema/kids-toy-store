import MainApi from './mainApi'

class Registrations extends MainApi {
    constructor() {
        super('registrations')
    }

    check_email(params) {
        this.api.loader = false
        return this.api.query('get', `${this.url}/check_email`, {params: {...params}})
    }

    confirmation(params) {
        this.api.loader = false
        return this.api.query('put', `${this.url}/confirmation`, {...params})
    }
}

export default new Registrations()
