<template>
	<view class="contents">
		<view class="progress">
			<view>
				<text class="cuIcon-lightfill text-red"></text>
				<text class="text-red">进度:{{ activeIndex+1 }}/100</text>
			</view>
			<!-- <view>
				<text class="cuIcon-lightfill text-orange"></text>
				<text class="text-orange text-bold">成绩:{{ total }}</text>
			</view> -->
		</view>
		<qsa :data="current" @choose="choose" />

		<view class="padding flex flex-direction">
			<button class="cu-btn bg-red margin-tb-sm lg" @click="next">下一题</button>
			<view class="text-brown text-center prev-even" @click="prev">上一题</view>
		</view>

		<view class="flex">
			<view class="bg-white flex-sub radius shadow-lg">
				<image src="https://image.weilanwl.com/gif/rhomb-white.gif" mode="aspectFit" class="gif-white response" style="height:240upx"></image>
			</view>
		</view>

		<!-- 结束 -->
		<view class="cu-modal" :class="modalName=='overModal'?'show':''">

			<view class="cu-dialog">
				<view class="cu-bar bg-white justify-end">
					<view class="content">提示</view>
					<view class="action" @tap="hideModal">
						<text class="cuIcon-close text-red"></text>
					</view>
				</view>
				<view class="padding text-lg text-gray">
					所有题目已经全部完成
				</view>
				<view class="padding-xl text-cyan ">
					本次成绩为 {{ this.total }} 分
				</view>
				<view class="cu-bar bg-white justify-center">
					<view class="action">
						<button class="cu-btn bg-green margin-left" @tap="submit">确定</button>
					</view>
				</view>
			</view>
		</view>

		<!-- 空 -->
		<view class="cu-modal" :class="modalName=='nullModal'?'show':''">
			<view class="cu-dialog">
				<view class="cu-bar bg-white justify-end">
					<view class="content">提示</view>
					<view class="action" @tap="hideModal">
						<text class="cuIcon-close text-red"></text>
					</view>
				</view>
				<view class="padding-xl text-cyan ">
					请选择答案
				</view>
				<view class="cu-bar bg-white justify-center">
					<view class="action">
						<button class="cu-btn bg-green margin-left" @tap="hideModal">确定</button>
					</view>
				</view>
			</view>
		</view>

	</view>
</template>

<script>
	// import list from './data.js'
	import qsa from '../../component/qsa.vue'
	import Question from '../../api/question'
	import Exam from '../../api/exam'
	export default {
		components: {
			qsa
		},
		data() {
			return {
				list: [],
				current: {},
				activeIndex: 0,
				modalName: null,
				chooseVal: '',
				total: 0,
				isSubmit: false
			};
		},
		async created() {
			let list = await Question.getItems()
			this.list = list
			this.current = list[0]
		},
		methods: {
			RadioChange(e) {
				this.radio = e.detail.value
			},
			choose(val) {
				this.chooseVal = val
				this.list[this.activeIndex].myAnswer = val
			},
			next() {
				this.activeIndex++

				if (!this.list[this.activeIndex - 1].myAnswer) {
					this.modalName = 'nullModal'
					this.activeIndex--
					return
				}

				if (this.activeIndex >= this.list.length) {
					this.activeIndex = this.list.length - 1
					console.log('没有题目了');
					this.modalName = 'overModal'
					return
				}

				// 计算分数
				if (this.chooseVal === this.current.answer) {
					this.total += this.current.score
				}
				this.current = this.list[this.activeIndex]
				this.chooseVal = ''
				uni.pageScrollTo({
					scrollTop: 0
				})
			},
			prev() {
				this.activeIndex--
				if (this.activeIndex < 0) {
					this.activeIndex = 0
				}
				this.current = this.list[this.activeIndex]
			},
			hideModal(e) {
				this.modalName = null
			},
			async submit() {
				if (this.isSubmit) {
					this.hideModal()
					return
				}
				let phone = uni.getStorageSync('phone')
				let coach = uni.getStorageSync('coach')
				let data = {
					name: coach || 'king',
					phone: 13888888888,
					score: this.total,
					extend: JSON.stringify(this.list)
				}
				await Exam.createItem(data)
				this.isSubmit = true
				this.hideModal()

			},
			array2obj(array, key) {
				let result = array.reduce((accumulator, current) => {
					accumulator[current[key]] = current;
					return accumulator;
				}, {});
				return result
			}
		},
	}
</script>

<style lang="less" scoped>
	.contents {
		padding: 30rpx;
		font-size: 20px;
	}

	.progress {
		display: flex;
		justify-content: space-between;
		font-size: 18rpx;
	}

	.question-title {
		margin-top: 30rpx;
		margin-bottom: 30rpx;
	}

	.quesstion-ask-list {
		padding-top: 30rpx;
		display: block;
	}

	.list-item {
		display: flex;
		justify-content: space-between;
	}

	.prev-even {
		font-size: 24rpx;
		line-height: 46rpx;
	}
</style>
