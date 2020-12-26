<template>
	<view>
		<view id="top-box" class="cu-bar bg-white solid-bottom">
			<view class="action text-black">
				<text v-if="currentType===1">判断题</text>
				<text v-else-if="currentType===2">单选题</text>
				<text v-else-if="currentType===3">多选题</text>
				<text v-else-if="currentType===4">填空题</text>
				<text v-else-if="currentType===5">问答题</text>
			</view>
			<view class="action">
				<button class="cu-btn bg-green shadow" @tap="showCardModal" data-target="modalCard">答题卡</button>
			</view>
		</view>
		<view class="cu-modal" :class="modalCard=='modalCard'?'show':''" @tap="hideCardModal">
			<view class="cu-dialog" @tap.stop>

				<scroll-view class="page padding" :scroll-y=true :style="{'height':swiperHeight}">
					<view class="cu-bar solid-bottom">
						<view class="action">
							<text class="cuIcon-title text-red"></text>答题卡
						</view>
					</view>
					<view class="grid col-5 ">
						<view class="margin-tb-sm text-center" v-for="(subject,index) in subjectList" :key="index">
							<button class="cu-btn round" :class="[subject.userAnswer.length===0?'line-grey':'bg-red']" @click="AppointedSubject(index)">{{index+1}}</button>
						</view>
					</view>

				</scroll-view>
			</view>
		</view>
		<view class="cu-modal padding " :class="modalError=='modalError'?'show':''" @tap="hideErrorModal">
			<view class="cu-dialog bg-white" @tap.stop>

				<view class="cu-bar solid-bottom ">
					<view class="action">
						<text class="cuIcon-title text-red"></text>试题纠错
					</view>
				</view>

				<radio-group class="block">
					<view class="cu-list menu text-left">
						<view class="cu-item cu-item-error" v-for="error in errorList">
							<radio :value="error"></radio>
							<view class="title text-black margin-left">{{error}}</view>
						</view>
					</view>
				</radio-group>

				<view class="padding flex flex-direction ">
					<button class="cu-btn bg-red margin-tb-sm lg" @click="SubmitError">提 交</button>
				</view>
			</view>
		</view>
		<form>
			<swiper :current="subjectIndex" class="swiper-box" @change="SwiperChange" :style="{'height':swiperHeight}">
				<swiper-item v-for="(subject,index) in subjectList">

					<view v-if="index-subjectIndex>=-1&&index-subjectIndex<=1">

						<view class="cu-bar bg-white solid-bottom">
							<view class="action text-black">
								<text class="cuIcon-title text-red"></text>{{subject.title}}
							</view>
						</view>
						<view>

							<radio-group class="block" @change="RadioboxChange" v-if="subject.type===1||subject.type===2">
								<view class="cu-form-group" v-for="option in subject.optionList">
									<radio :value="option.id" :checked="subject.userAnswer.indexOf(option.id) > -1?true:false"></radio>
									<view class="title text-black">{{option.id}}.{{option.content}}</view>
								</view>
							</radio-group>

							<checkbox-group class="block" @change="CheckboxChange" v-else-if="subject.type===3">
								<view class="cu-form-group" v-for="option in subject.optionList">
									<checkbox :value="option.id" :class="subject.userAnswer.indexOf(option.id) > -1?'checked':''" :checked="subject.userAnswer.indexOf(option.id) > -1?true:false"></checkbox>
									<view class="title  text-black">{{option.id}}.{{option.content}}</view>
								</view>
							</checkbox-group>

							<view v-else-if="subject.type===4">
								<view class="cu-form-group solid-bottom">
									<view class="title  text-black">
										答：
									</view>
									<input placeholder="文本输入框" name="input" v-model="subject.userAnswer" @blur="textInput"></input>
								</view>
							</view>

							<view v-else-if="subject.type===5">
								<view class="cu-bar cu-bar-title bg-white margin-top">
									<view class="action  text-black">
										答：
									</view>
								</view>
								<view class="cu-form-group solid margin">
									<textarea maxlength="-1" @blur="textInput" v-model="subject.userAnswer" placeholder="多行文本输入框"></textarea>
								</view>
							</view>

						</view>

						<view v-show="subject.showAnswer" class="margin-top solid-top">
							<view class="cu-bar">
								<view class="action  text-grey">
									<text>正确答案：</text>
									<text class="solid-bottom  padding-left text-green">{{subject.answer}}</text>
								</view>
							</view>
							<view class="cu-bar cu-bar-title">
								<view class="action  text-grey">
									<text>解析：</text>
								</view>
							</view>
							<view class="text-content padding  text-grey">
								{{subject.explain}}
							</view>
						</view>

					</view>
				</swiper-item>
			</swiper>
		</form>
		<view id="foot-box" class="cu-bar tabbar bg-white shadow foot">
			<view class="action" @click="MoveSubject(-1)">
				<view class="cuIcon-cu-image">
					<text class="lg cuIcon-back text-gray"></text>
				</view>
				<view class="text-gray">上一题</view>
			</view>
			<view class="action" @click="MoveSubject(1)">
				<view class="cuIcon-cu-image">
					<text class="lg text-gray cuIcon-right"></text>
				</view>
				<view class="text-gray">下一题</view>
			</view>

			<view class="action" @click="submitSubject">
				<view class="cuIcon-cu-image">
					<text class="lg cuIcon-warn" :class="[readySubject.length==5?'text-red':'text-gray']"></text>
				</view>
				<view :class="[readySubject.length==50?'text-red':'text-gray']">交卷</view>
			</view>

			<!-- 

			<view class="action" @click="ShowAnswerChange">
				<view class="cuIcon-cu-image">
					<text class="lg text-gray cuIcon-question"></text>
				</view>
				<view class="text-gray">解答</view>
			</view>
			<view class="action" @tap="showErrorModal" data-target="modalError">
				<view class="cuIcon-cu-image">
					<text class="lg text-gray cuIcon-warn"></text>
				</view>
				<view class="text-gray">纠错</view>
			</view> -->

		</view>

	</view>
</template>

<script>
	import Exam from '../../api/exam'
	export default {
		data() {
			return {
				userFavor: false, //是否已收藏
				currentType: 0, //当前题型
				subjectIndex: 0, //跳转索引
				autoShowAnswer: false, //答错是否显答案
				autoRadioNext: true, //判断题、单项题，自动移下一题
				swiperHeight: '800px', //
				title: '潜水员期末考卷',
				subjectList: [{
						"title": "1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "下沉."
						}, {
							"id": "B",
							"content": "浮起来或沉下去."
						}, {
							"id": "C",
							"content": " 不动."
						}, {
							"id": "D",
							"content": "上浮."
						}],
						"answer": "D",
						"userAnswer": "",
					},
					{
						"title": "2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "气球会变大, 气球里面的空气密度会变小(分子间的距离变大)."
						}, {
							"id": "B",
							"content": "交流"
						}, {
							"id": "C",
							"content": "直流和交流"
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "减为水面时的一半."
						}, {
							"id": "B",
							"content": "不变."
						}, {
							"id": "C",
							"content": "减为水面时的1/3."
						}, {
							"id": "D",
							"content": "减为水面时的2/3."
						}],
						"answer": "A",
						"userAnswer": "",
					}, {
						"title": "4. 无法平衡身体内的空腔, 可能是因为你 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "晕船."
						}, {
							"id": "B",
							"content": "有心脏病和高血压."
						}, {
							"id": "C",
							"content": "感冒, 过敏或其他呼吸上的疾病."
						}, {
							"id": "D",
							"content": "感到焦虑."
						}],
						"answer": "C",
						"userAnswer": "",
					}, {
						"title": "5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "你的空腔平衡好了."
						}, {
							"id": "B",
							"content": "你的面镜带太紧."
						}, {
							"id": "C",
							"content": "你觉得被挤压, 需要平衡."
						}, {
							"id": "D",
							"content": "你的面镜太小."
						}],
						"answer": "C",
						"userAnswer": "",
					}, {
						"title": "6. 放置备用气源的最佳位置是 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "在身旁吊着, 这样能够很快找到."
						}, {
							"id": "B",
							"content": "下巴和肋骨两端所形成的三角区域."
						}, {
							"id": "C",
							"content": "气瓶的底部.."
						}, {
							"id": "D",
							"content": "BCD的后面, 落在肩胛骨和腰线之间.."
						}],
						"answer": "C",
						"userAnswer": "",
					}, {
						"title": "7. 造成肺部扩张伤害可能的原因为 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "潜水时没有潜伴同行."
						}, {
							"id": "B",
							"content": "没穿戴正确的配重就继续潜水."
						}, {
							"id": "C",
							"content": "潜水前没喝足够的水."
						}, {
							"id": "D",
							"content": "潜水时憋气."
						}],
						"answer": "D",
						"userAnswer": "",
					}, {
						"title": "8. 假设一个气瓶的供气量, 可以让你在水面正常呼吸60分钟, 那么, 使用同一只气瓶, 可以让你在水深20公尺/ 66英尺的地方, 正常呼吸多久?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60分钟."
						}, {
							"id": "B",
							"content": "20分钟."
						}, {
							"id": "C",
							"content": "15分钟."
						}, {
							"id": "D",
							"content": "12分钟."
						}],
						"answer": "B",
						"userAnswer": "",
					}, {
						"title": "9. 水肺气瓶应该多久送到潜水中心做目测检查一次?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "每一年一次."
						}, {
							"id": "B",
							"content": "每二年一次."
						}, {
							"id": "C",
							"content": "每半年一次."
						}, {
							"id": "D",
							"content": "每五年一次."
						}],
						"answer": "A",
						"userAnswer": "",
					}, {
						"title": "10. YOKE气瓶阀和DIN气瓶阀有何不同?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "DIN气瓶阀是以耐用的塑料制成."
						}, {
							"id": "B",
							"content": "DIN气瓶阀上有一个弹簧式的阀门, 气瓶压力会使整个阀门保持在打开的状态."
						}, {
							"id": "C",
							"content": "DIN气瓶阀上有个O型的气密垫圈."
						}, {
							"id": "D",
							"content": "DIN气瓶阀上有一个固定调节器的螺旋钮."
						}],
						"answer": "D",
						"userAnswer": "",
					}, {
						"title": "11. 以下何者是正确的水肺气瓶保养法?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "气瓶每年要研磨抛光和上漆."
						}, {
							"id": "B",
							"content": "放在阳光下暴晒."
						}, {
							"id": "C",
							"content": "不要将气瓶内的空气完全用完."
						}, {
							"id": "D",
							"content": "每个月做气瓶压力测试."
						}],
						"answer": "C",
						"userAnswer": "",
					}, {
						"title": "12. 右图为一组调节器, 每个调节器的部位旁边都有一个数字, 请将这些数字填写在它额名称旁边---数字 _____ BCD的低压充气管.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "4 5 2 1 3"
						}, {
							"id": "B",
							"content": "4 5 2 1 2"
						}, {
							"id": "C",
							"content": "3 4 2 1 5"
						}, {
							"id": "D",
							"content": "1 2 3 4 5"
						}],
						"answer": "A",
						"userAnswer": "",
					}, {
						"title": "13. 同样的物体, 在水中看, 通常比在陆地上(水面上) 看来的 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "大 / 近."
						}, {
							"id": "B",
							"content": "大 / 远."
						}, {
							"id": "C",
							"content": "小 / 远."
						}, {
							"id": "D",
							"content": "小 / 近."
						}],
						"answer": "A",
						"userAnswer": "",
					}, {
						"title": "14. _____ 在水中行进的速度比在空气中快, 这就是为什么你无法辨别其来源的原因.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "光线."
						}, {
							"id": "B",
							"content": "水流."
						}, {
							"id": "C",
							"content": "水中生物."
						}, {
							"id": "D",
							"content": "声音."
						}],
						"answer": "D",
						"userAnswer": "",
					}, {
						"title": "15. 除非法规另有其他规定, 否则我应该待在距离潜水旗 _____ 的范围内.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60公尺 / 200英尺."
						}, {
							"id": "B",
							"content": "30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "15公尺 / 50英尺."
						}, {
							"id": "D",
							"content": "5公尺 / 15英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "16.  如果你在水底因为太过费力而感到呼吸困难, 应该 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "将BCD充气."
						}, {
							"id": "B",
							"content": "停止所有活动并休息, 可以的话,  用手扶着某个物体作为支撑."
						}, {
							"id": "C",
							"content": "马上游向潜伴, 做出求救的手势."
						}, {
							"id": "D",
							"content": "进行有控制式紧急游泳上升(CESA - 游泳上升, 发出 [啊…….] 的声音)."
						}],
						"answer": "B",
						"userAnswer": "",
					},
					{
						"title": "17. 当你下潜到水底时, 身上的湿式潜水衣会 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "因为水压而变得紧实(密度变小), 下潜越深, 你的浮力和保暖度越小."
						}, {
							"id": "B",
							"content": "因为水压而变得膨胀(密度变大), 下潜越深, 你的浮力和保暖度越大."
						}, {
							"id": "C",
							"content": "密度维持不变, 浮力和保暖度也不会随深度而改变."
						}, {
							"id": "D",
							"content": "因为水压而变得膨胀(密度变大), 下潜越深, 你的浮力和保暖度越小."
						}],
						"answer": "A",
						"userAnswer": "",
					},
					{
						"title": "18. 如何检查自己的配重是否适当?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "将BCD充入一半空气, 保持正常呼吸, 这时, 水线会在你颈部高度."
						}, {
							"id": "B",
							"content": "将BCD里的空气排光, 保持正常呼吸, 这时, 你会慢慢下沉."
						}, {
							"id": "C",
							"content": "将BCD里的空气排光, 保持正常呼吸, 这时, 水面与你的眼睛齐高(在眼睛的位置)."
						}, {
							"id": "D",
							"content": "将BCD充入部分空气, 这时, 你会很容易下沉."
						}],
						"answer": "",
						"userAnswer": "",
					},
					{
						"title": "19.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60公尺 / 200英尺."
						}, {
							"id": "B",
							"content": "30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "15公尺 / 50英尺."
						}, {
							"id": "D",
							"content": "5公尺 / 15英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "20.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60公尺 / 200英尺."
						}, {
							"id": "B",
							"content": "30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "15公尺 / 50英尺."
						}, {
							"id": "D",
							"content": "5公尺 / 15英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "21.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60公尺 / 200英尺."
						}, {
							"id": "B",
							"content": "30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "15公尺 / 50英尺."
						}, {
							"id": "D",
							"content": "5公尺 / 15英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "22.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60公尺 / 200英尺."
						}, {
							"id": "B",
							"content": "30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "15公尺 / 50英尺."
						}, {
							"id": "D",
							"content": "5公尺 / 15英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "23.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60公尺 / 200英尺."
						}, {
							"id": "B",
							"content": "30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "15公尺 / 50英尺."
						}, {
							"id": "D",
							"content": "5公尺 / 15英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "24.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60公尺 / 200英尺."
						}, {
							"id": "B",
							"content": "30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "15公尺 / 50英尺."
						}, {
							"id": "D",
							"content": "5公尺 / 15英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "25.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60公尺 / 200英尺."
						}, {
							"id": "B",
							"content": "30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "15公尺 / 50英尺."
						}, {
							"id": "D",
							"content": "5公尺 / 15英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "26.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "60公尺 / 200英尺."
						}, {
							"id": "B",
							"content": "30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "15公尺 / 50英尺."
						}, {
							"id": "D",
							"content": "5公尺 / 15英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "27. 如果你和潜伴在水底分散了, 这时通常该怎么做?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "立即上升到水面, 等一分钟, 然后再回到水底."
						}, {
							"id": "B",
							"content": "在水底寻找一分钟, 然后上升到水面和潜伴会合."
						}, {
							"id": "C",
							"content": "立即上升到水面. 然后出水."
						}, {
							"id": "D",
							"content": "寻找潜伴的气泡, 循着气泡找寻潜伴.."
						}],
						"answer": "B",
						"userAnswer": "",
					},
					{
						"title": "28. _____最有可能分不清上下方向.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "在水面."
						}, {
							"id": "B",
							"content": "靠近水底."
						}, {
							"id": "C",
							"content": "在水底."
						}, {
							"id": "D",
							"content": "在半水中."
						}],
						"answer": "D",
						"userAnswer": "",
					},
					{
						"title": "29. 假设你在开始潜水时, 感觉到一股温和的水流, 这时, 应该如何开始潜水?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": " 顺流而游."
						}, {
							"id": "B",
							"content": "穿越水流."
						}, {
							"id": "C",
							"content": "逆流而游."
						}, {
							"id": "D",
							"content": "与水流成斜角."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "30. 水底结构对下列何者的影响最大.",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "能见度(在水底能看到多远)."
						}, {
							"id": "B",
							"content": "温度(水温是多少)."
						}, {
							"id": "C",
							"content": "水流(水的流动)."
						}, {
							"id": "D",
							"content": "浮力(潜水员会上浮或下沉)."
						}],
						"answer": "A",
						"userAnswer": "",
					},
					{
						"title": "31. 潜水员之所以会被水中生物攻击或伤害, 大都是因为 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "动物饿了."
						}, {
							"id": "B",
							"content": "动物好奇."
						}, {
							"id": "C",
							"content": "动物受伤了."
						}, {
							"id": "D",
							"content": "动物要保护自己."
						}],
						"answer": "D",
						"userAnswer": "",
					},
					{
						"title": "32. 在水面有异味潜水员的动作快读急促, 面镜不在脸上, 调节器/呼吸管也不在口中, 而且对于指示没有任何反应, 这位潜水员 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "在比 [ OK ] 的手势."
						}, {
							"id": "B",
							"content": "正进行下水前安全检查."
						}, {
							"id": "C",
							"content": "很兴奋要去潜水."
						}, {
							"id": "D",
							"content": "遇到麻烦了."
						}],
						"answer": "D",
						"userAnswer": "",
					},
					{
						"title": "33. 万一潜水时你的空气用完, 正好潜伴就在附近, 这时你应该采取什么行动?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "使用潜伴的备用气源."
						}, {
							"id": "B",
							"content": "采用有控制式紧急游泳上升 (游泳上升, 同时发出 [啊……] 声音)."
						}, {
							"id": "C",
							"content": "采用紧急浮力上升 (丢掉配重系统)."
						}, {
							"id": "D",
							"content": "使用潜伴的备用气源然后继续完成该次潜水."
						}],
						"answer": "A",
						"userAnswer": "",
					},
					{
						"title": "34. 在水底你的调节器开始不断漏气, 你应该 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "采用有控制式紧急游泳上升."
						}, {
							"id": "B",
							"content": "不理会."
						}, {
							"id": "C",
							"content": "咬着调节器, 嘴唇不要封住咬嘴, 上升时, [ 小口吸取 ] 你所需要的空气."
						}, {
							"id": "D",
							"content": "采用紧急浮力上升"
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "35. 潜水时, 假设你的空气剩很少, 几乎快用完了, 你要怎么办?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "4 3 1 2."
						}, {
							"id": "B",
							"content": "1 2 3 4."
						}, {
							"id": "C",
							"content": "4 3 2 1."
						}, {
							"id": "D",
							"content": "1 4 2 3."
						}],
						"answer": " A",
						"userAnswer": "",
					},
					{
						"title": "36. 假设你在岸边发现了一位没有反应的受伤潜水员, 这时, 你首先应该 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "确定他有没有呼吸."
						}, {
							"id": "B",
							"content": "帮他取暖."
						}, {
							"id": "C",
							"content": "判断到底发生什么事."
						}, {
							"id": "D",
							"content": "让他呼吸氧气."
						}],
						"answer": "A",
						"userAnswer": "",
					},
					{
						"title": "37. 你应该将气瓶送到有信誉的潜水中心充气, 不要使用有异味或气味差的空气, 也不要拿灌车胎专用的压缩机来填充气瓶空气, 这么做是为了 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "减少气体氮醉的风险."
						}, {
							"id": "B",
							"content": " 增加潜水的乐趣."
						}, {
							"id": "C",
							"content": "减少肺部扩张伤害的风险."
						}, {
							"id": "D",
							"content": "避免呼吸到受污染的空气."
						}],
						"answer": "D",
						"userAnswer": "",
					},
					{
						"title": "38. 在水底由于气体麻醉表现出愚蠢行为的潜水员, 要怎么处理才能恢复正常?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "上升到较浅的深度."
						}, {
							"id": "B",
							"content": "慢而深地呼吸."
						}, {
							"id": "C",
							"content": "向潜伴做手势求救."
						}, {
							"id": "D",
							"content": "在免停留极限内潜水."
						}],
						"answer": "A",
						"userAnswer": "",
					},
					{
						"title": "39. 下列何种行为可能会提高罹患减压病(DCS)的风险?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "在能见度差, 水流强劲且狂风暴雨的海中潜水."
						}, {
							"id": "B",
							"content": "在疲累, 寒冷, 生病, 口渴或受伤的状态下潜水."
						}, {
							"id": "C",
							"content": "没有保养潜水装备."
						}, {
							"id": "D",
							"content": "使用潜水电脑表潜水."
						}],
						"answer": "B",
						"userAnswer": "",
					},
					{
						"title": "40. 如果你觉得自己罹患了减压病(DCS), 这时应该 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "停止潜水, 等好一点再说."
						}, {
							"id": "B",
							"content": "回到水里"
						}, {
							"id": "C",
							"content": "呼吸 100% 纯氧, 联络紧急医疗单位."
						}, {
							"id": "D",
							"content": "有空再去看医生."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "41. 使用电脑表的第一步是 _____ ?",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "设定时间日期."
						}, {
							"id": "B",
							"content": "阅读制造商的使用说明."
						}, {
							"id": "C",
							"content": "校准为适用于高氧空气."
						}, {
							"id": "D",
							"content": "设定为淡水或海水."
						}],
						"answer": "B",
						"userAnswer": "",
					},
					{
						"title": "42. 在使用电脑表计划潜水时, 你会用[ 计划 ]模式或[ NDL卷轴 ]模式来判断 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "前一趟潜水的最大深度."
						}, {
							"id": "B",
							"content": "不同深度的免停留极限 ( 通常以 3公尺 / 10英尺进位 )."
						}, {
							"id": "C",
							"content": "你的电脑表是否与潜伴的电脑表相容."
						}, {
							"id": "D",
							"content": "备用电脑表的最佳设定."
						}],
						"answer": "B",
						"userAnswer": "",
					},
					{
						"title": "43. 在使用电脑表潜水时 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "每位潜水员需要使用各自的电脑表."
						}, {
							"id": "B",
							"content": " 每组潜伴 ( 俩人一组 ) 需要一只电脑表."
						}, {
							"id": "C",
							"content": "最多四位潜水员可以共用一只电脑表."
						}, {
							"id": "D",
							"content": "所有潜水员都可以根据潜水员向导的电脑表来潜水."
						}],
						"answer": "A",
						"userAnswer": "",
					},
					{
						"title": "44. 两次潜水中的间隔时间不要关上电脑表, 这点很重要的原因是 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "潜水长会反对, 因为你会记不得上次的潜水资料"
						}, {
							"id": "B",
							"content": "这样会失去前一趟潜水的记录, 无法正确计算重复潜水."
						}, {
							"id": "C",
							"content": "这样会无法开机, 或是需要很久的时间才能开机."
						}, {
							"id": "D",
							"content": "这样对电池很不好, 可能会造成电脑表故障."
						}],
						"answer": "B",
						"userAnswer": "",
					},
					{
						"title": "45. 万一你不小心超出电脑表的免停留极限, 这时应该 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "在 5公尺 / 15英尺 处执行三分钟的安全停留."
						}, {
							"id": "B",
							"content": "根据电脑表的指示减压."
						}, {
							"id": "C",
							"content": "立刻上升到水面, 呼吸氧气, 把这个情况报告给潜水长."
						}, {
							"id": "D",
							"content": "进行有控制式的上升后, 再根据制造商说明书的内容执行减压程序."
						}],
						"answer": "B",
						"userAnswer": "",
					},
					{
						"title": "46. 如果你在寒冷水域中或是激烈的情况下潜水:",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "要额外注意安全, 并且确实维持在电脑表的极限内."
						}, {
							"id": "B",
							"content": "氮气吸收量会减慢, 因此可以在水中停留久一点."
						}, {
							"id": "C",
							"content": "你的电脑表可能会完全失灵."
						}, {
							"id": "D",
							"content": "不需要特别做什么事."
						}],
						"answer": "A",
						"userAnswer": "",
					},
					{
						"title": "47. 如果你的电脑表在潜水途中故障, 这时可以用你的备用电脑表继续潜水, 如果没有携带备用电脑表, 这时应该 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "上升, 执行安全停留, 结束该次潜水."
						}, {
							"id": "B",
							"content": "借用潜伴的备用电脑表."
						}, {
							"id": "C",
							"content": "继续潜水, 直到空气快要用完, 但是不要进行重复潜水."
						}, {
							"id": "D",
							"content": "立即结束潜水并上升到水面."
						}],
						"answer": "A",
						"userAnswer": "",
					},
					{
						"title": "48. 你在同一天内从事两次潜水, 并预计搭乘民航机返家, 这时你应该等到电脑表指示你可以搭机, 或是等 _____ 小时之后再搭机 ( 以较长的时间为准 ).",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "0"
						}, {
							"id": "B",
							"content": "48"
						}, {
							"id": "C",
							"content": "24"
						}, {
							"id": "D",
							"content": "18"
						}],
						"answer": "D",
						"userAnswer": "",
					},
					{
						"title": "49. 对于新的PADI开放水域潜水员, 建议最大潜水深度是 _____ ( 如果训练中实际到达的深度比较浅, 则采用训练时的深度), 对所有休闲水肺潜水员 ( 包括经验丰富的潜水员 ) 来说, 最大潜水深度则是 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "10公尺 / 30英尺 ; 18公尺 / 60英尺."
						}, {
							"id": "B",
							"content": "12公尺 / 40英尺 ; 30公尺 / 100英尺."
						}, {
							"id": "C",
							"content": "18公尺 / 60英尺 ; 40公尺 / 130英尺."
						}, {
							"id": "D",
							"content": "24公尺 / 80英尺 ; 50公尺 / 190英尺."
						}],
						"answer": "C",
						"userAnswer": "",
					},
					{
						"title": "50. 在高于海拔 300公尺 / 1000英尺的高地潜水时 _____ .",
						"type": 2,
						"optionList": [{
							"id": "A",
							"content": "你需要遵守特殊的程序."
						}, {
							"id": "B",
							"content": "你不能使用潜水电脑表."
						}, {
							"id": "C",
							"content": "你不需要遵守特殊的程序, 但要将电脑表设定为高海拔潜水."
						}, {
							"id": "D",
							"content": "你需要遵守特殊的程序, 但要将电脑表设定为高海拔潜水."
						}],
						"answer": "D",
						"userAnswer": "",
					},
					{
						"title": "什么美国要限制华为？",
						"type": 5,
						"optionList": [{
							"id": "",
							"content": ""
						}],
						"answer": "",
						"userAnswer": "",
						"userFavor": false,
						"explain": "问答题没有选项，无法做答，且不参与计分"
					},

					{
						"title": "酸菜鱼的味道？",
						"type": 3,
						"optionList": [{
							"id": "A",
							"content": "咸味"
						}, {
							"id": "B",
							"content": "辣味"
						}, {
							"id": "C",
							"content": "甜味"
						}, {
							"id": "D",
							"content": "酸味"
						}],
						"answer": "A,B,D",
						"userAnswer": "",
						"userFavor": false,
						"explain": "你怎么想都行，要的就是这个味，答案只能选A,B,D"
					},
					{
						"title": "床前（____）光，疑是地上霜。",
						"type": 4,
						"optionList": [{
							"id": "",
							"content": ""
						}],
						"answer": "明月",
						"userAnswer": "",
						"userFavor": false,
						"explain": "问答题没有选项，无法做答，且不参与计分"
					}


				],
				modalCard: null, //显示答题卡
				modalError: null, //纠错卡
				total:0
			}
		},
		computed: {
			readySubject() {
				let readySubject = this.subjectList.filter(item => item.userAnswer !== '')
				return readySubject
			}
		},
		onReady() {

			var tempHeight = 800;
			var _me = this;
			uni.getSystemInfo({
				//获取手机屏幕高度信息，让swiper的高度和手机屏幕一样高                
				success: function(res) {
					// console.log(res.model);                    
					// console.log(res.pixelRatio);                    
					// console.log(res.windowWidth);                    
					// console.log(res.windowHeight);
					// //这里是手机屏幕高度                    
					// console.log(res.language);                    
					// console.log(res.version);                    
					// console.log(res.platform);                    
					tempHeight = res.windowHeight;
					console.log("屏幕可用高度 " + tempHeight);

					uni.createSelectorQuery().select("#top-box").fields({
						size: true,
						scrollOffset: true
					}, (data) => {
						tempHeight -= data.height;
						console.log("减掉顶部后的高度 " + tempHeight);

						uni.createSelectorQuery().select("#foot-box").fields({
							size: true,
							scrollOffset: true
						}, (data) => {
							tempHeight -= data.height;
							console.log("减掉底部后的高度 " + tempHeight);
							_me.swiperHeight = tempHeight + 'px';
							console.log("滑屏最后高度 " + _me.swiperHeight);
						}).exec();

					}).exec();
				}
			});

		},
		onLoad() {

			this.currentType = this.subjectList[0].type;
			uni.setNavigationBarTitle({
				title: this.title
			});

			//添加用户显示答案字段
			for (var i = 0; i < this.subjectList.length; i++) {
				this.$set(this.subjectList[i], "showAnswer", false);
			}

		},
		methods: {
			submitSubject() {
				console.log(this.readySubject)
				let readySubject = this.readySubject
				if (readySubject.length < 50) {
					uni.showModal({
						showCancel: false,
						content: '请答题完成后再交卷'
					})
					return
				}
				this.total=0
				readySubject.map(item => {
					if (item.userAnswer === item.answer) {
						this.total += 2
					}
				})

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
					phone: phone,
					score: this.total,
					extend: JSON.stringify(this.readySubject)
				}
				uni.showLoading({
					title:'试卷生成中'
				})
				await Exam.createItem(data)
				uni.hideLoading()
			},
			showCardModal: function(e) {
				this.modalCard = e.currentTarget.dataset.target
			},
			hideCardModal: function(e) {
				this.modalCard = null
			},
			showErrorModal: function(e) {
				this.modalError = e.currentTarget.dataset.target
			},
			hideErrorModal: function(e) {
				this.modalError = null
			},
			SwiperChange: function(e) { //滑动事件

				let index = e.target.current;

				if (index != undefined) {
					this.subjectIndex = index;
					this.currentType = this.subjectList[index].type;
					this.userFavor = this.subjectList[index].userFavor;
				}
			},
			RadioboxChange: function(e) { //单选选中

				var items = this.subjectList[this.subjectIndex].optionList;
				var values = e.detail.value;
				this.subjectList[this.subjectIndex].userAnswer = values;
				if (this.autoRadioNext && this.subjectIndex < this.subjectList.length - 1) {
					this.subjectIndex += 1;
				};

			},
			CheckboxChange: function(e) { //复选选中

				var items = this.subjectList[this.subjectIndex].optionList;
				var values = e.detail.value;
				this.subjectList[this.subjectIndex].userAnswer = "";
				for (var i = 0, lenI = items.length; i < lenI; ++i) {
					for (var j = 0, lenJ = values.length; j < lenJ; ++j) {
						if (items[i].id == values[j]) {

							this.subjectList[this.subjectIndex].userAnswer += items[i].id;
							break
						}
					}
				}
			},
			textInput: function(e) { //填空题

				this.subjectList[this.subjectIndex].userAnswer = e.detail.value;

			},
			ShowAnswerChange: function(e) { //显示答案

				if (this.subjectList[this.subjectIndex].showAnswer) {
					this.subjectList[this.subjectIndex].showAnswer = false;
				} else {

					this.subjectList[this.subjectIndex].showAnswer = true;
				}
			},

			FavorSubject: function(e) { //收藏题

				if (this.userFavor) {
					this.userFavor = false;
					this.subjectList[this.subjectIndex].userFavor = false;
				} else {

					this.userFavor = true;
					this.subjectList[this.subjectIndex].userFavor = true;
				}
			},

			MoveSubject: function(e) { //上一题、下一题

				if (e === -1 && this.subjectIndex != 0) {
					this.subjectIndex -= 1;
				}
				if (e === 1 && this.subjectIndex < this.subjectList.length - 1) {
					this.subjectIndex += 1;
				}
			},

			AppointedSubject: function(e) { //题卡指定

				this.modalCard = null;
				this.subjectIndex = e;
			},

			SubmitError: function(e) { //提交纠错

				this.modalError = null;
			}

		}
	}
</script>

<style>
	@import "../../colorui/animation.css";

	page {
		background-color: #FFFFFF;
	}

	.cu-form-group {
		justify-content: flex-start
	}

	.cu-form-group .title {
		padding-left: 30upx;
		padding-right: 0upx;
	}

	.cu-form-group+.cu-form-group {
		border-top: none;
	}

	.cu-bar-title {
		min-height: 50upx;
	}

	.cu-list.menu>.cu-item-error {
		justify-content: flex-start;
	}
</style>
