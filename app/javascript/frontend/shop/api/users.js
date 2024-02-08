import MainApi from './mainApi'

class Users extends MainApi {
  constructor () {
    super('users')
  }

  info(params) {
    this.api.loader = false
    return this.api.query('get', `${this.url}/info`, { params: { ...params } })
  }

  updateAccount(data, options = {}) {
    return this.api.query('put', `${this.url}/update_account`, data, options)
  }

  changePassword(data, options = {}) {
    return this.api.query('put', `${this.url}/change_password`, data, options)
  }
}

export default new Users()
