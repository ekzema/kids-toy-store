import MainApi from './mainApi'

class LineItems extends MainApi {
  constructor() {
    super('line_items')
  }
}

export default new LineItems()
