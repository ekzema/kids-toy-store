import Conversation from '../../../api/categories'

const actions = {
    async fetchCategories() {
        try {
            const response = await Conversation.get()
            const { data } = response
            return data
        } catch (error) {
            console.log(error,'test')
        }
    }
}

export default actions;
