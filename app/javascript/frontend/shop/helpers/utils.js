import Cart from "./cart"

export const cart = new Cart()
export const emailRegexTemplate = /^[a-z0-9]+@[a-z]+\.[a-z]{2,5}$/
export const emailRegex = new RegExp(emailRegexTemplate)
export const deserialize = str => JSON.parse(str)
export const serialize = obj => JSON.stringify(obj)
export const user = localStorage.user ? deserialize(localStorage.user) : null
export const toPhoneString = str => str ? str.replace(/[()-]/g, "") : null
