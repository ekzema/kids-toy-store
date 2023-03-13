import MainApi from './mainApi'

class Sessions extends MainApi {
    constructor() {
        super('sessions')
    }
}

export default new Sessions()
