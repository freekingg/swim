import _axios from './request.js'

class Exam {

	async getItems(data) {
		return _axios({
			method: 'get',
			url: 'v1/exam',
			data,
		})
	}
	
	async getItem(id) {
	    const res = await get(`v1/exam/${id}`)
	    return res
	  }
	
	async createItem(data) {
	    return _axios({
	      method: 'post',
	      url: 'v1/exam',
	      data,
	    })
	  }
}

export default new Exam()
