import MainApi from './mainApi'

class LineItems extends MainApi {
  constructor() {
    super('line_items')
  }

  update(id, data, options = {}) {
    this.api.loader = false
    return this.api.query('put', `${this.url}/${id}`, data, options)
  }
}

export default new LineItems()
