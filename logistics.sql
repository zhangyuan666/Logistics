/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : logistics

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2020-07-13 22:28:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cargo_info
-- ----------------------------
DROP TABLE IF EXISTS `cargo_info`;
CREATE TABLE `cargo_info` (
  `cargo_id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_weight` int(11) NOT NULL,
  `cargo_category` varchar(20) NOT NULL,
  `cargo_name` varchar(30) NOT NULL,
  PRIMARY KEY (`cargo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cargo_info
-- ----------------------------
INSERT INTO `cargo_info` VALUES ('1', '1', '日用品', 'T恤');
INSERT INTO `cargo_info` VALUES ('3', '50', '水果', '西瓜');
INSERT INTO `cargo_info` VALUES ('6', '30', '水果', '西瓜');
INSERT INTO `cargo_info` VALUES ('7', '30', '水果', '西瓜');
INSERT INTO `cargo_info` VALUES ('8', '30', '水果', '西瓜');
INSERT INTO `cargo_info` VALUES ('9', '120', '水果', '西瓜');
INSERT INTO `cargo_info` VALUES ('10', '30', '水果', '西瓜');
INSERT INTO `cargo_info` VALUES ('11', '30', '水果', '西瓜');
INSERT INTO `cargo_info` VALUES ('12', '30', '水果', '西瓜');
INSERT INTO `cargo_info` VALUES ('13', '123', '水果', '菠萝');
INSERT INTO `cargo_info` VALUES ('14', '50', '水果', '桃子');
INSERT INTO `cargo_info` VALUES ('15', '50', '水果', '西瓜');
INSERT INTO `cargo_info` VALUES ('16', '12', '水果', '香蕉');
INSERT INTO `cargo_info` VALUES ('17', '12', '水果', '香蕉');
INSERT INTO `cargo_info` VALUES ('18', '12', '水果', '香蕉');
INSERT INTO `cargo_info` VALUES ('19', '20', '水果', '西瓜');

-- ----------------------------
-- Table structure for courier_info
-- ----------------------------
DROP TABLE IF EXISTS `courier_info`;
CREATE TABLE `courier_info` (
  `courier_id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_name` varchar(30) NOT NULL,
  `courier_tel` varchar(20) NOT NULL,
  `courier_task` varchar(100) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`courier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courier_info
-- ----------------------------
INSERT INTO `courier_info` VALUES ('1', '巴格利', '12345678910', '从服务点A配送给小红', '1');
INSERT INTO `courier_info` VALUES ('2', '阿布', '12345678910', '从服务点A配送给小明', '2');

-- ----------------------------
-- Table structure for driver_info
-- ----------------------------
DROP TABLE IF EXISTS `driver_info`;
CREATE TABLE `driver_info` (
  `driver_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_name` varchar(30) NOT NULL,
  `driver_tel` varchar(20) NOT NULL,
  `driver_task` varchar(100) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver_info
-- ----------------------------
INSERT INTO `driver_info` VALUES ('1', '小波特', '12345678910', '从A到B', '1');
INSERT INTO `driver_info` VALUES ('2', '阿巴', '12345678910', '从B到C', '2');

-- ----------------------------
-- Table structure for logistics_info
-- ----------------------------
DROP TABLE IF EXISTS `logistics_info`;
CREATE TABLE `logistics_info` (
  `logistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) NOT NULL,
  `logistics_info` varchar(100) NOT NULL,
  PRIMARY KEY (`logistics_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_info
-- ----------------------------
INSERT INTO `logistics_info` VALUES ('1', '20200712223835', '已出库');
INSERT INTO `logistics_info` VALUES ('2', '20200712223836', '已入库');
INSERT INTO `logistics_info` VALUES ('4', '20200712223837', '已入库');
INSERT INTO `logistics_info` VALUES ('5', '20200712223838', '已入库');
INSERT INTO `logistics_info` VALUES ('6', '20200712223839', '已入库');
INSERT INTO `logistics_info` VALUES ('7', '20200712223825', '已入库');
INSERT INTO `logistics_info` VALUES ('9', '20200712223834', '已出库');
INSERT INTO `logistics_info` VALUES ('10', '20200712223838', '已出库');
INSERT INTO `logistics_info` VALUES ('11', '20200712224214', '已出库');
INSERT INTO `logistics_info` VALUES ('12', '20200712231541', '已出库');
INSERT INTO `logistics_info` VALUES ('13', '20200712234023', '已出库');
INSERT INTO `logistics_info` VALUES ('14', '20200713005255', '已出库');
INSERT INTO `logistics_info` VALUES ('15', '20200713122017', '已出库');
INSERT INTO `logistics_info` VALUES ('16', '20200712224214', '已出库');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `order_id` varchar(20) NOT NULL,
  `order_creattime` datetime NOT NULL,
  `cargo_id` int(11) NOT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `user_info_id` int(11) NOT NULL,
  `order_state` int(2) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('123456789123456789', '2020-07-04 11:52:43', '1', '2', '1', '1', '1', '1');
INSERT INTO `order_info` VALUES ('20200712223834', '2020-07-12 22:38:34', '11', '2', '1', '7', '0', '1');
INSERT INTO `order_info` VALUES ('20200712223838', '2020-07-12 22:38:38', '12', '2', '2', '7', '0', '1');
INSERT INTO `order_info` VALUES ('20200712224214', '2020-07-12 22:42:14', '13', '2', '1', '7', '0', '1');
INSERT INTO `order_info` VALUES ('20200712231541', '2020-07-12 23:15:41', '14', '2', '2', '7', '0', '1');
INSERT INTO `order_info` VALUES ('20200712234023', '2020-07-12 23:40:23', '15', '2', '1', '7', '0', '1');
INSERT INTO `order_info` VALUES ('20200713122017', '2020-07-13 12:20:17', '19', '2', '1', '14', '0', '3');

-- ----------------------------
-- Table structure for recipient_info
-- ----------------------------
DROP TABLE IF EXISTS `recipient_info`;
CREATE TABLE `recipient_info` (
  `recipient_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient_tel` varchar(20) NOT NULL,
  `recipient_provinces` varchar(50) NOT NULL,
  `recipient_address` varchar(50) NOT NULL,
  `recipient_name` varchar(30) NOT NULL,
  `user_info_id` int(11) NOT NULL,
  PRIMARY KEY (`recipient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recipient_info
-- ----------------------------
INSERT INTO `recipient_info` VALUES ('1', '1234567890', '吉林省长春市朝阳区', '长春大学6543号', '小红', '1');
INSERT INTO `recipient_info` VALUES ('3', '13445645465', '陕西', '宝鸡', '小明', '14');

-- ----------------------------
-- Table structure for send
-- ----------------------------
DROP TABLE IF EXISTS `send`;
CREATE TABLE `send` (
  `send_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_info_id` int(11) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `send_freight` int(20) DEFAULT NULL,
  PRIMARY KEY (`send_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of send
-- ----------------------------
INSERT INTO `send` VALUES ('1', '1', '1', '1', '1', '10000');
INSERT INTO `send` VALUES ('2', '1', '1', '1', '2', '22000');
INSERT INTO `send` VALUES ('3', '1', '1', '2', '4', '50000');
INSERT INTO `send` VALUES ('4', '1', '1', '3', '1', '40000');
INSERT INTO `send` VALUES ('5', '1', '1', '4', '1', '30000');
INSERT INTO `send` VALUES ('6', '1', '1', '5', '1', '60000');
INSERT INTO `send` VALUES ('15', '3', '11', '1', '2', '155');
INSERT INTO `send` VALUES ('16', '3', '12', '1', '2', '155');
INSERT INTO `send` VALUES ('17', '3', '13', '1', '2', '620');
INSERT INTO `send` VALUES ('18', '3', '14', '1', '2', '255');
INSERT INTO `send` VALUES ('19', '3', '15', '1', '1', '255');
INSERT INTO `send` VALUES ('20', '4', '16', '1', '1', '65');
INSERT INTO `send` VALUES ('21', '14', '19', '1', '3', '105');

-- ----------------------------
-- Table structure for service_info
-- ----------------------------
DROP TABLE IF EXISTS `service_info`;
CREATE TABLE `service_info` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(50) NOT NULL,
  `service_address` varchar(100) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_info
-- ----------------------------
INSERT INTO `service_info` VALUES ('1', '菜鸟驿站', '吉林省长春市南关区长春大学5公寓');
INSERT INTO `service_info` VALUES ('2', '妈妈驿站', '吉林省长春市南关区长春大学1公寓');
INSERT INTO `service_info` VALUES ('3', '韵达快递', '吉林省长春市南关区长春大学2公寓');
INSERT INTO `service_info` VALUES ('4', '顺丰驿站', '吉林省长春市南关区长春大学3公寓');
INSERT INTO `service_info` VALUES ('5', '德邦物流', '吉林省长春市南关区长春大学4公寓');

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `mark` varchar(200) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  CONSTRAINT `system_auth_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `system_auth` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_auth
-- ----------------------------
INSERT INTO `system_auth` VALUES ('1', '系统设置', '菜单', '1', null, null);
INSERT INTO `system_auth` VALUES ('2', '用户设置', '页面', '1', '/', '1');
INSERT INTO `system_auth` VALUES ('3', '角色设置', '页面', '2', '/', '1');
INSERT INTO `system_auth` VALUES ('4', '权限设置', '页面', '3', '/', '1');
INSERT INTO `system_auth` VALUES ('14', '用户设置页面', '权限', '1', '/system/user/user.action', '2');
INSERT INTO `system_auth` VALUES ('15', '查询按钮', '权限', '2', '/system/user/query.action', '2');
INSERT INTO `system_auth` VALUES ('16', '新增功能', '权限', '3', '/', '2');
INSERT INTO `system_auth` VALUES ('17', '修改功能', '权限', '4', '/', '2');
INSERT INTO `system_auth` VALUES ('18', '删除按钮', '权限', '5', '/system/user/remove.action', '2');
INSERT INTO `system_auth` VALUES ('19', '重置密码按钮', '权限', '6', '/system/user/resetPwd.action', '2');
INSERT INTO `system_auth` VALUES ('20', '保存按钮', '权限', '1', '/system/user/addUser.action', '16');
INSERT INTO `system_auth` VALUES ('21', '保存按钮', '权限', '1', '/system/user/editUser.action', '17');
INSERT INTO `system_auth` VALUES ('22', '新增页面', '点击【新增】按钮', '2', '/system/user/userAdd.action', '16');
INSERT INTO `system_auth` VALUES ('23', '修改页面', '点击【修改】按钮', '2', '/system/user/userEdit.action', '17');
INSERT INTO `system_auth` VALUES ('25', '部门管理', '菜单', '2', null, null);
INSERT INTO `system_auth` VALUES ('26', '人员管理', '菜单', '3', null, null);
INSERT INTO `system_auth` VALUES ('27', '服务管理', '菜单', '4', null, null);
INSERT INTO `system_auth` VALUES ('28', '服务点管理', '页面', '1', '/', '25');
INSERT INTO `system_auth` VALUES ('29', '仓库管理', '页面', '2', '/', '25');
INSERT INTO `system_auth` VALUES ('30', '快递员管理', '页面', '1', '/', '26');
INSERT INTO `system_auth` VALUES ('31', '配送员管理', '页面', '2', '/', '26');
INSERT INTO `system_auth` VALUES ('32', '订单管理', '页面', '1', '/', '27');
INSERT INTO `system_auth` VALUES ('33', '收益统计', '页面', '2', '/', '27');
INSERT INTO `system_auth` VALUES ('37', '服务点管理页面', '权限', '1', '/department/serviceInfo/serviceInfo.action', '28');
INSERT INTO `system_auth` VALUES ('40', '仓库管理页面', '权限', '2', '/department/warehouse/warehouse.action', '29');
INSERT INTO `system_auth` VALUES ('41', '快递员管理页面', '权限', '1', '/personnel/courierInfo/courierInfo.action', '30');
INSERT INTO `system_auth` VALUES ('42', '配送员管理页面', '权限', '2', '/personnel/driverInfo/driverInfo.action', '31');
INSERT INTO `system_auth` VALUES ('43', '订单管理页面', '权限', '1', '/service/order/order.action', '32');
INSERT INTO `system_auth` VALUES ('44', '收益统计页面', '权限', '2', '/service/statistical/statistical.action', '33');
INSERT INTO `system_auth` VALUES ('45', '查询按钮', '权限', '2', '/department/serviceInfo/query.action', '28');
INSERT INTO `system_auth` VALUES ('46', '查询按钮', '权限', '2', '/department/warehouse/query.action', '29');
INSERT INTO `system_auth` VALUES ('47', '查询按钮', '权限', '2', '/personnel/courierInfo/query.action', '30');
INSERT INTO `system_auth` VALUES ('48', '查询按钮', '权限', '2', '/personnel/driverInfo/query.action', '31');
INSERT INTO `system_auth` VALUES ('49', '查询按钮', '权限', '2', '/service/order/query.action', '32');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `mark` varchar(100) DEFAULT NULL,
  `createid` varchar(20) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `modifyid` varchar(20) DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('1', '管理员', '拥有系统所有权限', 'admin', '2020-06-07 18:41:20', 'admin', '2020-07-13 21:35:40');
INSERT INTO `system_role` VALUES ('2', '普通用户', '个人使用用户，权限有限', 'admin', '2020-06-07 19:02:22', 'admin', '2020-06-16 17:49:54');
INSERT INTO `system_role` VALUES ('4', '仓库管理员', '管理配送员，进行收货与发货', 'admin', '2020-06-07 19:47:00', 'admin', '2020-07-13 22:11:03');
INSERT INTO `system_role` VALUES ('5', '快递员', '在用户，服务点，仓库三者之间进行货物配送，并且更新物流信息', 'admin', '2020-06-07 19:47:40', 'admin', '2020-07-13 22:11:09');
INSERT INTO `system_role` VALUES ('6', '配送员', '在仓库之间进行货物运输，并且更新物流信息', 'admin', '2020-07-13 21:22:11', 'admin', '2020-07-13 22:11:13');
INSERT INTO `system_role` VALUES ('7', '服务点管理员', '管理快递员，进行揽件与配送', 'admin', '2020-07-13 21:27:46', 'admin', '2020-07-13 22:11:16');

-- ----------------------------
-- Table structure for system_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_role_auth`;
CREATE TABLE `system_role_auth` (
  `roleid` int(11) DEFAULT NULL,
  `authid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_role_auth
-- ----------------------------
INSERT INTO `system_role_auth` VALUES ('2', '14');
INSERT INTO `system_role_auth` VALUES ('2', '15');
INSERT INTO `system_role_auth` VALUES ('2', '17');
INSERT INTO `system_role_auth` VALUES ('2', '21');
INSERT INTO `system_role_auth` VALUES ('2', '23');
INSERT INTO `system_role_auth` VALUES ('1', '1');
INSERT INTO `system_role_auth` VALUES ('1', '2');
INSERT INTO `system_role_auth` VALUES ('1', '14');
INSERT INTO `system_role_auth` VALUES ('1', '15');
INSERT INTO `system_role_auth` VALUES ('1', '16');
INSERT INTO `system_role_auth` VALUES ('1', '20');
INSERT INTO `system_role_auth` VALUES ('1', '22');
INSERT INTO `system_role_auth` VALUES ('1', '17');
INSERT INTO `system_role_auth` VALUES ('1', '21');
INSERT INTO `system_role_auth` VALUES ('1', '23');
INSERT INTO `system_role_auth` VALUES ('1', '18');
INSERT INTO `system_role_auth` VALUES ('1', '19');
INSERT INTO `system_role_auth` VALUES ('1', '3');
INSERT INTO `system_role_auth` VALUES ('1', '4');
INSERT INTO `system_role_auth` VALUES ('1', '25');
INSERT INTO `system_role_auth` VALUES ('1', '28');
INSERT INTO `system_role_auth` VALUES ('1', '29');
INSERT INTO `system_role_auth` VALUES ('1', '26');
INSERT INTO `system_role_auth` VALUES ('1', '30');
INSERT INTO `system_role_auth` VALUES ('1', '31');
INSERT INTO `system_role_auth` VALUES ('1', '27');
INSERT INTO `system_role_auth` VALUES ('1', '32');
INSERT INTO `system_role_auth` VALUES ('1', '33');
INSERT INTO `system_role_auth` VALUES ('4', '29');
INSERT INTO `system_role_auth` VALUES ('4', '31');
INSERT INTO `system_role_auth` VALUES ('4', '40');
INSERT INTO `system_role_auth` VALUES ('4', '46');
INSERT INTO `system_role_auth` VALUES ('4', '42');
INSERT INTO `system_role_auth` VALUES ('4', '48');
INSERT INTO `system_role_auth` VALUES ('5', '30');
INSERT INTO `system_role_auth` VALUES ('5', '41');
INSERT INTO `system_role_auth` VALUES ('5', '47');
INSERT INTO `system_role_auth` VALUES ('6', '31');
INSERT INTO `system_role_auth` VALUES ('6', '42');
INSERT INTO `system_role_auth` VALUES ('6', '48');
INSERT INTO `system_role_auth` VALUES ('7', '28');
INSERT INTO `system_role_auth` VALUES ('7', '30');
INSERT INTO `system_role_auth` VALUES ('7', '37');
INSERT INTO `system_role_auth` VALUES ('7', '45');
INSERT INTO `system_role_auth` VALUES ('7', '41');
INSERT INTO `system_role_auth` VALUES ('7', '47');

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` varchar(20) NOT NULL COMMENT '账号',
  `name` varchar(40) DEFAULT NULL COMMENT '昵称',
  `password` char(32) DEFAULT NULL COMMENT '密码 MD5加密32位',
  `status` char(1) DEFAULT NULL COMMENT '账户状态  0-正常 1-锁定',
  `createid` varchar(20) DEFAULT NULL COMMENT '数据创建人ID',
  `createtime` datetime DEFAULT NULL COMMENT '数据创建时间',
  `modifyid` varchar(20) DEFAULT NULL COMMENT '最后一次修改数据人ID',
  `modifytime` datetime DEFAULT NULL COMMENT '最后一次数据的修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1024', '123456', 'a3aca2964e72000eea4c56cb341002a4', '0', 'admin', '2020-06-08 11:30:27', 'admin', '2020-07-13 22:08:43');
INSERT INTO `system_user` VALUES ('111', '111', '698d51a19d8a121ce581499d7b701668', '0', 'admin', '2020-06-12 23:58:21', 'admin', '2020-07-13 22:09:39');
INSERT INTO `system_user` VALUES ('33', '33', '182be0c5cdcd5072bb1864cdee4d3d6e', '1', 'admin', '2020-06-06 10:19:42', 'admin', '2020-07-13 22:08:52');
INSERT INTO `system_user` VALUES ('a11', '张三', '81dc9bdb52d04dc20036dbd8313ed055', '0', 'admin', '2020-06-21 11:25:10', 'admin', '2020-06-23 20:48:04');
INSERT INTO `system_user` VALUES ('aaa', 'aaa', '81dc9bdb52d04dc20036dbd8313ed055', '0', 'admin', '2020-06-12 16:35:35', 'admin', '2020-07-13 22:09:01');
INSERT INTO `system_user` VALUES ('admin', '管理员', '21232f297a57a5a743894a0e4a801fc3', '0', 'admin', '2020-05-31 12:29:50', 'admin', '2020-07-13 22:13:31');
INSERT INTO `system_user` VALUES ('b11', '李四', '9996535e07258a7bbfd8b132435c5962', '0', 'admin', '2020-06-21 11:25:10', 'admin', '2020-07-13 22:09:09');
INSERT INTO `system_user` VALUES ('c11', '王五', '7bccfde7714a1ebadf06c5f4cea752c1', '0', 'admin', '2020-06-21 11:25:10', 'admin', '2020-07-13 22:09:16');
INSERT INTO `system_user` VALUES ('hhh', 'hhh', '81dc9bdb52d04dc20036dbd8313ed055', '0', 'admin', '2020-06-15 23:15:31', 'admin', '2020-07-13 22:09:35');
INSERT INTO `system_user` VALUES ('qqq', 'qqq', '81dc9bdb52d04dc20036dbd8313ed055', '0', 'admin', '2020-06-12 16:35:13', 'admin', '2020-07-13 22:09:23');
INSERT INTO `system_user` VALUES ('rrr', 'rrr', '44f437ced647ec3f40fa0841041871cd', '0', 'admin', '2020-06-16 18:02:49', 'admin', '2020-07-13 22:10:08');
INSERT INTO `system_user` VALUES ('sss', 'sss', '9f6e6800cfae7749eb6c486619254b9c', '0', 'admin', '2020-06-16 18:02:59', 'admin', '2020-07-13 22:10:28');
INSERT INTO `system_user` VALUES ('xxx', 'xxx', 'f561aaf6ef0bf14d4208bb46a4ccb3ad', '0', 'admin', '2020-06-16 18:03:16', 'admin', '2020-07-13 22:10:23');
INSERT INTO `system_user` VALUES ('zzz', 'zzz', 'f3abb86bd34cf4d52698f14c0da1dc60', '0', 'admin', '2020-06-16 18:03:08', 'admin', '2020-07-13 22:10:16');

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `userid` varchar(20) DEFAULT NULL,
  `roleid` int(20) DEFAULT NULL,
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `system_user_role_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `system_user` (`id`),
  CONSTRAINT `system_user_role_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `system_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES ('a11', '4');
INSERT INTO `system_user_role` VALUES ('1024', '7');
INSERT INTO `system_user_role` VALUES ('33', '6');
INSERT INTO `system_user_role` VALUES ('aaa', '5');
INSERT INTO `system_user_role` VALUES ('b11', '6');
INSERT INTO `system_user_role` VALUES ('c11', '7');
INSERT INTO `system_user_role` VALUES ('qqq', '1');
INSERT INTO `system_user_role` VALUES ('hhh', '2');
INSERT INTO `system_user_role` VALUES ('111', '5');
INSERT INTO `system_user_role` VALUES ('rrr', '2');
INSERT INTO `system_user_role` VALUES ('zzz', '2');
INSERT INTO `system_user_role` VALUES ('xxx', '2');
INSERT INTO `system_user_role` VALUES ('sss', '2');
INSERT INTO `system_user_role` VALUES ('admin', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_tel` varchar(20) NOT NULL,
  `user_provinces` varchar(50) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  PRIMARY KEY (`user_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '12345678910', '吉林省长春市朝阳区', '长春大学6543号', 'zhangyuan', '柯林斯');
INSERT INTO `user_info` VALUES ('2', '12345678910', '陕西宝鸡', '宝鸡文理学院', 'wahaha', '阿姆');
INSERT INTO `user_info` VALUES ('7', '12345678910', '陕西省宝鸡市', '宝鸡大学', '123', '作业');
INSERT INTO `user_info` VALUES ('8', '12345678910', '陕西省宝鸡市', '宝鸡大学', '456', '作业');
INSERT INTO `user_info` VALUES ('9', '12345678910', '陕西省宝鸡市', '宝鸡大学', '456', '作业');
INSERT INTO `user_info` VALUES ('10', '12345678910', '陕西省宝鸡市', '宝鸡大学', '789', '作业');
INSERT INTO `user_info` VALUES ('11', '12345678910', '陕西省宝鸡市', '宝鸡大学', '147', '作业');
INSERT INTO `user_info` VALUES ('12', '12345678910', '陕西省宝鸡市', '宝鸡大学', '258', '作业');
INSERT INTO `user_info` VALUES ('13', '12345678910', '陕西省宝鸡市', '宝鸡大学', '369', '作业');
INSERT INTO `user_info` VALUES ('14', '12345678910', '陕西省宝鸡市', '宝鸡大学', '888', '傻狗');

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `user_id` varchar(30) NOT NULL,
  `user_nickname` varchar(40) DEFAULT NULL,
  `user_pwd` varchar(32) DEFAULT NULL,
  `user_tel` char(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES ('123', 'zhangyuan', '202cb962ac59075b964b07152d234b70', '12345678910');
INSERT INTO `user_login` VALUES ('1234', 'zhangyuan', '81dc9bdb52d04dc20036dbd8313ed055', '12345678910');
INSERT INTO `user_login` VALUES ('147', 'hhhh', '202cb962ac59075b964b07152d234b70', '12345678910');
INSERT INTO `user_login` VALUES ('258', 'hhhh', '202cb962ac59075b964b07152d234b70', '12345678910');
INSERT INTO `user_login` VALUES ('369', 'hhhh', '202cb962ac59075b964b07152d234b70', '12345678910');
INSERT INTO `user_login` VALUES ('456', 'hhhh', '81dc9bdb52d04dc20036dbd8313ed055', '12345678910');
INSERT INTO `user_login` VALUES ('789', 'hhhh', '202cb962ac59075b964b07152d234b70', '12345678910');
INSERT INTO `user_login` VALUES ('888', 'hhhh', '202cb962ac59075b964b07152d234b70', '12345678910');
INSERT INTO `user_login` VALUES ('wahaha', '张三', 'a3aca2964e72000eea4c56cb341002a4', '12345678910');
INSERT INTO `user_login` VALUES ('zhangyuan', '张源', 'a3aca2964e72000eea4c56cb341002a4', '12345678910');
INSERT INTO `user_login` VALUES ('zy', '王五', '81dc9bdb52d04dc20036dbd8313ed055', '12345678910');

-- ----------------------------
-- Table structure for warehouse_info
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_info`;
CREATE TABLE `warehouse_info` (
  `warehouse_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(50) NOT NULL,
  `warehouse_address` varchar(100) NOT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse_info
-- ----------------------------
INSERT INTO `warehouse_info` VALUES ('1', '天天仓库', '陕西省宝鸡市渭滨区123号');
INSERT INTO `warehouse_info` VALUES ('2', '第一仓库', '吉林省长春市南关区');
