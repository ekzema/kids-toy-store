import MainApi from './mainApi'

class Users extends MainApi {
  constructor () {
    super('users')
  }

  info () {
    this.api.loader = false
    return this.api.query('get', `${this.url}/info`)
  }
}

export default new Users()
