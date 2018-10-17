/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2018-09-15 12:10:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_achievement`
-- ----------------------------
DROP TABLE IF EXISTS `tb_achievement`;
CREATE TABLE `tb_achievement` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `ac_createTime` datetime DEFAULT '0000-00-00 00:00:00',
  `ac_publishTime` datetime DEFAULT '0000-00-00 00:00:00',
  `ac_publish` int(11) DEFAULT NULL COMMENT '发布标识',
  `ac_setTop` int(11) DEFAULT NULL COMMENT '置顶',
  `ac_order` int(11) DEFAULT NULL COMMENT '排序',
  `ac_content` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_achievement
-- ----------------------------
INSERT INTO `tb_achievement` VALUES ('1', 'test1', '2018-09-06 11:45:19', '2018-09-07 00:00:00', '1', '1', '1', '<p>test1</p>');
INSERT INTO `tb_achievement` VALUES ('2', 'test2', '2018-09-06 12:40:15', '2018-09-06 00:00:00', '1', '1', '0', '<p>test2</p>');

-- ----------------------------
-- Table structure for `tb_activity`
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity`;
CREATE TABLE `tb_activity` (
  `a_id` int(11) NOT NULL,
  `a_title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `a_areaid` int(11) DEFAULT NULL COMMENT '地区',
  `a_type` int(11) DEFAULT '0',
  `a_descript` varchar(255) DEFAULT NULL,
  `a_issuerorg` varchar(255) DEFAULT NULL,
  `a_issuer` varchar(255) DEFAULT NULL,
  `a_publishtime` datetime DEFAULT NULL,
  `a_source` varchar(255) DEFAULT NULL,
  `a_createtime` datetime NOT NULL,
  `a_modifier` varchar(255) DEFAULT NULL,
  `a_order` int(11) DEFAULT NULL,
  `a_settop` int(11) DEFAULT NULL,
  `a_modifytime` datetime DEFAULT NULL,
  `a_publish` int(11) DEFAULT NULL,
  `a_img` varchar(255) DEFAULT NULL,
  `a_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_activity
-- ----------------------------
INSERT INTO `tb_activity` VALUES ('1', 'test1', '1', '0', 'test', '1', null, '2018-09-11 00:00:00', 'ssssss', '0000-00-00 00:00:00', 'admin', '0', '1', '2018-09-12 09:26:39', '0', '', '<p>test</p>');
INSERT INTO `tb_activity` VALUES ('2', 'test1', '3', '0', 'test', '6', null, '2018-09-12 00:00:00', '0', '2018-09-12 09:04:37', null, '1', '0', null, '0', '/uploadImgs/6c49384641c645eea2672fd94546c215.png', '<p>test</p>');

-- ----------------------------
-- Table structure for `tb_activityclass`
-- ----------------------------
DROP TABLE IF EXISTS `tb_activityclass`;
CREATE TABLE `tb_activityclass` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `ac_type` int(11) DEFAULT NULL,
  `ac_abstract` varchar(255) DEFAULT NULL,
  `ac_issuer` varchar(255) DEFAULT NULL,
  `ac_publishtime` datetime DEFAULT NULL,
  `ac_modifier` varchar(255) DEFAULT NULL,
  `ac_modifytime` datetime DEFAULT NULL,
  `ac_enabled` int(11) DEFAULT '1',
  `ac_img1` varchar(255) DEFAULT NULL,
  `ac_img2` varchar(255) DEFAULT NULL,
  `ac_link` varchar(255) DEFAULT NULL,
  `ac_visitcount` int(11) DEFAULT NULL,
  `ac_source` varchar(255) DEFAULT NULL,
  `ac_areaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_activityclass
-- ----------------------------
INSERT INTO `tb_activityclass` VALUES ('1', 'test1', '0', '<p>test1</p>', null, '2018-09-12 20:03:06', 'admin', '2018-09-12 20:29:48', '0', '/uploadImgs/473730ce72d64c7fa388d39eedfb30ba.png', '/uploadImgs/7e0b3228d1a34f0c844820d080572fe3.png', '', null, 'sss', '2');
INSERT INTO `tb_activityclass` VALUES ('2', 'test2', '0', '<p>test2</p>', 'admin', '2018-09-12 20:30:34', null, null, '1', '', '', '', null, 'sss', '1');

-- ----------------------------
-- Table structure for `tb_advertisement`
-- ----------------------------
DROP TABLE IF EXISTS `tb_advertisement`;
CREATE TABLE `tb_advertisement` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ad_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `ad_src` varchar(255) DEFAULT NULL COMMENT '图片保存路径',
  `ad_link` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `ad_order` int(11) DEFAULT NULL COMMENT '排序',
  `ad_setTop` int(11) DEFAULT NULL COMMENT '置顶设置  置顶:1 未置顶:2',
  `ad_issuer` varchar(255) DEFAULT NULL COMMENT '插入用户',
  `ad_addTime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
  `ad_modifier` varchar(255) DEFAULT NULL COMMENT '更新用户',
  `ad_changeTime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_advertisement
-- ----------------------------
INSERT INTO `tb_advertisement` VALUES ('1', '15', '589', '50819', '15', '1', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_advertisement` VALUES ('2', '01', '/uploadImgs/d5cf4e1398014b77afd2d9d24a5a7457.png', '5/4098498', '25', '1', 'admin', '2018-09-03 15:09:34', 'admin', '2018-09-03 15:56:11');
INSERT INTO `tb_advertisement` VALUES ('3', '1810', '/uploadImgs/be5bfa2fca974d4d82b2d2eece345ebf.png', '189198101', '2560901', '1', 'admin', '2018-09-03 15:56:34', null, null);

-- ----------------------------
-- Table structure for `tb_area`
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(255) DEFAULT NULL COMMENT '地区名称',
  `a_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES ('1', '四川', '0');
INSERT INTO `tb_area` VALUES ('2', '江苏', '1');
INSERT INTO `tb_area` VALUES ('3', '福建', '2');
INSERT INTO `tb_area` VALUES ('4', '江西', '3');
INSERT INTO `tb_area` VALUES ('5', '海南', '0');
INSERT INTO `tb_area` VALUES ('6', '贵州', '12');
INSERT INTO `tb_area` VALUES ('7', '云南', '1');
INSERT INTO `tb_area` VALUES ('8', '青海', '0');
INSERT INTO `tb_area` VALUES ('9', '新疆', '0');
INSERT INTO `tb_area` VALUES ('10', '北京', '0');
INSERT INTO `tb_area` VALUES ('11', '上海', '2');
INSERT INTO `tb_area` VALUES ('12', '重庆', '1');
INSERT INTO `tb_area` VALUES ('13', '天津', '3');
INSERT INTO `tb_area` VALUES ('14', '黑龙江', '0');
INSERT INTO `tb_area` VALUES ('15', '吉林', '1');
INSERT INTO `tb_area` VALUES ('16', '辽宁', '0');
INSERT INTO `tb_area` VALUES ('17', '广西', '1');
INSERT INTO `tb_area` VALUES ('18', '河北', '0');
INSERT INTO `tb_area` VALUES ('19', '河南', '0');
INSERT INTO `tb_area` VALUES ('20', '内蒙古', '1');
INSERT INTO `tb_area` VALUES ('21', '山东', '2');
INSERT INTO `tb_area` VALUES ('22', '山西', '0');
INSERT INTO `tb_area` VALUES ('23', '陕西', '1');
INSERT INTO `tb_area` VALUES ('24', '宁夏', '2');
INSERT INTO `tb_area` VALUES ('25', '广东', '3');
INSERT INTO `tb_area` VALUES ('26', '甘肃', '0');
INSERT INTO `tb_area` VALUES ('27', '安徽', '1');
INSERT INTO `tb_area` VALUES ('28', '湖南', '0');
INSERT INTO `tb_area` VALUES ('29', '湖北', '1');
INSERT INTO `tb_area` VALUES ('30', '浙江', '0');
INSERT INTO `tb_area` VALUES ('31', '西藏', '0');
INSERT INTO `tb_area` VALUES ('32', '香港', '1');
INSERT INTO `tb_area` VALUES ('33', '澳门', '0');
INSERT INTO `tb_area` VALUES ('34', '台湾', '0');

-- ----------------------------
-- Table structure for `tb_banner`
-- ----------------------------
DROP TABLE IF EXISTS `tb_banner`;
CREATE TABLE `tb_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) DEFAULT NULL,
  `banner_src` varchar(255) DEFAULT NULL,
  `banner_link` varchar(255) DEFAULT NULL,
  `banner_issuer` varchar(255) DEFAULT NULL,
  `banner_modifier` varchar(255) DEFAULT NULL,
  `banner_addtime` datetime DEFAULT '0000-00-00 00:00:00',
  `banner_changetime` datetime DEFAULT '0000-00-00 00:00:00',
  `banner_order` int(11) DEFAULT NULL,
  `banner_set` int(11) DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_banner
-- ----------------------------
INSERT INTO `tb_banner` VALUES ('1', '创响中国首页', '首页-创响中国跳转', null, null, '超级管理员', '超级管理员', '2018-08-29 13:53:06', '2018-08-30 13:53:11', '0', '1');
INSERT INTO `tb_banner` VALUES ('3', '156', '4984', null, null, '15606', 'admin', null, '2018-08-30 22:12:43', '0', '1');
INSERT INTO `tb_banner` VALUES ('4', '111115', '首页-创响中国跳转', '/uploadImgs/de91e904226e4dc8a328d0810bc4cbcf.jpeg', '', null, 'admin', '2018-08-29 22:12:01', '2018-08-30 22:05:16', '9', null);
INSERT INTO `tb_banner` VALUES ('5', '189', '首页-创响中国跳转', '/uploadImgs/25da3901b9d446c7b98b1e256610b4fe.png', '', 'admin', 'admin', '2018-08-30 22:13:47', '2018-08-31 10:23:46', '18', '2');
INSERT INTO `tb_banner` VALUES ('8', '409010', '首页-创响中国跳转', '', '', 'admin', null, '2018-08-31 09:09:12', null, '0', '2');

-- ----------------------------
-- Table structure for `tb_base`
-- ----------------------------
DROP TABLE IF EXISTS `tb_base`;
CREATE TABLE `tb_base` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `b_area` int(11) DEFAULT NULL COMMENT '所属区域',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_base
-- ----------------------------
INSERT INTO `tb_base` VALUES ('1', '湖南湘江新区', '28');
INSERT INTO `tb_base` VALUES ('2', '贵州贵安新区', '6');
INSERT INTO `tb_base` VALUES ('3', '重庆两江新区', '12');
INSERT INTO `tb_base` VALUES ('4', '湖北武汉东湖新技术开发区', '29');
INSERT INTO `tb_base` VALUES ('5', '上海市杨浦区', '11');
INSERT INTO `tb_base` VALUES ('6', '辽宁省沈阳市浑南区', '16');
INSERT INTO `tb_base` VALUES ('7', '江苏省常州市武进区', '2');
INSERT INTO `tb_base` VALUES ('8', '四川大学', '1');
INSERT INTO `tb_base` VALUES ('9', '南京大学', '2');
INSERT INTO `tb_base` VALUES ('10', '清华大学', '10');
INSERT INTO `tb_base` VALUES ('11', '四川省成都市郫县', '1');
INSERT INTO `tb_base` VALUES ('12', '北京大学', '10');

-- ----------------------------
-- Table structure for `tb_dynamic`
-- ----------------------------
DROP TABLE IF EXISTS `tb_dynamic`;
CREATE TABLE `tb_dynamic` (
  `dy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dy_title` varchar(255) DEFAULT NULL,
  `dy_abstract` varchar(255) DEFAULT NULL COMMENT '简介',
  `dy_issuer` int(11) DEFAULT NULL COMMENT '发布单位',
  `dy_leader` int(11) DEFAULT '1' COMMENT '领导标记',
  `dy_base` int(11) DEFAULT NULL COMMENT '所属基地',
  `dy_area` int(11) DEFAULT NULL COMMENT '所属地区',
  `dy_caste` int(11) DEFAULT NULL COMMENT '所属社会团体',
  `dy_type` int(11) DEFAULT NULL COMMENT '动态分类',
  `dy_createtime` datetime DEFAULT '0000-00-00 00:00:00',
  `dy_source` varchar(255) DEFAULT NULL COMMENT '来源',
  `dy_publish` int(11) DEFAULT '1',
  `dy_publishtime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `dy_order` int(11) DEFAULT NULL COMMENT '排序',
  `dy_content` varchar(10000) DEFAULT NULL COMMENT '正文',
  `dy_setTop` int(11) NOT NULL DEFAULT '1' COMMENT '置顶',
  `dy_img` varchar(255) DEFAULT NULL COMMENT '图片(保存路径)',
  `dy_autopublishtime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '自动发布时间',
  PRIMARY KEY (`dy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dynamic
-- ----------------------------
INSERT INTO `tb_dynamic` VALUES ('1', 'test1', 'test', '1', '1', '48', '15', '7', '8', '2018-09-10 10:18:43', 'source', '0', '2018-09-07 00:00:00', '0', '<p>test1</p>', '0', '/uploadImgs/bc8feb11d111486e8e62982ec0e61630.jpeg', null);
INSERT INTO `tb_dynamic` VALUES ('2', 'test2', 'test', '1', '1', '5', '10', '5', '1', '2018-09-10 10:18:47', '', '0', '2018-09-07 00:00:00', '0', '<p>test</p>', '0', '/uploadImgs/668e4c70e398430f9ef31dd212556e6d.jpeg', null);
INSERT INTO `tb_dynamic` VALUES ('3', 'test3', 'test', '1', '1', '12', '15', '14', '14', '2018-09-10 10:18:50', '11', '0', '2018-09-07 00:00:00', '0', '<p>test</p>', '0', '', null);
INSERT INTO `tb_dynamic` VALUES ('4', 'test4', 'test', '1', '1', '1', '1', '1', '1', '2018-09-10 10:18:53', 'source', '1', '2018-09-07 00:00:00', '0', '<p>test4</p>', '1', '1', null);
INSERT INTO `tb_dynamic` VALUES ('5', 'test5', 'test', '1', '0', null, null, null, null, '2018-09-10 10:18:55', '', '1', null, '0', '', '1', '', null);
INSERT INTO `tb_dynamic` VALUES ('6', 'test6', 'test', '1', '1', '7', '2', '1', '1', '2018-09-10 11:13:28', 'source', '1', '2018-09-10 00:00:00', '0', '<p>test1</p>', '1', '/uploadImgs/890667d9ed344f5991a2a6fa0842358a.png', '2018-09-10 00:00:00');
INSERT INTO `tb_dynamic` VALUES ('7', 'test7', 'test', '3', '1', '1', '28', '0', '1', '2018-09-10 11:14:25', 'source', '1', '2018-09-10 00:00:00', '0', '<p>test1</p>', '1', '/uploadImgs/ff7c5a5b5c454569961fbba1e3ef6e37.png', '2018-09-10 00:00:00');

-- ----------------------------
-- Table structure for `tb_ecosphere`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ecosphere`;
CREATE TABLE `tb_ecosphere` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ecosphere
-- ----------------------------
INSERT INTO `tb_ecosphere` VALUES ('1', '专业园区');
INSERT INTO `tb_ecosphere` VALUES ('2', '财税机构');
INSERT INTO `tb_ecosphere` VALUES ('3', '教育科研机构');

-- ----------------------------
-- Table structure for `tb_entregroup`
-- ----------------------------
DROP TABLE IF EXISTS `tb_entregroup`;
CREATE TABLE `tb_entregroup` (
  `eg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表的主键',
  `eg_name` varchar(255) DEFAULT '' COMMENT '创业群体名称',
  `eg_issuer` varchar(255) DEFAULT '' COMMENT '添加人',
  `eg_addTime` datetime DEFAULT '0000-00-00 00:00:00',
  `eg_modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `eg_changeTime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `eg_order` int(11) DEFAULT NULL COMMENT '排序',
  `eg_setTop` int(11) DEFAULT NULL COMMENT '置顶状态 1置顶 2未置顶',
  `eg_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_entregroup
-- ----------------------------
INSERT INTO `tb_entregroup` VALUES ('1', '高校毕业生', 'admin', '2018-08-31 16:33:58', null, null, '0', '2', '/uploadImgs/fa9b4bea6302420eade5e16cb86fce88.png');
INSERT INTO `tb_entregroup` VALUES ('3', '科技人员', 'admin', '2018-08-31 16:50:53', 'admin', '2018-09-03 15:27:17', '1000', '2', '/uploadImgs/4c8642cab97041e1bcd31ec37512fb75.jpeg');

-- ----------------------------
-- Table structure for `tb_exhibitionroom`
-- ----------------------------
DROP TABLE IF EXISTS `tb_exhibitionroom`;
CREATE TABLE `tb_exhibitionroom` (
  `er_id` int(11) NOT NULL AUTO_INCREMENT,
  `er_content` varchar(2555) DEFAULT NULL,
  `er_title` varchar(255) DEFAULT NULL,
  `er_abstract` varchar(255) DEFAULT NULL,
  `er_issuer` varchar(255) DEFAULT NULL,
  `er_publishtime` datetime DEFAULT NULL,
  `er_createtime` datetime DEFAULT NULL,
  `er_modifier` varchar(255) DEFAULT NULL,
  `er_modifytime` datetime DEFAULT NULL,
  `er_img` varchar(255) DEFAULT NULL,
  `er_settop` int(11) DEFAULT '1',
  `er_publish` int(11) DEFAULT '1',
  `er_order` int(11) DEFAULT '1',
  PRIMARY KEY (`er_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_exhibitionroom
-- ----------------------------
INSERT INTO `tb_exhibitionroom` VALUES ('1', '<p>test123</p>', 'test1', null, 'admin', '2018-09-12 00:00:00', '2018-09-12 13:52:27', 'admin', '2018-09-13 16:20:32', '', '0', '0', '1');
INSERT INTO `tb_exhibitionroom` VALUES ('2', '<p>test</p>', 'test2', null, 'admin', '2018-09-13 00:00:00', '2018-09-13 16:21:13', 'admin', '2018-09-13 16:22:01', '/uploadImgs/1438ca2cac574b859b0d89130925f591.png', '1', '0', '1');

-- ----------------------------
-- Table structure for `tb_fadvert`
-- ----------------------------
DROP TABLE IF EXISTS `tb_fadvert`;
CREATE TABLE `tb_fadvert` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fa_type` varchar(255) DEFAULT NULL COMMENT '类别',
  `fa_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `fa_descrip` varchar(255) DEFAULT NULL COMMENT '描述',
  `fa_link` varchar(255) DEFAULT NULL COMMENT '链接',
  `fa_order` int(11) DEFAULT NULL COMMENT '排序',
  `fa_setTop` int(11) DEFAULT NULL COMMENT '置顶',
  PRIMARY KEY (`fa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_fadvert
-- ----------------------------
INSERT INTO `tb_fadvert` VALUES ('1', null, 'test1', '', '15610600', '0', '2');

-- ----------------------------
-- Table structure for `tb_generaladvert`
-- ----------------------------
DROP TABLE IF EXISTS `tb_generaladvert`;
CREATE TABLE `tb_generaladvert` (
  `ga_id` int(11) NOT NULL COMMENT 'id',
  `ga_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `ga_type` int(11) DEFAULT NULL COMMENT '类别',
  `ga_link` varchar(255) DEFAULT NULL COMMENT '链接',
  `ga_src` varchar(255) DEFAULT NULL COMMENT '上传图片的保存路径',
  `ga_order` int(11) DEFAULT NULL COMMENT '排序',
  `ga_setTop` int(11) DEFAULT NULL COMMENT '置顶',
  PRIMARY KEY (`ga_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_generaladvert
-- ----------------------------
INSERT INTO `tb_generaladvert` VALUES ('0', 'test1', '3', '0', '/uploadImgs/472eae51d02a410c9792b2312277a0b4.png', '1', '1');

-- ----------------------------
-- Table structure for `tb_guest`
-- ----------------------------
DROP TABLE IF EXISTS `tb_guest`;
CREATE TABLE `tb_guest` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_title` varchar(255) DEFAULT NULL,
  `g_type` int(11) DEFAULT NULL,
  `g_issuer` varchar(255) DEFAULT NULL,
  `g_publishtime` datetime DEFAULT NULL,
  `g_createtime` datetime DEFAULT NULL,
  `g_modifier` varchar(255) DEFAULT NULL,
  `g_modifytime` datetime DEFAULT NULL,
  `g_img` varchar(255) DEFAULT NULL,
  `g_publish` int(11) DEFAULT '1',
  `g_settop` int(11) DEFAULT '1',
  `g_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_guest
-- ----------------------------
INSERT INTO `tb_guest` VALUES ('1', 'test1', '1', 'admin', '2018-09-13 00:00:00', '2018-09-13 15:13:24', null, null, '/uploadImgs/129a29b9c5a64ccb8c81a35de5b2e677.png', '1', '1', '0');

-- ----------------------------
-- Table structure for `tb_industrialpark`
-- ----------------------------
DROP TABLE IF EXISTS `tb_industrialpark`;
CREATE TABLE `tb_industrialpark` (
  `ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_name` varchar(255) DEFAULT NULL,
  `ip_order` int(11) DEFAULT NULL,
  `ip_link` varchar(255) DEFAULT NULL,
  `ip_img` varchar(255) DEFAULT NULL,
  `ip_settop` int(11) DEFAULT NULL,
  PRIMARY KEY (`ip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_industrialpark
-- ----------------------------
INSERT INTO `tb_industrialpark` VALUES ('1', '杭州未来科技城', '1', null, null, '0');
INSERT INTO `tb_industrialpark` VALUES ('2', '清华大学', '10', 'http', '/uploadImgs/ba0df34fdd6044b4985bfa2c3d7b4cd8.png', '1');

-- ----------------------------
-- Table structure for `tb_industry`
-- ----------------------------
DROP TABLE IF EXISTS `tb_industry`;
CREATE TABLE `tb_industry` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `i_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_industry
-- ----------------------------
INSERT INTO `tb_industry` VALUES ('1', '采矿业');
INSERT INTO `tb_industry` VALUES ('2', '建筑业');
INSERT INTO `tb_industry` VALUES ('3', '文化体育和娱乐业');
INSERT INTO `tb_industry` VALUES ('4', '国际组织');

-- ----------------------------
-- Table structure for `tb_industrynews`
-- ----------------------------
DROP TABLE IF EXISTS `tb_industrynews`;
CREATE TABLE `tb_industrynews` (
  `in_id` int(11) NOT NULL AUTO_INCREMENT,
  `in_title` varchar(255) DEFAULT NULL,
  `in_abstract` varchar(255) DEFAULT NULL,
  `in_order` int(11) DEFAULT NULL,
  `in_content` varchar(8000) DEFAULT NULL,
  `in_publishtime` datetime DEFAULT '0000-00-00 00:00:00',
  `in_source` varchar(255) DEFAULT NULL,
  `in_publish` int(11) DEFAULT '1',
  `in_type` int(11) DEFAULT NULL,
  `in_settop` int(11) DEFAULT '1',
  `in_modifytime` datetime DEFAULT '0000-00-00 00:00:00',
  `in_createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_industrynews
-- ----------------------------
INSERT INTO `tb_industrynews` VALUES ('1', 'test1', 'test', '0', '<p>test</p>', '2018-09-14 00:00:00', '', '0', '1', '1', '2018-09-14 14:10:01', '2018-09-14 11:38:41');
INSERT INTO `tb_industrynews` VALUES ('2', 'test2', 'test', '0', '<p>test</p>', '2018-09-14 00:00:00', 'test12', '1', '1', '1', '2018-09-14 14:11:14', '2018-09-14 11:39:28');
INSERT INTO `tb_industrynews` VALUES ('4', 'test3', 'test', '0', '<p>test</p>', '2018-09-14 00:00:00', 'tset123', '1', '2', '1', '2018-09-14 14:15:33', '2018-09-14 11:51:12');

-- ----------------------------
-- Table structure for `tb_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_info`;
CREATE TABLE `tb_info` (
  `info_id` int(10) NOT NULL AUTO_INCREMENT,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_info
-- ----------------------------
INSERT INTO `tb_info` VALUES ('1', 'a1', 'a2', 'a3');
INSERT INTO `tb_info` VALUES ('2', 'b1', 'b2', 'b3');
INSERT INTO `tb_info` VALUES ('3', 'c1', 'c2', 'c3');
INSERT INTO `tb_info` VALUES ('4', 'd1', 'd2', 'd3');
INSERT INTO `tb_info` VALUES ('5', 'e1', 'e2', 'e3');
INSERT INTO `tb_info` VALUES ('6', 'f1', 'f2', 'f3');
INSERT INTO `tb_info` VALUES ('7', 'g1', 'g2', 'g3');
INSERT INTO `tb_info` VALUES ('8', 'h1', 'h2', 'h3');
INSERT INTO `tb_info` VALUES ('9', 'i1', 'i2', 'i3');
INSERT INTO `tb_info` VALUES ('10', 'j1', 'j2', 'j3');
INSERT INTO `tb_info` VALUES ('11', 'k1', 'k2', 'k3');
INSERT INTO `tb_info` VALUES ('12', 'l1', 'l2', 'l3');
INSERT INTO `tb_info` VALUES ('13', 'm1', 'm2', 'm3');
INSERT INTO `tb_info` VALUES ('14', 'n1', 'n2', 'n3');
INSERT INTO `tb_info` VALUES ('15', 'o1', 'o2', 'o3');
INSERT INTO `tb_info` VALUES ('16', 'p1', 'p2', 'p3');
INSERT INTO `tb_info` VALUES ('17', 'q1', 'q2', 'q3');
INSERT INTO `tb_info` VALUES ('18', 'r1', 'r2', 'r3');
INSERT INTO `tb_info` VALUES ('19', 's1', 's2', 's3');
INSERT INTO `tb_info` VALUES ('20', 't1', 't2', 't3');
INSERT INTO `tb_info` VALUES ('21', 'u1', 'u2', 'u3');
INSERT INTO `tb_info` VALUES ('22', 'v1', 'v2', 'v3');
INSERT INTO `tb_info` VALUES ('23', 'w1', 'w2', 'w3');
INSERT INTO `tb_info` VALUES ('24', 'x1', 'x2', 'x3');
INSERT INTO `tb_info` VALUES ('25', 'y1', 'y2', 'y3');
INSERT INTO `tb_info` VALUES ('26', 'z1', 'z2', 'z3');

-- ----------------------------
-- Table structure for `tb_information`
-- ----------------------------
DROP TABLE IF EXISTS `tb_information`;
CREATE TABLE `tb_information` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id 主键自增',
  `info_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `info_link` varchar(255) DEFAULT NULL COMMENT '链接',
  `info_order` int(11) DEFAULT NULL COMMENT '排序',
  `info_type` int(11) DEFAULT NULL COMMENT '类别：1金融资讯 2技术资讯 3人才资讯 4场地资讯',
  `info_setTop` int(11) DEFAULT NULL COMMENT '置顶 1置顶 2未置顶',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_information
-- ----------------------------
INSERT INTO `tb_information` VALUES ('1', 'test1', 'http://', '0', '1', '2');
INSERT INTO `tb_information` VALUES ('2', 'test2', 'http://', '1', '1', '2');

-- ----------------------------
-- Table structure for `tb_institution`
-- ----------------------------
DROP TABLE IF EXISTS `tb_institution`;
CREATE TABLE `tb_institution` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `i_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_institution
-- ----------------------------
INSERT INTO `tb_institution` VALUES ('1', '农业部');
INSERT INTO `tb_institution` VALUES ('2', '邮政局');
INSERT INTO `tb_institution` VALUES ('3', '教育部');
INSERT INTO `tb_institution` VALUES ('4', '科技部');
INSERT INTO `tb_institution` VALUES ('6', '工信部');
INSERT INTO `tb_institution` VALUES ('7', '公安部');

-- ----------------------------
-- Table structure for `tb_issuer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_issuer`;
CREATE TABLE `tb_issuer` (
  `is_id` int(11) NOT NULL,
  `is_name` varchar(255) DEFAULT NULL COMMENT '机构名称',
  PRIMARY KEY (`is_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_issuer
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mascot`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mascot`;
CREATE TABLE `tb_mascot` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_content` varchar(2555) DEFAULT NULL,
  `m_title` varchar(255) DEFAULT NULL,
  `m_abstract` varchar(255) DEFAULT NULL,
  `m_issuer` varchar(255) DEFAULT NULL,
  `m_publishtime` datetime DEFAULT NULL,
  `m_createtime` datetime DEFAULT NULL,
  `m_modifier` varchar(255) DEFAULT NULL,
  `m_modifytime` datetime DEFAULT NULL,
  `m_img` varchar(255) DEFAULT NULL,
  `m_settop` int(11) DEFAULT '1',
  `m_publish` int(11) DEFAULT '1',
  `m_order` int(11) DEFAULT '1',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mascot
-- ----------------------------
INSERT INTO `tb_mascot` VALUES ('1', '<p>test</p>', 'test1', 'test', 'admin', '2018-09-12 00:00:00', '2018-09-12 13:52:27', 'admin', '2018-09-12 14:00:13', null, '1', '1', '1');

-- ----------------------------
-- Table structure for `tb_media`
-- ----------------------------
DROP TABLE IF EXISTS `tb_media`;
CREATE TABLE `tb_media` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(255) DEFAULT NULL COMMENT '媒体名称',
  `m_type1` int(11) DEFAULT NULL COMMENT '业务类型 0:创响中国 1:双创活动周',
  `m_type2` int(11) DEFAULT NULL COMMENT '媒体类型  0:图片 1:视频',
  `m_order` int(11) DEFAULT NULL COMMENT '排序',
  `m_link` varchar(255) DEFAULT NULL COMMENT '链接',
  `m_img` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `m_setTop` int(11) DEFAULT '1' COMMENT '置顶',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_media
-- ----------------------------
INSERT INTO `tb_media` VALUES ('1', '2017创响中国杭州站', '0', '0', '0', 'http', '/uploadImgs/bb7c387a81494a2aad949193e5aefe1c.png', '0');
INSERT INTO `tb_media` VALUES ('3', '2018', '0', '0', '5', 'http', '/uploadImgs/244bd9d37b8e4561a546e48454fdddbb.png', '1');

-- ----------------------------
-- Table structure for `tb_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `menu_id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(20) DEFAULT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '系统管理', '', null);
INSERT INTO `tb_menu` VALUES ('2', '业务管理', '', null);
INSERT INTO `tb_menu` VALUES ('5', '用户管理', 'user.html', '1');
INSERT INTO `tb_menu` VALUES ('6', '角色管理', 'role.html', '1');
INSERT INTO `tb_menu` VALUES ('7', '菜单管理', 'menu.html', '1');
INSERT INTO `tb_menu` VALUES ('8', '学生管理', 'student.html', '2');
INSERT INTO `tb_menu` VALUES ('9', '分类管理', 'category.html', '2');
INSERT INTO `tb_menu` VALUES ('21', '首页', '', null);
INSERT INTO `tb_menu` VALUES ('22', '微信/微博二维码管理', 'qrCode.html', '21');
INSERT INTO `tb_menu` VALUES ('23', 'Banner图片管理', 'banner.html', '21');
INSERT INTO `tb_menu` VALUES ('24', '创业群体维护', 'entreGroup.html', '21');
INSERT INTO `tb_menu` VALUES ('25', '动态管理', 'dynamic.html', '21');
INSERT INTO `tb_menu` VALUES ('26', '宣传位管理', 'advert.html', '21');
INSERT INTO `tb_menu` VALUES ('28', '金融宣传位管理', 'fadvert.html', '40');
INSERT INTO `tb_menu` VALUES ('29', '金融资讯管理', 'info.html?code=1', '40');
INSERT INTO `tb_menu` VALUES ('30', '金融机构管理', 'org.html?code=1', '40');
INSERT INTO `tb_menu` VALUES ('31', '技术宣传位管理', 'generalAdvert.html?code=2', '41');
INSERT INTO `tb_menu` VALUES ('32', '技术资讯管理', 'info.html?code=2', '41');
INSERT INTO `tb_menu` VALUES ('33', '技术机构管理', 'org.html?code=2', '41');
INSERT INTO `tb_menu` VALUES ('34', '人才宣传位管理', 'generalAdvert.html?code=3', '42');
INSERT INTO `tb_menu` VALUES ('35', '人才资讯管理', 'info.html?code=3', '42');
INSERT INTO `tb_menu` VALUES ('36', '人才机构管理', 'org.html?code=3', '42');
INSERT INTO `tb_menu` VALUES ('37', '场地宣传位管理', 'generalAdvert.html?code=4', '43');
INSERT INTO `tb_menu` VALUES ('38', '场地资讯管理', 'info.html?code=4', '43');
INSERT INTO `tb_menu` VALUES ('39', '场地机构管理', 'org.html?code=4', '43');
INSERT INTO `tb_menu` VALUES ('40', '金融服务管理', '', null);
INSERT INTO `tb_menu` VALUES ('41', '技术服务管理', '', null);
INSERT INTO `tb_menu` VALUES ('42', '人才服务管理', '', null);
INSERT INTO `tb_menu` VALUES ('43', '场地服务', '', null);
INSERT INTO `tb_menu` VALUES ('44', '成果展示管理', 'achievement.html', '21');
INSERT INTO `tb_menu` VALUES ('45', '活动管理', '', null);
INSERT INTO `tb_menu` VALUES ('46', '全面创新试验', '', null);
INSERT INTO `tb_menu` VALUES ('47', '战略性新兴产业', '', null);
INSERT INTO `tb_menu` VALUES ('49', '政策管理', '', null);
INSERT INTO `tb_menu` VALUES ('50', '媒体管理', 'media.html', '45');
INSERT INTO `tb_menu` VALUES ('51', '活动管理', 'activity.html', '45');
INSERT INTO `tb_menu` VALUES ('52', '吉祥物管理', 'mascot.html', '45');
INSERT INTO `tb_menu` VALUES ('53', '嘉宾管理', 'guest.html', '45');
INSERT INTO `tb_menu` VALUES ('54', '展厅管理', 'exhibitionRoom.html', '45');
INSERT INTO `tb_menu` VALUES ('55', '活动类别管理', 'activityClass.html', '45');
INSERT INTO `tb_menu` VALUES ('56', '中央快讯', 'news.html?code=1', '46');
INSERT INTO `tb_menu` VALUES ('57', '地方报道', 'news.html?code=2', '46');
INSERT INTO `tb_menu` VALUES ('58', '部委信息', 'news.html?code=3', '46');
INSERT INTO `tb_menu` VALUES ('59', '政策资讯', 'news.html?code=4', '46');
INSERT INTO `tb_menu` VALUES ('60', '八大新兴产业管理', 'industryNews.html', '47');
INSERT INTO `tb_menu` VALUES ('61', '地方报道', 'news.html?code=6', '47');
INSERT INTO `tb_menu` VALUES ('62', '政策资讯', 'news.html?code=8', '47');
INSERT INTO `tb_menu` VALUES ('63', '中央快讯', 'news.html?code=5', '47');
INSERT INTO `tb_menu` VALUES ('64', '部委讯息', 'news.html?code=7', '47');
INSERT INTO `tb_menu` VALUES ('65', '政策发布', '', '49');
INSERT INTO `tb_menu` VALUES ('66', '生态圈维护', 'ecosphere.html', '49');
INSERT INTO `tb_menu` VALUES ('67', '时间轴维护', 'timeAxis.html', '49');
INSERT INTO `tb_menu` VALUES ('68', '行业数据维护', 'industry.html', '49');
INSERT INTO `tb_menu` VALUES ('69', '区域数据维护', 'area.html', '49');
INSERT INTO `tb_menu` VALUES ('70', '主题分类维护', 'subjectClassfication.html', '49');
INSERT INTO `tb_menu` VALUES ('71', '政策分类维护', 'policyClassfication.html', '49');
INSERT INTO `tb_menu` VALUES ('72', '产业园推荐', 'industrialPark.html', '49');

-- ----------------------------
-- Table structure for `tb_news`
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_title` varchar(255) DEFAULT NULL,
  `n_abstract` varchar(255) DEFAULT NULL,
  `n_order` int(11) DEFAULT NULL,
  `n_content` varchar(8000) DEFAULT NULL,
  `n_publishtime` datetime DEFAULT '0000-00-00 00:00:00',
  `n_source` varchar(255) DEFAULT NULL,
  `n_publish` int(11) DEFAULT '1',
  `n_type` int(11) DEFAULT NULL,
  `n_settop` int(11) DEFAULT '1',
  `n_modifytime` datetime DEFAULT '0000-00-00 00:00:00',
  `n_createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES ('1', 'test1', null, '0', null, '2018-09-14 11:38:47', null, '0', '1', '0', '0000-00-00 00:00:00', '2018-09-14 11:38:41');
INSERT INTO `tb_news` VALUES ('2', 'test2', 'test', '0', '<p>test</p>', '2018-09-14 00:00:00', 'test12', '1', '1', '0', '2018-09-14 11:41:04', '2018-09-14 11:39:28');
INSERT INTO `tb_news` VALUES ('4', 'test1', 'test', '0', '<p>test</p>', '2018-09-14 00:00:00', 'tset123', '1', '5', '1', '0000-00-00 00:00:00', '2018-09-14 11:51:12');

-- ----------------------------
-- Table structure for `tb_organization`
-- ----------------------------
DROP TABLE IF EXISTS `tb_organization`;
CREATE TABLE `tb_organization` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `org_src` varchar(255) DEFAULT NULL COMMENT '图片保存的路径',
  `org_link` varchar(255) DEFAULT NULL COMMENT '链接',
  `org_order` varchar(255) DEFAULT NULL COMMENT '排序',
  `org_setTop` int(11) DEFAULT NULL COMMENT '置顶设置',
  `org_type` int(11) DEFAULT NULL COMMENT '类别',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_organization
-- ----------------------------
INSERT INTO `tb_organization` VALUES ('1', 'test1', '/uploadImgs/d25d327087a146fcaea2c9d773fbbb09.png', 'http://', '0', '1', '1');
INSERT INTO `tb_organization` VALUES ('2', 'test2', '/uploadImgs/23b432de9b8a4eb993698c7e15c717f9.png', 'http://', '2', '1', '1');

-- ----------------------------
-- Table structure for `tb_policyclassfication`
-- ----------------------------
DROP TABLE IF EXISTS `tb_policyclassfication`;
CREATE TABLE `tb_policyclassfication` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_policyclassfication
-- ----------------------------
INSERT INTO `tb_policyclassfication` VALUES ('1', '综合类');
INSERT INTO `tb_policyclassfication` VALUES ('2', '简政放权');
INSERT INTO `tb_policyclassfication` VALUES ('3', '财税扶持');
INSERT INTO `tb_policyclassfication` VALUES ('4', '创新创业示范');
INSERT INTO `tb_policyclassfication` VALUES ('5', '创业就业');
INSERT INTO `tb_policyclassfication` VALUES ('6', '产业创新');

-- ----------------------------
-- Table structure for `tb_qrcode`
-- ----------------------------
DROP TABLE IF EXISTS `tb_qrcode`;
CREATE TABLE `tb_qrcode` (
  `code_id` int(11) NOT NULL,
  `code_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_qrcode
-- ----------------------------
INSERT INTO `tb_qrcode` VALUES ('1', null);
INSERT INTO `tb_qrcode` VALUES ('2', '/uploadImgs/d9b02092d3cb406b92af8ea314c71d92.jpeg');

-- ----------------------------
-- Table structure for `tb_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  `rights` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '系统管理员', '35822');
INSERT INTO `tb_role` VALUES ('2', '普通用户', '2038792');
INSERT INTO `tb_role` VALUES ('3', '系统用户', '230374');

-- ----------------------------
-- Table structure for `tb_student`
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `student_sex` int(11) DEFAULT NULL,
  `student_age` varchar(255) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `student_no` varchar(255) DEFAULT NULL,
  `student_class` varchar(255) DEFAULT NULL,
  `student_image` varchar(255) DEFAULT NULL,
  `change_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_student
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_subjectclassfication`
-- ----------------------------
DROP TABLE IF EXISTS `tb_subjectclassfication`;
CREATE TABLE `tb_subjectclassfication` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_subjectclassfication
-- ----------------------------
INSERT INTO `tb_subjectclassfication` VALUES ('1', '科技教育');
INSERT INTO `tb_subjectclassfication` VALUES ('2', '公安安全司法');
INSERT INTO `tb_subjectclassfication` VALUES ('3', '市场监管、安全生产监管');
INSERT INTO `tb_subjectclassfication` VALUES ('4', '劳动人事监察');
INSERT INTO `tb_subjectclassfication` VALUES ('5', '财政金融审计');
INSERT INTO `tb_subjectclassfication` VALUES ('6', '国土资源能源');

-- ----------------------------
-- Table structure for `tb_timeaxis`
-- ----------------------------
DROP TABLE IF EXISTS `tb_timeaxis`;
CREATE TABLE `tb_timeaxis` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_timeaxis
-- ----------------------------
INSERT INTO `tb_timeaxis` VALUES ('1', '启动阶段');
INSERT INTO `tb_timeaxis` VALUES ('2', '成长阶段');
INSERT INTO `tb_timeaxis` VALUES ('3', '成熟阶段');
INSERT INTO `tb_timeaxis` VALUES ('4', '准备阶段');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `rights` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'admin', '管理员', '9444732684264177402854', '0', '1', '2018-09-15 12:03:10');
INSERT INTO `tb_user` VALUES ('2', 'user1', '111111', '用户A1a', '40716', '0', '2', null);
INSERT INTO `tb_user` VALUES ('3', 'user2', '111111', '用户B', null, '0', null, '2011-06-13 15:39:08');
INSERT INTO `tb_user` VALUES ('4', 'user3', '111111', '用户3', null, '0', null, '2011-06-13 15:35:42');
INSERT INTO `tb_user` VALUES ('5', 'aaa', '1111', 'aaa', null, '0', null, null);
INSERT INTO `tb_user` VALUES ('6', 'bbb', '111111', 'dsfdsf2', null, '0', '2', null);
INSERT INTO `tb_user` VALUES ('7', 'fffff', '1', 'ddds', null, '0', null, null);
INSERT INTO `tb_user` VALUES ('10', 'abc', '111111', 'dsfdsf2x', null, '0', null, null);
INSERT INTO `tb_user` VALUES ('11', 'user4', '111111', 'afdsf', null, '0', '1', null);
INSERT INTO `tb_user` VALUES ('12', 'test1', '111111', 'aaa', null, '0', null, null);
INSERT INTO `tb_user` VALUES ('13', 'test2', '222222', '222', null, '0', null, null);
INSERT INTO `tb_user` VALUES ('14', 'tes3', '333333', '333', null, '0', null, null);
INSERT INTO `tb_user` VALUES ('15', 'test4', '222222', 'somebody', null, '0', null, null);
INSERT INTO `tb_user` VALUES ('16', 'test5', '111111', 'dsfdsf', null, '0', null, null);
INSERT INTO `tb_user` VALUES ('17', 'test6', '111111', '1', null, '0', null, null);
INSERT INTO `tb_user` VALUES ('18', 'test7', '111111', 'dsfdsf', null, '0', null, null);
