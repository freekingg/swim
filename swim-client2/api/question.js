import _axios from './request.js'

class Question {

	async getItems(data) {
		return _axios({
			method: 'get',
			url: 'v1/question',
			data,
		})
	}
}

export default new Question()
