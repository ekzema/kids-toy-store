export const baseUrl = '/api/v1/admin'
export const languages = [{ code: 'ua', name: 'Українська' }, { code: 'ru', name: 'Русский' }]
export const user = localStorage.user ? JSON.parse(localStorage.user) : null
