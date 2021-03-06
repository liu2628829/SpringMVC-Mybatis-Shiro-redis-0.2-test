/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-11-03 11:42:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authenticate
-- ----------------------------
DROP TABLE IF EXISTS `authenticate`;
CREATE TABLE `authenticate` (
  `id` bigint(20) NOT NULL,
  `realName` varchar(30) DEFAULT NULL COMMENT '用户真实姓名',
  `idCard` varchar(30) DEFAULT NULL COMMENT '身份证号码',
  `idFimage` varchar(128) DEFAULT NULL COMMENT '身份证正面图片(url)',
  `idBimage` varchar(128) DEFAULT NULL COMMENT '身份证背面图片(url)',
  `licenceNum` varchar(30) DEFAULT NULL COMMENT '18/15位证书编号',
  `licenceImage` varchar(128) DEFAULT NULL COMMENT '营业证书图片(url)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authenticate
-- ----------------------------

-- ----------------------------
-- Table structure for authenticate_company
-- ----------------------------
DROP TABLE IF EXISTS `authenticate_company`;
CREATE TABLE `authenticate_company` (
  `id` bigint(20) NOT NULL,
  `authenticateId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authenticate_company
-- ----------------------------

-- ----------------------------
-- Table structure for authenticate_user
-- ----------------------------
DROP TABLE IF EXISTS `authenticate_user`;
CREATE TABLE `authenticate_user` (
  `id` bigint(20) NOT NULL,
  `authenticateId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authenticate_user
-- ----------------------------

-- ----------------------------
-- Table structure for community_user
-- ----------------------------
DROP TABLE IF EXISTS `community_user`;
CREATE TABLE `community_user` (
  `id` bigint(20) NOT NULL,
  `communityId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL COMMENT '小区住户的userId',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community_user
-- ----------------------------

-- ----------------------------
-- Table structure for company_user
-- ----------------------------
DROP TABLE IF EXISTS `company_user`;
CREATE TABLE `company_user` (
  `id` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL COMMENT '员工的userId',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_user
-- ----------------------------

-- ----------------------------
-- Table structure for c_community
-- ----------------------------
DROP TABLE IF EXISTS `c_community`;
CREATE TABLE `c_community` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL COMMENT '小区地址',
  `buildingNum` int(20) DEFAULT NULL COMMENT '楼盘数',
  `companyId` bigint(20) DEFAULT NULL COMMENT '所属物业公司的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_community
-- ----------------------------

-- ----------------------------
-- Table structure for c_company
-- ----------------------------
DROP TABLE IF EXISTS `c_company`;
CREATE TABLE `c_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET ascii DEFAULT NULL COMMENT '物业公司名',
  `userId` bigint(20) DEFAULT NULL COMMENT '企业申请人的userId',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_company
-- ----------------------------

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` bigint(20) NOT NULL COMMENT '审核表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for u_permission
-- ----------------------------
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_permission
-- ----------------------------
INSERT INTO `u_permission` VALUES ('4', '/permission/index.shtml', '权限列表');
INSERT INTO `u_permission` VALUES ('6', '/permission/addPermission.shtml', '权限添加');
INSERT INTO `u_permission` VALUES ('7', '/permission/deletePermissionById.shtml', '权限删除');
INSERT INTO `u_permission` VALUES ('8', '/member/list.shtml', '用户列表');
INSERT INTO `u_permission` VALUES ('9', '/member/online.shtml', '在线用户');
INSERT INTO `u_permission` VALUES ('10', '/member/changeSessionStatus.shtml', '用户Session踢出');
INSERT INTO `u_permission` VALUES ('11', '/member/forbidUserById.shtml', '用户激活&禁止');
INSERT INTO `u_permission` VALUES ('12', '/member/deleteUserById.shtml', '用户删除');
INSERT INTO `u_permission` VALUES ('13', '/permission/addPermission2Role.shtml', '权限分配');
INSERT INTO `u_permission` VALUES ('14', '/role/clearRoleByUserIds.shtml', '用户角色分配清空');
INSERT INTO `u_permission` VALUES ('15', '/role/addRole2User.shtml', '角色分配保存');
INSERT INTO `u_permission` VALUES ('16', '/role/deleteRoleById.shtml', '角色列表删除');
INSERT INTO `u_permission` VALUES ('17', '/role/addRole.shtml', '角色列表添加');
INSERT INTO `u_permission` VALUES ('18', '/role/index.shtml', '角色列表');
INSERT INTO `u_permission` VALUES ('19', '/permission/allocation.shtml', '权限分配');
INSERT INTO `u_permission` VALUES ('20', '/role/allocation.shtml', '角色分配');

-- ----------------------------
-- Table structure for u_role
-- ----------------------------
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role
-- ----------------------------
INSERT INTO `u_role` VALUES ('1', '系统管理员', '888888');
INSERT INTO `u_role` VALUES ('3', '权限角色', '100003');
INSERT INTO `u_role` VALUES ('4', '用户中心', '100002');
INSERT INTO `u_role` VALUES ('5', '企业用户', '888888');
INSERT INTO `u_role` VALUES ('6', '普通用户', '100002');

-- ----------------------------
-- Table structure for u_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role_permission
-- ----------------------------
INSERT INTO `u_role_permission` VALUES ('4', '8');
INSERT INTO `u_role_permission` VALUES ('4', '9');
INSERT INTO `u_role_permission` VALUES ('4', '10');
INSERT INTO `u_role_permission` VALUES ('4', '11');
INSERT INTO `u_role_permission` VALUES ('4', '12');
INSERT INTO `u_role_permission` VALUES ('3', '4');
INSERT INTO `u_role_permission` VALUES ('3', '6');
INSERT INTO `u_role_permission` VALUES ('3', '7');
INSERT INTO `u_role_permission` VALUES ('3', '13');
INSERT INTO `u_role_permission` VALUES ('3', '14');
INSERT INTO `u_role_permission` VALUES ('3', '15');
INSERT INTO `u_role_permission` VALUES ('3', '16');
INSERT INTO `u_role_permission` VALUES ('3', '17');
INSERT INTO `u_role_permission` VALUES ('3', '18');
INSERT INTO `u_role_permission` VALUES ('3', '19');
INSERT INTO `u_role_permission` VALUES ('3', '20');
INSERT INTO `u_role_permission` VALUES ('1', '4');
INSERT INTO `u_role_permission` VALUES ('1', '6');
INSERT INTO `u_role_permission` VALUES ('1', '7');
INSERT INTO `u_role_permission` VALUES ('1', '8');
INSERT INTO `u_role_permission` VALUES ('1', '9');
INSERT INTO `u_role_permission` VALUES ('1', '10');
INSERT INTO `u_role_permission` VALUES ('1', '11');
INSERT INTO `u_role_permission` VALUES ('1', '12');
INSERT INTO `u_role_permission` VALUES ('1', '13');
INSERT INTO `u_role_permission` VALUES ('1', '14');
INSERT INTO `u_role_permission` VALUES ('1', '15');
INSERT INTO `u_role_permission` VALUES ('1', '16');
INSERT INTO `u_role_permission` VALUES ('1', '17');
INSERT INTO `u_role_permission` VALUES ('1', '18');
INSERT INTO `u_role_permission` VALUES ('1', '19');
INSERT INTO `u_role_permission` VALUES ('1', '20');

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) DEFAULT NULL COMMENT '用户昵称',
  `phone` varchar(128) DEFAULT NULL COMMENT '手机号|登录帐号',
  `loginName` varchar(20) DEFAULT NULL COMMENT '登录账号',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `sessionId` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  `sex` int(8) DEFAULT NULL,
  `age` int(8) DEFAULT NULL,
  `register_count` varchar(20) DEFAULT NULL,
  `user_logo` varchar(100) DEFAULT NULL COMMENT '用户头像（url）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', '管理员', 'admin', 'admin', '57eb72e6b78a87a12d46a7f5e9315138', null, '2016-06-16 11:15:33', '2017-11-02 16:10:51', '1', null, '53', null, null);
INSERT INTO `u_user` VALUES ('3', 'dick', '13902588133', 'admin1', '0d53f25a0ba6a9f96ef2227c4450fcdf', null, '2017-10-22 16:35:38', '2017-10-22 16:35:38', '1', null, '34', null, null);
INSERT INTO `u_user` VALUES ('11', 'soso', '8446666@qq.com', '2', 'd57ffbe486910dd5b26d0167d034f9ad', null, '2016-05-26 20:50:54', '2016-06-16 11:24:35', '1', null, '35', null, null);
INSERT INTO `u_user` VALUES ('12', '8446666', '8446666', 'admin3', '4afdc875a67a55528c224ce088be2ab8', null, '2016-05-27 22:34:19', '2016-06-15 17:03:16', '1', null, '54', null, null);
INSERT INTO `u_user` VALUES ('13', 'sdasd', '15519089033', 'fff', '5de0a59a06401ad1a2cf5c5f0b9e99e6', null, '2017-10-13 14:13:03', '2017-11-01 11:30:31', '1', null, '51', null, null);
INSERT INTO `u_user` VALUES ('14', 'dobe', '123', 'admin4', '375fd02e07579a5a2caac1592d04aed0', null, '2017-10-26 17:08:00', '2017-10-26 17:08:00', '1', null, null, null, null);
INSERT INTO `u_user` VALUES ('15', 'aop', '1234', 'admin5', 'c6cb5067b1369f3c80d860508dcc4e9b', null, '2017-10-26 17:13:37', '2017-10-31 17:14:02', '1', null, null, null, null);
INSERT INTO `u_user` VALUES ('16', 'gr', '1111111', 'woaini', 'c35c0724734c34786707352f6276c799', null, '2017-11-01 11:46:12', '2017-11-01 11:46:13', '1', null, null, null, null);
INSERT INTO `u_user` VALUES ('17', '123456789', '844633', 'hkjh', 'fa1d6cf4a32c30953ec82ef1627df569', null, '2017-11-02 16:29:13', '2017-11-02 16:29:13', '1', null, null, null, null);
INSERT INTO `u_user` VALUES ('18', '123456789', null, '844633', '3c96a7a87b8706856019355166dc5a3f', null, '2017-11-02 16:42:54', '2017-11-02 16:42:55', '1', null, null, null, null);

-- ----------------------------
-- Table structure for u_user_role
-- ----------------------------
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user_role
-- ----------------------------
INSERT INTO `u_user_role` VALUES ('12', '4');
INSERT INTO `u_user_role` VALUES ('11', '3');
INSERT INTO `u_user_role` VALUES ('11', '4');
INSERT INTO `u_user_role` VALUES ('1', '1');
