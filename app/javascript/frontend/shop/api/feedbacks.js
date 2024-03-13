import MainApi from './mainApi'

class Feedbacks extends MainApi {
  constructor() {
    super('feedbacks')
  }
}

export default new Feedbacks()
