import MainApi from './mainApi'

class Orders extends MainApi {
  constructor() {
    super('orders')
  }
}

export default new Orders()
