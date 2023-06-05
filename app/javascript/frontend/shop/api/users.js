import MainApi from './mainApi'

class Users extends MainApi {
  constructor () {
    super('users')
  }

  info(params) {
    this.api.loader = false
    return this.api.query('get', `${this.url}/info`, { params: { ...params } })
  }
}

export default new Users()
