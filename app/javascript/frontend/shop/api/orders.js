import MainApi from './mainApi'

class Orders extends MainApi {
  constructor() {
    super('orders')
  }

  detailConstructor(params) {
    this.api.loader = false
    return this.api.query('get', `${this.url}/detail_constructor`, {params: {...params}})
  }
}

export default new Orders()
