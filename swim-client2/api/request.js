// api基地址
import Config from '@/config';
const {
	baseURL
} = Config


export default function request(params = {}) {
	/* 请求拦截 */
	return new Promise((resolve, reject) => {
		uni.request({
			url: baseURL + params.url,
			responseType: params.responseType || 'text',
			method: params.method || 'GET',
			sslVerify:false,
			data: {
				...params.data,
			},
			success: res => {
				console.log(res);
				resolve(res.data)

			},
			fail: (err) => {
				console.log('fail', err);
				uni.showToast({
					icon: 'none',
					title: '服务器开小差了,请稍后重试'
				})
				reject(err)
			},
			complete: () => {}
		});
	})
}
