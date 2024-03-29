class Cart {
  constructor() {
    this.cartKey = 'cart'
    this.maxCartSize = 1024 * 1024 // 1 MB
  }

  get() {
    return JSON.parse(localStorage.getItem(this.cartKey)) || []
  }

  set(cart) {
    localStorage.setItem(this.cartKey, JSON.stringify(cart))
  }

  add(item) {
    let cart = this.get()
    const itemInCart = cart.some(cartItem => cartItem.product_id === item.product_id)

    if (cart.length && itemInCart)
      return this.updateById(item.product_id, item.quantity)

    cart.push(item)
    const serializedCart = JSON.stringify(cart)
    if (serializedCart.length > this.maxCartSize) {
      // If the maximum size is reached, remove the oldest item
      cart.shift()
    }

    this.set(cart)
  }

  remove(index) {
    let cart = this.get()
    cart.splice(index, 1)

    this.set(cart)
  }

  reset() {
    this.set([])
  }

  update(index, newQuantity) {
    let cart = this.get()
    cart[index].quantity = newQuantity

    this.set(cart)
  }

  updateById(product_id, newQuantity) {
    let cart = this.get()
    const itemToUpdate = cart.find(item => item.product_id === product_id)

    if (itemToUpdate) {
      itemToUpdate.quantity += newQuantity
      this.set(cart)
    }
  }
}

export default Cart
