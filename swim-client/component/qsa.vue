<template>
	<view class="content">
		<view class="question-title">
			<text class="title text-black text-bold">{{ data.title }}</text>
		</view>
		<radio-group class="quesstion-ask-list" @change="RadioChange">
			<view @click="choose(item.key)" class="list-item bg-gray padding radius margin-tb-sm" v-for="(item,index) in data.choose" :key="index">
				<view>
					<text class="sub text-bold">{{ item.key }}. </text> <text class="title "> {{ item.summary }}</text>
				</view>
				<view>
					<radio class='red margin-left-sm'  :class="radio==item.key?'checked':''"  :checked="radio==item.key?true:false" :value="item.key"></radio>
				</view>
			</view>
		</radio-group>
	</view>
</template>

<script>
	export default {
		props:['data'],
		data() {
			return {
				radio: this.data.myAnswer,
			};
		},
		watch: {
			data(newValue, oldValue) {
				this.radio = this.data.myAnswer
			}
		},
		methods: {
			RadioChange(e) {
				this.radio = e.detail.value
			},
			choose(key){
				this.radio = key
				this.$emit('choose',key)
			},
			router(){
				uni.navigateTo({
					url:'../question/question'
				})
			}
		},
	}
</script>

<style lang="less" scoped>
.content{
	padding: 30rpx;
	font-size: 20px;
}
.progress{
	display: flex;
	justify-content: flex-end;
	font-size: 16rpx;
}
.question-title{
	margin-top: 30rpx;
	margin-bottom: 30rpx;
}
.quesstion-ask-list{
	padding-top: 30rpx;
	display: block;
	font-size: 34rpx;
}
.quesstion-ask-list .title{
	font-size: 30rpx;
	padding-left: 6rpx;
}
.list-item{
	display: flex;
	justify-content: space-between;
}
.margin-left-sm{
	opacity: 0;
}
.checked{
	opacity: 1;
}

</style>
