<template>
	<view class="contents">
		<view class="text-area">
			<view class="main-title">
				<text class="text-white title">5</text>
				<text class="text-white middle-title">分钟</text>
			</view>
			<view class="sub-title">
				<text class="text-white title">测出你的真实水平</text>
			</view>
			<view class="list">
				<view class="item">
					<text class="cuIcon-discoverfill text-red"></text>
					<text class="text-white title">听说读写全方位专家诊断</text>
				</view>
				<view class="item">
					<text class="cuIcon-lightfill text-red"></text>
					<text class="text-white title">听说读写全方位专家诊断</text>
				</view>
				<view class="item">
					<text class="cuIcon-discoverfill text-red"></text>
					<text class="text-white title">根据测试结果私人定制学习方案</text>
				</view>
			</view>
		</view>
		<view class="padding flex flex-direction">
			<button class="cu-btn bg-red margin-tb-sm lg" @click="enter">开始测试</button>
			<view class="text-brown text-center" @click="routerExplain">风险说明</view>
		</view>

		<!-- 空 -->
		<view class="cu-modal" :class="modalName=='Modal'?'show':''">
			<view class="cu-dialog">
				<view class="cu-bar bg-white justify-end">
					<view class="content">提示</view>
					<view class="action" @tap="hideModal">
						<text class="cuIcon-close text-red"></text>
					</view>
				</view>
				<view class="padding text-cyan ">
					<view class="cu-form-group margin-top">
						<view class="title">手机号</view>
						<input placeholder="请输入手机号" v-model="phone" name="input"></input>
					</view>
					<view class="cu-form-group">
						<view class="title">教练</view>
						<input placeholder="请输入教练名称" v-model="coach" name="input"></input>
					</view>
					<view v-if="isNull" class="text-red padding">{{ errText }}</view>
				</view>
				<view class="cu-bar bg-white justify-center">
					<view class="action">
						<button class="cu-btn line-green text-green" @tap="hideModal">取消</button>
						<button class="cu-btn bg-green margin-left" @tap="submit">确定</button>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				isNull: false,
				errText: '',
				modalName: '',
				phone: '',
				coach: ''
			}
		},
		methods: {
			router() {
				uni.navigateTo({
					url: '../index/index'
				})
			},
			enter() {
				this.modalName = 'Modal'
			},
			submit() {
				if (!this.phone) {
					this.errText = '请正确输入手机号'
					this.isNull = true
					return
				} else if (this.coach !== 'rock') {
					this.errText = '请正确输入教练名称'
					this.isNull = true
					return
				} else {
					this.isNull = false
				}
				uni.setStorageSync('phone', this.phone)
				uni.setStorageSync('coach', this.coach)
				this.router()
			},
			hideModal(e) {
				this.modalName = null
			},
			routerExplain() {
				uni.navigateTo({
					url: '../explain/explain'
				})
			}
		}
	}
</script>

<style scoped>
	page {
		height: 100%;
	}

	.contents {
		background-image: url(../../static/index_bg.jpg);
		background-repeat: no-repeat;
		height: 100%;
		background-size: cover;
		padding: 30rpx;
		display: flex;
		flex-direction: column;
		justify-content: flex-end;
	}

	.text-area .title {
		font-size: 120rpx;
	}

	.text-area .middle-title {
		font-size: 40rpx;
		padding-left: 10rpx;
	}

	.sub-title .title {
		font-size: 38rpx;
		line-height: 128rpx;
	}

	.list .item {
		margin-bottom: 10rpx;
	}

	.list .item .title {
		font-size: 28rpx;
		padding-left: 12rpx;
	}
</style>
