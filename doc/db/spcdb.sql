/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50168
Source Host           : localhost:3306
Source Database       : spcdb

Target Server Type    : MYSQL
Target Server Version : 50168
File Encoding         : 65001

Date: 2019-05-22 14:17:10
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `dict_id` varchar(32) NOT NULL DEFAULT '',
  `dict_code` varchar(30) DEFAULT NULL,
  `dict_name` varchar(100) DEFAULT NULL,
  `dict_val` varchar(30) DEFAULT NULL,
  `dict_type` varchar(10) DEFAULT NULL,
  `level_code` varchar(30) DEFAULT NULL,
  `par_code` varchar(30) DEFAULT NULL,
  `par_name` varchar(100) DEFAULT NULL,
  `status` decimal(10,0) DEFAULT NULL,
  `sort` decimal(10,0) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('343700E3B58247D8AFCECCB655056201', 'WEIXIN', '微信支付', '12', '1', '000001000001', 'PAY', '支付方式', '2', '1', '微信支付');
INSERT INTO `dictionary` VALUES ('49B6B564F39F447185A49A6D97D375A1', 'ALIPAY', '支付宝', '3', '1', '000001000002', 'PAY', '支付方式', '2', '1', '支付宝支付');
INSERT INTO `dictionary` VALUES ('567468741AFF479F8499CB4EFA2C3869', 'VIP', '永久', null, '1', '000002000001', 'MEMBERTYPE', '会员卡类型', '1', '1', null);
INSERT INTO `dictionary` VALUES ('587CA02E3CFF4BA1BDB3D37F4F9BF9E5', 'TIMES', '计次', null, '1', '000002000002', 'MEMBERTYPE', '会员卡类型', '1', '2', null);
INSERT INTO `dictionary` VALUES ('DF90D29CF6294786A27F3D1BF137FC13', 'PAY', '支付方式', '', '1', '000001', '0', '系统字典', '2', '1', '');
INSERT INTO `dictionary` VALUES ('E2ECD9E51287429AA2E9F8C55FCE03B1', 'MEMBERTYPE', '会员卡类型', '23', '1', '000002', '0', '系统字典', '1', '2', '21333');

-- ----------------------------
-- Table structure for `func`
-- ----------------------------
DROP TABLE IF EXISTS `func`;
CREATE TABLE `func` (
  `func_id` varchar(32) NOT NULL DEFAULT '',
  `func_code` varchar(50) DEFAULT NULL,
  `func_name` varchar(50) DEFAULT NULL,
  `func_type` varchar(10) DEFAULT NULL,
  `level_code` varchar(30) DEFAULT NULL,
  `par_code` varchar(50) DEFAULT NULL,
  `par_name` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `status` decimal(10,0) DEFAULT NULL,
  `sort` decimal(10,0) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`func_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of func
-- ----------------------------
INSERT INTO `func` VALUES ('04ADCFE2C5DB4869884B2288846E41B5', 'SYSMGR', '系统管理', '0', '000001', '0', '系统菜单', null, 'fa fa-tv', '1', '99', null);
INSERT INTO `func` VALUES ('1EF2775F521F4CF1952C679D8001B1F8', 'FUNCS', '功能管理', '1', '000001000003', 'SYSMGR', '系统管理', '/pages/base/funcs.jsp', 'fa fa-cog', '1', '3', null);
INSERT INTO `func` VALUES ('1EFA34291B7B4A988EFDBB99DF41A211', 'DEPARTMENTS', '组织机构管理', '1', '000001000002', 'SYSMGR', '系统管理', '/pages/base/orgs.jsp', 'fa fa-sitemap', '1', '2', null);
INSERT INTO `func` VALUES ('4C8D6FD38B9A4E2BA13A623F2B7EA312', 'LOGS', '日志查询', '1', '000001000008', 'SYSMGR', '系统管理', '/pages/base/logs.jsp', 'fa fa-file-text-o', '1', '8', null);
INSERT INTO `func` VALUES ('5F00C78692724F0DB875A448C25341A0', 'USERS', '用户管理', '1', '000001000001', 'SYSMGR', '系统管理', '/pages/base/users.jsp', 'fa fa-user', '1', '2', null);
INSERT INTO `func` VALUES ('62388BF17E0545178AA77E6C650D7E2E', 'ROLES', '角色管理', '1', '000001000004', 'SYSMGR', '系统管理', '/pages/base/roles.jsp', 'fa fa-street-view', '1', '4', null);
INSERT INTO `func` VALUES ('8C35FB2062CA44B589EF0081C3BCF547', 'MEMBER_MGR', '会员管理', '0', '000002', '0', '系统菜单', null, 'fa fa-users', '1', '2', null);
INSERT INTO `func` VALUES ('ACBFFF58C6C9471C882D06A243DA0219', 'PARAMS', '参数管理', '1', '000001000007', 'SYSMGR', '系统管理', '/pages/base/params.jsp', 'fa fa-wrench', '1', '7', null);
INSERT INTO `func` VALUES ('BB22945158AA46B4AEDB76EF5AB16F48', 'MEMBERINFO', '会员管理', '1', '000002000001', 'MEMBER_MGR', '会员管理', '/pages/member/members.jsp', 'fa fa-user', '1', '1', null);
INSERT INTO `func` VALUES ('C497060813934FADA7847BDB10C2564A', 'USERS_REG_FINGER', '注册指纹', '2', '000001000001000001', 'USERS', '用户管理', null, 'fa fa-hand-paper-o', '1', '1', null);
INSERT INTO `func` VALUES ('CCB09EE427ED417FB93712C3E5067EE0', 'AUTH', '角色授权', '1', '000001000005', 'SYSMGR', '系统管理', '/pages/base/auths.jsp', 'fa fa-key', '1', '5', null);
INSERT INTO `func` VALUES ('F714F21A7F444B93A89F669AB63C23D2', 'DICTS', '字典管理', '1', '000001000006', 'SYSMGR', '系统管理', '/pages/base/dicts.jsp', 'fa fa-book', '1', '6', null);

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` varchar(32) NOT NULL DEFAULT '',
  `user_code` varchar(30) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `client_ip` varchar(20) DEFAULT NULL,
  `operate_type` varchar(2) DEFAULT NULL,
  `operate_time` datetime DEFAULT NULL,
  `operate_content` varchar(500) DEFAULT NULL,
  `operate_condition` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('003F3188032F42E98F52216C63445F3B', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 14:34:44', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('01592BFE3A41476A8D4BB13C3BB16D7F', 'zhangsan', '张三', '127.0.0.1', '', '2017-09-16 13:09:13', '用户登录[张三]', '');
INSERT INTO `log` VALUES ('02D5D6901564426CB5B47768902C17C5', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 11:49:18', '重置密码[zhaoliu]', 'zhaoliu');
INSERT INTO `log` VALUES ('0ADC7C8B6A554D76B15B00923D421A88', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:16:20', '修改角色[ADMIN-管理员]', '');
INSERT INTO `log` VALUES ('0C9E8FD6ABD3493499126A93CC2F6C5B', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 11:41:21', '重置密码[李四]', 'lisi');
INSERT INTO `log` VALUES ('114ECFD3DFE740A6A83769E402E4550A', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 13:05:50', '修改角色授权，角色代码[CURATOR]', '');
INSERT INTO `log` VALUES ('11B1A00635584DA198DDCDE0A8437965', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 16:58:10', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('11FC5EABB09C418DB95D7E2FFCABEE2F', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-16 20:04:06', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('14300E996B0F414E8EEC76ECDD6A548A', 'admin', '管理员', '127.0.0.1', 'A', '2017-09-16 18:38:36', '新增用户[212-121]', '');
INSERT INTO `log` VALUES ('150EB7C354D2439495FA10CF613F89C4', 'admin', '管理员', '127.0.0.1', 'A', '2017-09-16 13:35:12', '新增功能[MEMBERINFO-会员信息管理]', '');
INSERT INTO `log` VALUES ('15AB42A1D89D4EC194DB4AEFF322E0CA', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 18:43:09', '重置密码[赵六]', 'zhaoliu');
INSERT INTO `log` VALUES ('19EFE85B6330412E8C6903AAF06DE51F', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:56:38', '修改用户[tian-田]', '');
INSERT INTO `log` VALUES ('1DC9DDCAEBD142AB91543A61D890AF66', 'superadmin', '超级管理员', '192.168.8.245', 'U', '2017-09-14 22:35:48', '修改角色授权[角色编码:COMM]', '');
INSERT INTO `log` VALUES ('1EC80CB7CAFA4697A4776091CDB86DC5', 'superadmin', '超级管理员', '127.0.0.1', 'D', '2017-09-16 13:01:48', '删除用户授权，用户代码[zhangsan]', '');
INSERT INTO `log` VALUES ('20057581DB29413E8FD569ABD06A2BA0', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 19:32:09', '重置密码[王五]', 'wangwu');
INSERT INTO `log` VALUES ('2311DFA7463049D49F88E257DCE7B942', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:58:15', '修改用户[tianqi-田七]', '');
INSERT INTO `log` VALUES ('235D3EACD7F1451499169A166C2381AC', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2019-05-21 17:06:25', '修改功能[ROLES-角色管理]', '');
INSERT INTO `log` VALUES ('27B5B00F20C04C1493A68FE12178E146', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 13:20:18', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('2A7A911DFC804745B14A319268226604', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 17:38:42', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('2AAAB42959AD42089E0C835FA7C9E9BB', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 15:42:59', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('2B1E44C1FB8146208FC8000025E7BF13', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:10:05', '重置密码[李四]', 'lisi');
INSERT INTO `log` VALUES ('2B996E9492394113A93ADBC816E27C85', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 19:32:03', '修改用户[wangwu-王五]', '');
INSERT INTO `log` VALUES ('2BBA97D11BA342EFB819465A10A1FEF3', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-15 23:06:25', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('2DDD42A26C154869B3091811797DFC4A', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-15 23:10:41', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('2DE4E6CC9F1244F1B44CBA60A45AD917', 'superadmin', '超级管理员', '192.168.8.245', '', '2017-09-14 22:34:25', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('316F3F5DBE7744CB8A714FFC82961F34', 'admin', '管理员', '127.0.0.1', 'D', '2017-09-16 17:14:05', '删除会员[1]', '');
INSERT INTO `log` VALUES ('33E77EFDB21B47DDAAAE6AA38DEA190B', 'superadmin', '超级管理员', '127.0.0.1', 'A', '2017-09-16 12:24:46', '新增角色[TICKET_SELLER-售票员]', '');
INSERT INTO `log` VALUES ('394B846A925A470BB94C35266AF7BF29', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 17:05:25', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('3ADE5B5858844E7198072E92BBEB400B', 'superadmin', '超级管理员', '192.168.8.245', 'U', '2017-09-14 22:36:16', '修改参数[VARSION_PDA=1]', '');
INSERT INTO `log` VALUES ('3B025EEEF02D4426BDCFE2370D91F3F3', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 20:04:57', '修改功能[SYS-系统管理]', '');
INSERT INTO `log` VALUES ('3BF29DB0D9E6441D8AE3913409D1920A', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 15:56:59', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('3C2353AB5E9C4885B5C797354C43FA18', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 18:43:13', '重置密码[李四]', 'lisi');
INSERT INTO `log` VALUES ('3E68633EBFF34A08967B7C0ADFC4005E', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 19:26:17', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('3EE9555F787940FEBC91F7B9D3AB85B0', 'superadmin', '超级管理员', '192.168.8.245', 'D', '2017-09-14 22:36:07', '删除参数[1条]', '');
INSERT INTO `log` VALUES ('4124015FB2424F3FBD7185DACC191F40', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:57:58', '修改用户[tian-田七]', '');
INSERT INTO `log` VALUES ('422A3AB491C94CEDBC48F6EE0E7BFF36', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 17:01:31', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('42D25AE25C2D43F987F8837799ABF336', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:54:58', '修改用户[zhaoliu-赵六]', '');
INSERT INTO `log` VALUES ('44C99F8AF5CD42C88424E4F16FF86085', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 15:49:47', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('45C3A56DBF5048DFA46EA647C036228D', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-15 23:06:30', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('48E4B1437B854310930904190EEB423C', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 14:55:18', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('4A4F9FC842834DF7ACEAB1B12C2A9F56', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 22:28:26', '重置密码[田女娃子]', 'tian');
INSERT INTO `log` VALUES ('4B613C69A5994A7BA3B2B4B7BEF7A370', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 13:00:06', '保存用户授权，用户代码[tianqi]', '');
INSERT INTO `log` VALUES ('4CE7FD137ED7483085CEEA84AB8F7994', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-17 15:54:59', '修改角色授权，角色代码[]', '');
INSERT INTO `log` VALUES ('532D25934FD2491A951532AC4DF75A75', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 11:41:24', '重置密码[田女娃子]', 'tian');
INSERT INTO `log` VALUES ('53653E6F47214FF2811640E9643E3743', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 18:11:09', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('555EA54187A74E1BA47F1BEC053AA3B4', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 17:40:05', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('566AAFA409C146789DD5CB027C91C769', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-15 22:59:52', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('5680EB97F0DC48BC8B13EB3D7D90BBC7', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 12:15:38', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('56ADA27B5DA9410A87A0A0C50F0886A6', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-17 16:56:18', '修改用户[admin-管理员]', '');
INSERT INTO `log` VALUES ('56CA5CDA95754924A866127DD37B54E4', 'superadmin', '超级管理员', '127.0.0.1', '', '2019-05-21 16:53:05', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('578484133AD5484391B2F436B640D8E0', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:54:36', '修改用户[zhaoliu-赵六]', '');
INSERT INTO `log` VALUES ('57947BD176104F9CB28F7E021D1B24D1', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 13:06:08', '修改角色授权，角色代码[TICKET_SELLER]', '');
INSERT INTO `log` VALUES ('599704B51DED450D80F30790D4A88824', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 16:58:39', '修改会员[100566777777-张三]', '');
INSERT INTO `log` VALUES ('59CC968449134F0A8D7DB83B640D59EA', 'admin', '管理员', '127.0.0.1', 'D', '2017-09-16 17:13:59', '删除会员[1]', '');
INSERT INTO `log` VALUES ('5B2766BD14D64D18A21DEBB260C09802', 'superadmin', '超级管理员', '192.168.8.245', 'U', '2017-09-14 22:44:11', '重置密码[田女娃子]', 'tian');
INSERT INTO `log` VALUES ('5C7FDD64497546EBAB48C99B9A0EAD27', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 18:38:07', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('5D87C0B633E84CE1B12AB27C6C911D19', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 11:58:52', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('5EB582ECD6B8471386A57C70CA3452C7', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:14:12', '重置密码[李四]', 'lisi');
INSERT INTO `log` VALUES ('5F0321F57D3148349EB37E2BE71C1DEC', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:56:28', '修改用户[zhaoliu-赵六]', '');
INSERT INTO `log` VALUES ('5FEE16C8802E4ED69DFE332591C42980', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 20:12:49', '修改角色[TICKETSELLER-售票员]', '');
INSERT INTO `log` VALUES ('604C9D25FA8C4BD781ECA7DD29E03876', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 20:04:16', '修改功能[SYS-系统管理]', '');
INSERT INTO `log` VALUES ('6313E3E6E7AB44B69CAFDA31D5A758FF', 'admin', '管理员', '127.0.0.1', 'D', '2017-09-16 13:10:37', '删除用户授权，用户代码[zhangsan]', '');
INSERT INTO `log` VALUES ('68F9AAD64F494553BFD2958171851D03', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-16 20:12:40', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('691B13582402489B8AA577299018233A', 'admin', '管理员', '192.168.8.245', '', '2017-09-14 22:49:10', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('6D7048BDF059405CA39D4BC12A06875C', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 13:08:55', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('6FA277D9BDB24F4CADEB1B845431250F', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 19:54:42', '修改功能[SYS-系统管理]', '');
INSERT INTO `log` VALUES ('7274EE40F8204604A2EF7DFB1600A527', 'superadmin', '超级管理员', '127.0.0.1', 'A', '2017-09-16 12:23:08', '新增角色[CURATOR-资料员]', '');
INSERT INTO `log` VALUES ('7365A6B4C21A49D7823B14A9B16A40D1', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-16 20:03:02', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('737F31D25518422EB5AAAECDEA4ACCE9', 'zhangsan', '张三', '127.0.0.1', '', '2017-09-16 13:06:55', '用户登录[张三]', '');
INSERT INTO `log` VALUES ('75B59636E7CA4CDBBF23D5C4825C9FFC', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-17 15:54:57', '修改角色授权，角色代码[]', '');
INSERT INTO `log` VALUES ('772BEEC4C7144587BD2696ECB23B1744', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-15 23:20:27', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('78581A53062A482185A20555E263440E', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 09:09:29', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('7A67720275C14598A7319820E71A726E', 'admin', '管理员', '192.168.8.245', 'U', '2017-09-14 22:52:50', '修改功能[LOGS-日志查询]', '');
INSERT INTO `log` VALUES ('7AA4857D09C043C891C45204885CB5A6', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:14:06', '重置密码[田女娃子]', 'tian');
INSERT INTO `log` VALUES ('7B4E134F32B144288252CB723DEE5A5E', 'superadmin', '超级管理员', '127.0.0.1', 'D', '2017-09-16 13:03:36', '刪除角色[1条]', '');
INSERT INTO `log` VALUES ('7BBCCCEAA88A42C98E1ED2C70D0FFE8D', 'superadmin', '超级管理员', '192.168.8.245', 'U', '2017-09-14 22:35:24', '保存用户授权', '');
INSERT INTO `log` VALUES ('7C30148C0A91434C86A809E685794256', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-16 11:39:26', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('7DF13860E71F4AB19E24A02CC1176717', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 13:10:04', '保存用户授权，用户代码[zhangsan]', '');
INSERT INTO `log` VALUES ('81EA0099E6134A72B9B1E018EF533759', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 11:50:10', '修改机构[WXCGS-无锡支队车管所]', '');
INSERT INTO `log` VALUES ('821EB92915344FE2BA4C77E7D6E367D1', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 18:13:39', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('836BE20D6994452285BA91FCC69DAB60', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 17:08:01', '修改会员[1001-田女娃子]', '');
INSERT INTO `log` VALUES ('85902619C6904A43B02364E426AF12F6', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 19:40:31', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('85AA2E83000E46A39D23291BA890D4E1', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 18:18:28', '修改用户[lisi-李四]', '');
INSERT INTO `log` VALUES ('86A7D5C558E8417C9B7D30CD28D89C84', 'superadmin', '超级管理员', '192.168.8.245', 'D', '2017-09-14 22:35:26', '刪除用戶授权，用户代码[zhaoliu]', '');
INSERT INTO `log` VALUES ('88D7C9F1E7F2437C96C5BCFF0A06F0BE', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 13:52:49', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('898909306E2F4C9AA6A014FC1E2BA56C', 'zhangsan', '张三', '127.0.0.1', '', '2017-09-16 13:08:14', '用户登录[张三]', '');
INSERT INTO `log` VALUES ('8B4D17431B5B40E2A3ABCA87D7B9EA5C', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:23:18', '修改角色[CURATOR-馆长]', '');
INSERT INTO `log` VALUES ('8BE28AE3EFAF4532AB2498AD1215B68C', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 11:41:27', '重置密码[管理员]', 'admin');
INSERT INTO `log` VALUES ('8F4D344E9AED41C0A3607CC55684C865', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-19 21:49:09', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('904CE1B6185D41E8B29C3A3516AA0469', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 16:58:53', '修改会员[1001-张三]', '');
INSERT INTO `log` VALUES ('90984F072DC043CDBD17C786E5F090D2', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-16 12:16:06', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('914CB48CCBE447DFA7F162742AB24B30', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 19:28:09', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('91D1FF90612E4FB6855E5761B34B321D', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-16 11:41:12', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('91FEA8DF4C3A443AB256F8AEAA3C86E8', 'superadmin', '超级管理员', '127.0.0.1', '', '2019-05-21 17:44:29', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('932F248561DE402F89E6742F13294D8C', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 13:03:59', '保存用户授权，用户代码[zhaoliu]', '');
INSERT INTO `log` VALUES ('955DAF9B2DD842059F49C9F82583F5DD', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 13:09:07', '修改角色[TICKET_SELLER-售票员]', '');
INSERT INTO `log` VALUES ('958F7DBCF5A54C5FA5E9F77C6E79E9B8', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 13:09:44', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('961CBA4358E14FB8843FC2710CC1D66E', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 12:07:27', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('9726C15689B247BA8EA6CFBC828E6325', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 12:09:46', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('9775B223B2644080BB7C0801AF613C79', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 10:22:47', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('97B7A6FDBF67480D866F08E8B53FAF49', 'superadmin', '超级管理员', '192.168.8.245', 'U', '2017-09-14 22:35:12', '修改角色[COMM-普通用户]', '');
INSERT INTO `log` VALUES ('99321B16596D49F399B196613098A95F', 'superadmin', '超级管理员', '127.0.0.1', 'D', '2017-09-16 13:01:47', '删除用户授权，用户代码[zhaoliu]', '');
INSERT INTO `log` VALUES ('9C3E3D24A0A5443B85C3DC5127394E4F', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 16:28:46', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('9D30A1D40DE84EBC858A0C7711B58C7D', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-17 17:07:11', '修改用户[tianqi-田七]', '');
INSERT INTO `log` VALUES ('9EDA1D5969504968A3580EECCA8E70FA', 'admin', '管理员', '127.0.0.1', 'A', '2017-09-16 13:23:17', '新增功能[MEMBER_MGR-会员管理]', '');
INSERT INTO `log` VALUES ('9FDDBF57F0A84C27888B9F8CEE91C779', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 09:04:19', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('A2C6F98BD5FB48E497D2E94139FD7DF6', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 16:58:25', '修改会员[1010-李四]', '');
INSERT INTO `log` VALUES ('A3AD9CF7B7A54C9FA1FD3AE7723CC1B7', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:14:03', '重置密码[王五]', 'wangwu');
INSERT INTO `log` VALUES ('A5ABECB4F7F748A9BE015B87BFD88897', 'admin', '管理员', '127.0.0.1', 'D', '2017-09-16 18:38:42', '删除用户[1]', '');
INSERT INTO `log` VALUES ('A5ADEC03EAE241888EE6F8A32E86DD1A', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-17 17:06:56', '修改用户[admin-管理员]', '');
INSERT INTO `log` VALUES ('A91962FE99AD4D78B21264CF3012F1ED', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 16:59:06', '修改会员[1001-张三]', '');
INSERT INTO `log` VALUES ('AA7AE2B645EF494FBB8129EBA2F0C892', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:13:54', '重置密码[李四]', 'lisi');
INSERT INTO `log` VALUES ('AC5ACF511E66434F99CD1D69D5BD9417', 'admin', '管理员', '127.0.0.1', 'D', '2017-09-16 17:14:10', '删除会员[1]', '');
INSERT INTO `log` VALUES ('AE9C25480ECF43D19A722B7A303070C2', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-17 16:56:37', '修改用户[admin-管理员]', '');
INSERT INTO `log` VALUES ('AFC418B624F34A7D845B08C65C837685', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 13:07:42', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('B384038F737747EEBF995A343963BE98', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-16 11:45:35', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('B68BA9323AB2468793AE0A37B82B859F', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-15 22:27:03', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('B6BBF7C227764C8F9DFDE9D05624699B', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-16 11:58:39', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('BD08AE626EC04C3AAB4405C04EA628E6', 'superadmin', '超级管理员', '192.168.8.245', 'U', '2017-09-14 22:34:43', '修改用户[zhaoliu]', 'zhaoliu');
INSERT INTO `log` VALUES ('BDDC37FBE3CA4530886A8A1D1B28837E', 'superadmin', '超级管理员', '127.0.0.1', 'D', '2017-09-16 13:01:45', '删除用户授权，用户代码[tianqi]', '');
INSERT INTO `log` VALUES ('C081A33BEF6F4C239E109274AA7244D5', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 16:59:27', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('C186F5F4B2D24F8D93A56F17FF00A988', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 14:35:16', '修改功能[MEMBERINFO-会员管理]', '');
INSERT INTO `log` VALUES ('C1E1117B34FF4566B851DC79B43AE986', 'admin', '管理员', '127.0.0.1', 'D', '2017-09-16 19:33:11', '删除会员[1]', '');
INSERT INTO `log` VALUES ('C46115B053B74745B1B3B3F9A2BAEC17', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 17:04:28', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('C70178D77C32403BBAEAAD1E94409F8B', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:09:37', '重置密码[田女娃子]', 'tian');
INSERT INTO `log` VALUES ('C79E729F96C742819A4088137965ADDA', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 20:04:36', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('C9582B2578DF4E5683B3E7867C1FE321', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:07:22', '重置密码[zhaoliu]', 'zhaoliu');
INSERT INTO `log` VALUES ('CD5F3C60D1134F9B9477F1525D282067', 'superadmin', '超级管理员', '192.168.8.245', 'U', '2017-09-14 22:35:02', '修改功能[SYS:系统管理]', '');
INSERT INTO `log` VALUES ('CEABE4AAE0E04F169A74F0DEE500AA5E', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:56:51', '修改用户[tian-田八]', '');
INSERT INTO `log` VALUES ('CF7A6EABC66546279ABD36BFAFE89EEF', 'admin', '管理员', '127.0.0.1', 'A', '2017-09-16 19:26:43', '新增参数[2=2]', '');
INSERT INTO `log` VALUES ('CFFEA9DD1D764C9284B5E0F77D1B792B', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 12:57:32', '修改用户[tian-田女娃子]', '');
INSERT INTO `log` VALUES ('D2A17D9CA46348F2960D682ED7E7F9D9', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 13:40:01', '修改角色授权，角色代码[ADMIN]', '');
INSERT INTO `log` VALUES ('D3423689DFE74CA995B713B5694ECD6F', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 13:40:41', '修改功能[MEMBERINFO-会员信息管理]', '');
INSERT INTO `log` VALUES ('D5BE96FDB1E54228B21CCE4ECBFFF49B', 'superadmin', '超级管理员', '192.168.8.245', 'U', '2017-09-14 22:35:56', '修改字典[PAY=]', '');
INSERT INTO `log` VALUES ('D65D922AE0CA49918D12D9D8773715B8', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 15:12:10', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('D6BE60BB39644E5CAE8CEF27F876665F', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:09:13', '重置密码[王五]', 'wangwu');
INSERT INTO `log` VALUES ('D7D9207EFB194E57AB70003A5D987B7E', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 17:02:19', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('D91B513A686D4C13B1EFA224625A5D42', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-17 17:08:08', '修改用户[admin-管理员]', '');
INSERT INTO `log` VALUES ('DAA90DF1FDA24C988E0A3D70D1D81B58', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:09:26', '重置密码[王五]', 'wangwu');
INSERT INTO `log` VALUES ('DCA796E2F40D4A0F8C79F33F3D3FA84C', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 17:40:28', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('DE510648BB63460BADB142B8EE203636', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-16 12:56:14', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('DF87E1C915804A6A8FC53104C0182851', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:10:01', '重置密码[田女娃子]', 'tian');
INSERT INTO `log` VALUES ('E2D11E19E30F4488BEE5BB43CC1DDA69', 'superadmin', '超级管理员', '192.168.8.245', '', '2017-09-14 22:44:00', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('E316FF1C46FC41BBA55294FFA2701E50', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 11:41:17', '重置密码[王五]', 'wangwu');
INSERT INTO `log` VALUES ('E5534B282FE24034A4DBD1569F845CB0', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 10:18:45', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('EC1D44CB8A2445B3B979CD0374984799', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 17:06:05', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('ECEE365A664B462A97C195CF5A40B1E0', 'admin', '管理员', '127.0.0.1', 'D', '2017-09-16 19:32:22', '删除会员[1]', '');
INSERT INTO `log` VALUES ('ED22DD05F7544555BF0739B46850F29A', 'admin', '管理员', '127.0.0.1', '', '2017-09-16 15:43:54', '用户登录[管理员]', '');
INSERT INTO `log` VALUES ('ED5F737AAB50499FA9A0425CAAE5059E', 'admin', '管理员', '127.0.0.1', 'D', '2017-09-16 19:32:19', '删除会员[1]', '');
INSERT INTO `log` VALUES ('F1B687104B7343ED866666F4E1F551E9', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 10:19:40', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('F20B5678127C43B78CB89C9DB555AD0F', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-15 23:13:46', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('F34565F0D43A457784756CCDE2EAC9B6', 'superadmin', '超级管理员', '192.168.8.245', 'U', '2017-09-14 22:34:54', '修改机构[WXCGS-无锡支队车管所]', '');
INSERT INTO `log` VALUES ('F488F744029548F39311EB3591A55ABB', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 17:05:27', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('F58448869C63444D9C68606752C24EB6', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-15 22:42:52', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('F6F2D5610A7741E8AAF52CD6F2B78133', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 14:35:02', '修改功能[MEMBER_MGR-会员管理]', '');
INSERT INTO `log` VALUES ('F714F72A486743469A346013FB2CA95A', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 13:08:01', '修改角色授权，角色代码[TICKET_SELLER]', '');
INSERT INTO `log` VALUES ('F7D72CDC6425491EAF147901F8F66C39', 'superadmin', '超级管理员', '192.168.8.245', 'D', '2017-09-14 22:36:01', '删除参数[1条]', '');
INSERT INTO `log` VALUES ('F7D78326745E4A78892782EDCD689858', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:13:57', '重置密码[zhaoliu]', 'zhaoliu');
INSERT INTO `log` VALUES ('F8B8BBBE80C54E9FA83B41C75CBF4B80', 'admin', '管理员', '127.0.0.1', 'U', '2017-09-16 13:10:22', '修改角色[TICKET_SELLER-售票员]', '');
INSERT INTO `log` VALUES ('F95DC10F147F49929EA0F07F9A5F9D5F', 'admin', '管理员', '127.0.0.1', 'D', '2017-09-16 19:31:19', '删除参数[1条]', '');
INSERT INTO `log` VALUES ('F9F75B80AA2A44A99EF32853D754CEC9', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 11:49:25', '重置密码[王五]', 'wangwu');
INSERT INTO `log` VALUES ('FC5439FFBFAB46549CA9506F7E97658D', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-17 17:02:35', '修改用户[admin-管理员]', '');
INSERT INTO `log` VALUES ('FDA9C9939FF54970B9EBDF9D80305E3A', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-15 23:09:52', '重置密码[李四]', 'lisi');
INSERT INTO `log` VALUES ('FE480A0B00334034AB83F24970032B7D', 'superadmin', '超级管理员', '127.0.0.1', '', '2017-09-17 10:21:18', '用户登录[超级管理员]', '');
INSERT INTO `log` VALUES ('FF3B4CDFFDBC4293A29B13068C5AB863', 'superadmin', '超级管理员', '127.0.0.1', 'U', '2017-09-16 13:01:42', '保存用户授权，用户代码[tianqi]', '');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `member_id` varchar(32) NOT NULL DEFAULT '',
  `member_code` varchar(50) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `org_code` varchar(30) DEFAULT NULL,
  `card_code` varchar(32) DEFAULT NULL,
  `status` decimal(10,0) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `grade` decimal(10,0) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `points` decimal(10,0) DEFAULT NULL,
  `regist_date` datetime DEFAULT NULL,
  `valid_date` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '1001', '田女娃子', '1', null, '0998877', '1', '1', '2015-03-31', '18523334087', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', '3333321');
INSERT INTO `member` VALUES ('10', '1010', '李四', '2', null, '100002', '2', '2', '1990-03-31', '15826327795', 'tandiming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '2', '22.00', '88', '2017-08-26 20:55:53', '2017-08-26 20:55:50', null);
INSERT INTO `member` VALUES ('11', '1011', '张三', '1', null, '100001', '1', '1', '1990-03-31', '15826327795', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', null);
INSERT INTO `member` VALUES ('1110', '1010', '李四', '2', null, '100002', '2', '2', '1990-03-31', '15826327795', 'tandiming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '2', '22.00', '88', '2017-08-26 20:55:53', '2017-08-26 20:55:50', '0000');
INSERT INTO `member` VALUES ('1111', '1011', '张三', '1', null, '100001', '1', '1', '1990-03-31', '15826327795', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', null);
INSERT INTO `member` VALUES ('1112', '1012', '李四', '2', null, '100002', '2', '2', '1990-03-31', '15826327795', 'tandiming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '2', '22.00', '88', '2017-08-26 20:55:53', '2017-08-26 20:55:50', null);
INSERT INTO `member` VALUES ('113', '1003', '张三', '1', null, '100001', '1', '1', '1990-03-31', '15826327795', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', null);
INSERT INTO `member` VALUES ('117', '1007', '张三', '1', null, '100001', '1', '1', '1990-03-31', '15826327795', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', null);
INSERT INTO `member` VALUES ('118', '1008', '李四', '2', null, '100002', '2', '2', '1990-03-31', '15826327795', 'tandiming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '2', '22.00', '88', '2017-08-26 20:55:53', '2017-08-26 20:55:50', null);
INSERT INTO `member` VALUES ('119', '1009', '张三', '1', null, '100001', '1', '1', '1990-03-31', '15826327795', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', null);
INSERT INTO `member` VALUES ('12', '1012', '李四', '2', null, '100002', '2', '2', '1990-03-31', '15826327795', 'tandiming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '2', '22.00', '88', '2017-08-26 20:55:53', '2017-08-26 20:55:50', null);
INSERT INTO `member` VALUES ('2', '1002', '李四', '2', null, '100002', '2', '2', '1990-03-31', '15826327795', 'tandiming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '2', '22.00', '88', '2017-08-26 20:55:53', '2017-08-26 20:55:50', null);
INSERT INTO `member` VALUES ('3', '1003', '张三', '1', null, '100001', '1', '1', '1990-03-31', '15826327795', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', null);
INSERT INTO `member` VALUES ('4', '1004', '李四', '2', null, '100002', '2', '2', '1990-03-31', '15826327795', 'tandiming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '2', '22.00', '88', '2017-08-26 20:55:53', '2017-08-26 20:55:50', null);
INSERT INTO `member` VALUES ('5', '1005', '张三', '1', null, '100001', '1', '1', '1990-03-31', '15826327795', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', null);
INSERT INTO `member` VALUES ('6', '1006', '李四', '2', null, '100002', '2', '2', '1990-03-31', '15826327795', 'tandiming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '2', '22.00', '88', '2017-08-26 20:55:53', '2017-08-26 20:55:50', null);
INSERT INTO `member` VALUES ('7', '1007', '张三', '1', null, '100001', '1', '1', '1990-03-31', '15826327795', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', null);
INSERT INTO `member` VALUES ('9', '1009', '张三', '1', null, '100001', '1', '1', '1990-03-31', '15826327795', 'ouming758@163.com', '重庆市九龙坡区二郎千叶中央街区3栋7-6', '1', '100.00', '758', '2017-08-28 18:22:19', '2017-08-26 18:22:26', null);

-- ----------------------------
-- Table structure for `org`
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `org_id` varchar(32) NOT NULL DEFAULT '',
  `org_code` varchar(30) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `org_type` varchar(10) DEFAULT NULL,
  `level_code` varchar(50) DEFAULT NULL,
  `par_code` varchar(30) DEFAULT NULL,
  `par_name` varchar(50) DEFAULT NULL,
  `status` decimal(10,0) DEFAULT NULL,
  `sort` decimal(10,0) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org
-- ----------------------------
INSERT INTO `org` VALUES ('23F93F72EC0C428AAFBEA0AFF84F6F01', 'JYCGS', '江阴车管所', '2', '000001000001', 'WXCGS', '无锡支队车管所', '1', '2', null);
INSERT INTO `org` VALUES ('F11927804B894D0384179C44B355ECAC', 'YXCGS', '宜兴车管所', '2', '000001000002', 'WXCGS', '无锡支队车管所', '1', '2', null);
INSERT INTO `org` VALUES ('FC10E237B6D947F79C973265D08967D6', 'WXCGS', '无锡支队车管所', '1', '000001', '0', '组织机构', '1', '1', null);

-- ----------------------------
-- Table structure for `param`
-- ----------------------------
DROP TABLE IF EXISTS `param`;
CREATE TABLE `param` (
  `param_id` varchar(32) NOT NULL DEFAULT '',
  `param_code` varchar(50) DEFAULT NULL,
  `param_name` varchar(50) DEFAULT NULL,
  `param_value` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of param
-- ----------------------------
INSERT INTO `param` VALUES ('1', 'VARSION_PDA', 'PDA版本', '1', '1', '提示PDA版本升级');
INSERT INTO `param` VALUES ('F90FBB34730C4D7C9523C4F6B2BC506D', 'ENABLE_LOG_TO_DB', '启用记录日志到数据库', '1', '1', null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` varchar(32) NOT NULL DEFAULT '',
  `role_code` varchar(30) DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `status` decimal(10,0) DEFAULT NULL,
  `sort` decimal(10,0) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('813C46101C3D4B02B88009714424C9A2', 'TICKETSELLER', '售票员', '1', '3', null);
INSERT INTO `role` VALUES ('90771C205FBD4C2B96A6E3566DD60B03', 'CURATOR', '馆长', '1', '2', null);
INSERT INTO `role` VALUES ('CF77A2E31A1D47DBAA68BE4CC8698A4D', 'ADMIN', '管理员', '1', '999', '999');

-- ----------------------------
-- Table structure for `role_func`
-- ----------------------------
DROP TABLE IF EXISTS `role_func`;
CREATE TABLE `role_func` (
  `role_func_id` varchar(32) NOT NULL DEFAULT '',
  `role_code` varchar(30) DEFAULT NULL,
  `func_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_func_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_func
-- ----------------------------
INSERT INTO `role_func` VALUES ('0BF7CCE282024FC2B16EF51DB1E34E02', '', 'FUNCS');
INSERT INTO `role_func` VALUES ('140058BCE0864097A2ECDE8A133FF65A', 'ADMIN', 'ROLES');
INSERT INTO `role_func` VALUES ('1A10FCC52BA9480A82584EAF08213BFD', 'ADMIN', 'LOGS');
INSERT INTO `role_func` VALUES ('1EC0B62E892B4E0DB3CEC686677F2CDF', 'ADMIN', 'MEMBERINFO');
INSERT INTO `role_func` VALUES ('2511F302E3E74FA5AB5BE51412E68E88', 'COMM', 'SYSMGR');
INSERT INTO `role_func` VALUES ('317F9229504C4A22B5AD3D694CCA0B83', 'TICKET_SELLER', 'DEPARTMENTS');
INSERT INTO `role_func` VALUES ('3CE3717A146C46B2BC02874CFB41021A', 'ADMIN', 'DEPARTMENTS');
INSERT INTO `role_func` VALUES ('447D16CCE96E45B8A8B56AF050F14682', 'ADMIN', 'PARAMS');
INSERT INTO `role_func` VALUES ('44E150A210454E56AA6DF5844252C054', 'CURATOR', 'DEPARTMENTS');
INSERT INTO `role_func` VALUES ('5B1F9862139C4A23B19841E208C8385A', 'TICKET_SELLER', 'SYSMGR');
INSERT INTO `role_func` VALUES ('5D7000F6491D4CDEB00CF88E91D63DE9', 'ADMIN', 'AUTH');
INSERT INTO `role_func` VALUES ('74C8950DF94346E99860A31879D1ED09', 'ADMIN', 'DICTS');
INSERT INTO `role_func` VALUES ('782333BDDD7546F6B15D9CDD2D13E355', 'COMM', 'USERS');
INSERT INTO `role_func` VALUES ('825C1762A3CA40A681070C156A68B669', 'ADMIN', 'SYSMGR');
INSERT INTO `role_func` VALUES ('8772BDD529484967A053A635760C8178', 'ADMIN', 'FUNCS');
INSERT INTO `role_func` VALUES ('8DC0F8239F7149A7B06A324BC20EE278', 'CURATOR', 'SYSMGR');
INSERT INTO `role_func` VALUES ('A761C60A302E4C7EBDE9A6941A87D79B', '', 'SYSMGR');
INSERT INTO `role_func` VALUES ('CC2638CCD6CF47E8A8A03BF10E51F2D5', 'CURATOR', 'USERS_REG_FINGER');
INSERT INTO `role_func` VALUES ('D11FAAE0F8B94FB59119D305AC960D45', 'CURATOR', 'USERS');
INSERT INTO `role_func` VALUES ('D98B5374CAB545EA8C4E9A134F66D214', 'ADMIN', 'USERS_REG_FINGER');
INSERT INTO `role_func` VALUES ('F081937FCEC14C738FEC0B76161CA4E8', 'ADMIN', 'MEMBER_MGR');
INSERT INTO `role_func` VALUES ('F9AF3CF6396B47DC8400AD22F2E73836', 'ADMIN', 'USERS');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_role_id` varchar(32) NOT NULL DEFAULT '',
  `user_code` varchar(30) DEFAULT NULL,
  `role_code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('012CC1BF5BC54804B01C91E8EEF8C954', 'zhangsan', 'COMM');
INSERT INTO `user_role` VALUES ('29C108CE1CFA40A48B59CB9FF78E1B2F', 'zhaoliu', 'TICKETSELLER');
INSERT INTO `user_role` VALUES ('87B54C933C1D44B78EB48BCCD3E3B345', 'zhangsan', 'TICKETSELLER');
INSERT INTO `user_role` VALUES ('C8204E2CB2914E22A72E062D1BAAF30C', 'tianqi', 'CURATOR');
INSERT INTO `user_role` VALUES ('C84A4EF30AA44F3BB44E6CB4D8DD65EF', 'superadmin', 'ADMIN');
INSERT INTO `user_role` VALUES ('F0733E67A21F4999AE562C235BC7AFAF', 'tian', 'COMM');
INSERT INTO `user_role` VALUES ('FF8D9CE365FC4D4A865B96CB9F83B2B4', 'admin', 'ADMIN');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `user_code` varchar(30) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `telphone` varchar(15) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `status` decimal(2,0) DEFAULT NULL,
  `org_code` varchar(10) DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_ip` varchar(17) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1279CDED162743BB8CCC933C35FB896D', 'superadmin', '超级管理员', '5f46fffebffb346838739390f1ff1d4fcccd9f75', 'TQJph3M2Odp56Wbo1d4746yYS74D4108', '1', '2017-05-30', 'tandiming@163.com', '592715351', '02368818588', '15826327795', '-1', 'YXCGS', 'superadmin', '2017-09-16 18:14:23', '2019-05-21 17:44:29', '127.0.0.1', null);
INSERT INTO `users` VALUES ('22211FAB43E14F50BC03C3CFDE0F91ED', 'admin', '管理员', '6308f371b7782712d6de03a55df398be2e8b5313', '964PTTxY8qK4953743Y95853yFH380K8', '1', '2017-02-08', 'ouming758@163.com', '592715351', '02368818588', '15826327795', '1', 'WXCGS', 'superadmin', '2017-09-16 18:14:23', '2017-09-16 20:04:36', '127.0.0.1', null);
INSERT INTO `users` VALUES ('3C8A9BC57C5047268FA89CEE9D60284C', 'tianqi', '田七', 'e76ea7913bb01a9593fcb99e283cedf22006789e', '3iDPMyQ68o06w023w4H7cd7Hm96B499t', '2', '2017-08-31', 'tian@163.com', null, null, null, '1', 'YXCGS', 'superadmin', '2017-09-16 18:14:23', null, null, null);
INSERT INTO `users` VALUES ('69CDFE6D43C34AD3BE530E9727F252BA', 'wangwu', '王五', '7733113dbb3e29e3f1aeddbc514952cae33d9db8', '2m66Q68S8rDRpl9E218VUOMy1f8k8v3Q', '1', '2017-09-12', 'wangwu@qq.com', null, null, null, '2', 'YXCGS', 'superadmin', '2017-09-16 18:14:23', null, null, null);
INSERT INTO `users` VALUES ('6F543F50A5EF40AEA230AD489C9AC093', 'zhaoliu', '赵六', '4e9c074cef1c32a74290684939b6ff38e8a33c2d', 'kIx29VUJJDzu6Hb50f4t30z28eVXQ047', '1', '2017-04-24', 'zhaoliu@163.com', null, null, null, '1', 'YXCGS', 'superadmin', '2017-09-16 18:14:23', '2017-09-13 00:22:14', '127.0.0.1', null);
INSERT INTO `users` VALUES ('F32678F29F844FD3B7800F1897C766CC', 'lisi', '李四', 'decced662cf0c97639131bd1e6c903d6647c27f7', '20Wt442fni68S1G6L8Pt05Sgn5bxF14E', '2', '2017-09-28', 'lisi@163.com', '212', null, null, '2', 'YXCGS', 'superadmin', '2017-09-16 18:14:23', null, null, null);
INSERT INTO `users` VALUES ('F8D20ADE58724E729765B5FB60F4CDEA', 'zhangsan', '张三', 'e809c68078de7ad156c7bbfa921d4d4462418963', '912OpPzyG16vX279f3aNY5i7Eg22n80t', '1', '2017-09-21', 'zhangsan@163.com', null, null, null, '1', 'YXCGS', 'superadmin', '2017-09-16 18:14:23', '2017-09-16 13:09:13', '127.0.0.1', null);
