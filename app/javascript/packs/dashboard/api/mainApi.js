import apiClient from "../../helpers/apiClient"
import Api from "../../helpers/api"
import { baseUrl } from '../config'

class MainApi extends Api {
    constructor(resource) {
        super(resource)
        let store = import('../store') //store is defined only directly in the constructor
        this.api = new apiClient(store, baseUrl)
    }
}

export default MainApi
