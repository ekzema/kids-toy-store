import Sessions from '../../../api/sessions'

const actions = {
    async createSession({ commit }, data) {
        try {
            return await Sessions.create(data)
        } catch (error) {
            return error.response.data
        }
    }
}
export default actions
