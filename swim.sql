/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80020
Source Host           : localhost:3307
Source Database       : swim

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2020-11-07 19:39:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `summary` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '老人与海', 'king', '老人与海', '老人与海老人与海老人与海', '2020-09-04 15:44:24.000', '2020-09-04 15:44:24.000', null);

-- ----------------------------
-- Table structure for `exam`
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `coach` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `score` int DEFAULT NULL,
  `extend` text COLLATE utf8mb4_general_ci,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  `poster` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('1', 'king', '13888888888', null, null, '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"A\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"C\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"C\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"C\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"B\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"D\"}]', '2020-09-05 12:42:46', '2020-09-05 12:42:46', null, null);
INSERT INTO `exam` VALUES ('2', 'king', '13888888888', null, '1', '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"A\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"C\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"D\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"D\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"C\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"B\"}]', '2020-09-05 12:43:51', '2020-09-05 12:43:51', null, null);
INSERT INTO `exam` VALUES ('3', 'rock', '13888888888', null, '1', '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"A\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"C\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"D\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"C\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"B\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"B\"}]', '2020-09-05 13:34:15', '2020-09-05 13:34:15', null, null);
INSERT INTO `exam` VALUES ('4', 'rock', '13888888888', null, '3', '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"D\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"D\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"C\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"C\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"C\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"B\"}]', '2020-09-05 13:53:18', '2020-09-05 13:53:18', null, null);
INSERT INTO `exam` VALUES ('5', 'rock', '13888888888', null, '3', '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"A\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"B\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"C\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"C\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"C\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"D\"}]', '2020-10-03 14:11:20', '2020-10-03 14:11:20', null, null);
INSERT INTO `exam` VALUES ('6', 'rock', '13888888888', null, '0', '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"B\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"C\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"D\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"D\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"D\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"D\"}]', '2020-10-03 14:12:21', '2020-10-03 14:12:21', null, null);
INSERT INTO `exam` VALUES ('7', 'rock', '13888888888', null, '1', '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"A\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"B\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"C\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"D\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"D\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"D\"}]', '2020-10-03 14:31:23', '2020-10-03 14:31:23', null, null);
INSERT INTO `exam` VALUES ('8', 'rock', '13888888888', null, '2', '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"A\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"B\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"C\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"D\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"C\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"C\"}]', '2020-10-03 14:32:31', '2020-10-03 14:32:31', null, null);
INSERT INTO `exam` VALUES ('9', 'rock', '13888888888', null, '2', '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"A\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"B\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"D\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"D\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"C\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"C\"}]', '2020-10-03 14:37:41', '2020-10-03 14:37:41', null, null);
INSERT INTO `exam` VALUES ('10', 'rock', '13888888888', null, '0', '[{\"id\":6,\"title\":\"1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .\",\"author\":\"未名\",\"summary\":\"答案:D\",\"image\":null,\"score\":1,\"answer\":\"D\",\"create_time\":\"2020-09-04T12:41:33.000Z\",\"choose\":[{\"id\":9,\"key\":\"A\",\"summary\":\"下沉.\",\"question_id\":\"6\"},{\"id\":10,\"key\":\"B\",\"summary\":\"浮起来或沉下去.\",\"question_id\":\"6\"},{\"id\":11,\"key\":\"C\",\"summary\":\"不动.\",\"question_id\":\"6\"},{\"id\":12,\"key\":\"D\",\"summary\":\"上浮.\",\"question_id\":\"6\"}],\"myAnswer\":\"A\"},{\"id\":7,\"title\":\"2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:B\",\"image\":null,\"score\":1,\"answer\":\"B\",\"create_time\":\"2020-09-04T12:43:13.000Z\",\"choose\":[{\"id\":13,\"key\":\"A\",\"summary\":\"气球会变大, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"},{\"id\":14,\"key\":\"B\",\"summary\":\"气球会变小, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":15,\"key\":\"C\",\"summary\":\"气球会变大, 气球里面的空气密度会变大(分子间的距离变小).\",\"question_id\":\"7\"},{\"id\":16,\"key\":\"D\",\"summary\":\"气球会变小, 气球里面的空气密度会变小(分子间的距离变大).\",\"question_id\":\"7\"}],\"myAnswer\":\"C\"},{\"id\":8,\"title\":\"3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?\",\"author\":\"未名\",\"summary\":\"答案:A\",\"image\":null,\"score\":1,\"answer\":\"A\",\"create_time\":\"2020-09-04T12:44:29.000Z\",\"choose\":[{\"id\":17,\"key\":\"A\",\"summary\":\"减为水面时的一半.\",\"question_id\":\"8\"},{\"id\":18,\"key\":\"B\",\"summary\":\"不变.\",\"question_id\":\"8\"},{\"id\":19,\"key\":\"C\",\"summary\":\"减为水面时的1/3.\",\"question_id\":\"8\"},{\"id\":20,\"key\":\"D\",\"summary\":\"减为水面时的2/3.\",\"question_id\":\"8\"}],\"myAnswer\":\"C\"},{\"id\":9,\"title\":\"4. 无法平衡身体内的空腔, 可能是因为你 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:45:10.000Z\",\"choose\":[{\"id\":21,\"key\":\"A\",\"summary\":\"晕船.\",\"question_id\":\"9\"},{\"id\":22,\"key\":\"B\",\"summary\":\"有心脏病和高血压.\",\"question_id\":\"9\"},{\"id\":23,\"key\":\"C\",\"summary\":\"感冒, 过敏或其他呼吸上的疾病.\",\"question_id\":\"9\"},{\"id\":24,\"key\":\"D\",\"summary\":\"感到焦虑.\",\"question_id\":\"9\"}],\"myAnswer\":\"D\"},{\"id\":10,\"title\":\"5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:48:49.000Z\",\"choose\":[{\"id\":25,\"key\":\"A\",\"summary\":\"你的空腔平衡好了.\",\"question_id\":\"10\"},{\"id\":26,\"key\":\"B\",\"summary\":\"你的面镜带太紧.\",\"question_id\":\"10\"},{\"id\":27,\"key\":\"C\",\"summary\":\"你觉得被挤压, 需要平衡.\",\"question_id\":\"10\"},{\"id\":28,\"key\":\"D\",\"summary\":\"你的面镜太小.\",\"question_id\":\"10\"}],\"myAnswer\":\"D\"},{\"id\":11,\"title\":\"6. 放置备用气源的最佳位置是 _____ .\",\"author\":\"未名\",\"summary\":\"答案:C\",\"image\":null,\"score\":1,\"answer\":\"C\",\"create_time\":\"2020-09-04T12:49:34.000Z\",\"choose\":[{\"id\":29,\"key\":\"A\",\"summary\":\"在身旁吊着, 这样能够很快找到.\",\"question_id\":\"11\"},{\"id\":30,\"key\":\"B\",\"summary\":\"下巴和肋骨两端所形成的三角区域.\",\"question_id\":\"11\"},{\"id\":31,\"key\":\"C\",\"summary\":\"气瓶的底部.\",\"question_id\":\"11\"},{\"id\":32,\"key\":\"D\",\"summary\":\"BCD的后面, 落在肩胛骨和腰线之间.\",\"question_id\":\"11\"}],\"myAnswer\":\"C\"}]', '2020-10-03 14:45:01', '2020-10-03 14:45:06', null, 'poster/10.png');

-- ----------------------------
-- Table structure for `lin_file`
-- ----------------------------
DROP TABLE IF EXISTS `lin_file`;
CREATE TABLE `lin_file` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'LOCAL' COMMENT 'LOCAL 本地，REMOTE 远程',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `md5` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'md5值，防止上传重复文件',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5_del` (`md5`,`delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lin_file
-- ----------------------------
INSERT INTO `lin_file` VALUES ('1', '2020/09/04/109e6934-9655-4790-b120-f321544e04e5.jpg', 'LOCAL', '109e6934-9655-4790-b120-f321544e04e5.jpg', '.jpg', '2328', '3daf7f895762331896da80deea80939a', '2020-09-04 16:43:10.000', '2020-09-04 16:43:10.000', null);
INSERT INTO `lin_file` VALUES ('2', '2020/09/04/d03d6eec-4b93-47e9-9f0a-e61b0debb54d.jpg', 'LOCAL', 'd03d6eec-4b93-47e9-9f0a-e61b0debb54d.jpg', '.jpg', '5835', 'e79bac315fac4081afa145b5ec21d4a5', '2020-09-04 16:43:34.000', '2020-09-04 16:43:34.000', null);

-- ----------------------------
-- Table structure for `lin_group`
-- ----------------------------
DROP TABLE IF EXISTS `lin_group`;
CREATE TABLE `lin_group` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组名称，例如：搬砖者',
  `info` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组信息：例如：搬砖的人',
  `level` tinyint NOT NULL DEFAULT '3' COMMENT '分组级别 1：root 2：guest 3：user（root、guest分组只能存在一个)',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_del` (`name`,`delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lin_group
-- ----------------------------
INSERT INTO `lin_group` VALUES ('1', 'root', '超级用户组', '1', '2020-09-04 14:05:38.979', '2020-09-04 14:05:38.979', null);
INSERT INTO `lin_group` VALUES ('2', 'guest', '游客组', '2', '2020-09-04 14:05:38.980', '2020-09-04 14:05:38.980', null);

-- ----------------------------
-- Table structure for `lin_group_permission`
-- ----------------------------
DROP TABLE IF EXISTS `lin_group_permission`;
CREATE TABLE `lin_group_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int unsigned NOT NULL COMMENT '分组id',
  `permission_id` int unsigned NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`) USING BTREE COMMENT '联合索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lin_group_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `lin_log`
-- ----------------------------
DROP TABLE IF EXISTS `lin_log`;
CREATE TABLE `lin_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(450) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `username` varchar(24) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_code` int DEFAULT NULL,
  `method` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `permission` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `lin_permission`
-- ----------------------------
DROP TABLE IF EXISTS `lin_permission`;
CREATE TABLE `lin_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称，例如：访问首页',
  `module` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限所属模块，例如：人员管理',
  `mount` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：关闭 1：开启',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lin_permission
-- ----------------------------
INSERT INTO `lin_permission` VALUES ('1', '查询所有日志', '日志', '1', '2020-09-04 15:42:46.000', '2020-09-04 15:42:46.000', null);
INSERT INTO `lin_permission` VALUES ('2', '搜索日志', '日志', '1', '2020-09-04 15:42:46.000', '2020-09-04 15:42:46.000', null);
INSERT INTO `lin_permission` VALUES ('3', '查询日志记录的用户', '日志', '1', '2020-09-04 15:42:46.000', '2020-09-04 15:42:46.000', null);
INSERT INTO `lin_permission` VALUES ('4', '测试日志记录', '信息', '1', '2020-09-04 15:42:46.000', '2020-09-04 15:42:46.000', null);
INSERT INTO `lin_permission` VALUES ('5', '查看lin的信息', '信息', '1', '2020-09-04 15:42:46.000', '2020-09-04 15:42:46.000', null);
INSERT INTO `lin_permission` VALUES ('6', '删除图书', '图书', '1', '2020-09-04 15:42:46.000', '2020-09-05 12:10:29.000', null);
INSERT INTO `lin_permission` VALUES ('7', '删除问题', '题目', '1', '2020-09-04 16:26:51.000', '2020-09-04 16:26:51.000', null);
INSERT INTO `lin_permission` VALUES ('8', '删除试卷', '题目', '1', '2020-09-05 12:10:29.000', '2020-09-05 12:10:29.000', null);

-- ----------------------------
-- Table structure for `lin_user`
-- ----------------------------
DROP TABLE IF EXISTS `lin_user`;
CREATE TABLE `lin_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(24) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名，唯一',
  `nickname` varchar(24) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像url',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_del` (`username`,`delete_time`),
  UNIQUE KEY `email_del` (`email`,`delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lin_user
-- ----------------------------
INSERT INTO `lin_user` VALUES ('1', 'root', 'root', '2020/09/04/d03d6eec-4b93-47e9-9f0a-e61b0debb54d.jpg', null, '2020-09-04 14:05:38.977', '2020-09-04 16:43:34.000', null);

-- ----------------------------
-- Table structure for `lin_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `lin_user_group`;
CREATE TABLE `lin_user_group` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL COMMENT '用户id',
  `group_id` int unsigned NOT NULL COMMENT '分组id',
  PRIMARY KEY (`id`),
  KEY `user_id_group_id` (`user_id`,`group_id`) USING BTREE COMMENT '联合索引'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lin_user_group
-- ----------------------------
INSERT INTO `lin_user_group` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `lin_user_identity`
-- ----------------------------
DROP TABLE IF EXISTS `lin_user_identity`;
CREATE TABLE `lin_user_identity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL COMMENT '用户id',
  `identity_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `credential` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of lin_user_identity
-- ----------------------------
INSERT INTO `lin_user_identity` VALUES ('1', '1', 'USERNAME_PASSWORD', 'root', 'sha1$c419e500$1$84869e5560ebf3de26b6690386484929456d6c07', '2020-09-04 14:05:38.978', '2020-09-04 14:05:38.978', null);

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '未名',
  `summary` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `score` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  `answer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('2', 'test', '未名', 'DFADSADFADSFA', '10', null, '2020-09-04 18:38:26', '2020-09-04 20:37:25', '2020-09-04 20:37:25', 'B');
INSERT INTO `question` VALUES ('3', 'test23333', '未名', 'SDFADSFDASFADFADS暗示法但是', '5', null, '2020-09-04 19:32:27', '2020-09-04 20:24:18', '2020-09-04 20:24:18', 'A');
INSERT INTO `question` VALUES ('4', 'CCC', '未名', 'DFADSADFADSFA', '1', null, '2020-09-04 20:22:18', '2020-09-04 20:37:27', '2020-09-04 20:37:27', 'C');
INSERT INTO `question` VALUES ('5', '答案:D', '未名', '答案:D', '1', null, '2020-09-04 20:40:05', '2020-09-04 20:41:29', '2020-09-04 20:41:29', 'A');
INSERT INTO `question` VALUES ('6', '1. 如果将一个物体放在淡水中是具有中性浮力(不沉也不浮), 那么将它放到海水中, 它会 _____ .', '未名', '答案:D', '1', null, '2020-09-04 20:41:33', '2020-09-04 20:42:16', null, 'D');
INSERT INTO `question` VALUES ('7', '2. 假设你将一个气球吹入空气, 绑紧, 然后带到游泳池底去, 这时, 气球里面的空气会发生什么变化?', '未名', '答案:B', '1', null, '2020-09-04 20:43:13', '2020-09-04 20:43:13', null, 'B');
INSERT INTO `question` VALUES ('8', '3. 假设你将一个空玻璃瓶倒置, 放到水里, 然后将它带到10公尺 / 33英尺的深度. 这时, 瓶内的空腔将发生什么变化?', '未名', '答案:A', '1', null, '2020-09-04 20:44:29', '2020-09-04 20:44:29', null, 'A');
INSERT INTO `question` VALUES ('9', '4. 无法平衡身体内的空腔, 可能是因为你 _____ .', '未名', '答案:C', '1', null, '2020-09-04 20:45:10', '2020-09-04 20:45:10', null, 'C');
INSERT INTO `question` VALUES ('10', '5. 如果你在下潜时, 耳朵和鼻窦感到疼痛, 这通常是表示 _____ .', '未名', '答案:C', '1', null, '2020-09-04 20:48:49', '2020-09-04 20:48:49', null, 'C');
INSERT INTO `question` VALUES ('11', '6. 放置备用气源的最佳位置是 _____ .', '未名', '答案:C', '1', null, '2020-09-04 20:49:34', '2020-09-04 20:49:34', null, 'C');

-- ----------------------------
-- Table structure for `question_choose`
-- ----------------------------
DROP TABLE IF EXISTS `question_choose`;
CREATE TABLE `question_choose` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `key` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `summary` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of question_choose
-- ----------------------------
INSERT INTO `question_choose` VALUES ('1', '2', 'A', 'AAAA', '2020-09-04 18:38:26', '2020-09-04 18:38:26', null);
INSERT INTO `question_choose` VALUES ('2', '2', 'B', 'BBBB', '2020-09-04 18:38:26', '2020-09-04 20:17:01', '2020-09-04 20:17:01');
INSERT INTO `question_choose` VALUES ('3', '3', 'A', 'SDFADSFDASFADFADS暗示法但是', '2020-09-04 19:32:27', '2020-09-04 20:13:41', '2020-09-04 20:13:41');
INSERT INTO `question_choose` VALUES ('4', '3', 'B', 'BBBBB', '2020-09-04 19:32:27', '2020-09-04 20:21:59', '2020-09-04 20:21:59');
INSERT INTO `question_choose` VALUES ('5', '3', 'C', 'cc', '2020-09-04 20:03:59', '2020-09-04 20:08:03', '2020-09-04 20:08:03');
INSERT INTO `question_choose` VALUES ('6', '3', 'DDD', 'DDD', '2020-09-04 20:04:35', '2020-09-04 20:06:47', '2020-09-04 20:06:47');
INSERT INTO `question_choose` VALUES ('7', '2', 'CCC', 'CCC', '2020-09-04 20:19:56', '2020-09-04 20:19:56', null);
INSERT INTO `question_choose` VALUES ('8', '4', '工', '工', '2020-09-04 20:22:29', '2020-09-04 20:22:29', null);
INSERT INTO `question_choose` VALUES ('9', '6', 'A', '下沉.', '2020-09-04 20:42:16', '2020-09-04 20:42:16', null);
INSERT INTO `question_choose` VALUES ('10', '6', 'B', '浮起来或沉下去.', '2020-09-04 20:42:16', '2020-09-04 20:42:16', null);
INSERT INTO `question_choose` VALUES ('11', '6', 'C', '不动.', '2020-09-04 20:42:16', '2020-09-04 20:42:16', null);
INSERT INTO `question_choose` VALUES ('12', '6', 'D', '上浮.', '2020-09-04 20:42:16', '2020-09-04 20:42:16', null);
INSERT INTO `question_choose` VALUES ('13', '7', 'A', '气球会变大, 气球里面的空气密度会变小(分子间的距离变大).', '2020-09-04 20:43:13', '2020-09-04 20:43:13', null);
INSERT INTO `question_choose` VALUES ('14', '7', 'B', '气球会变小, 气球里面的空气密度会变大(分子间的距离变小).', '2020-09-04 20:43:13', '2020-09-04 20:43:13', null);
INSERT INTO `question_choose` VALUES ('15', '7', 'C', '气球会变大, 气球里面的空气密度会变大(分子间的距离变小).', '2020-09-04 20:43:13', '2020-09-04 20:43:13', null);
INSERT INTO `question_choose` VALUES ('16', '7', 'D', '气球会变小, 气球里面的空气密度会变小(分子间的距离变大).', '2020-09-04 20:43:13', '2020-09-04 20:43:13', null);
INSERT INTO `question_choose` VALUES ('17', '8', 'A', '减为水面时的一半.', '2020-09-04 20:44:29', '2020-09-04 20:44:29', null);
INSERT INTO `question_choose` VALUES ('18', '8', 'B', '不变.', '2020-09-04 20:44:29', '2020-09-04 20:44:29', null);
INSERT INTO `question_choose` VALUES ('19', '8', 'C', '减为水面时的1/3.', '2020-09-04 20:44:29', '2020-09-04 20:44:29', null);
INSERT INTO `question_choose` VALUES ('20', '8', 'D', '减为水面时的2/3.', '2020-09-04 20:44:29', '2020-09-04 20:44:29', null);
INSERT INTO `question_choose` VALUES ('21', '9', 'A', '晕船.', '2020-09-04 20:45:10', '2020-09-04 20:45:10', null);
INSERT INTO `question_choose` VALUES ('22', '9', 'B', '有心脏病和高血压.', '2020-09-04 20:45:10', '2020-09-04 20:45:10', null);
INSERT INTO `question_choose` VALUES ('23', '9', 'C', '感冒, 过敏或其他呼吸上的疾病.', '2020-09-04 20:45:10', '2020-09-04 20:45:10', null);
INSERT INTO `question_choose` VALUES ('24', '9', 'D', '感到焦虑.', '2020-09-04 20:45:10', '2020-09-04 20:45:10', null);
INSERT INTO `question_choose` VALUES ('25', '10', 'A', '你的空腔平衡好了.', '2020-09-04 20:48:49', '2020-09-04 20:48:49', null);
INSERT INTO `question_choose` VALUES ('26', '10', 'B', '你的面镜带太紧.', '2020-09-04 20:48:49', '2020-09-04 20:48:49', null);
INSERT INTO `question_choose` VALUES ('27', '10', 'C', '你觉得被挤压, 需要平衡.', '2020-09-04 20:48:49', '2020-09-04 20:48:49', null);
INSERT INTO `question_choose` VALUES ('28', '10', 'D', '你的面镜太小.', '2020-09-04 20:48:49', '2020-09-04 20:48:49', null);
INSERT INTO `question_choose` VALUES ('29', '11', 'A', '在身旁吊着, 这样能够很快找到.', '2020-09-04 20:49:34', '2020-09-04 20:49:34', null);
INSERT INTO `question_choose` VALUES ('30', '11', 'B', '下巴和肋骨两端所形成的三角区域.', '2020-09-04 20:49:34', '2020-09-04 20:49:34', null);
INSERT INTO `question_choose` VALUES ('31', '11', 'C', '气瓶的底部.', '2020-09-04 20:49:34', '2020-09-04 20:49:34', null);
INSERT INTO `question_choose` VALUES ('32', '11', 'D', 'BCD的后面, 落在肩胛骨和腰线之间.', '2020-09-04 20:49:34', '2020-09-04 20:49:34', null);
