import MainApi from './mainApi'

class Passwords extends MainApi {
    constructor() {
        super('passwords')
    }
}

export default new Passwords()
