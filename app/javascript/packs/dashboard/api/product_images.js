import MainApi from './mainApi'

class ProductImages extends MainApi {
    constructor() {
        super('product_images')
    }
}

export default new ProductImages()
