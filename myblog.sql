/*
Navicat MySQL Data Transfer

Source Server         : MyTest
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-06-22 16:32:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'JS', '2019-06-09 11:09:26');
INSERT INTO `category` VALUES ('2', 'Python', '2019-06-08 21:32:42');
INSERT INTO `category` VALUES ('4', 'C++', '2019-06-09 10:10:29');
INSERT INTO `category` VALUES ('7', 'Golang', '2019-06-09 07:51:31');
INSERT INTO `category` VALUES ('9', 'C', '2019-06-10 13:54:23');
INSERT INTO `category` VALUES ('10', 'Java', '2019-06-09 11:09:16');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `category_title` varchar(100) DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('7', 'python天下第一', 'python是实用性非常好的脚本语言，不接受任何反驳！', 'python', '49', '2019-06-22 16:31:21');
INSERT INTO `post` VALUES ('8', '放屁，Java才是爹', '这个还用得着比吗？Java如此规范和严谨的语言，兼职就是锻炼你逻辑思维的必备语言，渣渣python安敢在此造次？', 'Java', '21', '2019-06-22 16:16:56');
INSERT INTO `post` VALUES ('9', '扯淡，python牛逼不解释', '测试一下！接受所有关于python的赞美，无视一切来自Java的恶人恶语，我为python代言，欧耶！', 'python', '12', '2019-06-22 16:23:31');
INSERT INTO `post` VALUES ('12', 'C++的凝视', '我不想说话，各位大佬都好牛逼，我只想安静的做个美男子，好吗？？', 'C++', '10', '2019-06-22 16:17:53');
INSERT INTO `post` VALUES ('14', 'JS不服啊', '我JS被吃了嘛？！', 'JS', '13', '2019-06-22 16:07:44');
INSERT INTO `post` VALUES ('16', 'Golang没人理', '你们都不考虑萌新的感受！！！', 'Golang', '2', '2019-06-22 16:17:51');
INSERT INTO `post` VALUES ('17', 'Java', '爸爸懒得和你们吵', 'Java', '4', '2019-06-22 16:24:22');
INSERT INTO `post` VALUES ('19', 'JS之美', '我要要测试测试测试………………', 'JS', '2', '2019-06-11 08:44:16');
INSERT INTO `post` VALUES ('20', 'Java的爹', '哈哈放屁！黄家辉才是爹！', 'Java', '2', '2019-06-21 13:48:35');
INSERT INTO `post` VALUES ('21', 'C语言的崛起', '老子是C，老子是C位！！！！！！！', 'C', '5', '2019-06-22 16:26:32');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `username` varchar(1000) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '评论测试一', 'caixukun', 'Java的爹', '2019-06-21 11:58:43');
INSERT INTO `reply` VALUES ('3', '蔡徐坤你好帅！', 'caixukun', 'Java的爹', '2019-06-22 15:37:29');
INSERT INTO `reply` VALUES ('4', '坤坤I love you', 'caixukun', 'Java的爹', '2019-06-22 15:41:21');
INSERT INTO `reply` VALUES ('5', '我爱坤坤！！', 'caixukun', 'Java的爹', '2019-06-22 15:45:36');
INSERT INTO `reply` VALUES ('10', '评论测试啊', 'caixukun', 'python天下第一', '2019-06-22 15:50:44');
INSERT INTO `reply` VALUES ('11', 'happy life!', 'caixukun', 'JS不服啊', '2019-06-22 15:55:31');
INSERT INTO `reply` VALUES ('12', '啦啦啦德玛西亚！', 'caixukun', 'python天下第一', '2019-06-22 15:59:30');
INSERT INTO `reply` VALUES ('13', '你好帅啊！', '蔡徐坤', 'python天下第一', '2019-06-22 16:18:01');
INSERT INTO `reply` VALUES ('14', '坤坤 牛逼啊！！！', '蔡徐坤我爱你', 'python天下第一', '2019-06-22 16:25:44');
INSERT INTO `reply` VALUES ('15', '蔡徐坤我爱你！', '蔡徐坤我爱你', 'C语言的崛起', '2019-06-22 16:26:04');
INSERT INTO `reply` VALUES ('16', '放屁，老子不爱你！', '蔡徐坤', 'C语言的崛起', '2019-06-22 16:26:32');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lhc', '123', '2019-06-07 09:21:45');
INSERT INTO `user` VALUES ('4', '蔡徐坤', 'asd134679', '2019-06-09 21:04:37');
INSERT INTO `user` VALUES ('5', 'caixukun', 'asd134679', '2019-06-09 21:10:50');
INSERT INTO `user` VALUES ('6', '蔡徐坤我爱你', 'asd134679', '2019-06-22 16:25:14');
