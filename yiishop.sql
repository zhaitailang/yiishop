/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yiishop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-18 22:32:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sp_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `sp_admin_user`;
CREATE TABLE `sp_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) NOT NULL COMMENT '管理员帐号',
  `nickname` varchar(255) DEFAULT NULL COMMENT '别名',
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL COMMENT '管理员密码',
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL COMMENT '管理员邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `login_at` int(11) NOT NULL COMMENT '最近登陆时间',
  `login_ip` varchar(32) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminuser_username_email` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_admin_user
-- ----------------------------
INSERT INTO `sp_admin_user` VALUES ('2', 'admin', '宅太浪', 'owK8MnOIcXvKBCZg84qdDL4Qv9OzfNLg', '$2y$13$sLdMVBItIKRY9Gpn4AiMCejZwuh9gHrKLqXEBRnx/sRca00Pw7guq', null, 'admin@163.com', '10', '10', '1513433882', '127.0.0.1', '1500800407', '1501233884');
INSERT INTO `sp_admin_user` VALUES ('3', 'admin123', '你ninin', 'mmbshgsYf3hcY5Uyqyr_Mm9ZByuqG3gm', '$2y$13$IGNhRQvhF0gb.n.L4wv3duwJDHa/s07i7nQtK4UF3JHKCQIARMVRe', null, 'admin213123@163.com', '10', '10', '0', '0', '1500974268', '1501245169');
INSERT INTO `sp_admin_user` VALUES ('4', 'admin1234', 'das', 'UcymRn7-nVeJ8oq1QLqVc-UpbaReQtFb', '$2y$13$UH.Agh51yhFzTU1oQs9DJu38cyx8RnVaSyOEKGw//W5sqawuP.d9u', null, 'admi3n@163.com', '10', '10', '0', '0', '1501037414', '1501037414');
INSERT INTO `sp_admin_user` VALUES ('5', 'zhaitailang', '哈哈哈', '5Boe4gzMlglYqXBGyE8kAaefgWgOg7v0', '$2y$13$zq2xAJlWZB7m5MMU96v.YuJkqCo4zCN/sEjwj75dRX1od5VPhW23.', null, '282586392@qq.com', '10', '10', '0', '0', '1501037769', '1501037769');
INSERT INTO `sp_admin_user` VALUES ('6', 'admin11111', 'ddd', 'U1DAVINuUs28d1Oxt00TSip8qrFLcxdA', '$2y$13$jucVOLMCSuTW8P6P2kiCTuZKFQVhhTPqpEpVY.56m2I.jBfIaphnK', null, '111@qq.com', '10', '10', '0', '0', '1508240611', '1508240611');
INSERT INTO `sp_admin_user` VALUES ('7', 'admin11111222', 'ddd', 'JaO6hW6Yf2tbfzQorkp1BKFHlw1hGeNO', '$2y$13$wZEQnNHkPKLpxRCOWnMsDOxDSSfHaWZ7/5jKJgelcD1zOuZgsr1QG', null, '121@qq.com', '10', '10', '0', '0', '1508240885', '1508240885');

-- ----------------------------
-- Table structure for `sp_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `sp_auth_assignment`;
CREATE TABLE `sp_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `sp_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `sp_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sp_auth_assignment
-- ----------------------------
INSERT INTO `sp_auth_assignment` VALUES ('上帝视角', '2', '1500881777');

-- ----------------------------
-- Table structure for `sp_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `sp_auth_item`;
CREATE TABLE `sp_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `sp_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `sp_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sp_auth_item
-- ----------------------------
INSERT INTO `sp_auth_item` VALUES ('/*', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/admin-log/*', '2', null, null, null, '1506310850', '1506310850');
INSERT INTO `sp_auth_item` VALUES ('/admin-log/create', '2', null, null, null, '1506310850', '1506310850');
INSERT INTO `sp_auth_item` VALUES ('/admin-log/delete', '2', null, null, null, '1506310850', '1506310850');
INSERT INTO `sp_auth_item` VALUES ('/admin-log/index', '2', null, null, null, '1506310850', '1506310850');
INSERT INTO `sp_auth_item` VALUES ('/admin-log/update', '2', null, null, null, '1506310850', '1506310850');
INSERT INTO `sp_auth_item` VALUES ('/admin-log/view', '2', null, null, null, '1506310850', '1506310850');
INSERT INTO `sp_auth_item` VALUES ('/admin-user/*', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/admin-user/create', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/admin-user/delete', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/admin-user/index', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/admin-user/resetpwd', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/admin-user/update', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/admin-user/view', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/admin/*', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1500880316', '1500880316');
INSERT INTO `sp_auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1500880317', '1500880317');
INSERT INTO `sp_auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1506177540', '1506177540');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1506177540', '1506177540');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1506177540', '1506177540');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1506177540', '1506177540');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1506177540', '1506177540');
INSERT INTO `sp_auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1506177540', '1506177540');
INSERT INTO `sp_auth_item` VALUES ('/banner/*', '2', null, null, null, '1506317288', '1506317288');
INSERT INTO `sp_auth_item` VALUES ('/banner/create', '2', null, null, null, '1506317288', '1506317288');
INSERT INTO `sp_auth_item` VALUES ('/banner/delete', '2', null, null, null, '1506317288', '1506317288');
INSERT INTO `sp_auth_item` VALUES ('/banner/index', '2', null, null, null, '1506317288', '1506317288');
INSERT INTO `sp_auth_item` VALUES ('/banner/update', '2', null, null, null, '1506317288', '1506317288');
INSERT INTO `sp_auth_item` VALUES ('/banner/upload', '2', null, null, null, '1506327701', '1506327701');
INSERT INTO `sp_auth_item` VALUES ('/banner/view', '2', null, null, null, '1506317288', '1506317288');
INSERT INTO `sp_auth_item` VALUES ('/brand/*', '2', null, null, null, '1506654954', '1506654954');
INSERT INTO `sp_auth_item` VALUES ('/brand/create', '2', null, null, null, '1506654954', '1506654954');
INSERT INTO `sp_auth_item` VALUES ('/brand/delete', '2', null, null, null, '1506654954', '1506654954');
INSERT INTO `sp_auth_item` VALUES ('/brand/index', '2', null, null, null, '1506654954', '1506654954');
INSERT INTO `sp_auth_item` VALUES ('/brand/update', '2', null, null, null, '1506654954', '1506654954');
INSERT INTO `sp_auth_item` VALUES ('/brand/view', '2', null, null, null, '1506654954', '1506654954');
INSERT INTO `sp_auth_item` VALUES ('/business/*', '2', null, null, null, '1510566450', '1510566450');
INSERT INTO `sp_auth_item` VALUES ('/business/create', '2', null, null, null, '1510566450', '1510566450');
INSERT INTO `sp_auth_item` VALUES ('/business/delete', '2', null, null, null, '1510566450', '1510566450');
INSERT INTO `sp_auth_item` VALUES ('/business/index', '2', null, null, null, '1510566450', '1510566450');
INSERT INTO `sp_auth_item` VALUES ('/business/update', '2', null, null, null, '1510566450', '1510566450');
INSERT INTO `sp_auth_item` VALUES ('/business/view', '2', null, null, null, '1510566450', '1510566450');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/*', '2', null, null, null, '1511070301', '1511070301');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/ajax-post-children-cate', '2', null, null, null, '1510992109', '1510992109');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/create', '2', null, null, null, '1511070301', '1511070301');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/create-good-code', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/good-code', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/index', '2', null, null, null, '1511070301', '1511070301');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/update', '2', null, null, null, '1511070301', '1511070301');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/update-good-code', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/upload', '2', null, null, null, '1511070301', '1511070301');
INSERT INTO `sp_auth_item` VALUES ('/category-ajax/view', '2', null, null, null, '1511070301', '1511070301');
INSERT INTO `sp_auth_item` VALUES ('/category/*', '2', null, null, null, '1506402056', '1506402056');
INSERT INTO `sp_auth_item` VALUES ('/category/create', '2', null, null, null, '1506402056', '1506402056');
INSERT INTO `sp_auth_item` VALUES ('/category/delete', '2', null, null, null, '1506402056', '1506402056');
INSERT INTO `sp_auth_item` VALUES ('/category/index', '2', null, null, null, '1506402056', '1506402056');
INSERT INTO `sp_auth_item` VALUES ('/category/update', '2', null, null, null, '1506402056', '1506402056');
INSERT INTO `sp_auth_item` VALUES ('/category/view', '2', null, null, null, '1506402056', '1506402056');
INSERT INTO `sp_auth_item` VALUES ('/debug/*', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/debug/user/*', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/debug/user/reset-identity', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/debug/user/set-identity', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/gii/*', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1500880318', '1500880318');
INSERT INTO `sp_auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/good-code/*', '2', null, null, null, '1512028993', '1512028993');
INSERT INTO `sp_auth_item` VALUES ('/good-code/create', '2', null, null, null, '1512028993', '1512028993');
INSERT INTO `sp_auth_item` VALUES ('/good-code/delete', '2', null, null, null, '1512028993', '1512028993');
INSERT INTO `sp_auth_item` VALUES ('/good-code/index', '2', null, null, null, '1512028993', '1512028993');
INSERT INTO `sp_auth_item` VALUES ('/good-code/update', '2', null, null, null, '1512028993', '1512028993');
INSERT INTO `sp_auth_item` VALUES ('/good-code/view', '2', null, null, null, '1512028993', '1512028993');
INSERT INTO `sp_auth_item` VALUES ('/good-mb/*', '2', null, null, null, '1511070296', '1511070296');
INSERT INTO `sp_auth_item` VALUES ('/good-mb/create', '2', null, null, null, '1511070295', '1511070295');
INSERT INTO `sp_auth_item` VALUES ('/good-mb/delete', '2', null, null, null, '1511070295', '1511070295');
INSERT INTO `sp_auth_item` VALUES ('/good-mb/good-mbv', '2', null, null, null, '1511191452', '1511191452');
INSERT INTO `sp_auth_item` VALUES ('/good-mb/good-mbv-update', '2', null, null, null, '1511191452', '1511191452');
INSERT INTO `sp_auth_item` VALUES ('/good-mb/index', '2', null, null, null, '1511070295', '1511070295');
INSERT INTO `sp_auth_item` VALUES ('/good-mb/status-ok', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/good-mb/update', '2', null, null, null, '1511070295', '1511070295');
INSERT INTO `sp_auth_item` VALUES ('/good-mb/view', '2', null, null, null, '1511070295', '1511070295');
INSERT INTO `sp_auth_item` VALUES ('/good/*', '2', null, null, null, '1510729784', '1510729784');
INSERT INTO `sp_auth_item` VALUES ('/good/create', '2', null, null, null, '1510729784', '1510729784');
INSERT INTO `sp_auth_item` VALUES ('/good/create-good-code', '2', null, null, null, '1512107967', '1512107967');
INSERT INTO `sp_auth_item` VALUES ('/good/delete', '2', null, null, null, '1510729784', '1510729784');
INSERT INTO `sp_auth_item` VALUES ('/good/good-code', '2', null, null, null, '1512107967', '1512107967');
INSERT INTO `sp_auth_item` VALUES ('/good/index', '2', null, null, null, '1510729784', '1510729784');
INSERT INTO `sp_auth_item` VALUES ('/good/update', '2', null, null, null, '1510729784', '1510729784');
INSERT INTO `sp_auth_item` VALUES ('/good/update-good-code', '2', null, null, null, '1512107967', '1512107967');
INSERT INTO `sp_auth_item` VALUES ('/good/upload', '2', null, null, null, '1511070295', '1511070295');
INSERT INTO `sp_auth_item` VALUES ('/good/view', '2', null, null, null, '1510729784', '1510729784');
INSERT INTO `sp_auth_item` VALUES ('/order/*', '2', null, null, null, '1510652748', '1510652748');
INSERT INTO `sp_auth_item` VALUES ('/order/create', '2', null, null, null, '1510652748', '1510652748');
INSERT INTO `sp_auth_item` VALUES ('/order/delete', '2', null, null, null, '1510652748', '1510652748');
INSERT INTO `sp_auth_item` VALUES ('/order/index', '2', null, null, null, '1510652748', '1510652748');
INSERT INTO `sp_auth_item` VALUES ('/order/update', '2', null, null, null, '1510652748', '1510652748');
INSERT INTO `sp_auth_item` VALUES ('/order/view', '2', null, null, null, '1510652748', '1510652748');
INSERT INTO `sp_auth_item` VALUES ('/place-ajax/*', '2', null, null, null, '1511191453', '1511191453');
INSERT INTO `sp_auth_item` VALUES ('/place-ajax/ajax-post-children-place', '2', null, null, null, '1511191452', '1511191452');
INSERT INTO `sp_auth_item` VALUES ('/place-ajax/good-mbv', '2', null, null, null, '1511191453', '1511191453');
INSERT INTO `sp_auth_item` VALUES ('/place-ajax/good-mbv-update', '2', null, null, null, '1511191453', '1511191453');
INSERT INTO `sp_auth_item` VALUES ('/place-ajax/index', '2', null, null, null, '1511191452', '1511191452');
INSERT INTO `sp_auth_item` VALUES ('/place-ajax/status-ok', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/place-ajax/update', '2', null, null, null, '1511191452', '1511191452');
INSERT INTO `sp_auth_item` VALUES ('/place-ajax/view', '2', null, null, null, '1511191452', '1511191452');
INSERT INTO `sp_auth_item` VALUES ('/site/*', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/site/captcha', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/site/error', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/site/index', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/site/login', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/site/logout', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/site/request-password-reset', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/site/reset-password', '2', null, null, null, '1506177541', '1506177541');
INSERT INTO `sp_auth_item` VALUES ('/user-address/*', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/user-address/create', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/user-address/delete', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/user-address/index', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/user-address/update', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/user-address/view', '2', null, null, null, '1513144205', '1513144205');
INSERT INTO `sp_auth_item` VALUES ('/user-withdrawalsapply/*', '2', null, null, null, '1511535126', '1511535126');
INSERT INTO `sp_auth_item` VALUES ('/user-withdrawalsapply/create', '2', null, null, null, '1511535126', '1511535126');
INSERT INTO `sp_auth_item` VALUES ('/user-withdrawalsapply/delete', '2', null, null, null, '1511535126', '1511535126');
INSERT INTO `sp_auth_item` VALUES ('/user-withdrawalsapply/index', '2', null, null, null, '1511535126', '1511535126');
INSERT INTO `sp_auth_item` VALUES ('/user-withdrawalsapply/status-no', '2', null, null, null, '1512028993', '1512028993');
INSERT INTO `sp_auth_item` VALUES ('/user-withdrawalsapply/status-ok', '2', null, null, null, '1512028993', '1512028993');
INSERT INTO `sp_auth_item` VALUES ('/user-withdrawalsapply/status-success', '2', null, null, null, '1512028993', '1512028993');
INSERT INTO `sp_auth_item` VALUES ('/user-withdrawalsapply/update', '2', null, null, null, '1511535126', '1511535126');
INSERT INTO `sp_auth_item` VALUES ('/user-withdrawalsapply/view', '2', null, null, null, '1511535126', '1511535126');
INSERT INTO `sp_auth_item` VALUES ('/user/*', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/user/create', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/user/delete', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/user/index', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/user/resetpwd', '2', null, null, null, '1510566450', '1510566450');
INSERT INTO `sp_auth_item` VALUES ('/user/update', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('/user/view', '2', null, null, null, '1500880319', '1500880319');
INSERT INTO `sp_auth_item` VALUES ('上帝视角', '1', 'root', null, null, '1500881758', '1506402092');
INSERT INTO `sp_auth_item` VALUES ('开发测试', '2', 'gii和debug工具', null, null, '1500882216', '1500882216');
INSERT INTO `sp_auth_item` VALUES ('权限控制', '2', 'rbac 以及菜单的操作', null, null, '1500882022', '1500882022');
INSERT INTO `sp_auth_item` VALUES ('用户管理', '2', '前台会员管理', null, null, '1500881691', '1500881709');
INSERT INTO `sp_auth_item` VALUES ('管理员用户', '2', '后台管理人员集合', null, null, '1500881634', '1500881664');

-- ----------------------------
-- Table structure for `sp_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `sp_auth_item_child`;
CREATE TABLE `sp_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `sp_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `sp_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sp_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `sp_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sp_auth_item_child
-- ----------------------------
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-log/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-log/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-log/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-log/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-log/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-log/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-user/*');
INSERT INTO `sp_auth_item_child` VALUES ('管理员用户', '/admin-user/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-user/create');
INSERT INTO `sp_auth_item_child` VALUES ('管理员用户', '/admin-user/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-user/delete');
INSERT INTO `sp_auth_item_child` VALUES ('管理员用户', '/admin-user/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-user/index');
INSERT INTO `sp_auth_item_child` VALUES ('管理员用户', '/admin-user/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-user/resetpwd');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-user/update');
INSERT INTO `sp_auth_item_child` VALUES ('管理员用户', '/admin-user/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin-user/view');
INSERT INTO `sp_auth_item_child` VALUES ('管理员用户', '/admin-user/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/assignment/*');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/assignment/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/assignment/assign');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/assignment/assign');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/assignment/index');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/assignment/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/assignment/revoke');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/assignment/revoke');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/assignment/view');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/assignment/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/default/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/default/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/menu/*');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/menu/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/menu/create');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/menu/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/menu/delete');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/menu/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/menu/index');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/menu/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/menu/update');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/menu/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/menu/view');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/menu/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/permission/*');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/permission/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/permission/assign');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/permission/assign');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/permission/create');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/permission/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/permission/delete');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/permission/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/permission/index');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/permission/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/permission/remove');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/permission/remove');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/permission/update');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/permission/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/permission/view');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/permission/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/role/*');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/role/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/role/assign');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/role/assign');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/role/create');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/role/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/role/delete');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/role/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/role/index');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/role/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/role/remove');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/role/remove');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/role/update');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/role/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/role/view');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/role/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/route/*');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/route/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/route/assign');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/route/assign');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/route/create');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/route/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/route/index');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/route/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/route/refresh');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/route/refresh');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/route/remove');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/route/remove');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/rule/*');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/rule/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/rule/create');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/rule/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/rule/delete');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/rule/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/rule/index');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/rule/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/rule/update');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/rule/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/rule/view');
INSERT INTO `sp_auth_item_child` VALUES ('权限控制', '/admin/rule/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/activate');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/change-password');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/login');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/logout');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/request-password-reset');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/reset-password');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/signup');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/admin/user/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/banner/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/banner/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/banner/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/banner/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/banner/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/banner/upload');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/banner/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/brand/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/brand/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/brand/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/brand/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/brand/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/brand/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/business/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/business/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/business/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/business/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/business/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/business/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/ajax-post-children-cate');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/create-good-code');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/good-code');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/update-good-code');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/upload');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category-ajax/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/category/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/*');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/debug/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/default/*');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/debug/default/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/default/db-explain');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/debug/default/db-explain');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/default/download-mail');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/debug/default/download-mail');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/default/index');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/debug/default/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/default/toolbar');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/debug/default/toolbar');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/default/view');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/debug/default/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/user/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/user/reset-identity');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/debug/user/set-identity');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/gii/*');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/gii/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/gii/default/*');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/gii/default/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/gii/default/action');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/gii/default/action');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/gii/default/diff');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/gii/default/diff');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/gii/default/index');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/gii/default/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/gii/default/preview');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/gii/default/preview');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/gii/default/view');
INSERT INTO `sp_auth_item_child` VALUES ('开发测试', '/gii/default/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-code/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-code/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-code/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-code/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-code/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-code/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-mb/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-mb/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-mb/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-mb/good-mbv');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-mb/good-mbv-update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-mb/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-mb/status-ok');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-mb/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good-mb/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/create-good-code');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/good-code');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/update-good-code');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/upload');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/good/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/order/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/order/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/order/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/order/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/order/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/order/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/place-ajax/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/place-ajax/ajax-post-children-place');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/place-ajax/good-mbv');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/place-ajax/good-mbv-update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/place-ajax/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/place-ajax/status-ok');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/place-ajax/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/place-ajax/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/site/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/site/captcha');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/site/error');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/site/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/site/login');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/site/logout');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/site/request-password-reset');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/site/reset-password');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-address/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-address/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-address/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-address/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-address/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-address/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-withdrawalsapply/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-withdrawalsapply/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-withdrawalsapply/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-withdrawalsapply/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-withdrawalsapply/status-no');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-withdrawalsapply/status-ok');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-withdrawalsapply/status-success');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-withdrawalsapply/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user-withdrawalsapply/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user/*');
INSERT INTO `sp_auth_item_child` VALUES ('用户管理', '/user/*');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user/create');
INSERT INTO `sp_auth_item_child` VALUES ('用户管理', '/user/create');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user/delete');
INSERT INTO `sp_auth_item_child` VALUES ('用户管理', '/user/delete');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user/index');
INSERT INTO `sp_auth_item_child` VALUES ('用户管理', '/user/index');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user/resetpwd');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user/update');
INSERT INTO `sp_auth_item_child` VALUES ('用户管理', '/user/update');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '/user/view');
INSERT INTO `sp_auth_item_child` VALUES ('用户管理', '/user/view');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '开发测试');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '权限控制');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '用户管理');
INSERT INTO `sp_auth_item_child` VALUES ('上帝视角', '管理员用户');

-- ----------------------------
-- Table structure for `sp_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `sp_auth_rule`;
CREATE TABLE `sp_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sp_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_banner`
-- ----------------------------
DROP TABLE IF EXISTS `sp_banner`;
CREATE TABLE `sp_banner` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'bannerID',
  `title` varchar(255) NOT NULL COMMENT 'banner标题',
  `image_url` varchar(255) NOT NULL COMMENT '图片路径',
  `ad_url` varchar(255) DEFAULT NULL COMMENT '链接',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'banner状态 0正常 1禁用',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_banner
-- ----------------------------
INSERT INTO `sp_banner` VALUES ('23', 'banner_1', 'http://oz588ykkh.bkt.gdipper.com/1511067170', '', '1507089624', '1511067178', '0', '0');
INSERT INTO `sp_banner` VALUES ('24', 'banner_2', 'http://oz588ykkh.bkt.gdipper.com/1511067188', '', '1507089624', '1511067194', '0', '10');
INSERT INTO `sp_banner` VALUES ('25', 'banner_3', 'http://oz588ykkh.bkt.gdipper.com/1511067206', '', '1507089624', '1511067213', '0', '0');

-- ----------------------------
-- Table structure for `sp_brand`
-- ----------------------------
DROP TABLE IF EXISTS `sp_brand`;
CREATE TABLE `sp_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id（一级分类）',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态0正常 1已禁用',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_hot` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否热门 0否1是',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `sp_brand_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `sp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_brand
-- ----------------------------
INSERT INTO `sp_brand` VALUES ('2', '兰蔻', '', '6', '0', '0', '1');
INSERT INTO `sp_brand` VALUES ('3', '资生堂', '', '17', '0', '0', '1');
INSERT INTO `sp_brand` VALUES ('4', 'OLAY（玉兰油）', '', '17', '0', '0', '0');
INSERT INTO `sp_brand` VALUES ('5', 'COACH(蔻驰)', '', '27', '0', '0', '1');
INSERT INTO `sp_brand` VALUES ('6', 'Cartier(卡地亚)', '', '17', '0', '0', '0');
INSERT INTO `sp_brand` VALUES ('7', 'LOREAL(欧莱雅)', '', '17', '0', '0', '0');
INSERT INTO `sp_brand` VALUES ('8', 'CHANEL(香奈儿)', '', '17', '0', '0', '0');
INSERT INTO `sp_brand` VALUES ('9', 'HERMES(爱马仕)', '', '10', '0', '0', '0');
INSERT INTO `sp_brand` VALUES ('10', 'GUCCI(古驰)', '', '17', '0', '0', '0');
INSERT INTO `sp_brand` VALUES ('11', 'Dior(迪奥)', '', '17', '0', '0', '0');
INSERT INTO `sp_brand` VALUES ('12', '乔治.阿玛尼', '', '10', '0', '0', '0');
INSERT INTO `sp_brand` VALUES ('13', '雅诗兰黛', '', '17', '0', '0', '0');
INSERT INTO `sp_brand` VALUES ('14', '帮宝适', '', '6', '0', '0', '1');
INSERT INTO `sp_brand` VALUES ('15', '惠氏', '', '6', '0', '0', '1');
INSERT INTO `sp_brand` VALUES ('16', '多美滋', '', '6', '0', '0', '1');
INSERT INTO `sp_brand` VALUES ('17', '雀氏', '', '6', '0', '0', '1');

-- ----------------------------
-- Table structure for `sp_business`
-- ----------------------------
DROP TABLE IF EXISTS `sp_business`;
CREATE TABLE `sp_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '关联的用户id',
  `image_url` varchar(1000) NOT NULL COMMENT '商家认证图片',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '商家姓名',
  `city_id` int(11) NOT NULL COMMENT '城市id',
  `address` varchar(500) NOT NULL COMMENT '详细地址',
  `cate_id` varchar(50) NOT NULL COMMENT '分类id',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0 待审核 1正常 2审核不通过',
  `score` int(100) NOT NULL DEFAULT '100' COMMENT '评分值',
  `score_updated_at` int(11) NOT NULL COMMENT '评分更新时间',
  `created_at` int(11) NOT NULL COMMENT '商家创建时间',
  `updated_at` int(11) NOT NULL COMMENT '商家更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `city_id` (`city_id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `sp_business_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_business
-- ----------------------------
INSERT INTO `sp_business` VALUES ('5', '7', '11', '翟翟翟221', '4021', '纽约大街', '6,17', '1', '96', '1508746177', '1508746177', '1508746177');
INSERT INTO `sp_business` VALUES ('6', '13', 'http://oz588ykkh.bkt.gdipper.com/Fu2q9mV8fKzZjTR-19BkfnZEZiYZ,http://oz588ykkh.bkt.gdipper.com/Fgd8xm2-gnSNWeeHvcafANHgNJa6', '哈哈哈', '4021', 'dwdwdqwdwqdwq', '6,17', '0', '100', '1510630690', '1510630690', '1511338581');

-- ----------------------------
-- Table structure for `sp_business_star`
-- ----------------------------
DROP TABLE IF EXISTS `sp_business_star`;
CREATE TABLE `sp_business_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '评价用户id',
  `business_id` int(11) NOT NULL COMMENT '被评价商家用户id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `good_star` smallint(5) NOT NULL COMMENT '商品评价',
  `business_star` smallint(5) NOT NULL COMMENT '商家评价',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `business_id` (`business_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_business_star
-- ----------------------------
INSERT INTO `sp_business_star` VALUES ('3', '13', '7', '8', '2', '2', '1509281581');
INSERT INTO `sp_business_star` VALUES ('6', '13', '7', '8', '2', '2', '1509282423');
INSERT INTO `sp_business_star` VALUES ('7', '13', '7', '8', '2', '2', '1509282502');
INSERT INTO `sp_business_star` VALUES ('8', '13', '7', '8', '2', '2', '1509282889');
INSERT INTO `sp_business_star` VALUES ('9', '13', '7', '8', '2', '2', '1509283250');
INSERT INTO `sp_business_star` VALUES ('10', '13', '7', '8', '2', '2', '1509291747');
INSERT INTO `sp_business_star` VALUES ('11', '13', '7', '8', '2', '2', '1511249652');
INSERT INTO `sp_business_star` VALUES ('12', '13', '7', '8', '2', '2', '1511249692');

-- ----------------------------
-- Table structure for `sp_category`
-- ----------------------------
DROP TABLE IF EXISTS `sp_category`;
CREATE TABLE `sp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(50) NOT NULL COMMENT '分类',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `status` smallint(6) DEFAULT '0' COMMENT '状态 0正常 1已禁用',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `sp_category_parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_category
-- ----------------------------
INSERT INTO `sp_category` VALUES ('6', '母婴专区', '0', '0', '998');
INSERT INTO `sp_category` VALUES ('8', '彩妆套装', '9', '0', '0');
INSERT INTO `sp_category` VALUES ('9', '彩妆香氛', '17', '0', '0');
INSERT INTO `sp_category` VALUES ('10', '男女箱包', '0', '0', '997');
INSERT INTO `sp_category` VALUES ('11', '眼妆', '9', '0', '0');
INSERT INTO `sp_category` VALUES ('12', '美容工具', '9', '0', '0');
INSERT INTO `sp_category` VALUES ('14', '面部彩妆', '9', '0', '0');
INSERT INTO `sp_category` VALUES ('15', '香水', '9', '0', '0');
INSERT INTO `sp_category` VALUES ('16', '美容护肤', '17', '0', '0');
INSERT INTO `sp_category` VALUES ('17', '美容美妆', '0', '0', '999');
INSERT INTO `sp_category` VALUES ('18', '底妆', '9', '0', '0');
INSERT INTO `sp_category` VALUES ('19', '美甲', '9', '0', '0');
INSERT INTO `sp_category` VALUES ('20', '精油', '9', '0', '0');
INSERT INTO `sp_category` VALUES ('21', '唇妆', '9', '0', '0');
INSERT INTO `sp_category` VALUES ('22', '百货商品', '0', '0', '996');
INSERT INTO `sp_category` VALUES ('23', '食品零食', '0', '0', '995');
INSERT INTO `sp_category` VALUES ('24', '女装服饰', '0', '0', '995');
INSERT INTO `sp_category` VALUES ('25', '男装服饰', '0', '0', '994');
INSERT INTO `sp_category` VALUES ('26', '品牌鞋靴', '0', '0', '994');
INSERT INTO `sp_category` VALUES ('27', '手表配饰', '0', '0', '993');
INSERT INTO `sp_category` VALUES ('28', '面部护理', '16', '0', '0');
INSERT INTO `sp_category` VALUES ('29', '化妆水', '16', '0', '0');
INSERT INTO `sp_category` VALUES ('30', '面膜', '16', '0', '0');
INSERT INTO `sp_category` VALUES ('31', '面霜', '16', '0', '0');
INSERT INTO `sp_category` VALUES ('32', '辅食营养', '6', '0', '0');
INSERT INTO `sp_category` VALUES ('33', '饼干/泡芙', '32', '0', '0');
INSERT INTO `sp_category` VALUES ('34', '米粉', '32', '0', '0');
INSERT INTO `sp_category` VALUES ('35', '果泥/肉泥/菜泥', '32', '0', '0');
INSERT INTO `sp_category` VALUES ('36', '辅食/零食', '32', '0', '0');
INSERT INTO `sp_category` VALUES ('37', '母婴用品', '6', '0', '0');
INSERT INTO `sp_category` VALUES ('38', '吸奶器', '37', '0', '0');
INSERT INTO `sp_category` VALUES ('39', '孕妇营养', '6', '0', '0');
INSERT INTO `sp_category` VALUES ('40', '叶酸', '39', '0', '0');
INSERT INTO `sp_category` VALUES ('41', 'DHA', '39', '0', '0');
INSERT INTO `sp_category` VALUES ('42', '维生素/矿物质', '39', '0', '0');
INSERT INTO `sp_category` VALUES ('43', '增强免疫力', '39', '0', '0');
INSERT INTO `sp_category` VALUES ('44', '奶瓶奶嘴', '37', '0', '0');
INSERT INTO `sp_category` VALUES ('45', '消毒用具', '37', '0', '0');
INSERT INTO `sp_category` VALUES ('46', '辅助用品', '37', '0', '0');
INSERT INTO `sp_category` VALUES ('47', '清洁洗护', '37', '0', '0');
INSERT INTO `sp_category` VALUES ('48', '婴儿用品', '6', '0', '0');
INSERT INTO `sp_category` VALUES ('49', '牛奶粉', '48', '0', '0');
INSERT INTO `sp_category` VALUES ('50', '羊奶粉', '48', '0', '0');
INSERT INTO `sp_category` VALUES ('51', '湿巾', '48', '0', '0');
INSERT INTO `sp_category` VALUES ('52', '纸尿裤', '48', '0', '0');
INSERT INTO `sp_category` VALUES ('53', '婴儿服饰', '48', '0', '0');
INSERT INTO `sp_category` VALUES ('54', '婴儿玩具', '48', '0', '0');
INSERT INTO `sp_category` VALUES ('55', '婴儿餐具', '48', '0', '0');
INSERT INTO `sp_category` VALUES ('56', '男士箱包', '10', '0', '0');
INSERT INTO `sp_category` VALUES ('57', '女士箱包', '10', '0', '0');
INSERT INTO `sp_category` VALUES ('58', '斜挎包', '57', '0', '0');
INSERT INTO `sp_category` VALUES ('59', '手提包', '57', '0', '0');
INSERT INTO `sp_category` VALUES ('60', '双肩包', '57', '0', '0');
INSERT INTO `sp_category` VALUES ('61', '钱包/卡包', '57', '0', '0');
INSERT INTO `sp_category` VALUES ('62', '化妆包', '57', '0', '0');
INSERT INTO `sp_category` VALUES ('63', '斜挎包', '56', '0', '0');
INSERT INTO `sp_category` VALUES ('64', '双肩包', '56', '0', '0');
INSERT INTO `sp_category` VALUES ('65', '手拿包', '56', '0', '0');
INSERT INTO `sp_category` VALUES ('66', '商务包', '56', '0', '0');
INSERT INTO `sp_category` VALUES ('67', '钱包/卡包', '56', '0', '0');
INSERT INTO `sp_category` VALUES ('68', '拉杆箱', '56', '0', '0');
INSERT INTO `sp_category` VALUES ('69', '拉杆箱', '57', '0', '0');
INSERT INTO `sp_category` VALUES ('70', '手拿包', '57', '0', '0');
INSERT INTO `sp_category` VALUES ('71', '手提包', '56', '0', '0');
INSERT INTO `sp_category` VALUES ('72', '保温杯', '22', '0', '0');
INSERT INTO `sp_category` VALUES ('73', '空腔护理', '22', '0', '0');
INSERT INTO `sp_category` VALUES ('74', '女性护理', '22', '0', '0');
INSERT INTO `sp_category` VALUES ('75', '洗护日用', '22', '0', '0');
INSERT INTO `sp_category` VALUES ('76', '情趣用品', '22', '0', '0');
INSERT INTO `sp_category` VALUES ('77', '休闲零食', '23', '0', '0');
INSERT INTO `sp_category` VALUES ('78', '茶酒冲饮', '23', '0', '0');
INSERT INTO `sp_category` VALUES ('79', '生鲜食品', '23', '0', '0');
INSERT INTO `sp_category` VALUES ('80', '麦片', '77', '0', '0');
INSERT INTO `sp_category` VALUES ('81', '巧克力', '77', '0', '0');
INSERT INTO `sp_category` VALUES ('82', '坚果', '77', '0', '0');
INSERT INTO `sp_category` VALUES ('83', '肉干肉脯', '77', '0', '0');
INSERT INTO `sp_category` VALUES ('84', '蜂蜜', '77', '0', '0');
INSERT INTO `sp_category` VALUES ('85', '女士T恤', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('86', '连衣裙', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('87', '针织衫毛衣', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('88', '裙子', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('89', '内衣', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('90', '风衣', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('91', '女士休闲裤', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('92', '女士卫衣/绒衫', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('93', '女士牛仔裤', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('94', '女士毛呢外套', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('95', '女士毛衣', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('96', '女士羽绒服', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('97', '女士衬衫', '24', '0', '0');
INSERT INTO `sp_category` VALUES ('98', '男士衬衣', '25', '0', '0');
INSERT INTO `sp_category` VALUES ('99', 'POLO衫', '25', '0', '0');
INSERT INTO `sp_category` VALUES ('100', '男士T-恤', '25', '0', '0');
INSERT INTO `sp_category` VALUES ('101', '针织衫毛衣', '25', '0', '0');
INSERT INTO `sp_category` VALUES ('102', '男士卫衣', '25', '0', '0');
INSERT INTO `sp_category` VALUES ('103', '夹克', '25', '0', '0');
INSERT INTO `sp_category` VALUES ('104', '男士羽绒服', '25', '0', '0');
INSERT INTO `sp_category` VALUES ('105', '男士裤装', '25', '0', '0');
INSERT INTO `sp_category` VALUES ('106', '牛仔裤', '25', '0', '0');
INSERT INTO `sp_category` VALUES ('107', '男鞋', '26', '0', '0');
INSERT INTO `sp_category` VALUES ('108', '女鞋', '26', '0', '0');
INSERT INTO `sp_category` VALUES ('109', '运动鞋', '26', '0', '0');
INSERT INTO `sp_category` VALUES ('110', '单鞋', '26', '0', '0');
INSERT INTO `sp_category` VALUES ('111', '豆豆鞋', '26', '0', '0');
INSERT INTO `sp_category` VALUES ('112', '凉鞋', '26', '0', '0');
INSERT INTO `sp_category` VALUES ('113', '高跟鞋', '26', '0', '0');
INSERT INTO `sp_category` VALUES ('114', '靴子', '26', '0', '0');
INSERT INTO `sp_category` VALUES ('115', '手表', '27', '0', '0');
INSERT INTO `sp_category` VALUES ('116', '手链手镯', '27', '0', '0');
INSERT INTO `sp_category` VALUES ('117', '戒指', '27', '0', '0');
INSERT INTO `sp_category` VALUES ('118', '耳饰', '27', '0', '0');
INSERT INTO `sp_category` VALUES ('119', '项链吊坠', '27', '0', '0');
INSERT INTO `sp_category` VALUES ('120', '太阳镜', '27', '0', '0');
INSERT INTO `sp_category` VALUES ('121', '皮带', '27', '0', '0');
INSERT INTO `sp_category` VALUES ('122', '围巾帽子', '27', '0', '0');
INSERT INTO `sp_category` VALUES ('123', '测1', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('124', '测试2', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('125', '测试3', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('126', '测试4', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('127', '测试5', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('128', '订单', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('129', '哈哈111', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('130', 'wewerwrwe', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('131', 'asss', '0', '0', '0');
INSERT INTO `sp_category` VALUES ('132', '地地道道的', '8', '0', '0');
INSERT INTO `sp_category` VALUES ('133', 's搜索', '0', '0', '0');

-- ----------------------------
-- Table structure for `sp_express`
-- ----------------------------
DROP TABLE IF EXISTS `sp_express`;
CREATE TABLE `sp_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '快递名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1已禁用',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_express
-- ----------------------------
INSERT INTO `sp_express` VALUES ('1', '中通快递', '0', '0', '0');
INSERT INTO `sp_express` VALUES ('2', '圆通快递', '0', '0', '0');

-- ----------------------------
-- Table structure for `sp_freight`
-- ----------------------------
DROP TABLE IF EXISTS `sp_freight`;
CREATE TABLE `sp_freight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '运费模版状态 0正常 1商家已删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sp_freight_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_freight
-- ----------------------------
INSERT INTO `sp_freight` VALUES ('7', '7', '箱包类模版', '0');
INSERT INTO `sp_freight` VALUES ('8', '7', '箱包类模版', '0');
INSERT INTO `sp_freight` VALUES ('9', '7', '箱包类模版', '0');
INSERT INTO `sp_freight` VALUES ('11', '7', '箱包类模版', '0');
INSERT INTO `sp_freight` VALUES ('12', '7', '箱包类模版', '0');
INSERT INTO `sp_freight` VALUES ('14', '7', '箱包类模版', '0');
INSERT INTO `sp_freight` VALUES ('16', '7', '11箱包类模版', '0');
INSERT INTO `sp_freight` VALUES ('17', '7', '箱包类模版', '0');
INSERT INTO `sp_freight` VALUES ('18', '7', '箱包类模版', '0');
INSERT INTO `sp_freight` VALUES ('47', '7', '模版', '0');
INSERT INTO `sp_freight` VALUES ('48', '7', '模版', '0');
INSERT INTO `sp_freight` VALUES ('51', '7', '模版', '0');
INSERT INTO `sp_freight` VALUES ('55', '7', '模版', '0');
INSERT INTO `sp_freight` VALUES ('56', '7', '模版', '0');
INSERT INTO `sp_freight` VALUES ('58', '7', '模版', '0');
INSERT INTO `sp_freight` VALUES ('59', '7', '模版', '0');

-- ----------------------------
-- Table structure for `sp_freight_var`
-- ----------------------------
DROP TABLE IF EXISTS `sp_freight_var`;
CREATE TABLE `sp_freight_var` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freight_id` int(11) NOT NULL COMMENT '运费模版id',
  `place_id_arr` varchar(255) NOT NULL DEFAULT '0' COMMENT '地区id集合',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '几件内',
  `freight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `numadd` int(10) NOT NULL DEFAULT '0' COMMENT '每增加',
  `freightadd` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费增加',
  `place_names` varchar(1000) NOT NULL COMMENT '州名称',
  PRIMARY KEY (`id`),
  KEY `freight_id` (`freight_id`),
  CONSTRAINT `sp_freight_var_ibfk_1` FOREIGN KEY (`freight_id`) REFERENCES `sp_freight` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_freight_var
-- ----------------------------
INSERT INTO `sp_freight_var` VALUES ('4', '7', '0', '1', '2.00', '2', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('5', '7', '321,322,326', '2', '3.00', '4', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('6', '8', '0', '0', '0.00', '0', '0.00', '');
INSERT INTO `sp_freight_var` VALUES ('7', '8', '0', '0', '0.00', '0', '0.00', '');
INSERT INTO `sp_freight_var` VALUES ('8', '9', '0', '0', '0.00', '0', '0.00', '');
INSERT INTO `sp_freight_var` VALUES ('9', '9', '0', '0', '0.00', '0', '0.00', '');
INSERT INTO `sp_freight_var` VALUES ('10', '11', '0', '1', '2.00', '2', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('11', '11', '321,322,326', '2', '3.00', '4', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('12', '12', '0', '1', '2.00', '2', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('13', '12', '321,322,326', '2', '3.00', '4', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('14', '14', '0', '1', '2.00', '2', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('15', '14', '321,322,326', '2', '3.00', '4', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('20', '16', '0', '1', '2.00', '2', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('21', '16', '321,322,326,356', '3', '3.00', '2', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('22', '17', '0', '1', '2.00', '2', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('23', '17', '321,322,326', '2', '3.00', '4', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('24', '18', '0', '1', '2.00', '2', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('25', '18', '321,322,326', '2', '3.00', '4', '5.00', '');
INSERT INTO `sp_freight_var` VALUES ('26', '47', '0', '1', '1.00', '2', '2.00', '');
INSERT INTO `sp_freight_var` VALUES ('27', '47', '337', '0', '0.00', '0', '0.00', '');
INSERT INTO `sp_freight_var` VALUES ('28', '48', '0', '1', '1.00', '2', '2.00', '');
INSERT INTO `sp_freight_var` VALUES ('29', '48', '337', '0', '0.00', '0', '0.00', '');
INSERT INTO `sp_freight_var` VALUES ('30', '51', '0', '1', '1.00', '2', '2.00', '');
INSERT INTO `sp_freight_var` VALUES ('31', '51', '337', '0', '0.00', '0', '0.00', '');
INSERT INTO `sp_freight_var` VALUES ('32', '55', '0', '1', '1.00', '2', '2.00', '0');
INSERT INTO `sp_freight_var` VALUES ('33', '55', '337', '0', '0.00', '0', '0.00', '\'纽约1 纽约2 纽约3\'');
INSERT INTO `sp_freight_var` VALUES ('34', '56', '0', '1', '1.00', '2', '2.00', '0');
INSERT INTO `sp_freight_var` VALUES ('35', '56', '337', '0', '0.00', '0', '0.00', '\'纽约1 纽约2 纽约3\'');
INSERT INTO `sp_freight_var` VALUES ('36', '58', '0', '1', '1.00', '2', '2.00', '0');
INSERT INTO `sp_freight_var` VALUES ('37', '58', '337 33 43', '0', '0.00', '0', '0.00', '\'纽约1 纽约2 纽约3\'');
INSERT INTO `sp_freight_var` VALUES ('38', '59', '0', '1', '1.00', '2', '2.00', '0');
INSERT INTO `sp_freight_var` VALUES ('39', '59', '337', '0', '0.00', '0', '0.00', '\'纽约1 纽约2 纽约3\'');

-- ----------------------------
-- Table structure for `sp_good`
-- ----------------------------
DROP TABLE IF EXISTS `sp_good`;
CREATE TABLE `sp_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `good_num` varchar(55) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(500) NOT NULL COMMENT '商品说明',
  `cate_id` int(11) NOT NULL COMMENT '分类id',
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1禁用 2审核中',
  `is_reco` int(11) NOT NULL DEFAULT '0' COMMENT '是否推荐 0否 1是',
  `is_hot` int(11) NOT NULL DEFAULT '0' COMMENT '是否热门 0否 1是',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT '商家用户id 空为后台发布 ',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '商品排序',
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `cate_id` (`cate_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_good
-- ----------------------------
INSERT INTO `sp_good` VALUES ('55', '123321456987', '后台测试产品', '这是一个测试产品', '33', '14', '0', '0', '0', '1512187923', '1512197666', '0', '0');
INSERT INTO `sp_good` VALUES ('56', '789456123', '后台测试产品123hfgh56345344444444444444444444444444444444444444444444444444444444444444444444444444444445', '这是一个测试产品', '34', '14', '0', '0', '0', '1512197537', '1512305880', '0', '0');
INSERT INTO `sp_good` VALUES ('59', '213123123', '商品测试1', '三大三大四的', '8', '2', '0', '0', '0', '1513431125', '1513431125', '7', '0');
INSERT INTO `sp_good` VALUES ('60', '213123123', '商品测试1123', '三大三大四的', '8', '2', '0', '0', '0', '1513431150', '1513431150', '7', '0');

-- ----------------------------
-- Table structure for `sp_good_clicks`
-- ----------------------------
DROP TABLE IF EXISTS `sp_good_clicks`;
CREATE TABLE `sp_good_clicks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clicks` int(11) NOT NULL DEFAULT '500' COMMENT '点击数',
  `good_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_good_clicks
-- ----------------------------
INSERT INTO `sp_good_clicks` VALUES ('5', '500', '56');
INSERT INTO `sp_good_clicks` VALUES ('8', '500', '59');
INSERT INTO `sp_good_clicks` VALUES ('9', '500', '60');

-- ----------------------------
-- Table structure for `sp_good_code`
-- ----------------------------
DROP TABLE IF EXISTS `sp_good_code`;
CREATE TABLE `sp_good_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(255) NOT NULL COMMENT '商品id',
  `model_text` varchar(50) NOT NULL COMMENT '商品型号',
  `bar_code` varchar(255) NOT NULL COMMENT '条形码',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_good_code
-- ----------------------------
INSERT INTO `sp_good_code` VALUES ('15', '55', '红色', '111111', '1512307131', '1512307131');
INSERT INTO `sp_good_code` VALUES ('16', '55', '黑色', '222222', '1512307142', '1512307142');

-- ----------------------------
-- Table structure for `sp_good_image`
-- ----------------------------
DROP TABLE IF EXISTS `sp_good_image`;
CREATE TABLE `sp_good_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `image_url` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_good_image
-- ----------------------------
INSERT INTO `sp_good_image` VALUES ('21', '55', 'http://oz588ykkh.bkt.gdipper.com/1fec5ded8ed2e786048657717ba60f0c');
INSERT INTO `sp_good_image` VALUES ('22', '56', 'http://oz588ykkh.bkt.gdipper.com/071fdbe8a59628f2cea4f080dd6a8300');
INSERT INTO `sp_good_image` VALUES ('25', '59', '[{\"pic\":\"goods\\/20170718\\/thumb\\/201707181645191500367519028.jpg\",\"small\":\"goods\\/small\\/20170718\\/thumb\\/201707181645191500367519028.jpg\"},{\"pic\":\"goods\\/20170724\\/thumb\\/201707241142061500867726937.jpg\",\"small\":\"goods\\/small\\/20170724\\/thumb\\/201707241142061500867726937.jpg\"},{\"pic\":\"goods\\/20170724\\/thumb\\/201707241142071500867727082.jpg\",\"small\":\"goods\\/small\\/20170724\\/thumb\\/201707241142071500867727082.jpg\"},{\"pic\":\"goods\\/20170724\\/thumb\\/201707241142071500867727257.jpg\",\"small\":\"goods\\/small\\/20170724\\/thumb\\/201707241142071500867727257.jpg\"}]');
INSERT INTO `sp_good_image` VALUES ('26', '60', '[{\"pic\":\"goods\\/20170718\\/thumb\\/201707181645191500367519028.jpg\",\"small\":\"goods\\/small\\/20170718\\/thumb\\/201707181645191500367519028.jpg\"},{\"pic\":\"goods\\/20170724\\/thumb\\/201707241142061500867726937.jpg\",\"small\":\"goods\\/small\\/20170724\\/thumb\\/201707241142061500867726937.jpg\"},{\"pic\":\"goods\\/20170724\\/thumb\\/201707241142071500867727082.jpg\",\"small\":\"goods\\/small\\/20170724\\/thumb\\/201707241142071500867727082.jpg\"},{\"pic\":\"goods\\/20170724\\/thumb\\/201707241142071500867727257.jpg\",\"small\":\"goods\\/small\\/20170724\\/thumb\\/201707241142071500867727257.jpg\"}]');

-- ----------------------------
-- Table structure for `sp_good_mb`
-- ----------------------------
DROP TABLE IF EXISTS `sp_good_mb`;
CREATE TABLE `sp_good_mb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家用户id',
  `place_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货地id',
  `freight_id` int(11) NOT NULL DEFAULT '0' COMMENT '运费模板id',
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `cate_id` int(11) NOT NULL COMMENT '分类id',
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 0正常  1审核中 ',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `mb_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0 正常 1商家已下架',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `place_id` (`place_id`),
  KEY `freight_id` (`freight_id`),
  KEY `good_id` (`good_id`),
  KEY `cate_id` (`cate_id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sp_good_mb
-- ----------------------------
INSERT INTO `sp_good_mb` VALUES ('34', '7', '4021', '14', '55', '33', '14', '0', '1512189182', '1512304843', '0');
INSERT INTO `sp_good_mb` VALUES ('35', '7', '4021', '0', '59', '8', '2', '1', '1513431125', '1513431125', '0');
INSERT INTO `sp_good_mb` VALUES ('36', '7', '4021', '0', '60', '8', '2', '1', '1513431150', '1513431150', '0');

-- ----------------------------
-- Table structure for `sp_good_mbv`
-- ----------------------------
DROP TABLE IF EXISTS `sp_good_mbv`;
CREATE TABLE `sp_good_mbv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` int(11) NOT NULL DEFAULT '0' COMMENT '报价id',
  `model_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '型号 如 黑色1 黑色2',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `stock_num` int(7) NOT NULL COMMENT '库存数量',
  `bar_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '条形码',
  `bar_code_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '条形码是否通过官方验证 0否 1是',
  `status` smallint(6) NOT NULL DEFAULT '2' COMMENT '状态 0正常 2审核中',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sp_good_mbv
-- ----------------------------
INSERT INTO `sp_good_mbv` VALUES ('61', '34', '红色', '111.00', '50', '111111', '0', '0', '1512189182', '1512189182');
INSERT INTO `sp_good_mbv` VALUES ('62', '34', '黑色', '222.00', '50', '222222', '0', '0', '1512189182', '1512189182');
INSERT INTO `sp_good_mbv` VALUES ('63', '34', '黄色', '222.00', '50', '333333', '0', '0', '1512189182', '1512304843');
INSERT INTO `sp_good_mbv` VALUES ('64', '35', '型号1', '111.00', '50', '21231231231', '0', '2', '1513431125', '1513431125');
INSERT INTO `sp_good_mbv` VALUES ('65', '35', '型号2', '222.00', '50', '3123123123123', '0', '2', '1513431125', '1513431125');
INSERT INTO `sp_good_mbv` VALUES ('66', '36', '型号1', '111.00', '50', '21231231231', '0', '2', '1513431150', '1513431150');
INSERT INTO `sp_good_mbv` VALUES ('67', '36', '型号2', '222.00', '50', '3123123123123', '0', '2', '1513431150', '1513431150');

-- ----------------------------
-- Table structure for `sp_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sp_menu`;
CREATE TABLE `sp_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `sp_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `sp_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_menu
-- ----------------------------
INSERT INTO `sp_menu` VALUES ('5', '后台管理', null, '/admin-user/index', null, null);
INSERT INTO `sp_menu` VALUES ('6', '管理员用户', '5', '/admin-user/index', null, null);
INSERT INTO `sp_menu` VALUES ('7', '权限管理', '5', '/admin/route/index', null, null);
INSERT INTO `sp_menu` VALUES ('8', '路由', '7', '/admin/route/index', '1', null);
INSERT INTO `sp_menu` VALUES ('9', '权限', '7', '/admin/permission/index', '2', null);
INSERT INTO `sp_menu` VALUES ('10', '角色', '7', '/admin/role/index', '3', null);
INSERT INTO `sp_menu` VALUES ('11', '分配', '7', '/admin/assignment/index', '4', null);
INSERT INTO `sp_menu` VALUES ('12', '菜单管理', '5', '/admin/menu/index', null, null);
INSERT INTO `sp_menu` VALUES ('13', '前台管理', null, '/user/index', null, null);
INSERT INTO `sp_menu` VALUES ('14', '用户管理', '13', '/user/index', null, null);
INSERT INTO `sp_menu` VALUES ('15', '神之左手', '5', '/admin/default/index', null, null);
INSERT INTO `sp_menu` VALUES ('16', 'gii', '15', '/gii/default/index', '1', null);
INSERT INTO `sp_menu` VALUES ('17', 'debug', '15', '/debug/default/index', '2', null);
INSERT INTO `sp_menu` VALUES ('19', 'Banner管理', '13', '/banner/index', null, null);
INSERT INTO `sp_menu` VALUES ('20', '商品分类', '13', '/category/index', null, null);
INSERT INTO `sp_menu` VALUES ('21', '商品品牌', '13', '/brand/index', null, null);
INSERT INTO `sp_menu` VALUES ('22', '商家管理', '13', '/business/index', null, null);
INSERT INTO `sp_menu` VALUES ('23', '订单管理', '13', '/order/index', null, null);
INSERT INTO `sp_menu` VALUES ('24', '商品管理', '13', '/good/index', null, null);
INSERT INTO `sp_menu` VALUES ('25', '商家报价管理', '13', '/good-mb/index', null, null);
INSERT INTO `sp_menu` VALUES ('26', '提现管理', '13', '/user-withdrawalsapply/index', null, null);
INSERT INTO `sp_menu` VALUES ('27', '条形码库', '13', '/good-code/index', null, null);
INSERT INTO `sp_menu` VALUES ('28', '转运仓管理', '13', '/user-address/index', null, null);

-- ----------------------------
-- Table structure for `sp_migration`
-- ----------------------------
DROP TABLE IF EXISTS `sp_migration`;
CREATE TABLE `sp_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_migration
-- ----------------------------
INSERT INTO `sp_migration` VALUES ('m000000_000000_base', '1500776810');
INSERT INTO `sp_migration` VALUES ('m130524_201442_init', '1500776815');
INSERT INTO `sp_migration` VALUES ('m140602_111327_create_menu_table', '1500781213');
INSERT INTO `sp_migration` VALUES ('m140506_102106_rbac_init', '1500787705');

-- ----------------------------
-- Table structure for `sp_order`
-- ----------------------------
DROP TABLE IF EXISTS `sp_order`;
CREATE TABLE `sp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(128) NOT NULL COMMENT '订单编号',
  `user_id` int(11) NOT NULL COMMENT '购买用户id',
  `business_id` int(11) NOT NULL COMMENT '商家用户id',
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `mb_id` int(11) NOT NULL COMMENT '商家报价id',
  `mbv_id` int(11) NOT NULL COMMENT '商品属性id',
  `user_address` varchar(1000) NOT NULL COMMENT '用户收货地址',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式 1余额 2支付宝',
  `good_price` decimal(12,2) NOT NULL COMMENT '商品单价',
  `pay_num` int(11) NOT NULL COMMENT '购买数量',
  `good_total_price` decimal(12,2) NOT NULL COMMENT '商品总价',
  `order_fare` decimal(12,2) NOT NULL COMMENT '运费',
  `order_total_price` decimal(12,2) NOT NULL COMMENT '订单总价',
  `express_name` varchar(50) DEFAULT NULL COMMENT '快递名称',
  `express_num` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1待支付 2待发货 3已发货 4已完成 5已出库',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `pay_at` int(11) DEFAULT NULL COMMENT '支付时间',
  `deliver_at` int(11) DEFAULT NULL COMMENT '发货时间',
  `complete_at` int(11) DEFAULT NULL COMMENT '完成时间',
  `good_var` varchar(1000) DEFAULT NULL COMMENT '商品信息',
  `cancel_text` varchar(100) DEFAULT NULL COMMENT '订单取消原因',
  `message` varchar(300) DEFAULT NULL COMMENT '用户留言',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `business_id` (`business_id`),
  KEY `good_id` (`good_id`),
  KEY `mb_id` (`mb_id`),
  KEY `mbv_id` (`mbv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_order
-- ----------------------------
INSERT INTO `sp_order` VALUES ('1', '20171029021742425308000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '125.00', '1', '125.00', '3.00', '128.00', null, null, '1', '1509214662', null, null, null, null, null, null);
INSERT INTO `sp_order` VALUES ('2', '20171029021903043482000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '1', '125.00', '1', '125.00', '3.00', '128.00', null, null, '2', '1509214743', null, null, null, null, null, null);
INSERT INTO `sp_order` VALUES ('3', '20171029022226154988000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '2', '125.00', '1', '125.00', '3.00', '128.00', null, null, '3', '1509214946', null, null, null, null, null, null);
INSERT INTO `sp_order` VALUES ('4', '20171029140546286815000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '1', '125.00', '17', '2125.00', '38.00', '2163.00', null, null, '4', '1509257146', null, null, null, null, null, null);
INSERT INTO `sp_order` VALUES ('5', '20171029140727716590000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '125.00', '17', '2125.00', '38.00', '2163.00', null, null, '5', '1509257247', null, null, null, null, null, null);
INSERT INTO `sp_order` VALUES ('6', '20171029140729451181000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '125.00', '17', '2125.00', '38.00', '2163.00', null, null, '1', '1509257249', '1509307742', null, null, null, null, null);
INSERT INTO `sp_order` VALUES ('7', '20171029140810464235000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '125.00', '17', '2125.00', '38.00', '2163.00', null, null, '1', '1509257290', null, null, null, null, null, null);
INSERT INTO `sp_order` VALUES ('8', '20171029154200732727000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '125.00', '17', '2125.00', '38.00', '2163.00', null, null, '3', '1509262920', null, null, '1511249692', '{\"title\":\"karen murrell \\u53e3\\u7ea2 #8 \\u8273\\u4e3d\\u6a58\\u8272 4\\u514b \\u5f20\\u827a\\u5174\\u6781\\u9650\\u6311\\u6218\\u540c\\u6b3e\\u53e3\\u7ea2\\uff01\",\"good_image\":\"http:\\/\\/localhost\\/yiishop\\/uploads\\/goods\\/small\\/20170718\\/thumb\\/201707181645191500367519028.jpg\",\"model_text\":\"\\u578b\\u53f73\"}', null, '');
INSERT INTO `sp_order` VALUES ('9', '20171029154344136863000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '2', '125.00', '17', '2125.00', '38.00', '2163.00', '中通快递', '231231231243124124123', '3', '1509263024', null, '1509288828', null, '{\"title\":\"karen murrell \\u53e3\\u7ea2 #8 \\u8273\\u4e3d\\u6a58\\u8272 4\\u514b \\u5f20\\u827a\\u5174\\u6781\\u9650\\u6311\\u6218\\u540c\\u6b3e\\u53e3\\u7ea2\\uff01\",\"good_image\":\"http:\\/\\/localhost\\/yiishop\\/uploads\\/goods\\/small\\/20170718\\/thumb\\/201707181645191500367519028.jpg\",\"model_text\":\"\\u578b\\u53f73\"}', null, '');
INSERT INTO `sp_order` VALUES ('10', '20171029154357105472000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '125.00', '17', '2125.00', '38.00', '2163.00', null, null, '5', '1509263037', null, null, '1509288988', '{\"title\":\"karen murrell \\u53e3\\u7ea2 #8 \\u8273\\u4e3d\\u6a58\\u8272 4\\u514b \\u5f20\\u827a\\u5174\\u6781\\u9650\\u6311\\u6218\\u540c\\u6b3e\\u53e3\\u7ea2\\uff01\",\"good_image\":\"http:\\/\\/localhost\\/yiishop\\/uploads\\/goods\\/small\\/20170718\\/thumb\\/201707181645191500367519028.jpg\",\"model_text\":\"\\u578b\\u53f73\"}', '缺货', 'sdasdasdasdasd');
INSERT INTO `sp_order` VALUES ('11', '20171029155020892421000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '125.00', '17', '2125.00', '38.00', '2163.00', null, null, '1', '1509263420', null, null, null, '{\"title\":\"karen murrell \\u53e3\\u7ea2 #8 \\u8273\\u4e3d\\u6a58\\u8272 4\\u514b \\u5f20\\u827a\\u5174\\u6781\\u9650\\u6311\\u6218\\u540c\\u6b3e\\u53e3\\u7ea2\\uff01\",\"good_image\":\"http:\\/\\/localhost\\/yiishop\\/uploads\\/goods\\/small\\/20170718\\/thumb\\/201707181645191500367519028.jpg\",\"model_text\":\"\\u578b\\u53f73\"}', null, '');
INSERT INTO `sp_order` VALUES ('12', '20171029155039595458000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '125.00', '17', '2125.00', '38.00', '2163.00', null, null, '1', '1509263439', null, null, null, '{\"title\":\"karen murrell \\u53e3\\u7ea2 #8 \\u8273\\u4e3d\\u6a58\\u8272 4\\u514b \\u5f20\\u827a\\u5174\\u6781\\u9650\\u6311\\u6218\\u540c\\u6b3e\\u53e3\\u7ea2\\uff01\",\"good_image\":\"http:\\/\\/localhost\\/yiishop\\/uploads\\/goods\\/small\\/20170718\\/thumb\\/201707181645191500367519028.jpg\",\"model_text\":\"\\u578b\\u53f73\"}', null, '');
INSERT INTO `sp_order` VALUES ('13', '20171030220856591069000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '125.00', '1', '125.00', '3.00', '128.00', null, null, '1', '1509372536', null, null, null, '{\"title\":\"karen murrell \\u53e3\\u7ea2 #8 \\u8273\\u4e3d\\u6a58\\u8272 4\\u514b \\u5f20\\u827a\\u5174\\u6781\\u9650\\u6311\\u6218\\u540c\\u6b3e\\u53e3\\u7ea2\\uff01\",\"good_image\":\"http:\\/\\/localhost\\/yiishop\\/uploads\\/goods\\/small\\/20170718\\/thumb\\/201707181645191500367519028.jpg\",\"model_text\":\"\\u578b\\u53f73\"}', null, '');
INSERT INTO `sp_order` VALUES ('14', '20171031213859042508000013', '13', '7', '5', '3', '5', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '1', '125.00', '1', '125.00', '3.00', '128.00', null, null, '2', '1509457139', '1509552026', null, null, '{\"title\":\"karen murrell \\u53e3\\u7ea2 #8 \\u8273\\u4e3d\\u6a58\\u8272 4\\u514b \\u5f20\\u827a\\u5174\\u6781\\u9650\\u6311\\u6218\\u540c\\u6b3e\\u53e3\\u7ea2\\uff01\",\"good_image\":\"http:\\/\\/localhost\\/yiishop\\/uploads\\/goods\\/small\\/20170718\\/thumb\\/201707181645191500367519028.jpg\",\"model_text\":\"\\u578b\\u53f73\"}', null, '');
INSERT INTO `sp_order` VALUES ('15', '20171203232308061759000013', '13', '7', '55', '34', '61', '{\"address_id\":28,\"name\":\"\\u5b85\\u5927\\u6d6a\",\"phone\":\"18767192928\",\"address_cn\":\"\\u7ebd\\u7ea6 \\u7ebd\\u7ea6\\u5e02\",\"address_en\":\"New York,NY\",\"address_street\":\"\\u5927\\u9053\\u4e1c\"}', '0', '111.00', '1', '111.00', '2.00', '113.00', null, null, '1', '1512314588', null, null, null, '{\"title\":\"\\u540e\\u53f0\\u6d4b\\u8bd5\\u4ea7\\u54c1\",\"good_image\":\"http:\\/\\/oz588ykkh.bkt.gdipper.com\\/1fec5ded8ed2e786048657717ba60f0c\",\"model_text\":\"\\u7ea2\\u8272\"}', null, '1111');

-- ----------------------------
-- Table structure for `sp_place`
-- ----------------------------
DROP TABLE IF EXISTS `sp_place`;
CREATE TABLE `sp_place` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '父ID',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `level` int(11) unsigned DEFAULT NULL COMMENT '层级',
  `name` varchar(255) DEFAULT NULL COMMENT '中文名称',
  `name_en` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `name_pinyin` varchar(255) DEFAULT NULL COMMENT '中文拼音',
  `code` varchar(50) DEFAULT NULL COMMENT '代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4170 DEFAULT CHARSET=utf8 COMMENT='全球地区库，采集自腾讯QQ国内+国际版.ADD.JENA.20141221';

-- ----------------------------
-- Records of sp_place
-- ----------------------------
INSERT INTO `sp_place` VALUES ('1', '0', ',1,', '1', '亚洲', 'Asia', 'yazhou', null);
INSERT INTO `sp_place` VALUES ('2', '0', ',2,', '1', '欧洲', 'Europe', 'ouzhou', null);
INSERT INTO `sp_place` VALUES ('3', '0', ',3,', '1', '非洲', 'Africa', 'feizhou', null);
INSERT INTO `sp_place` VALUES ('4', '0', ',4,', '1', '北美', 'North America', 'beimei', null);
INSERT INTO `sp_place` VALUES ('5', '0', ',5,', '1', '南美', 'South America', 'nanmei', null);
INSERT INTO `sp_place` VALUES ('6', '0', ',6,', '1', '大洋洲', 'Oceania', 'dayangzhou', null);
INSERT INTO `sp_place` VALUES ('7', '1', ',1,7,', '2', '中国', 'China', 'zhongguo', 'CN');
INSERT INTO `sp_place` VALUES ('8', '2', ',2,8,', '2', '阿尔巴尼亚', 'Albania', 'aerbaniya', 'ALB');
INSERT INTO `sp_place` VALUES ('9', '3', ',3,9,', '2', '阿尔及利亚', 'Algeria', 'aerjiliya', 'DZA');
INSERT INTO `sp_place` VALUES ('10', '1', ',1,10,', '2', '阿富汗', 'Afghanistan', 'afuhan', 'AFG');
INSERT INTO `sp_place` VALUES ('11', '5', ',5,11,', '2', '阿根廷', 'Argentina', 'agenting', 'ARG');
INSERT INTO `sp_place` VALUES ('12', '1', ',1,12,', '2', '阿拉伯联合酋长国', 'United Arab Emirates', 'alabolianheqiuchangguo', 'ARE');
INSERT INTO `sp_place` VALUES ('13', '5', ',5,13,', '2', '阿鲁巴', 'Aruba', 'aluba', 'ABW');
INSERT INTO `sp_place` VALUES ('14', '1', ',1,14,', '2', '阿曼', 'Oman', 'aman', 'OMN');
INSERT INTO `sp_place` VALUES ('15', '1', ',1,15,', '2', '阿塞拜疆', 'Azerbaijan', 'asaibaijiang', 'AZE');
INSERT INTO `sp_place` VALUES ('16', '3', ',3,16,', '2', '阿森松岛', 'Ascension Island', 'asensongdao', 'ASC');
INSERT INTO `sp_place` VALUES ('17', '3', ',3,17,', '2', '埃及', 'Egypt', 'aiji', 'EGY');
INSERT INTO `sp_place` VALUES ('18', '3', ',3,18,', '2', '埃塞俄比亚', 'Ethiopia', 'aisaiebiya', 'ETH');
INSERT INTO `sp_place` VALUES ('19', '2', ',2,19,', '2', '爱尔兰', 'Ireland', 'aierlan', 'IRL');
INSERT INTO `sp_place` VALUES ('20', '2', ',2,20,', '2', '爱沙尼亚', 'Estonia', 'aishaniya', 'EST');
INSERT INTO `sp_place` VALUES ('21', '2', ',2,21,', '2', '安道尔', 'Andorra', 'andaoer', 'AND');
INSERT INTO `sp_place` VALUES ('22', '3', ',3,22,', '2', '安哥拉', 'Angola', 'angela', 'AGO');
INSERT INTO `sp_place` VALUES ('23', '5', ',5,23,', '2', '安圭拉', 'Anguilla', 'anguila', 'AIA');
INSERT INTO `sp_place` VALUES ('24', '4', ',4,24,', '2', '安提瓜岛和巴布达', 'Antigua and Barbuda', 'antiguadaohebabuda', 'ATG');
INSERT INTO `sp_place` VALUES ('25', '6', ',6,25,', '2', '澳大利亚', 'Australia', 'aodaliya', 'AUS');
INSERT INTO `sp_place` VALUES ('26', '2', ',2,26,', '2', '奥地利', 'Austria', 'aodili', 'AUT');
INSERT INTO `sp_place` VALUES ('27', '2', ',2,27,', '2', '奥兰群岛', 'Aland lslands', 'aolanqundao', 'ALA');
INSERT INTO `sp_place` VALUES ('28', '5', ',5,28,', '2', '巴巴多斯岛', 'Barbados', 'babaduosidao', 'BRB');
INSERT INTO `sp_place` VALUES ('29', '6', ',6,29,', '2', '巴布亚新几内亚', 'Papua New Guinea', 'babuyaxinjineiya', 'PNG');
INSERT INTO `sp_place` VALUES ('30', '4', ',4,30,', '2', '巴哈马', 'Bahamas', 'bahama', 'BHS');
INSERT INTO `sp_place` VALUES ('31', '1', ',1,31,', '2', '巴基斯坦', 'Pakistan', 'bajisitan', 'PAK');
INSERT INTO `sp_place` VALUES ('32', '5', ',5,32,', '2', '巴拉圭', 'Paraguay', 'balagui', 'PRY');
INSERT INTO `sp_place` VALUES ('33', '1', ',1,33,', '2', '巴勒斯坦', 'Palestinian Authority', 'balesitan', 'PSE');
INSERT INTO `sp_place` VALUES ('34', '1', ',1,34,', '2', '巴林', 'Bahrain', 'balin', 'BHR');
INSERT INTO `sp_place` VALUES ('35', '4', ',4,35,', '2', '巴拿马', 'Panama', 'banama', 'PAN');
INSERT INTO `sp_place` VALUES ('36', '5', ',5,36,', '2', '巴西', 'Brazil', 'baxi', 'BRA');
INSERT INTO `sp_place` VALUES ('37', '2', ',2,37,', '2', '白俄罗斯', 'White Russia', 'baieluosi', 'BLR');
INSERT INTO `sp_place` VALUES ('38', '4', ',4,38,', '2', '百慕大', 'Bermuda', 'baimuda', 'BMU');
INSERT INTO `sp_place` VALUES ('39', '2', ',2,39,', '2', '保加利亚', 'Bulgaria', 'baojialiya', 'BGR');
INSERT INTO `sp_place` VALUES ('40', '4', ',4,40,', '2', '北马里亚纳群岛', 'Northern Mariana Islands', 'beimaliyanaqundao', 'MNP');
INSERT INTO `sp_place` VALUES ('41', '3', ',3,41,', '2', '贝宁', 'Benin', 'beining', 'BEN');
INSERT INTO `sp_place` VALUES ('42', '2', ',2,42,', '2', '比利时', 'Belgium', 'bilishi', 'BEL');
INSERT INTO `sp_place` VALUES ('43', '2', ',2,43,', '2', '冰岛', 'Iceland', 'bingdao', 'ISL');
INSERT INTO `sp_place` VALUES ('44', '4', ',4,44,', '2', '波多黎各', 'Puerto Rico', 'boduolige', 'PRI');
INSERT INTO `sp_place` VALUES ('45', '2', ',2,45,', '2', '波兰', 'Poland', 'bolan', 'POL');
INSERT INTO `sp_place` VALUES ('46', '5', ',5,46,', '2', '玻利维亚', 'Bolivia', 'boliweiya', 'BOL');
INSERT INTO `sp_place` VALUES ('47', '2', ',2,47,', '2', '波斯尼亚和黑塞哥维那', 'Bosnia and Herzegovina', 'bosiniyaheheisaigeweina', 'BIH');
INSERT INTO `sp_place` VALUES ('48', '3', ',3,48,', '2', '博茨瓦纳', 'Botswana', 'bociwana', 'BWA');
INSERT INTO `sp_place` VALUES ('49', '4', ',4,49,', '2', '伯利兹', 'Belize', 'bolizi', 'BLZ');
INSERT INTO `sp_place` VALUES ('50', '1', ',1,50,', '2', '不丹', 'Bhutan', 'budan', 'BTN');
INSERT INTO `sp_place` VALUES ('51', '3', ',3,51,', '2', '布基纳法索', 'Burkina Faso', 'bujinafasuo', 'BFA');
INSERT INTO `sp_place` VALUES ('52', '3', ',3,52,', '2', '布隆迪', 'Burundi', 'bulongdi', 'BDI');
INSERT INTO `sp_place` VALUES ('53', '2', ',2,53,', '2', '布韦岛', 'Bouvet Island', 'buweidao', 'BVT');
INSERT INTO `sp_place` VALUES ('54', '1', ',1,54,', '2', '朝鲜', 'North Korea', 'chaoxian', 'PRK');
INSERT INTO `sp_place` VALUES ('55', '2', ',2,55,', '2', '丹麦', 'Denmark', 'danmai', 'DNK');
INSERT INTO `sp_place` VALUES ('56', '2', ',2,56,', '2', '德国', 'Germany', 'deguo', 'DEU');
INSERT INTO `sp_place` VALUES ('57', '1', ',1,57,', '2', '东帝汶', 'Timor-Leste', 'dongdi', 'TLS');
INSERT INTO `sp_place` VALUES ('58', '3', ',3,58,', '2', '多哥', 'Togo', 'duoge', 'TGO');
INSERT INTO `sp_place` VALUES ('59', '4', ',4,59,', '2', '多米尼加', 'Dominica', 'duominijia', 'DMA');
INSERT INTO `sp_place` VALUES ('60', '4', ',4,60,', '2', '多米尼加共和国', 'Dominican Republic', 'duominijiagongheguo', 'DOM');
INSERT INTO `sp_place` VALUES ('61', '2', ',2,61,', '2', '俄罗斯', 'Russia', 'eluosi', 'RUS');
INSERT INTO `sp_place` VALUES ('62', '5', ',5,62,', '2', '厄瓜多尔', 'Ecuador', 'eguaduoer', 'ECU');
INSERT INTO `sp_place` VALUES ('63', '3', ',3,63,', '2', '厄立特里亚', 'Eritrea', 'eliteliya', 'ERI');
INSERT INTO `sp_place` VALUES ('64', '2', ',2,64,', '2', '法国', 'France', 'faguo', 'FRA');
INSERT INTO `sp_place` VALUES ('65', '2', ',2,65,', '2', '法罗群岛', 'Faroe Islands', 'faluoqundao', 'FRO');
INSERT INTO `sp_place` VALUES ('66', '6', ',6,66,', '2', '法属波利尼西亚', 'Frech Polynesia', 'fashubolinixiya', 'PYF');
INSERT INTO `sp_place` VALUES ('67', '5', ',5,67,', '2', '法属圭亚那', 'French Guiana', 'fashuguiyana', 'GUF');
INSERT INTO `sp_place` VALUES ('68', '2', ',2,68,', '2', '法属南部领地', 'French Southern and Antarctic Lands', 'fashunanbulingdi', 'ATF');
INSERT INTO `sp_place` VALUES ('69', '2', ',2,69,', '2', '梵蒂冈', 'Vatican City', 'digang', 'VAT');
INSERT INTO `sp_place` VALUES ('70', '1', ',1,70,', '2', '菲律宾', 'Philippines', 'feilvbin', 'PHL');
INSERT INTO `sp_place` VALUES ('71', '6', ',6,71,', '2', '斐济', 'Fiji Islands', 'ji', 'FJI');
INSERT INTO `sp_place` VALUES ('72', '2', ',2,72,', '2', '芬兰', 'Finland', 'fenlan', 'FIN');
INSERT INTO `sp_place` VALUES ('73', '3', ',3,73,', '2', '佛得角', 'Cape Verde', 'fodejiao', 'CPV');
INSERT INTO `sp_place` VALUES ('74', '2', ',2,74,', '2', '弗兰克群岛', 'Falkland Islands', 'fulankequndao', 'FLK');
INSERT INTO `sp_place` VALUES ('75', '3', ',3,75,', '2', '冈比亚', 'Gambia', 'gangbiya', 'GMB');
INSERT INTO `sp_place` VALUES ('76', '3', ',3,76,', '2', '刚果', 'Congo', 'gangguo', 'COG');
INSERT INTO `sp_place` VALUES ('77', '3', ',3,77,', '2', '刚果民主共和国', 'Congo(DRC)', 'gangguominzhugongheguo', 'COD');
INSERT INTO `sp_place` VALUES ('78', '5', ',5,78,', '2', '哥伦比亚', 'Colombia', 'gelunbiya', 'COL');
INSERT INTO `sp_place` VALUES ('79', '4', ',4,79,', '2', '哥斯达黎加', 'Costa Rica', 'gesidalijia', 'CRI');
INSERT INTO `sp_place` VALUES ('80', '2', ',2,80,', '2', '格恩西岛', 'Guernsey', 'geenxidao', 'GGY');
INSERT INTO `sp_place` VALUES ('81', '4', ',4,81,', '2', '格林纳达', 'Grenada', 'gelinnada', 'GRD');
INSERT INTO `sp_place` VALUES ('82', '4', ',4,82,', '2', '格陵兰', 'Greenland', 'gelinglan', 'GRL');
INSERT INTO `sp_place` VALUES ('83', '4', ',4,83,', '2', '古巴', 'Cuba', 'guba', 'CUB');
INSERT INTO `sp_place` VALUES ('84', '4', ',4,84,', '2', '瓜德罗普', 'Guadeloupe', 'guadeluopu', 'GLP');
INSERT INTO `sp_place` VALUES ('85', '6', ',6,85,', '2', '关岛', 'Guam', 'guandao', 'GUM');
INSERT INTO `sp_place` VALUES ('86', '5', ',5,86,', '2', '圭亚那', 'Guyana', 'guiyana', 'GUY');
INSERT INTO `sp_place` VALUES ('87', '1', ',1,87,', '2', '哈萨克斯坦', 'Kazakhstan', 'hasakesitan', 'KAZ');
INSERT INTO `sp_place` VALUES ('88', '4', ',4,88,', '2', '海地', 'Haiti', 'haidi', 'HTI');
INSERT INTO `sp_place` VALUES ('89', '1', ',1,89,', '2', '韩国', 'Korea', 'hanguo', 'KOR');
INSERT INTO `sp_place` VALUES ('90', '2', ',2,90,', '2', '荷兰', 'Netherlands', 'helan', 'NLD');
INSERT INTO `sp_place` VALUES ('91', '5', ',5,91,', '2', '荷属安地列斯', 'Netherlands Antilles', 'heshuandiliesi', 'ANT');
INSERT INTO `sp_place` VALUES ('92', '6', ',6,92,', '2', '赫德和麦克唐纳群岛', 'Heard Island and McDonald Islands', 'hedehemaiketangnaqundao', 'HMD');
INSERT INTO `sp_place` VALUES ('93', '4', ',4,93,', '2', '洪都拉斯', 'Honduras', 'hongdulasi', 'HND');
INSERT INTO `sp_place` VALUES ('94', '6', ',6,94,', '2', '基里巴斯', 'Kiribati', 'jilibasi', 'KIR');
INSERT INTO `sp_place` VALUES ('95', '3', ',3,95,', '2', '吉布提', 'Djibouti', 'jibuti', 'DJI');
INSERT INTO `sp_place` VALUES ('96', '1', ',1,96,', '2', '吉尔吉斯斯坦', 'Kyrgyzstan', 'jierjisisitan', 'KGZ');
INSERT INTO `sp_place` VALUES ('97', '3', ',3,97,', '2', '几内亚', 'Guinea', 'jineiya', 'GIN');
INSERT INTO `sp_place` VALUES ('98', '3', ',3,98,', '2', '几内亚比绍', 'Guinea-Bissau', 'jineiyabishao', 'GNB');
INSERT INTO `sp_place` VALUES ('99', '4', ',4,99,', '2', '加拿大', 'Canada', 'jianada', 'CAN');
INSERT INTO `sp_place` VALUES ('100', '3', ',3,100,', '2', '加纳', 'Ghana', 'jiana', 'GHA');
INSERT INTO `sp_place` VALUES ('101', '3', ',3,101,', '2', '加蓬', 'Gabon', 'jiapeng', 'GAB');
INSERT INTO `sp_place` VALUES ('102', '1', ',1,102,', '2', '柬埔寨', 'Cambodia', 'jianpuzhai', 'KHM');
INSERT INTO `sp_place` VALUES ('103', '2', ',2,103,', '2', '捷克共和国', 'Czech Republic', 'jiekegongheguo', 'CZE');
INSERT INTO `sp_place` VALUES ('104', '3', ',3,104,', '2', '津巴布韦', 'Zimbabwe', 'jinbabuwei', 'ZWE');
INSERT INTO `sp_place` VALUES ('105', '3', ',3,105,', '2', '喀麦隆', 'Cameroon', 'kamailong', 'CMR');
INSERT INTO `sp_place` VALUES ('106', '1', ',1,106,', '2', '卡塔尔', 'Qatar', 'kataer', 'QAT');
INSERT INTO `sp_place` VALUES ('107', '4', ',4,107,', '2', '开曼群岛', 'Cayman Islands', 'kaimanqundao', 'CYM');
INSERT INTO `sp_place` VALUES ('108', '6', ',6,108,', '2', '科科斯群岛', 'Cocos(Keeling)Islands', 'kekesiqundao', 'CCK');
INSERT INTO `sp_place` VALUES ('109', '3', ',3,109,', '2', '科摩罗', 'Comoros', 'kemoluo', 'COM');
INSERT INTO `sp_place` VALUES ('110', '3', ',3,110,', '2', '科特迪瓦', 'Cote d\'Ivoire', 'ketediwa', 'CIV');
INSERT INTO `sp_place` VALUES ('111', '1', ',1,111,', '2', '科威特', 'Kuwait', 'keweite', 'KWT');
INSERT INTO `sp_place` VALUES ('112', '2', ',2,112,', '2', '克罗地亚', 'Croatia', 'keluodiya', 'HRV');
INSERT INTO `sp_place` VALUES ('113', '3', ',3,113,', '2', '肯尼亚', 'Kenya', 'kenniya', 'KEN');
INSERT INTO `sp_place` VALUES ('114', '6', ',6,114,', '2', '库克群岛', 'Cook Islands', 'kukequndao', 'COK');
INSERT INTO `sp_place` VALUES ('115', '2', ',2,115,', '2', '拉脱维亚', 'Latvia', 'latuoweiya', 'LVA');
INSERT INTO `sp_place` VALUES ('116', '3', ',3,116,', '2', '莱索托', 'Lesotho', 'laisuotuo', 'LSO');
INSERT INTO `sp_place` VALUES ('117', '1', ',1,117,', '2', '老挝', 'Laos', 'laowo', 'LAO');
INSERT INTO `sp_place` VALUES ('118', '1', ',1,118,', '2', '黎巴嫩', 'Lebanon', 'libanen', 'LBN');
INSERT INTO `sp_place` VALUES ('119', '3', ',3,119,', '2', '利比里亚', 'Liberia', 'libiliya', 'LBR');
INSERT INTO `sp_place` VALUES ('120', '3', ',3,120,', '2', '利比亚', 'Libya', 'libiya', 'LBY');
INSERT INTO `sp_place` VALUES ('121', '2', ',2,121,', '2', '立陶宛', 'Lithuania', 'litaowan', 'LTU');
INSERT INTO `sp_place` VALUES ('122', '2', ',2,122,', '2', '列支敦士登', 'Liechtenstein', 'liezhidunshideng', 'LIE');
INSERT INTO `sp_place` VALUES ('123', '2', ',2,123,', '2', '留尼旺岛', 'Reunion', 'liuniwangdao', 'REU');
INSERT INTO `sp_place` VALUES ('124', '2', ',2,124,', '2', '卢森堡', 'Luxembourg', 'lusenbao', 'LUX');
INSERT INTO `sp_place` VALUES ('125', '3', ',3,125,', '2', '卢旺达', 'Rwanda', 'luwangda', 'RWA');
INSERT INTO `sp_place` VALUES ('126', '2', ',2,126,', '2', '罗马尼亚', 'Romania', 'luomaniya', 'ROU');
INSERT INTO `sp_place` VALUES ('127', '3', ',3,127,', '2', '马达加斯加', 'Madagascar', 'madajiasijia', 'MDG');
INSERT INTO `sp_place` VALUES ('128', '1', ',1,128,', '2', '马尔代夫', 'Maldives', 'maerdaifu', 'MDV');
INSERT INTO `sp_place` VALUES ('129', '2', ',2,129,', '2', '马耳他', 'Malta', 'maerta', 'MLT');
INSERT INTO `sp_place` VALUES ('130', '3', ',3,130,', '2', '马拉维', 'Malawi', 'malawei', 'MWI');
INSERT INTO `sp_place` VALUES ('131', '1', ',1,131,', '2', '马来西亚', 'Malaysia', 'malaixiya', 'MYS');
INSERT INTO `sp_place` VALUES ('132', '3', ',3,132,', '2', '马里', 'Mali', 'mali', 'MLI');
INSERT INTO `sp_place` VALUES ('133', '2', ',2,133,', '2', '马其顿', 'Macedonia,Former Yugoslav Republic of', 'maqidun', 'MKD');
INSERT INTO `sp_place` VALUES ('134', '6', ',6,134,', '2', '马绍尔群岛', 'Marshall Islands', 'mashaoerqundao', 'MHL');
INSERT INTO `sp_place` VALUES ('135', '4', ',4,135,', '2', '马提尼克', 'Martinique', 'matinike', 'MTQ');
INSERT INTO `sp_place` VALUES ('136', '3', ',3,136,', '2', '马约特岛', 'Mayotte', 'mayuetedao', 'MYT');
INSERT INTO `sp_place` VALUES ('137', '2', ',2,137,', '2', '曼岛', 'Isle of Man', 'mandao', 'IMN');
INSERT INTO `sp_place` VALUES ('138', '3', ',3,138,', '2', '毛里求斯', 'Mauritius', 'maoliqiusi', 'MUS');
INSERT INTO `sp_place` VALUES ('139', '3', ',3,139,', '2', '毛里塔尼亚', 'Mauritania', 'maolitaniya', 'MRT');
INSERT INTO `sp_place` VALUES ('140', '4', ',4,140,', '2', '美国', 'United States', 'meiguo', 'USA');
INSERT INTO `sp_place` VALUES ('141', '6', ',6,141,', '2', '美属萨摩亚', 'American Samoa', 'meishusamoya', 'ASM');
INSERT INTO `sp_place` VALUES ('142', '4', ',4,142,', '2', '美属外岛', 'United States Minor Outlying Islands', 'meishuwaidao', 'UMI');
INSERT INTO `sp_place` VALUES ('143', '1', ',1,143,', '2', '蒙古', 'Mongolia', 'menggu', 'MNG');
INSERT INTO `sp_place` VALUES ('144', '4', ',4,144,', '2', '蒙特塞拉特', 'Montserrat', 'mengtesailate', 'MSR');
INSERT INTO `sp_place` VALUES ('145', '1', ',1,145,', '2', '孟加拉', 'Bangladesh', 'mengjiala', 'BGD');
INSERT INTO `sp_place` VALUES ('146', '6', ',6,146,', '2', '密克罗尼西亚', 'Micronesia', 'mikeluonixiya', 'FSM');
INSERT INTO `sp_place` VALUES ('147', '5', ',5,147,', '2', '秘鲁', 'Peru', 'milu', 'PER');
INSERT INTO `sp_place` VALUES ('148', '1', ',1,148,', '2', '缅甸', 'Myanmar', 'miandian', 'MMR');
INSERT INTO `sp_place` VALUES ('149', '2', ',2,149,', '2', '摩尔多瓦', 'Moldova', 'moerduowa', 'MDA');
INSERT INTO `sp_place` VALUES ('150', '3', ',3,150,', '2', '摩洛哥', 'Morocco', 'moluoge', 'MAR');
INSERT INTO `sp_place` VALUES ('151', '2', ',2,151,', '2', '摩纳哥', 'Monaco', 'monage', 'MCO');
INSERT INTO `sp_place` VALUES ('152', '3', ',3,152,', '2', '莫桑比克', 'Mozambique', 'mosangbike', 'MOZ');
INSERT INTO `sp_place` VALUES ('153', '4', ',4,153,', '2', '墨西哥', 'Mexico', 'moxige', 'MEX');
INSERT INTO `sp_place` VALUES ('154', '3', ',3,154,', '2', '纳米比亚', 'Namibia', 'namibiya', 'NAM');
INSERT INTO `sp_place` VALUES ('155', '3', ',3,155,', '2', '南非', 'South Africa', 'nanfei', 'ZAF');
INSERT INTO `sp_place` VALUES ('156', '0', ',156,', '1', '南极洲', 'Antarctica', 'nanjizhou', 'ATA');
INSERT INTO `sp_place` VALUES ('157', '156', ',156,157,', '2', '南乔治亚和南桑德威奇群岛', 'South Georgia and South Sandwich Islands', 'nanqiaozhiyahenansangdeweiqiqundao', 'SGS');
INSERT INTO `sp_place` VALUES ('158', '6', ',6,158,', '2', '瑙鲁', 'Nauru', 'lu', 'NRU');
INSERT INTO `sp_place` VALUES ('159', '1', ',1,159,', '2', '尼泊尔', 'Nepal', 'niboer', 'NPL');
INSERT INTO `sp_place` VALUES ('160', '4', ',4,160,', '2', '尼加拉瓜', 'Nicaragua', 'nijialagua', 'NIC');
INSERT INTO `sp_place` VALUES ('161', '3', ',3,161,', '2', '尼日尔', 'Niger', 'nirier', 'NER');
INSERT INTO `sp_place` VALUES ('162', '3', ',3,162,', '2', '尼日利亚', 'Nigeria', 'niriliya', 'NGA');
INSERT INTO `sp_place` VALUES ('163', '6', ',6,163,', '2', '纽埃', 'Niue', 'niuai', 'NIU');
INSERT INTO `sp_place` VALUES ('164', '2', ',2,164,', '2', '挪威', 'Norway', 'nuowei', 'NOR');
INSERT INTO `sp_place` VALUES ('165', '4', ',4,165,', '2', '诺福克', 'Norfolk Island', 'nuofuke', 'NFK');
INSERT INTO `sp_place` VALUES ('166', '6', ',6,166,', '2', '帕劳群岛', 'Palau', 'palaoqundao', 'PLW');
INSERT INTO `sp_place` VALUES ('167', '6', ',6,167,', '2', '皮特凯恩', 'Pitcairn Islands', 'pitekaien', 'PCN');
INSERT INTO `sp_place` VALUES ('168', '2', ',2,168,', '2', '葡萄牙', 'Portugal', 'putaoya', 'PRT');
INSERT INTO `sp_place` VALUES ('169', '156', ',156,169,', '2', '乔治亚', 'Georgia', 'qiaozhiya', 'GEO');
INSERT INTO `sp_place` VALUES ('170', '1', ',1,170,', '2', '日本', 'Japan', 'riben', 'JPN');
INSERT INTO `sp_place` VALUES ('171', '2', ',2,171,', '2', '瑞典', 'Sweden', 'ruidian', 'SWE');
INSERT INTO `sp_place` VALUES ('172', '2', ',2,172,', '2', '瑞士', 'Switzerland', 'ruishi', 'CHE');
INSERT INTO `sp_place` VALUES ('173', '4', ',4,173,', '2', '萨尔瓦多', 'El Salvador', 'saerwaduo', 'SLV');
INSERT INTO `sp_place` VALUES ('174', '6', ',6,174,', '2', '萨摩亚', 'Samoa', 'samoya', 'WSM');
INSERT INTO `sp_place` VALUES ('175', '2', ',2,175,', '2', '塞尔维亚,黑山', 'Serbia,Montenegro', 'saierweiyaheishan', 'SCG');
INSERT INTO `sp_place` VALUES ('176', '3', ',3,176,', '2', '塞拉利昂', 'Sierra Leone', 'sailaliang', 'SLE');
INSERT INTO `sp_place` VALUES ('177', '3', ',3,177,', '2', '塞内加尔', 'Senegal', 'saineijiaer', 'SEN');
INSERT INTO `sp_place` VALUES ('178', '1', ',1,178,', '2', '塞浦路斯', 'Cyprus', 'saipulusi', 'CYP');
INSERT INTO `sp_place` VALUES ('179', '3', ',3,179,', '2', '塞舌尔', 'Seychelles', 'saisheer', 'SYC');
INSERT INTO `sp_place` VALUES ('180', '1', ',1,180,', '2', '沙特阿拉伯', 'Saudi Arabia', 'shatealabo', 'SAU');
INSERT INTO `sp_place` VALUES ('181', '6', ',6,181,', '2', '圣诞岛', 'Christmas Island', 'shengdandao', 'CXR');
INSERT INTO `sp_place` VALUES ('182', '3', ',3,182,', '2', '圣多美和普林西比', 'Sao Tome and Principe', 'shengduomeihepulinxibi', 'STP');
INSERT INTO `sp_place` VALUES ('183', '3', ',3,183,', '2', '圣赫勒拿', 'St.Helena', 'shenghelena', 'SHN');
INSERT INTO `sp_place` VALUES ('184', '4', ',4,184,', '2', '圣基茨和尼维斯', 'St.Kitts and Nevis', 'shengjiciheniweisi', 'KNA');
INSERT INTO `sp_place` VALUES ('185', '4', ',4,185,', '2', '圣卢西亚', 'St.Lucia', 'shengluxiya', 'LCA');
INSERT INTO `sp_place` VALUES ('186', '2', ',2,186,', '2', '圣马力诺', 'San Marino', 'shengmalinuo', 'SMR');
INSERT INTO `sp_place` VALUES ('187', '4', ',4,187,', '2', '圣皮埃尔和米克隆群岛', 'St.Pierre and Miquelon', 'shengpiaierhemikelongqundao', 'SPM');
INSERT INTO `sp_place` VALUES ('188', '4', ',4,188,', '2', '圣文森特和格林纳丁斯', 'St.Vincent and the Grenadines', 'shengwensentehegelinnadingsi', 'VCT');
INSERT INTO `sp_place` VALUES ('189', '1', ',1,189,', '2', '斯里兰卡', 'Sri Lanka', 'sililanka', 'LKA');
INSERT INTO `sp_place` VALUES ('190', '2', ',2,190,', '2', '斯洛伐克', 'Slovakia', 'siluofake', 'SVK');
INSERT INTO `sp_place` VALUES ('191', '2', ',2,191,', '2', '斯洛文尼亚', 'Slovenia', 'siluowenniya', 'SVN');
INSERT INTO `sp_place` VALUES ('192', '2', ',2,192,', '2', '斯瓦尔巴和扬马廷', 'Svalbard and Jan Mayen', 'siwaerbaheyangmating', 'SJM');
INSERT INTO `sp_place` VALUES ('193', '3', ',3,193,', '2', '斯威士兰', 'Swaziland', 'siweishilan', 'SWZ');
INSERT INTO `sp_place` VALUES ('194', '3', ',3,194,', '2', '苏丹', 'Sudan', 'sudan', 'SDN');
INSERT INTO `sp_place` VALUES ('195', '5', ',5,195,', '2', '苏里南', 'Suriname', 'sulinan', 'SUR');
INSERT INTO `sp_place` VALUES ('196', '6', ',6,196,', '2', '所罗门群岛', 'Solomon Islands', 'suoluomenqundao', 'SLB');
INSERT INTO `sp_place` VALUES ('197', '3', ',3,197,', '2', '索马里', 'Somalia', 'suomali', 'SOM');
INSERT INTO `sp_place` VALUES ('198', '1', ',1,198,', '2', '塔吉克斯坦', 'Tajikistan', 'tajikesitan', 'TJK');
INSERT INTO `sp_place` VALUES ('199', '1', ',1,199,', '2', '泰国', 'Thailand', 'taiguo', 'THA');
INSERT INTO `sp_place` VALUES ('200', '3', ',3,200,', '2', '坦桑尼亚', 'Tanzania', 'tansangniya', 'TZA');
INSERT INTO `sp_place` VALUES ('201', '6', ',6,201,', '2', '汤加', 'Tonga', 'tangjia', 'TON');
INSERT INTO `sp_place` VALUES ('202', '4', ',4,202,', '2', '特克斯和凯克特斯群岛', 'Turks and Caicos Islands', 'tekesihekaiketesiqundao', 'TCA');
INSERT INTO `sp_place` VALUES ('203', '5', ',5,203,', '2', '特里斯坦达昆哈', 'Tristan da Cunha', 'telisitandakunha', 'TAA');
INSERT INTO `sp_place` VALUES ('204', '4', ',4,204,', '2', '特立尼达和多巴哥', 'Trinidad and Tobago', 'telinidaheduobage', 'TTO');
INSERT INTO `sp_place` VALUES ('205', '3', ',3,205,', '2', '突尼斯', 'Tunisia', 'tunisi', 'TUN');
INSERT INTO `sp_place` VALUES ('206', '6', ',6,206,', '2', '图瓦卢', 'Tuvalu', 'tuwalu', 'TUV');
INSERT INTO `sp_place` VALUES ('207', '1', ',1,207,', '2', '土耳其', 'Turkey', 'tuerqi', 'TUR');
INSERT INTO `sp_place` VALUES ('208', '1', ',1,208,', '2', '土库曼斯坦', 'Turkmenistan', 'tukumansitan', 'TKM');
INSERT INTO `sp_place` VALUES ('209', '6', ',6,209,', '2', '托克劳', 'Tokelau', 'tuokelao', 'TKL');
INSERT INTO `sp_place` VALUES ('210', '6', ',6,210,', '2', '瓦利斯和福图纳', 'Wallis and Futuna', 'walisihefutuna', 'WLF');
INSERT INTO `sp_place` VALUES ('211', '6', ',6,211,', '2', '瓦努阿图', 'Vanuatu', 'wanuatu', 'VUT');
INSERT INTO `sp_place` VALUES ('212', '4', ',4,212,', '2', '危地马拉', 'Guatemala', 'weidimala', 'GTM');
INSERT INTO `sp_place` VALUES ('213', '4', ',4,213,', '2', '维尔京群岛，美属', 'Virgin Islands', 'weierjingqundaomeishu', 'VIR');
INSERT INTO `sp_place` VALUES ('214', '4', ',4,214,', '2', '维尔京群岛，英属', 'Virgin Islands,British', 'weierjingqundaoyingshu', 'VGB');
INSERT INTO `sp_place` VALUES ('215', '5', ',5,215,', '2', '委内瑞拉', 'Venezuela', 'weineiruila', 'VEN');
INSERT INTO `sp_place` VALUES ('216', '1', ',1,216,', '2', '文莱', 'Brunei', 'wenlai', 'BRN');
INSERT INTO `sp_place` VALUES ('217', '3', ',3,217,', '2', '乌干达', 'Uganda', 'wuganda', 'UGA');
INSERT INTO `sp_place` VALUES ('218', '2', ',2,218,', '2', '乌克兰', 'Ukraine', 'wukelan', 'UKR');
INSERT INTO `sp_place` VALUES ('219', '5', ',5,219,', '2', '乌拉圭', 'Uruguay', 'wulagui', 'URY');
INSERT INTO `sp_place` VALUES ('220', '1', ',1,220,', '2', '乌兹别克斯坦', 'Uzbekistan', 'wuzibiekesitan', 'UZB');
INSERT INTO `sp_place` VALUES ('221', '2', ',2,221,', '2', '西班牙', 'Spain', 'xibanya', 'ESP');
INSERT INTO `sp_place` VALUES ('222', '2', ',2,222,', '2', '希腊', 'Greece', 'xila', 'GRC');
INSERT INTO `sp_place` VALUES ('223', '1', ',1,223,', '2', '新加坡', 'Singapore', 'xinjiapo', 'SGP');
INSERT INTO `sp_place` VALUES ('224', '6', ',6,224,', '2', '新喀里多尼亚', 'New Caledonia', 'xinkaliduoniya', 'NCL');
INSERT INTO `sp_place` VALUES ('225', '6', ',6,225,', '2', '新西兰', 'New Zealand', 'xinxilan', 'NZL');
INSERT INTO `sp_place` VALUES ('226', '2', ',2,226,', '2', '匈牙利', 'Hungary', 'xiongyali', 'HUN');
INSERT INTO `sp_place` VALUES ('227', '1', ',1,227,', '2', '叙利亚', 'Syria', 'xuliya', 'SYR');
INSERT INTO `sp_place` VALUES ('228', '4', ',4,228,', '2', '牙买加', 'Jamaica', 'yamaijia', 'JAM');
INSERT INTO `sp_place` VALUES ('229', '1', ',1,229,', '2', '亚美尼亚', 'Armenia', 'yameiniya', 'ARM');
INSERT INTO `sp_place` VALUES ('230', '1', ',1,230,', '2', '也门', 'Yemen', 'yemen', 'YEM');
INSERT INTO `sp_place` VALUES ('231', '1', ',1,231,', '2', '伊拉克', 'Iraq', 'yilake', 'IRQ');
INSERT INTO `sp_place` VALUES ('232', '1', ',1,232,', '2', '伊朗', 'Iran', 'yilang', 'IRN');
INSERT INTO `sp_place` VALUES ('233', '1', ',1,233,', '2', '以色列', 'Israel', 'yiselie', 'ISR');
INSERT INTO `sp_place` VALUES ('234', '2', ',2,234,', '2', '意大利', 'Italy', 'yidali', 'ITA');
INSERT INTO `sp_place` VALUES ('235', '1', ',1,235,', '2', '印度', 'India', 'yindu', 'IND');
INSERT INTO `sp_place` VALUES ('236', '1', ',1,236,', '2', '印度尼西亚', 'Indonesia', 'yindunixiya', 'IDN');
INSERT INTO `sp_place` VALUES ('237', '2', ',2,237,', '2', '英国', 'United Kingdom', 'yingguo', 'GBR');
INSERT INTO `sp_place` VALUES ('238', '3', ',3,238,', '2', '英属印度洋领地', 'British Indian Ocean Territory', 'yingshuyinduyanglingdi', 'IOT');
INSERT INTO `sp_place` VALUES ('239', '1', ',1,239,', '2', '约旦', 'Jordan', 'yuedan', 'JOR');
INSERT INTO `sp_place` VALUES ('240', '1', ',1,240,', '2', '越南', 'Vietnam', 'yuenan', 'VNM');
INSERT INTO `sp_place` VALUES ('241', '3', ',3,241,', '2', '赞比亚', 'Zambia', 'zanbiya', 'ZMB');
INSERT INTO `sp_place` VALUES ('242', '2', ',2,242,', '2', '泽西岛', 'Jersey', 'zexidao', 'JEY');
INSERT INTO `sp_place` VALUES ('243', '3', ',3,243,', '2', '乍得', 'Chad', 'zhade', 'TCD');
INSERT INTO `sp_place` VALUES ('244', '3', ',3,244,', '2', '直布罗陀', 'Gibraltar', 'zhibuluotuo', 'GIB');
INSERT INTO `sp_place` VALUES ('245', '5', ',5,245,', '2', '智利', 'Chile', 'zhili', 'CHL');
INSERT INTO `sp_place` VALUES ('246', '3', ',3,246,', '2', '中非共和国', 'Central African Republic', 'zhongfeigongheguo', 'CAF');
INSERT INTO `sp_place` VALUES ('247', '7', ',1,7,247,', '3', '北京', 'Beijing', 'beijing', '11');
INSERT INTO `sp_place` VALUES ('248', '7', ',1,7,248,', '3', '天津', 'Tianjin', 'tianjin', '12');
INSERT INTO `sp_place` VALUES ('249', '7', ',1,7,249,', '3', '河北', 'Hebei', 'hebei', '13');
INSERT INTO `sp_place` VALUES ('250', '7', ',1,7,250,', '3', '山西', 'Shanxi', 'shanxi', '14');
INSERT INTO `sp_place` VALUES ('251', '7', ',1,7,251,', '3', '内蒙古', 'Inner Mongolia', 'neimenggu', '15');
INSERT INTO `sp_place` VALUES ('252', '7', ',1,7,252,', '3', '辽宁', 'Liaoning', 'liaoning', '21');
INSERT INTO `sp_place` VALUES ('253', '7', ',1,7,253,', '3', '吉林', 'Jilin', 'jilin', '22');
INSERT INTO `sp_place` VALUES ('254', '7', ',1,7,254,', '3', '黑龙江', 'Heilongjiang', 'heilongjiang', '23');
INSERT INTO `sp_place` VALUES ('255', '7', ',1,7,255,', '3', '上海', 'Shanghai', 'shanghai', '31');
INSERT INTO `sp_place` VALUES ('256', '7', ',1,7,256,', '3', '江苏', 'Jiangsu', 'jiangsu', '32');
INSERT INTO `sp_place` VALUES ('257', '7', ',1,7,257,', '3', '浙江', 'Zhejiang', 'zhejiang', '33');
INSERT INTO `sp_place` VALUES ('258', '7', ',1,7,258,', '3', '安徽', 'Anhui', 'anhui', '34');
INSERT INTO `sp_place` VALUES ('259', '7', ',1,7,259,', '3', '福建', 'Fujian', 'fujian', '35');
INSERT INTO `sp_place` VALUES ('260', '7', ',1,7,260,', '3', '江西', 'Jiangxi', 'jiangxi', '36');
INSERT INTO `sp_place` VALUES ('261', '7', ',1,7,261,', '3', '山东', 'Shandong', 'shandong', '37');
INSERT INTO `sp_place` VALUES ('262', '7', ',1,7,262,', '3', '河南', 'Henan', 'henan', '41');
INSERT INTO `sp_place` VALUES ('263', '7', ',1,7,263,', '3', '湖北', 'Hubei', 'hubei', '42');
INSERT INTO `sp_place` VALUES ('264', '7', ',1,7,264,', '3', '湖南', 'Hunan', 'hunan', '43');
INSERT INTO `sp_place` VALUES ('265', '7', ',1,7,265,', '3', '广东', 'Guangdong', 'guangdong', '44');
INSERT INTO `sp_place` VALUES ('266', '7', ',1,7,266,', '3', '广西', 'Guangxi', 'guangxi', '45');
INSERT INTO `sp_place` VALUES ('267', '7', ',1,7,267,', '3', '海南', 'Hainan', 'hainan', '46');
INSERT INTO `sp_place` VALUES ('268', '7', ',1,7,268,', '3', '重庆', 'Chongqing', 'zhongqing', '50');
INSERT INTO `sp_place` VALUES ('269', '7', ',1,7,269,', '3', '四川', 'Sichuan', 'sichuan', '51');
INSERT INTO `sp_place` VALUES ('270', '7', ',1,7,270,', '3', '贵州', 'Guizhou', 'guizhou', '52');
INSERT INTO `sp_place` VALUES ('271', '7', ',1,7,271,', '3', '云南', 'Yunnan', 'yunnan', '53');
INSERT INTO `sp_place` VALUES ('272', '7', ',1,7,272,', '3', '西藏', 'Tibet', 'xicang', '54');
INSERT INTO `sp_place` VALUES ('273', '7', ',1,7,273,', '3', '陕西', 'Shaanxi', 'shanxi', '61');
INSERT INTO `sp_place` VALUES ('274', '7', ',1,7,274,', '3', '甘肃', 'Gansu', 'gansu', '62');
INSERT INTO `sp_place` VALUES ('275', '7', ',1,7,275,', '3', '青海', 'Qinghai', 'qinghai', '63');
INSERT INTO `sp_place` VALUES ('276', '7', ',1,7,276,', '3', '宁夏', 'Ningxia', 'ningxia', '64');
INSERT INTO `sp_place` VALUES ('277', '7', ',1,7,277,', '3', '新疆', 'Xinjiang', 'xinjiang', '65');
INSERT INTO `sp_place` VALUES ('278', '7', ',1,7,278,', '3', '台湾', 'Taiwan', 'taiwan', '71');
INSERT INTO `sp_place` VALUES ('279', '7', ',1,7,279,', '3', '香港', 'Hongkong SAR', 'xianggang', '81');
INSERT INTO `sp_place` VALUES ('280', '7', ',1,7,280,', '3', '澳门', 'Macao SAR', 'aomen', '82');
INSERT INTO `sp_place` VALUES ('281', '25', ',6,25,281,', '3', '北部地区', 'Northern Territory', 'beibudiqu', 'NT');
INSERT INTO `sp_place` VALUES ('282', '25', ',6,25,282,', '3', '堪培拉', 'Canberra', 'kanpeila', 'ACT');
INSERT INTO `sp_place` VALUES ('283', '25', ',6,25,283,', '3', '昆士兰', 'Queensland', 'kunshilan', 'QLD');
INSERT INTO `sp_place` VALUES ('284', '25', ',6,25,284,', '3', '南澳大利亚', 'South Australia', 'nanaodaliya', 'SA');
INSERT INTO `sp_place` VALUES ('285', '25', ',6,25,285,', '3', '塔斯马尼亚', 'Tasmania', 'tasimaniya', 'TAS');
INSERT INTO `sp_place` VALUES ('286', '25', ',6,25,286,', '3', '维多利亚', 'Victoria', 'weiduoliya', 'VIC');
INSERT INTO `sp_place` VALUES ('287', '25', ',6,25,287,', '3', '西澳大利亚', 'Western Australia', 'xiaodaliya', 'WA');
INSERT INTO `sp_place` VALUES ('288', '25', ',6,25,288,', '3', '新南威尔士', 'New South Wales', 'xinnanweiershi', 'NSW');
INSERT INTO `sp_place` VALUES ('289', '89', ',1,89,289,', '3', '大邱', 'Daegu', 'daqiu', '27');
INSERT INTO `sp_place` VALUES ('290', '89', ',1,89,290,', '3', '大田', 'Daejeon', 'datian', '30');
INSERT INTO `sp_place` VALUES ('291', '89', ',1,89,291,', '3', '釜山', 'Busan', 'fushan', '26');
INSERT INTO `sp_place` VALUES ('292', '89', ',1,89,292,', '3', '光州', 'Gwangju', 'guangzhou', '29');
INSERT INTO `sp_place` VALUES ('293', '89', ',1,89,293,', '3', '济州特别自治道', 'Jeju-do', 'jizhoutebiezizhidao', '41');
INSERT INTO `sp_place` VALUES ('294', '89', ',1,89,294,', '3', '江原道', 'Gangwon-do', 'jiangyuandao', '42');
INSERT INTO `sp_place` VALUES ('295', '89', ',1,89,295,', '3', '京畿道', 'Gyeonggi-do', 'jingdao', '49');
INSERT INTO `sp_place` VALUES ('296', '89', ',1,89,296,', '3', '庆尚北道', 'Chungcheongbuk-do', 'qingshangbeidao', '43');
INSERT INTO `sp_place` VALUES ('297', '89', ',1,89,297,', '3', '庆尚南道', 'Chungcheongnam-do', 'qingshangnandao', '44');
INSERT INTO `sp_place` VALUES ('298', '89', ',1,89,298,', '3', '全罗北道', 'Gyeongsangbuk-do', 'quanluobeidao', '47');
INSERT INTO `sp_place` VALUES ('299', '89', ',1,89,299,', '3', '全罗南道', 'Gyeongsangnam-do', 'quanluonandao', '48');
INSERT INTO `sp_place` VALUES ('300', '89', ',1,89,300,', '3', '仁川', 'Incheon', 'renchuan', '28');
INSERT INTO `sp_place` VALUES ('301', '89', ',1,89,301,', '3', '首尔', 'Seoul', 'shouer', '11');
INSERT INTO `sp_place` VALUES ('302', '89', ',1,89,302,', '3', '蔚山', 'Ulsan', 'weishan', '31');
INSERT INTO `sp_place` VALUES ('303', '89', ',1,89,303,', '3', '忠清北道', 'Jeollabuk-do', 'zhongqingbeidao', '45');
INSERT INTO `sp_place` VALUES ('304', '89', ',1,89,304,', '3', '忠清南道', 'Jeollanam-do', 'zhongqingnandao', '46');
INSERT INTO `sp_place` VALUES ('305', '131', ',1,131,305,', '3', '槟榔屿', 'Pulau Pinang', 'langyu', 'PH');
INSERT INTO `sp_place` VALUES ('306', '131', ',1,131,306,', '3', '玻璃市', 'Perlis', 'bolishi', 'PS');
INSERT INTO `sp_place` VALUES ('307', '131', ',1,131,307,', '3', '丁加奴', 'Terengganu', 'dingjianu', 'TR');
INSERT INTO `sp_place` VALUES ('308', '131', ',1,131,308,', '3', '吉打', 'Kedah', 'jida', 'KD');
INSERT INTO `sp_place` VALUES ('309', '131', ',1,131,309,', '3', '吉兰丹', 'Kelantan', 'jilandan', 'KN');
INSERT INTO `sp_place` VALUES ('310', '131', ',1,131,310,', '3', '吉隆坡', 'Kuala Lumpur', 'jilongpo', 'KL');
INSERT INTO `sp_place` VALUES ('311', '131', ',1,131,311,', '3', '马六甲', 'Malacca', 'maliujia', 'ML');
INSERT INTO `sp_place` VALUES ('312', '131', ',1,131,312,', '3', '纳闽', 'Labuan', 'namin', 'LB');
INSERT INTO `sp_place` VALUES ('313', '131', ',1,131,313,', '3', '彭亨', 'Pahang', 'pengheng', 'PG');
INSERT INTO `sp_place` VALUES ('314', '131', ',1,131,314,', '3', '霹雳', 'Perak', 'pi', 'PK');
INSERT INTO `sp_place` VALUES ('315', '131', ',1,131,315,', '3', '柔佛', 'Johor', 'roufo', 'JH');
INSERT INTO `sp_place` VALUES ('316', '131', ',1,131,316,', '3', '森美兰', 'Negeri Sembilan', 'senmeilan', 'NS');
INSERT INTO `sp_place` VALUES ('317', '131', ',1,131,317,', '3', '沙巴', 'Sabah', 'shaba', 'SB');
INSERT INTO `sp_place` VALUES ('318', '131', ',1,131,318,', '3', '沙捞越', 'Sarawak', 'shalaoyue', 'SR');
INSERT INTO `sp_place` VALUES ('319', '131', ',1,131,319,', '3', '雪兰莪', 'Selangor', 'xuelan', 'SL');
INSERT INTO `sp_place` VALUES ('320', '140', ',4,140,320,', '3', '阿肯色', 'Arkansas', 'akense', 'AR');
INSERT INTO `sp_place` VALUES ('321', '140', ',4,140,321,', '3', '阿拉巴马', 'Alabama', 'alabama', 'AL');
INSERT INTO `sp_place` VALUES ('322', '140', ',4,140,322,', '3', '阿拉斯加', 'Alaska', 'alasijia', 'AK');
INSERT INTO `sp_place` VALUES ('323', '140', ',4,140,323,', '3', '爱达荷', 'Idaho', 'aidahe', 'ID');
INSERT INTO `sp_place` VALUES ('324', '140', ',4,140,324,', '3', '爱荷华', 'Iowa', 'aihehua', 'IA');
INSERT INTO `sp_place` VALUES ('325', '140', ',4,140,325,', '3', '北达科他', 'North Dakota', 'beidaketa', 'ND');
INSERT INTO `sp_place` VALUES ('326', '140', ',4,140,326,', '3', '北卡罗来纳', 'North Carolina', 'beikaluolaina', 'NC');
INSERT INTO `sp_place` VALUES ('327', '140', ',4,140,327,', '3', '宾夕法尼亚', 'Pennsylvania', 'binxifaniya', 'PA');
INSERT INTO `sp_place` VALUES ('328', '140', ',4,140,328,', '3', '德克萨斯', 'Texas', 'dekesasi', 'TX');
INSERT INTO `sp_place` VALUES ('329', '140', ',4,140,329,', '3', '俄亥俄', 'Ohio', 'ehaie', 'OH');
INSERT INTO `sp_place` VALUES ('330', '140', ',4,140,330,', '3', '俄克拉荷马', 'Oklahoma', 'ekelahema', 'OK');
INSERT INTO `sp_place` VALUES ('331', '140', ',4,140,331,', '3', '俄勒冈', 'Oregon', 'elegang', 'OR');
INSERT INTO `sp_place` VALUES ('332', '140', ',4,140,332,', '3', '佛罗里达', 'Florida', 'foluolida', 'FL');
INSERT INTO `sp_place` VALUES ('333', '140', ',4,140,333,', '3', '佛蒙特', 'Vermont', 'fomengte', 'VT');
INSERT INTO `sp_place` VALUES ('334', '140', ',4,140,334,', '3', '哥伦比亚特区', 'District of Columbia', 'gelunbiyatequ', 'DC');
INSERT INTO `sp_place` VALUES ('335', '140', ',4,140,335,', '3', '华盛顿', 'Washington', 'huashengdun', 'WA');
INSERT INTO `sp_place` VALUES ('336', '140', ',4,140,336,', '3', '怀俄明', 'Wyoming', 'huaieming', 'WY');
INSERT INTO `sp_place` VALUES ('337', '140', ',4,140,337,', '3', '加利福尼亚', 'California', 'jialifuniya', 'CA');
INSERT INTO `sp_place` VALUES ('338', '140', ',4,140,338,', '3', '堪萨斯', 'Kansas', 'kansasi', 'KS');
INSERT INTO `sp_place` VALUES ('339', '140', ',4,140,339,', '3', '康涅狄格', 'Connecticut', 'kangniedige', 'CT');
INSERT INTO `sp_place` VALUES ('340', '140', ',4,140,340,', '3', '科罗拉多', 'Colorado', 'keluoladuo', 'CO');
INSERT INTO `sp_place` VALUES ('341', '140', ',4,140,341,', '3', '肯塔基', 'Kentucky', 'kentaji', 'KY');
INSERT INTO `sp_place` VALUES ('342', '140', ',4,140,342,', '3', '路易斯安那', 'Louisiana', 'luyisianna', 'LA');
INSERT INTO `sp_place` VALUES ('343', '140', ',4,140,343,', '3', '罗德岛', 'Rhode Island', 'luodedao', 'RI');
INSERT INTO `sp_place` VALUES ('344', '140', ',4,140,344,', '3', '马里兰', 'Maryland', 'malilan', 'MD');
INSERT INTO `sp_place` VALUES ('345', '140', ',4,140,345,', '3', '马萨诸塞', 'Massachusetts', 'masazhusai', 'MA');
INSERT INTO `sp_place` VALUES ('346', '140', ',4,140,346,', '3', '蒙大拿', 'Montana', 'mengdana', 'MT');
INSERT INTO `sp_place` VALUES ('347', '140', ',4,140,347,', '3', '密苏里', 'Missouri', 'misuli', 'MO');
INSERT INTO `sp_place` VALUES ('348', '140', ',4,140,348,', '3', '密西西比', 'Mississippi', 'mixixibi', 'MS');
INSERT INTO `sp_place` VALUES ('349', '140', ',4,140,349,', '3', '密歇根', 'Michigan', 'mixiegen', 'MI');
INSERT INTO `sp_place` VALUES ('350', '140', ',4,140,350,', '3', '缅因', 'Maine', 'mianyin', 'ME');
INSERT INTO `sp_place` VALUES ('351', '140', ',4,140,351,', '3', '明尼苏达', 'Minnesota', 'mingnisuda', 'MN');
INSERT INTO `sp_place` VALUES ('352', '140', ',4,140,352,', '3', '南达科他', 'South Dakota', 'nandaketa', 'SD');
INSERT INTO `sp_place` VALUES ('353', '140', ',4,140,353,', '3', '南卡罗来纳', 'South Carolina', 'nankaluolaina', 'SC');
INSERT INTO `sp_place` VALUES ('354', '140', ',4,140,354,', '3', '内布拉斯加', 'Nebraska', 'neibulasijia', 'NE');
INSERT INTO `sp_place` VALUES ('355', '140', ',4,140,355,', '3', '内华达', 'Nevada', 'neihuada', 'NV');
INSERT INTO `sp_place` VALUES ('356', '140', ',4,140,356,', '3', '纽约', 'New York', 'niuyue', 'NY');
INSERT INTO `sp_place` VALUES ('357', '140', ',4,140,357,', '3', '特拉华', 'Delaware', 'telahua', 'DE');
INSERT INTO `sp_place` VALUES ('358', '140', ',4,140,358,', '3', '田纳西', 'Tennessee', 'tiannaxi', 'TN');
INSERT INTO `sp_place` VALUES ('359', '140', ',4,140,359,', '3', '威斯康星', 'Wisconsin', 'weisikangxing', 'WI');
INSERT INTO `sp_place` VALUES ('360', '140', ',4,140,360,', '3', '维吉尼亚', 'Virginia', 'weijiniya', 'VA');
INSERT INTO `sp_place` VALUES ('361', '140', ',4,140,361,', '3', '西佛吉尼亚', 'West Virginia', 'xifojiniya', 'WV');
INSERT INTO `sp_place` VALUES ('362', '140', ',4,140,362,', '3', '夏威夷', 'Hawaii', 'xiaweiyi', 'HI');
INSERT INTO `sp_place` VALUES ('363', '140', ',4,140,363,', '3', '新罕布什尔', 'New Hampshire', 'xinhanbushier', 'NH');
INSERT INTO `sp_place` VALUES ('364', '140', ',4,140,364,', '3', '新墨西哥', 'New Mexico', 'xinmoxige', 'NM');
INSERT INTO `sp_place` VALUES ('365', '140', ',4,140,365,', '3', '新泽西', 'New Jersey', 'xinzexi', 'NJ');
INSERT INTO `sp_place` VALUES ('366', '140', ',4,140,366,', '3', '亚利桑那', 'Arizona', 'yalisangna', 'AZ');
INSERT INTO `sp_place` VALUES ('367', '140', ',4,140,367,', '3', '伊利诺斯', 'Illinois', 'yilinuosi', 'IL');
INSERT INTO `sp_place` VALUES ('368', '140', ',4,140,368,', '3', '印第安那', 'Indiana', 'yindianna', 'IN');
INSERT INTO `sp_place` VALUES ('369', '140', ',4,140,369,', '3', '犹他', 'Utah', 'youta', 'UT');
INSERT INTO `sp_place` VALUES ('370', '140', ',4,140,370,', '3', '佐治亚', 'Georgia', 'zuozhiya', 'GA');
INSERT INTO `sp_place` VALUES ('371', '237', ',2,237,371,', '3', '北爱尔兰', 'Northern Ireland', 'beiaierlan', 'NIR');
INSERT INTO `sp_place` VALUES ('372', '237', ',2,237,372,', '3', '苏格兰', 'Scotland', 'sugelan', 'SCT');
INSERT INTO `sp_place` VALUES ('373', '237', ',2,237,373,', '3', '威尔士', 'Wales', 'weiershi', 'WLS');
INSERT INTO `sp_place` VALUES ('374', '237', ',2,237,374,', '3', '英格兰', 'England', 'yinggelan', 'ENG');
INSERT INTO `sp_place` VALUES ('375', '8', ',2,8,375,', '3', '爱尔巴桑', 'Elbasan', 'aierbasang', 'EL');
INSERT INTO `sp_place` VALUES ('376', '8', ',2,8,376,', '3', '迪勃拉', 'Diber', 'dibola', 'DI');
INSERT INTO `sp_place` VALUES ('377', '8', ',2,8,377,', '3', '地拉那', 'Tirane', 'dilana', 'TR');
INSERT INTO `sp_place` VALUES ('378', '8', ',2,8,378,', '3', '都拉斯', 'Durres', 'dulasi', 'DR');
INSERT INTO `sp_place` VALUES ('379', '8', ',2,8,379,', '3', '发罗拉', 'Vlore', 'faluola', 'VL');
INSERT INTO `sp_place` VALUES ('380', '8', ',2,8,380,', '3', '费里', 'Fier', 'feili', 'FR');
INSERT INTO `sp_place` VALUES ('381', '8', ',2,8,381,', '3', '吉诺卡斯特', 'Gjirokaster', 'jinuokasite', 'GJ');
INSERT INTO `sp_place` VALUES ('382', '8', ',2,8,382,', '3', '科尔察', 'Korce', 'keercha', 'KO');
INSERT INTO `sp_place` VALUES ('383', '8', ',2,8,383,', '3', '库克斯', 'Kukes', 'kukesi', 'KU');
INSERT INTO `sp_place` VALUES ('384', '8', ',2,8,384,', '3', '莱什', 'Lezhe', 'laishi', 'LE');
INSERT INTO `sp_place` VALUES ('385', '8', ',2,8,385,', '3', '培拉特', 'Berat', 'peilate', 'BR');
INSERT INTO `sp_place` VALUES ('386', '8', ',2,8,386,', '3', '斯库台', 'Shkoder', 'sikutai', 'SH');
INSERT INTO `sp_place` VALUES ('387', '9', ',3,9,387,', '3', '阿德拉尔', 'Adrar', 'adelaer', 'ADR');
INSERT INTO `sp_place` VALUES ('388', '9', ',3,9,388,', '3', '阿尔及尔', 'Alger', 'aerjier', 'ALG');
INSERT INTO `sp_place` VALUES ('389', '9', ',3,9,389,', '3', '艾因·德夫拉', 'Ain Defla', 'aiyin', 'ADE');
INSERT INTO `sp_place` VALUES ('390', '9', ',3,9,390,', '3', '艾因·蒂姆尚特', 'Ain Temouchent', 'aiyin', 'ATE');
INSERT INTO `sp_place` VALUES ('391', '9', ',3,9,391,', '3', '安纳巴', 'Annaba', 'annaba', 'AAE');
INSERT INTO `sp_place` VALUES ('392', '9', ',3,9,392,', '3', '奥兰', 'Oran', 'aolan', 'ORA');
INSERT INTO `sp_place` VALUES ('393', '9', ',3,9,393,', '3', '巴特纳', 'Batna', 'batena', 'BAT');
INSERT INTO `sp_place` VALUES ('394', '9', ',3,9,394,', '3', '贝贾亚', 'Bejaia', 'beijiaya', 'BJA');
INSERT INTO `sp_place` VALUES ('395', '9', ',3,9,395,', '3', '贝沙尔', 'Bechar', 'beishaer', 'BEC');
INSERT INTO `sp_place` VALUES ('396', '9', ',3,9,396,', '3', '贝伊德', 'El Bayadh', 'beiyide', 'EBA');
INSERT INTO `sp_place` VALUES ('397', '9', ',3,9,397,', '3', '比斯克拉', 'Biskra', 'bisikela', 'BIS');
INSERT INTO `sp_place` VALUES ('398', '9', ',3,9,398,', '3', '布尔吉·布阿雷里吉', 'Bordj Bou Arreridj', 'buerji', 'BOR');
INSERT INTO `sp_place` VALUES ('399', '9', ',3,9,399,', '3', '布利达', 'Blida', 'bulida', 'BLI');
INSERT INTO `sp_place` VALUES ('400', '9', ',3,9,400,', '3', '布迈德斯', 'Boumerdes', 'bumaidesi', 'BOU');
INSERT INTO `sp_place` VALUES ('401', '9', ',3,9,401,', '3', '布依拉', 'Bouira', 'buyila', 'BOA');
INSERT INTO `sp_place` VALUES ('402', '9', ',3,9,402,', '3', '蒂巴扎', 'Tipaza', 'dibazha', 'TIP');
INSERT INTO `sp_place` VALUES ('403', '9', ',3,9,403,', '3', '蒂斯姆西勒特', 'Tissemsilt', 'disimuxilete', 'TIS');
INSERT INTO `sp_place` VALUES ('404', '9', ',3,9,404,', '3', '盖尔达耶', 'Ghardaia', 'gaierdaye', 'GHA');
INSERT INTO `sp_place` VALUES ('405', '9', ',3,9,405,', '3', '盖尔马', 'Guelma', 'gaierma', 'GUE');
INSERT INTO `sp_place` VALUES ('406', '9', ',3,9,406,', '3', '罕西拉', 'Khenchela', 'hanxila', 'KHE');
INSERT INTO `sp_place` VALUES ('407', '9', ',3,9,407,', '3', '赫利赞', 'Relizane', 'helizan', 'REL');
INSERT INTO `sp_place` VALUES ('408', '9', ',3,9,408,', '3', '吉杰尔', 'Jijel', 'jijieer', 'JIJ');
INSERT INTO `sp_place` VALUES ('409', '9', ',3,9,409,', '3', '杰勒法', 'Djelfa', 'jielefa', 'DJE');
INSERT INTO `sp_place` VALUES ('410', '9', ',3,9,410,', '3', '君士坦丁', 'Constantine', 'junshitanding', 'CZL');
INSERT INTO `sp_place` VALUES ('411', '9', ',3,9,411,', '3', '拉格瓦特', 'Laghouat', 'lagewate', 'LAG');
INSERT INTO `sp_place` VALUES ('412', '9', ',3,9,412,', '3', '马斯卡拉', 'Mascara', 'masikala', 'MUA');
INSERT INTO `sp_place` VALUES ('413', '9', ',3,9,413,', '3', '麦迪亚', 'Medea', 'maidiya', 'MED');
INSERT INTO `sp_place` VALUES ('414', '9', ',3,9,414,', '3', '密拉', 'Mila', 'mila', 'MIL');
INSERT INTO `sp_place` VALUES ('415', '9', ',3,9,415,', '3', '莫斯塔加纳姆', 'Mostaganem', 'mositajianamu', 'MOS');
INSERT INTO `sp_place` VALUES ('416', '9', ',3,9,416,', '3', '姆西拉', 'Msila', 'muxila', 'MSI');
INSERT INTO `sp_place` VALUES ('417', '9', ',3,9,417,', '3', '纳阿马', 'Naama', 'naama', 'NAA');
INSERT INTO `sp_place` VALUES ('418', '9', ',3,9,418,', '3', '塞蒂夫', 'Setif', 'saidifu', 'SET');
INSERT INTO `sp_place` VALUES ('419', '9', ',3,9,419,', '3', '赛伊达', 'Saida', 'saiyida', 'SAI');
INSERT INTO `sp_place` VALUES ('420', '9', ',3,9,420,', '3', '斯基克达', 'Skikda', 'sijikeda', 'SKI');
INSERT INTO `sp_place` VALUES ('421', '9', ',3,9,421,', '3', '苏克·阿赫拉斯', 'Souk Ahras', 'suke', 'SAH');
INSERT INTO `sp_place` VALUES ('422', '9', ',3,9,422,', '3', '塔里夫', 'El Tarf', 'talifu', 'ETA');
INSERT INTO `sp_place` VALUES ('423', '9', ',3,9,423,', '3', '塔曼拉塞特', 'Tamanghasset', 'tamanlasaite', 'TAM');
INSERT INTO `sp_place` VALUES ('424', '9', ',3,9,424,', '3', '特贝萨', 'Tebessa', 'tebeisa', 'TEB');
INSERT INTO `sp_place` VALUES ('425', '9', ',3,9,425,', '3', '特莱姆森', 'Tlemcen', 'telaimusen', 'TLE');
INSERT INTO `sp_place` VALUES ('426', '9', ',3,9,426,', '3', '提济乌祖', 'Tizi Ouzou', 'tijiwuzu', 'IOU');
INSERT INTO `sp_place` VALUES ('427', '9', ',3,9,427,', '3', '提亚雷特', 'Tiaret', 'tiyaleite', 'TIA');
INSERT INTO `sp_place` VALUES ('428', '9', ',3,9,428,', '3', '廷杜夫', 'Tindouf', 'tingdufu', 'TIN');
INSERT INTO `sp_place` VALUES ('429', '9', ',3,9,429,', '3', '瓦德', 'El Oued', 'wade', 'EOU');
INSERT INTO `sp_place` VALUES ('430', '9', ',3,9,430,', '3', '瓦尔格拉', 'Ouargla', 'waergela', 'OUA');
INSERT INTO `sp_place` VALUES ('431', '9', ',3,9,431,', '3', '乌姆布阿基', 'Oum el Bouaghi', 'wumubuaji', 'OEB');
INSERT INTO `sp_place` VALUES ('432', '9', ',3,9,432,', '3', '西迪贝勒阿贝斯', 'Sidi Bel Abbes', 'xidibeileabeisi', 'SBA');
INSERT INTO `sp_place` VALUES ('433', '9', ',3,9,433,', '3', '谢里夫', 'Chlef', 'xielifu', 'CHL');
INSERT INTO `sp_place` VALUES ('434', '9', ',3,9,434,', '3', '伊利齐', 'Illizi', 'yiliqi', 'ILL');
INSERT INTO `sp_place` VALUES ('435', '10', ',1,10,435,', '3', '赫拉特', 'Herat', 'helate', 'HEA');
INSERT INTO `sp_place` VALUES ('436', '10', ',1,10,436,', '3', '喀布尔', 'Kabul', 'kabuer', 'KBL');
INSERT INTO `sp_place` VALUES ('437', '10', ',1,10,437,', '3', '坎大哈', 'Kandahar', 'kandaha', 'KDH');
INSERT INTO `sp_place` VALUES ('438', '10', ',1,10,438,', '3', '马扎里沙里夫', 'Mazar-i Sharif', 'mazhalishalifu', 'MZR');
INSERT INTO `sp_place` VALUES ('439', '11', ',5,11,439,', '3', '巴拉那', 'Parana', 'balana', 'PRA');
INSERT INTO `sp_place` VALUES ('440', '11', ',5,11,440,', '3', '别德马', 'Viedma', 'biedema', 'VDM');
INSERT INTO `sp_place` VALUES ('441', '11', ',5,11,441,', '3', '波萨达斯', 'Posadas', 'bosadasi', 'PSS');
INSERT INTO `sp_place` VALUES ('442', '11', ',5,11,442,', '3', '布兰卡港', 'Bahia Blanca', 'bulankagang', 'BHI');
INSERT INTO `sp_place` VALUES ('443', '11', ',5,11,443,', '3', '布宜诺斯艾利斯', 'Buenos Aires', 'buyinuosiailisi', 'BUE');
INSERT INTO `sp_place` VALUES ('444', '11', ',5,11,444,', '3', '福莫萨', 'Formosa', 'fumosa', 'FMA');
INSERT INTO `sp_place` VALUES ('445', '11', ',5,11,445,', '3', '胡胡伊', 'Jujuy', 'huhuyi', 'JUJ');
INSERT INTO `sp_place` VALUES ('446', '11', ',5,11,446,', '3', '卡塔马卡', 'Catamarca', 'katamaka', 'CTC');
INSERT INTO `sp_place` VALUES ('447', '11', ',5,11,447,', '3', '科尔多瓦', 'Cordoba', 'keerduowa', 'COR');
INSERT INTO `sp_place` VALUES ('448', '11', ',5,11,448,', '3', '科连特斯', 'Corrientes', 'keliantesi', 'CNQ');
INSERT INTO `sp_place` VALUES ('449', '11', ',5,11,449,', '3', '克劳斯城', 'Villa Krause', 'kelaosicheng', 'VLK');
INSERT INTO `sp_place` VALUES ('450', '11', ',5,11,450,', '3', '肯考迪娅', 'Concordia', 'kenkaodi', 'COC');
INSERT INTO `sp_place` VALUES ('451', '11', ',5,11,451,', '3', '拉里奥哈', 'La Rioja', 'laliaoha', 'IRJ');
INSERT INTO `sp_place` VALUES ('452', '11', ',5,11,452,', '3', '拉普拉塔', 'La Plata', 'lapulata', 'LPG');
INSERT INTO `sp_place` VALUES ('453', '11', ',5,11,453,', '3', '雷西斯滕匹亚', 'Resistencia', 'leixisipiya', 'RES');
INSERT INTO `sp_place` VALUES ('454', '11', ',5,11,454,', '3', '里奥加耶戈斯', 'Rio Gallegos', 'liaojiayegesi', 'RGL');
INSERT INTO `sp_place` VALUES ('455', '11', ',5,11,455,', '3', '里奥夸尔托', 'Rio Cuarto', 'liaokuaertuo', 'RCU');
INSERT INTO `sp_place` VALUES ('456', '11', ',5,11,456,', '3', '里瓦达维亚海军准将城', 'Comodoro Rivadavia', 'liwadaweiyahaijunzhunjiangcheng', 'CRD');
INSERT INTO `sp_place` VALUES ('457', '11', ',5,11,457,', '3', '罗萨里奥', 'Rosario', 'luosaliao', 'ROS');
INSERT INTO `sp_place` VALUES ('458', '11', ',5,11,458,', '3', '罗森', 'Rawson', 'luosen', 'RWO');
INSERT INTO `sp_place` VALUES ('459', '11', ',5,11,459,', '3', '马德普拉塔', 'Mar del Plata', 'madepulata', 'MDQ');
INSERT INTO `sp_place` VALUES ('460', '11', ',5,11,460,', '3', '门多萨', 'Mendoza', 'menduosa', 'MDZ');
INSERT INTO `sp_place` VALUES ('461', '11', ',5,11,461,', '3', '内乌肯', 'Neuquen', 'neiwuken', 'NQN');
INSERT INTO `sp_place` VALUES ('462', '11', ',5,11,462,', '3', '萨尔塔', 'Salta', 'saerta', 'SLA');
INSERT INTO `sp_place` VALUES ('463', '11', ',5,11,463,', '3', '圣地亚哥-德尔埃斯特罗', 'Santiago del Estero', 'shengdiyagedeeraisiteluo', 'SDE');
INSERT INTO `sp_place` VALUES ('464', '11', ',5,11,464,', '3', '圣菲', 'Santa Fe', 'shengfei', 'SFN');
INSERT INTO `sp_place` VALUES ('465', '11', ',5,11,465,', '3', '圣胡安', 'San Juan', 'shenghuan', 'UAQ');
INSERT INTO `sp_place` VALUES ('466', '11', ',5,11,466,', '3', '圣拉斐尔', 'San Rafael', 'shenglaer', 'AFA');
INSERT INTO `sp_place` VALUES ('467', '11', ',5,11,467,', '3', '圣路易斯', 'San Luis', 'shengluyisi', 'LUQ');
INSERT INTO `sp_place` VALUES ('468', '11', ',5,11,468,', '3', '圣罗莎', 'Santa Rosa', 'shengluosha', 'RSA');
INSERT INTO `sp_place` VALUES ('469', '11', ',5,11,469,', '3', '圣米格尔-德图库曼', 'San Miguel de Tucuman', 'shengmigeerdetukuman', 'SMC');
INSERT INTO `sp_place` VALUES ('470', '11', ',5,11,470,', '3', '圣尼古拉斯', 'San Nicolas', 'shengnigulasi', 'SNS');
INSERT INTO `sp_place` VALUES ('471', '11', ',5,11,471,', '3', '特雷利乌', 'Trelew', 'teleiliwu', 'REL');
INSERT INTO `sp_place` VALUES ('472', '11', ',5,11,472,', '3', '乌斯怀亚', 'Ushuaia', 'wusihuaiya', 'USH');
INSERT INTO `sp_place` VALUES ('473', '12', ',1,12,473,', '3', '阿布扎比', 'Abu Dhabi', 'abuzhabi', 'AZ');
INSERT INTO `sp_place` VALUES ('474', '12', ',1,12,474,', '3', '艾因', 'Al l\'Ayn', 'aiyin', 'AL');
INSERT INTO `sp_place` VALUES ('475', '12', ',1,12,475,', '3', '迪拜', 'Dubai', 'dibai', 'DU');
INSERT INTO `sp_place` VALUES ('476', '12', ',1,12,476,', '3', '沙迦', 'Ash Shariqah', 'sha', 'SH');
INSERT INTO `sp_place` VALUES ('477', '14', ',1,14,477,', '3', '巴提奈地区', 'Al-Batinah', 'batinaidiqu', 'BA');
INSERT INTO `sp_place` VALUES ('478', '14', ',1,14,478,', '3', '达希莱地区', 'Az-Zahirah', 'daxilaidiqu', 'ZA');
INSERT INTO `sp_place` VALUES ('479', '14', ',1,14,479,', '3', '东部地区', 'Ash-Sharqiyah', 'dongbudiqu', 'SH');
INSERT INTO `sp_place` VALUES ('480', '14', ',1,14,480,', '3', '马斯喀特省', 'Masqat', 'masikatesheng', 'MA');
INSERT INTO `sp_place` VALUES ('481', '14', ',1,14,481,', '3', '穆桑达姆省', 'Musandam', 'musangdamusheng', 'MU');
INSERT INTO `sp_place` VALUES ('482', '14', ',1,14,482,', '3', '内地地区', 'Ad-Dakhiliyah', 'neididiqu', 'DA');
INSERT INTO `sp_place` VALUES ('483', '14', ',1,14,483,', '3', '中部地区', 'Al-Wusta', 'zhongbudiqu', 'WU');
INSERT INTO `sp_place` VALUES ('484', '14', ',1,14,484,', '3', '佐法尔省', 'Zufar', 'zuofaersheng', 'ZU');
INSERT INTO `sp_place` VALUES ('485', '15', ',1,15,485,', '3', '阿布歇隆', 'Abseron', 'abuxielong', 'ABS');
INSERT INTO `sp_place` VALUES ('486', '15', ',1,15,486,', '3', '哈奇马斯', 'Xacmaz', 'haqimasi', 'XAC');
INSERT INTO `sp_place` VALUES ('487', '15', ',1,15,487,', '3', '卡尔巴卡尔', 'Kalbacar', 'kaerbakaer', 'KAL');
INSERT INTO `sp_place` VALUES ('488', '15', ',1,15,488,', '3', '卡扎赫', 'Qazax', 'kazhahe', 'QAZ');
INSERT INTO `sp_place` VALUES ('489', '15', ',1,15,489,', '3', '连科兰', 'Lankaran', 'liankelan', 'LAN');
INSERT INTO `sp_place` VALUES ('490', '15', ',1,15,490,', '3', '密尔-卡拉巴赫', 'Mil-Qarabax', 'mierkalabahe', 'MQA');
INSERT INTO `sp_place` VALUES ('491', '15', ',1,15,491,', '3', '穆甘-萨连', 'Mugan-Salyan', 'mugansalian', 'MSA');
INSERT INTO `sp_place` VALUES ('492', '15', ',1,15,492,', '3', '纳戈尔诺－卡拉巴赫', 'Nagorni-Qarabax', 'nageernuokalabahe', 'NQA');
INSERT INTO `sp_place` VALUES ('493', '15', ',1,15,493,', '3', '纳希切万', 'Naxcivan', 'naxiqiewan', 'NX');
INSERT INTO `sp_place` VALUES ('494', '15', ',1,15,494,', '3', '普利亚拉克斯', 'Priaraks', 'puliyalakesi', 'PRI');
INSERT INTO `sp_place` VALUES ('495', '15', ',1,15,495,', '3', '舍基', 'Saki', 'sheji', 'SA');
INSERT INTO `sp_place` VALUES ('496', '15', ',1,15,496,', '3', '苏姆盖特', 'Sumqayit', 'sumugaite', 'SMC');
INSERT INTO `sp_place` VALUES ('497', '15', ',1,15,497,', '3', '锡尔万', 'Sirvan', 'xierwan', 'SIR');
INSERT INTO `sp_place` VALUES ('498', '15', ',1,15,498,', '3', '占贾', 'Ganca', 'zhanjia', 'GA');
INSERT INTO `sp_place` VALUES ('499', '17', ',3,17,499,', '3', '阿斯旺', 'Aswan', 'asiwang', 'ASW');
INSERT INTO `sp_place` VALUES ('500', '17', ',3,17,500,', '3', '古尔代盖', 'Al Ghurdaqah', 'guerdaigai', 'GBY');
INSERT INTO `sp_place` VALUES ('501', '17', ',3,17,501,', '3', '开罗', 'Cairo', 'kailuo', 'CAI');
INSERT INTO `sp_place` VALUES ('502', '17', ',3,17,502,', '3', '苏布拉开马', 'Shubra al Khaymah', 'subulakaima', 'SKH');
INSERT INTO `sp_place` VALUES ('503', '17', ',3,17,503,', '3', '亚历山大', 'Alexandria', 'yalishanda', 'ALY');
INSERT INTO `sp_place` VALUES ('504', '18', ',3,18,504,', '3', '阿法尔', 'Afar', 'afaer', 'AF');
INSERT INTO `sp_place` VALUES ('505', '18', ',3,18,505,', '3', '阿姆哈拉', 'Amara', 'amuhala', 'AH');
INSERT INTO `sp_place` VALUES ('506', '18', ',3,18,506,', '3', '奥罗米亚', 'Oromiya', 'aoluomiya', 'OR');
INSERT INTO `sp_place` VALUES ('507', '18', ',3,18,507,', '3', '宾香古尔', 'Binshangul Gumuz', 'binxiangguer', 'BG');
INSERT INTO `sp_place` VALUES ('508', '18', ',3,18,508,', '3', '德雷达瓦', 'Dire Dawa', 'deleidawa', 'DD');
INSERT INTO `sp_place` VALUES ('509', '18', ',3,18,509,', '3', '甘贝拉各族', 'Gambela Hizboch', 'ganbeilagezu', 'GB');
INSERT INTO `sp_place` VALUES ('510', '18', ',3,18,510,', '3', '哈勒里民族', 'Hareri  Hizb', 'haleliminzu', 'HR');
INSERT INTO `sp_place` VALUES ('511', '18', ',3,18,511,', '3', '南方各族', 'YeDebub Biheroch', 'nanfanggezu', 'SN');
INSERT INTO `sp_place` VALUES ('512', '18', ',3,18,512,', '3', '索马里', 'Sumale', 'suomali', 'SM');
INSERT INTO `sp_place` VALUES ('513', '18', ',3,18,513,', '3', '提格雷', 'Tigray', 'tigelei', 'TG');
INSERT INTO `sp_place` VALUES ('514', '18', ',3,18,514,', '3', '亚的斯亚贝巴', 'Adis abeba', 'yadesiyabeiba', 'AA');
INSERT INTO `sp_place` VALUES ('515', '19', ',2,19,515,', '3', '奥法利', 'Offaly', 'aofali', 'OF');
INSERT INTO `sp_place` VALUES ('516', '19', ',2,19,516,', '3', '蒂珀雷里', 'Tipperary', 'dileili', 'TP');
INSERT INTO `sp_place` VALUES ('517', '19', ',2,19,517,', '3', '都柏林', 'Dublin', 'dubailin', 'DB');
INSERT INTO `sp_place` VALUES ('518', '19', ',2,19,518,', '3', '多内加尔', 'Donegal', 'duoneijiaer', 'DG');
INSERT INTO `sp_place` VALUES ('519', '19', ',2,19,519,', '3', '戈尔韦', 'Galway', 'geerwei', 'GW');
INSERT INTO `sp_place` VALUES ('520', '19', ',2,19,520,', '3', '基尔代尔', 'Kildare', 'jierdaier', 'KD');
INSERT INTO `sp_place` VALUES ('521', '19', ',2,19,521,', '3', '基尔肯尼', 'Kilkenny', 'jierkenni', 'KK');
INSERT INTO `sp_place` VALUES ('522', '19', ',2,19,522,', '3', '卡范', 'Cavan', 'kafan', 'CV');
INSERT INTO `sp_place` VALUES ('523', '19', ',2,19,523,', '3', '卡洛', 'Carlow', 'kaluo', 'CW');
INSERT INTO `sp_place` VALUES ('524', '19', ',2,19,524,', '3', '凯里', 'Kerry', 'kaili', 'KR');
INSERT INTO `sp_place` VALUES ('525', '19', ',2,19,525,', '3', '科克', 'Cork', 'keke', 'CK');
INSERT INTO `sp_place` VALUES ('526', '19', ',2,19,526,', '3', '克莱尔', 'Clare', 'kelaier', 'CL');
INSERT INTO `sp_place` VALUES ('527', '19', ',2,19,527,', '3', '朗福德', 'Longford', 'langfude', 'LF');
INSERT INTO `sp_place` VALUES ('528', '19', ',2,19,528,', '3', '劳斯', 'Louth', 'laosi', 'LT');
INSERT INTO `sp_place` VALUES ('529', '19', ',2,19,529,', '3', '崂斯', 'Laois', 'si', 'LA');
INSERT INTO `sp_place` VALUES ('530', '19', ',2,19,530,', '3', '利默里克', 'Limerick', 'limolike', 'LM');
INSERT INTO `sp_place` VALUES ('531', '19', ',2,19,531,', '3', '利特里姆', 'Leitrim', 'litelimu', 'LR');
INSERT INTO `sp_place` VALUES ('532', '19', ',2,19,532,', '3', '罗斯康芒', 'Roscommon', 'luosikangmang', 'RC');
INSERT INTO `sp_place` VALUES ('533', '19', ',2,19,533,', '3', '梅奥', 'Mayo', 'meiao', 'MY');
INSERT INTO `sp_place` VALUES ('534', '19', ',2,19,534,', '3', '米斯', 'Meath', 'misi', 'MT');
INSERT INTO `sp_place` VALUES ('535', '19', ',2,19,535,', '3', '莫内根', 'Monaghan', 'moneigen', 'MG');
INSERT INTO `sp_place` VALUES ('536', '19', ',2,19,536,', '3', '斯莱戈', 'Sligo', 'silaige', 'SL');
INSERT INTO `sp_place` VALUES ('537', '19', ',2,19,537,', '3', '威克洛', 'Wicklow', 'weikeluo', 'WK');
INSERT INTO `sp_place` VALUES ('538', '19', ',2,19,538,', '3', '韦克斯福德', 'Wexford', 'weikesifude', 'WX');
INSERT INTO `sp_place` VALUES ('539', '19', ',2,19,539,', '3', '沃特福德', 'Waterford', 'wotefude', 'WF');
INSERT INTO `sp_place` VALUES ('540', '19', ',2,19,540,', '3', '西米斯', 'Westmeath', 'ximisi', 'WM');
INSERT INTO `sp_place` VALUES ('541', '20', ',2,20,541,', '3', '贝尔瓦', 'Polva', 'beierwa', '65');
INSERT INTO `sp_place` VALUES ('542', '20', ',2,20,542,', '3', '哈留', 'Harju', 'haliu', '37');
INSERT INTO `sp_place` VALUES ('543', '20', ',2,20,543,', '3', '拉普拉', 'Rapla', 'lapula', '70');
INSERT INTO `sp_place` VALUES ('544', '20', ',2,20,544,', '3', '里亚内', 'Laane', 'liyanei', '57');
INSERT INTO `sp_place` VALUES ('545', '20', ',2,20,545,', '3', '帕尔努', 'Parnu', 'paernu', '67');
INSERT INTO `sp_place` VALUES ('546', '20', ',2,20,546,', '3', '萨雷', 'Saare', 'salei', '74');
INSERT INTO `sp_place` VALUES ('547', '20', ',2,20,547,', '3', '塔尔图', 'Tartu', 'taertu', '78');
INSERT INTO `sp_place` VALUES ('548', '20', ',2,20,548,', '3', '瓦尔加', 'Valga', 'waerjia', '82');
INSERT INTO `sp_place` VALUES ('549', '20', ',2,20,549,', '3', '维良地', 'Viljandi', 'weiliangdi', '84');
INSERT INTO `sp_place` VALUES ('550', '20', ',2,20,550,', '3', '维鲁', 'Laane-Viru', 'weilu', '59');
INSERT INTO `sp_place` VALUES ('551', '20', ',2,20,551,', '3', '沃鲁', 'Voru', 'wolu', '86');
INSERT INTO `sp_place` VALUES ('552', '20', ',2,20,552,', '3', '希尤', 'Hiiu', 'xiyou', '39');
INSERT INTO `sp_place` VALUES ('553', '20', ',2,20,553,', '3', '耶尔韦', 'Jarva', 'yeerwei', '51');
INSERT INTO `sp_place` VALUES ('554', '20', ',2,20,554,', '3', '耶盖瓦', 'Jogeva', 'yegaiwa', '49');
INSERT INTO `sp_place` VALUES ('555', '20', ',2,20,555,', '3', '依达－维鲁', 'Ida-Viru', 'yidaweilu', '44');
INSERT INTO `sp_place` VALUES ('556', '21', ',2,21,556,', '3', '安道尔城', 'Andorra la Vella', 'andaoercheng', '7');
INSERT INTO `sp_place` VALUES ('557', '21', ',2,21,557,', '3', '奥尔迪诺', 'Ordino', 'aoerdinuo', '5');
INSERT INTO `sp_place` VALUES ('558', '21', ',2,21,558,', '3', '恩坎普', 'Encamp', 'enkanpu', '3');
INSERT INTO `sp_place` VALUES ('559', '21', ',2,21,559,', '3', '卡尼略', 'Canillo', 'kanilue', '2');
INSERT INTO `sp_place` VALUES ('560', '21', ',2,21,560,', '3', '莱塞斯卡尔德－恩戈尔达', 'Escaldes-Engordany', 'laisaisikaerdeengeerda', '8');
INSERT INTO `sp_place` VALUES ('561', '21', ',2,21,561,', '3', '马萨纳', 'La Massana', 'masana', '4');
INSERT INTO `sp_place` VALUES ('562', '21', ',2,21,562,', '3', '圣胡利娅－德洛里亚', 'Sant Julia de Laria', 'shenghulideluoliya', '6');
INSERT INTO `sp_place` VALUES ('563', '22', ',3,22,563,', '3', '北宽扎', 'Cuanza Norte', 'beikuanzha', 'CNO');
INSERT INTO `sp_place` VALUES ('564', '22', ',3,22,564,', '3', '北隆达', 'Lunda Norte', 'beilongda', 'LNO');
INSERT INTO `sp_place` VALUES ('565', '22', ',3,22,565,', '3', '本戈', 'Bengo', 'benge', 'BGO');
INSERT INTO `sp_place` VALUES ('566', '22', ',3,22,566,', '3', '本格拉', 'Benguela', 'bengela', 'BGU');
INSERT INTO `sp_place` VALUES ('567', '22', ',3,22,567,', '3', '比耶', 'Bie', 'biye', 'BIE');
INSERT INTO `sp_place` VALUES ('568', '22', ',3,22,568,', '3', '卡宾达', 'Cabinda', 'kabinda', 'CAB');
INSERT INTO `sp_place` VALUES ('569', '22', ',3,22,569,', '3', '库内内', 'Cunene', 'kuneinei', 'CNN');
INSERT INTO `sp_place` VALUES ('570', '22', ',3,22,570,', '3', '宽多库邦戈', 'Cuando Cubango', 'kuanduokubangge', 'CCU');
INSERT INTO `sp_place` VALUES ('571', '22', ',3,22,571,', '3', '罗安达', 'Luanda', 'luoanda', 'LUA');
INSERT INTO `sp_place` VALUES ('572', '22', ',3,22,572,', '3', '马兰热', 'Malanje', 'malanre', 'MAL');
INSERT INTO `sp_place` VALUES ('573', '22', ',3,22,573,', '3', '莫希科', 'Moxico', 'moxike', 'MOX');
INSERT INTO `sp_place` VALUES ('574', '22', ',3,22,574,', '3', '纳米贝', 'Namibe', 'namibei', 'NAM');
INSERT INTO `sp_place` VALUES ('575', '22', ',3,22,575,', '3', '南宽扎', 'Cuanza Sul', 'nankuanzha', 'CUS');
INSERT INTO `sp_place` VALUES ('576', '22', ',3,22,576,', '3', '南隆达', 'Lunda Sul', 'nanlongda', 'LSU');
INSERT INTO `sp_place` VALUES ('577', '22', ',3,22,577,', '3', '万博', 'Huambo', 'wanbo', 'HUA');
INSERT INTO `sp_place` VALUES ('578', '22', ',3,22,578,', '3', '威拉', 'Huila', 'weila', 'HUI');
INSERT INTO `sp_place` VALUES ('579', '22', ',3,22,579,', '3', '威热', 'Uige', 'weire', 'UIG');
INSERT INTO `sp_place` VALUES ('580', '22', ',3,22,580,', '3', '扎伊尔', 'Zaire', 'zhayier', 'ZAI');
INSERT INTO `sp_place` VALUES ('581', '26', ',2,26,581,', '3', '布尔根兰', 'Burgenland', 'buergenlan', 'BUR');
INSERT INTO `sp_place` VALUES ('582', '26', ',2,26,582,', '3', '蒂罗尔', 'Tyrol', 'diluoer', 'TYR');
INSERT INTO `sp_place` VALUES ('583', '26', ',2,26,583,', '3', '福拉尔贝格', 'Vorarlberg', 'fulaerbeige', 'VOR');
INSERT INTO `sp_place` VALUES ('584', '26', ',2,26,584,', '3', '克恩顿', 'Carinthia', 'keendun', 'CAT');
INSERT INTO `sp_place` VALUES ('585', '26', ',2,26,585,', '3', '萨尔茨堡', 'Salzburg', 'saercibao', 'SZG');
INSERT INTO `sp_place` VALUES ('586', '26', ',2,26,586,', '3', '上奥地利', 'Upper Austria', 'shangaodili', 'UAU');
INSERT INTO `sp_place` VALUES ('587', '26', ',2,26,587,', '3', '施蒂利亚', 'Styria', 'shidiliya', 'STY');
INSERT INTO `sp_place` VALUES ('588', '26', ',2,26,588,', '3', '维也纳', 'Vienna', 'weiyena', 'VDD');
INSERT INTO `sp_place` VALUES ('589', '26', ',2,26,589,', '3', '下奥地利', 'Lower Austria', 'xiaaodili', 'LAU');
INSERT INTO `sp_place` VALUES ('590', '29', ',6,29,590,', '3', '北部', 'Northern', 'beibu', 'NO');
INSERT INTO `sp_place` VALUES ('591', '29', ',6,29,591,', '3', '布干维尔', 'Bougainville', 'buganweier', 'BV');
INSERT INTO `sp_place` VALUES ('592', '29', ',6,29,592,', '3', '东部高地', 'Eastern Highlands', 'dongbugaodi', 'EH');
INSERT INTO `sp_place` VALUES ('593', '29', ',6,29,593,', '3', '东塞皮克', 'East Sepik', 'dongsaipike', 'ES');
INSERT INTO `sp_place` VALUES ('594', '29', ',6,29,594,', '3', '东新不列颠', 'East New Britain', 'dongxinbuliedian', 'EB');
INSERT INTO `sp_place` VALUES ('595', '29', ',6,29,595,', '3', '恩加', 'Enga', 'enjia', 'EN');
INSERT INTO `sp_place` VALUES ('596', '29', ',6,29,596,', '3', '海湾', 'Gulf', 'haiwan', 'GU');
INSERT INTO `sp_place` VALUES ('597', '29', ',6,29,597,', '3', '马当', 'Madang', 'madang', 'MD');
INSERT INTO `sp_place` VALUES ('598', '29', ',6,29,598,', '3', '马努斯', 'Manus', 'manusi', 'MN');
INSERT INTO `sp_place` VALUES ('599', '29', ',6,29,599,', '3', '米尔恩湾', 'Milne Bay', 'mierenwan', 'MB');
INSERT INTO `sp_place` VALUES ('600', '29', ',6,29,600,', '3', '莫尔兹比港', 'Port Moresby', 'moerzibigang', 'NC');
INSERT INTO `sp_place` VALUES ('601', '29', ',6,29,601,', '3', '莫罗贝', 'Morobe', 'moluobei', 'MR');
INSERT INTO `sp_place` VALUES ('602', '29', ',6,29,602,', '3', '南部高地', 'Southern Highlands', 'nanbugaodi', 'SH');
INSERT INTO `sp_place` VALUES ('603', '29', ',6,29,603,', '3', '钦布', 'Simbu', 'qinbu', 'SI');
INSERT INTO `sp_place` VALUES ('604', '29', ',6,29,604,', '3', '桑道恩', 'Sandaun', 'sangdaoen', 'SA');
INSERT INTO `sp_place` VALUES ('605', '29', ',6,29,605,', '3', '西部', 'Western', 'xibu', 'WE');
INSERT INTO `sp_place` VALUES ('606', '29', ',6,29,606,', '3', '西部高地', 'Western Highlands', 'xibugaodi', 'WH');
INSERT INTO `sp_place` VALUES ('607', '29', ',6,29,607,', '3', '西新不列颠', 'West New Britain', 'xixinbuliedian', 'WB');
INSERT INTO `sp_place` VALUES ('608', '29', ',6,29,608,', '3', '新爱尔兰', 'New Ireland', 'xinaierlan', 'NI');
INSERT INTO `sp_place` VALUES ('609', '31', ',1,31,609,', '3', '白沙瓦', 'Peshawar', 'baishawa', 'PEW');
INSERT INTO `sp_place` VALUES ('610', '31', ',1,31,610,', '3', '费萨拉巴德', 'Faisalabad', 'feisalabade', 'LYP');
INSERT INTO `sp_place` VALUES ('611', '31', ',1,31,611,', '3', '故吉软瓦拉', 'Gujranwala', 'gujiruanwala', 'GUJ');
INSERT INTO `sp_place` VALUES ('612', '31', ',1,31,612,', '3', '海德拉巴', 'Hyderabad', 'haidelaba', 'HDD');
INSERT INTO `sp_place` VALUES ('613', '31', ',1,31,613,', '3', '卡拉奇', 'Karachi', 'kalaqi', 'KCT');
INSERT INTO `sp_place` VALUES ('614', '31', ',1,31,614,', '3', '拉合尔', 'Lahore', 'laheer', 'LHE');
INSERT INTO `sp_place` VALUES ('615', '31', ',1,31,615,', '3', '拉瓦尔品第', 'Rawalpindi', 'lawaerpindi', 'RWP');
INSERT INTO `sp_place` VALUES ('616', '31', ',1,31,616,', '3', '木尔坦', 'Multan', 'muertan', 'MUX');
INSERT INTO `sp_place` VALUES ('617', '31', ',1,31,617,', '3', '伊斯兰堡', 'Islamabad', 'yisilanbao', 'ISB');
INSERT INTO `sp_place` VALUES ('618', '32', ',5,32,618,', '3', '阿曼拜', 'Amambay', 'amanbai', 'AM');
INSERT INTO `sp_place` VALUES ('619', '32', ',5,32,619,', '3', '阿耶斯总统省', 'Presidente Hayes', 'ayesizongtongsheng', 'PH');
INSERT INTO `sp_place` VALUES ('620', '32', ',5,32,620,', '3', '巴拉瓜里', 'Paraguari', 'balaguali', 'PA');
INSERT INTO `sp_place` VALUES ('621', '32', ',5,32,621,', '3', '博克龙', 'Boqueron', 'bokelong', 'BO');
INSERT INTO `sp_place` VALUES ('622', '32', ',5,32,622,', '3', '瓜伊拉', 'Guaira', 'guayila', 'GU');
INSERT INTO `sp_place` VALUES ('623', '32', ',5,32,623,', '3', '卡瓜苏', 'Caaguazu', 'kaguasu', 'CG');
INSERT INTO `sp_place` VALUES ('624', '32', ',5,32,624,', '3', '卡嫩迪尤', 'Canindeyu', 'kanendiyou', 'CN');
INSERT INTO `sp_place` VALUES ('625', '32', ',5,32,625,', '3', '卡萨帕', 'Caazapa', 'kasapa', 'CZ');
INSERT INTO `sp_place` VALUES ('626', '32', ',5,32,626,', '3', '康塞普西翁', 'Concepcion', 'kangsaipuxiweng', 'CC');
INSERT INTO `sp_place` VALUES ('627', '32', ',5,32,627,', '3', '科迪勒拉', 'Cordillera', 'kedilela', 'CD');
INSERT INTO `sp_place` VALUES ('628', '32', ',5,32,628,', '3', '米西奥内斯', 'Misiones', 'mixiaoneisi', 'MI');
INSERT INTO `sp_place` VALUES ('629', '32', ',5,32,629,', '3', '涅恩布库', 'Neembucu', 'nieenbuku', 'NE');
INSERT INTO `sp_place` VALUES ('630', '32', ',5,32,630,', '3', '上巴拉圭', 'Alto Paraguay', 'shangbalagui', 'AG');
INSERT INTO `sp_place` VALUES ('631', '32', ',5,32,631,', '3', '上巴拉那', 'Alto Parana', 'shangbalana', 'AN');
INSERT INTO `sp_place` VALUES ('632', '32', ',5,32,632,', '3', '圣佩德罗', 'San Pedro', 'shengpeideluo', 'SP');
INSERT INTO `sp_place` VALUES ('633', '32', ',5,32,633,', '3', '亚松森特别区', 'Asuncion', 'yasongsentebiequ', 'AS');
INSERT INTO `sp_place` VALUES ('634', '32', ',5,32,634,', '3', '伊塔普亚', 'Itapua', 'yitapuya', 'IT');
INSERT INTO `sp_place` VALUES ('635', '32', ',5,32,635,', '3', '中央', 'Central', 'zhongyang', 'CE');
INSERT INTO `sp_place` VALUES ('636', '33', ',1,33,636,', '3', '加沙地带', 'Gaza Strip', 'jiashadidai', 'GZ');
INSERT INTO `sp_place` VALUES ('637', '33', ',1,33,637,', '3', '西岸', 'West Bank', 'xian', 'WE');
INSERT INTO `sp_place` VALUES ('638', '34', ',1,34,638,', '3', '北部', 'Ash-Shamaliyah', 'beibu', '5');
INSERT INTO `sp_place` VALUES ('639', '34', ',1,34,639,', '3', '哈德', 'Al-Hadd', 'hade', '1');
INSERT INTO `sp_place` VALUES ('640', '34', ',1,34,640,', '3', '哈马德', 'Hammad', 'hamade', '12');
INSERT INTO `sp_place` VALUES ('641', '34', ',1,34,641,', '3', '里法', 'Ar-Rifa', 'lifa', '9');
INSERT INTO `sp_place` VALUES ('642', '34', ',1,34,642,', '3', '麦纳麦', 'Al-Manamah', 'mainamai', '3');
INSERT INTO `sp_place` VALUES ('643', '34', ',1,34,643,', '3', '穆哈拉格', 'Al-Muharraq', 'muhalage', '2');
INSERT INTO `sp_place` VALUES ('644', '34', ',1,34,644,', '3', '西部', 'Al-Gharbiyah', 'xibu', '10');
INSERT INTO `sp_place` VALUES ('645', '34', ',1,34,645,', '3', '伊萨城', 'Isa', 'yisacheng', '8');
INSERT INTO `sp_place` VALUES ('646', '34', ',1,34,646,', '3', '中部', 'Al-Wusta', 'zhongbu', '7');
INSERT INTO `sp_place` VALUES ('647', '36', ',5,36,647,', '3', '阿克里', 'Acre', 'akeli', 'AC');
INSERT INTO `sp_place` VALUES ('648', '36', ',5,36,648,', '3', '阿拉戈斯', 'Alagoas', 'alagesi', 'AL');
INSERT INTO `sp_place` VALUES ('649', '36', ',5,36,649,', '3', '阿马帕', 'Amapa', 'amapa', 'AP');
INSERT INTO `sp_place` VALUES ('650', '36', ',5,36,650,', '3', '巴拉那', 'Parana', 'balana', 'PR');
INSERT INTO `sp_place` VALUES ('651', '36', ',5,36,651,', '3', '巴西利亚', 'Brasilia', 'baxiliya', 'BSB');
INSERT INTO `sp_place` VALUES ('652', '36', ',5,36,652,', '3', '巴伊亚', 'Bahia', 'bayiya', 'BA');
INSERT INTO `sp_place` VALUES ('653', '36', ',5,36,653,', '3', '北里奥格兰德', 'Rio Grande do Norte', 'beiliaogelande', 'RN');
INSERT INTO `sp_place` VALUES ('654', '36', ',5,36,654,', '3', '伯南布哥', 'Pernambuco', 'bonanbuge', 'PE');
INSERT INTO `sp_place` VALUES ('655', '36', ',5,36,655,', '3', '戈亚斯', 'Goias', 'geyasi', 'GO');
INSERT INTO `sp_place` VALUES ('656', '36', ',5,36,656,', '3', '朗多尼亚', 'Rondonia', 'langduoniya', 'RO');
INSERT INTO `sp_place` VALUES ('657', '36', ',5,36,657,', '3', '里约热内卢', 'Rio de Janeiro', 'liyuereneilu', 'RJ');
INSERT INTO `sp_place` VALUES ('658', '36', ',5,36,658,', '3', '罗赖马', 'Roraima', 'luolaima', 'RR');
INSERT INTO `sp_place` VALUES ('659', '36', ',5,36,659,', '3', '马拉尼昂', 'Maranhao', 'malaniang', 'MA');
INSERT INTO `sp_place` VALUES ('660', '36', ',5,36,660,', '3', '马托格罗索', 'Mato Grosso', 'matuogeluosuo', 'MT');
INSERT INTO `sp_place` VALUES ('661', '36', ',5,36,661,', '3', '米纳斯吉拉斯', 'Minas Gerais', 'minasijilasi', 'MG');
INSERT INTO `sp_place` VALUES ('662', '36', ',5,36,662,', '3', '南里奥格兰德', 'Rio Grande do Sul', 'nanliaogelande', 'RS');
INSERT INTO `sp_place` VALUES ('663', '36', ',5,36,663,', '3', '南马托格罗索', 'Mato Grosso do Sul', 'nanmatuogeluosuo', 'MS');
INSERT INTO `sp_place` VALUES ('664', '36', ',5,36,664,', '3', '帕拉', 'Para', 'pala', 'PA');
INSERT INTO `sp_place` VALUES ('665', '36', ',5,36,665,', '3', '帕拉伊巴', 'Paraiba', 'palayiba', 'PB');
INSERT INTO `sp_place` VALUES ('666', '36', ',5,36,666,', '3', '皮奥伊', 'Piaui', 'piaoyi', 'PI');
INSERT INTO `sp_place` VALUES ('667', '36', ',5,36,667,', '3', '塞阿拉', 'Ceara', 'saiala', 'CE');
INSERT INTO `sp_place` VALUES ('668', '36', ',5,36,668,', '3', '塞尔希培', 'Sergipe', 'saierxipei', 'SE');
INSERT INTO `sp_place` VALUES ('669', '36', ',5,36,669,', '3', '圣埃斯皮里图', 'Espirito Santo', 'shengaisipilitu', 'ES');
INSERT INTO `sp_place` VALUES ('670', '36', ',5,36,670,', '3', '圣保罗', 'Sao Paulo', 'shengbaoluo', 'SP');
INSERT INTO `sp_place` VALUES ('671', '36', ',5,36,671,', '3', '圣卡塔琳娜', 'Santa Catarina', 'shengkatalinna', 'SC');
INSERT INTO `sp_place` VALUES ('672', '36', ',5,36,672,', '3', '托坎廷斯', 'Tocantins', 'tuokantingsi', 'TO');
INSERT INTO `sp_place` VALUES ('673', '36', ',5,36,673,', '3', '亚马孙', 'Amazonas', 'yamasun', 'AM');
INSERT INTO `sp_place` VALUES ('674', '37', ',2,37,674,', '3', '布列斯特', 'Bresckaja', 'buliesite', 'BR');
INSERT INTO `sp_place` VALUES ('675', '37', ',2,37,675,', '3', '戈梅利', 'Homelskaja', 'gemeili', 'HO');
INSERT INTO `sp_place` VALUES ('676', '37', ',2,37,676,', '3', '格罗德诺', 'Hrodzenskaja', 'geluodenuo', 'HR');
INSERT INTO `sp_place` VALUES ('677', '37', ',2,37,677,', '3', '明斯克市', 'Minsk', 'mingsikeshi', 'MI');
INSERT INTO `sp_place` VALUES ('678', '37', ',2,37,678,', '3', '莫吉廖夫', 'Mahileuskaja', 'mojiliaofu', 'MA');
INSERT INTO `sp_place` VALUES ('679', '37', ',2,37,679,', '3', '维捷布斯克', 'Vicebskaja', 'weijiebusike', 'VI');
INSERT INTO `sp_place` VALUES ('680', '39', ',2,39,680,', '3', '布尔加斯', 'Burgas', 'buerjiasi', 'BOJ');
INSERT INTO `sp_place` VALUES ('681', '39', ',2,39,681,', '3', '卡斯科伏', 'Khaskovo', 'kasikefu', 'KHO');
INSERT INTO `sp_place` VALUES ('682', '39', ',2,39,682,', '3', '鲁塞', 'Ruse', 'lusai', 'ROU');
INSERT INTO `sp_place` VALUES ('683', '39', ',2,39,683,', '3', '洛维奇', 'Lovech', 'luoweiqi', 'LVP');
INSERT INTO `sp_place` VALUES ('684', '39', ',2,39,684,', '3', '蒙塔纳', 'Montana', 'mengtana', 'OZA');
INSERT INTO `sp_place` VALUES ('685', '39', ',2,39,685,', '3', '普罗夫迪夫', 'Plovdiv', 'puluofudifu', 'PDV');
INSERT INTO `sp_place` VALUES ('686', '39', ',2,39,686,', '3', '索非亚', 'Sofiya', 'suofeiya', 'SOF');
INSERT INTO `sp_place` VALUES ('687', '39', ',2,39,687,', '3', '索非亚市', 'Grad Sofiya', 'suofeiyashi', 'GSO');
INSERT INTO `sp_place` VALUES ('688', '39', ',2,39,688,', '3', '瓦尔纳', 'Varna', 'waerna', 'VAR');
INSERT INTO `sp_place` VALUES ('689', '41', ',3,41,689,', '3', '阿黎博里', 'Alibori', 'aliboli', 'AL');
INSERT INTO `sp_place` VALUES ('690', '41', ',3,41,690,', '3', '阿塔科拉', 'Atakora', 'atakela', 'AK');
INSERT INTO `sp_place` VALUES ('691', '41', ',3,41,691,', '3', '滨海', 'Littoral', 'binhai', 'LI');
INSERT INTO `sp_place` VALUES ('692', '41', ',3,41,692,', '3', '波希康市', 'Bohicon', 'boxikangshi', 'BOH');
INSERT INTO `sp_place` VALUES ('693', '41', ',3,41,693,', '3', '博尔古', 'Borgou', 'boergu', 'BO');
INSERT INTO `sp_place` VALUES ('694', '41', ',3,41,694,', '3', '大西洋', 'Atlantique', 'daxiyang', 'AQ');
INSERT INTO `sp_place` VALUES ('695', '41', ',3,41,695,', '3', '高原', 'Plateau', 'gaoyuan', 'PL');
INSERT INTO `sp_place` VALUES ('696', '41', ',3,41,696,', '3', '库福', 'Kouffo', 'kufu', 'KO');
INSERT INTO `sp_place` VALUES ('697', '41', ',3,41,697,', '3', '莫诺', 'Mono', 'monuo', 'MO');
INSERT INTO `sp_place` VALUES ('698', '41', ',3,41,698,', '3', '丘陵', 'Collines', 'qiuling', 'CO');
INSERT INTO `sp_place` VALUES ('699', '41', ',3,41,699,', '3', '韦梅', 'Oueme', 'weimei', 'OU');
INSERT INTO `sp_place` VALUES ('700', '41', ',3,41,700,', '3', '峡谷', 'Donga', 'xiagu', 'DO');
INSERT INTO `sp_place` VALUES ('701', '41', ',3,41,701,', '3', '祖', 'Zou', 'zu', 'ZO');
INSERT INTO `sp_place` VALUES ('702', '42', ',2,42,702,', '3', '埃诺', 'Hainaut', 'ainuo', 'WHT');
INSERT INTO `sp_place` VALUES ('703', '42', ',2,42,703,', '3', '安特卫普', 'Antwerpen', 'anteweipu', 'VAN');
INSERT INTO `sp_place` VALUES ('704', '42', ',2,42,704,', '3', '布拉班特-瓦隆', 'Brabant-Wallone', 'bulabantewalong', 'WBR');
INSERT INTO `sp_place` VALUES ('705', '42', ',2,42,705,', '3', '布鲁塞尔', 'Brussels', 'bulusaier', 'BRU');
INSERT INTO `sp_place` VALUES ('706', '42', ',2,42,706,', '3', '东佛兰德', 'Oost-Vlaanderen', 'dongfolande', 'VOV');
INSERT INTO `sp_place` VALUES ('707', '42', ',2,42,707,', '3', '佛兰芒-布拉班特', 'Vlaams-Brabant', 'folanmangbulabante', 'VBR');
INSERT INTO `sp_place` VALUES ('708', '42', ',2,42,708,', '3', '列日', 'Liege', 'lieri', 'WLG');
INSERT INTO `sp_place` VALUES ('709', '42', ',2,42,709,', '3', '林堡', 'Limburg', 'linbao', 'VLI');
INSERT INTO `sp_place` VALUES ('710', '42', ',2,42,710,', '3', '卢森堡', 'Luxembourg', 'lusenbao', 'WLX');
INSERT INTO `sp_place` VALUES ('711', '42', ',2,42,711,', '3', '那慕尔', 'Namur', 'namuer', 'WNA');
INSERT INTO `sp_place` VALUES ('712', '42', ',2,42,712,', '3', '西佛兰德', 'West-Vlaanderen', 'xifolande', 'VWV');
INSERT INTO `sp_place` VALUES ('713', '45', ',2,45,713,', '3', '埃尔布隆格', 'Elbląg', 'aierbulongge', 'ELB');
INSERT INTO `sp_place` VALUES ('714', '45', ',2,45,714,', '3', '奥尔什丁', 'Olsztyn', 'aoershiding', 'OLS');
INSERT INTO `sp_place` VALUES ('715', '45', ',2,45,715,', '3', '奥斯特罗文卡', 'Ostrołeka', 'aositeluowenka', 'OSS');
INSERT INTO `sp_place` VALUES ('716', '45', ',2,45,716,', '3', '比得哥什', 'Bydgoszcz', 'bidegeshi', 'BZG');
INSERT INTO `sp_place` VALUES ('717', '45', ',2,45,717,', '3', '彼得库夫', 'Piotrkow', 'bidekufu', 'PIO');
INSERT INTO `sp_place` VALUES ('718', '45', ',2,45,718,', '3', '比托姆', 'Bytom', 'bituomu', 'BYT');
INSERT INTO `sp_place` VALUES ('719', '45', ',2,45,719,', '3', '比亚瓦波德拉斯卡', 'Biała Podlaska', 'biyawabodelasika', 'BAP');
INSERT INTO `sp_place` VALUES ('720', '45', ',2,45,720,', '3', '比亚维斯托克', 'Białystok', 'biyaweisituoke', 'BIA');
INSERT INTO `sp_place` VALUES ('721', '45', ',2,45,721,', '3', '波莱', 'Opole', 'bolai', 'OPO');
INSERT INTO `sp_place` VALUES ('722', '45', ',2,45,722,', '3', '波兹南', 'Poznan', 'bozinan', 'POZ');
INSERT INTO `sp_place` VALUES ('723', '45', ',2,45,723,', '3', '达布罗瓦戈尼察', 'Dabrowa Gornicza', 'dabuluowagenicha', 'DAB');
INSERT INTO `sp_place` VALUES ('724', '45', ',2,45,724,', '3', '大波兰地区戈茹夫', 'Gorzow Wlkp', 'dabolandiqugerufu', 'GOW');
INSERT INTO `sp_place` VALUES ('725', '45', ',2,45,725,', '3', '弗罗茨瓦夫', 'Wroclaw', 'fuluociwafu', 'WRO');
INSERT INTO `sp_place` VALUES ('726', '45', ',2,45,726,', '3', '弗沃茨瓦韦克', 'Wlocławek', 'fuwociwaweike', 'WLO');
INSERT INTO `sp_place` VALUES ('727', '45', ',2,45,727,', '3', '格但斯克', 'Gdansk', 'gedansike', 'GDN');
INSERT INTO `sp_place` VALUES ('728', '45', ',2,45,728,', '3', '格丁尼亚', 'Gdynia', 'gedingniya', 'GDY');
INSERT INTO `sp_place` VALUES ('729', '45', ',2,45,729,', '3', '格利维采', 'Gliwice', 'geliweicai', 'GWC');
INSERT INTO `sp_place` VALUES ('730', '45', ',2,45,730,', '3', '格鲁琼兹', 'Grudziadz', 'geluqiongzi', 'GRU');
INSERT INTO `sp_place` VALUES ('731', '45', ',2,45,731,', '3', '海乌姆', 'Chełm', 'haiwumu', 'CHO');
INSERT INTO `sp_place` VALUES ('732', '45', ',2,45,732,', '3', '华沙', 'Warszawa', 'huasha', 'WAW');
INSERT INTO `sp_place` VALUES ('733', '45', ',2,45,733,', '3', '霍茹夫', 'Chorzow', 'huorufu', 'CHZ');
INSERT INTO `sp_place` VALUES ('734', '45', ',2,45,734,', '3', '卡利什', 'Kalisz', 'kalishi', 'KAL');
INSERT INTO `sp_place` VALUES ('735', '45', ',2,45,735,', '3', '卡托维兹', 'Katowice', 'katuoweizi', 'KTW');
INSERT INTO `sp_place` VALUES ('736', '45', ',2,45,736,', '3', '凯尔采', 'Kielce', 'kaiercai', 'KLC');
INSERT INTO `sp_place` VALUES ('737', '45', ',2,45,737,', '3', '科宁', 'Konin', 'kening', 'KON');
INSERT INTO `sp_place` VALUES ('738', '45', ',2,45,738,', '3', '科沙林', 'Koszalin', 'keshalin', 'OSZ');
INSERT INTO `sp_place` VALUES ('739', '45', ',2,45,739,', '3', '克拉科夫', 'Krakow', 'kelakefu', 'KRK');
INSERT INTO `sp_place` VALUES ('740', '45', ',2,45,740,', '3', '克罗斯诺', 'Krosno', 'keluosinuo', 'KRO');
INSERT INTO `sp_place` VALUES ('741', '45', ',2,45,741,', '3', '拉多姆', 'Radom', 'laduomu', 'RDM');
INSERT INTO `sp_place` VALUES ('742', '45', ',2,45,742,', '3', '莱格尼察', 'Legnica', 'laigenicha', 'LEG');
INSERT INTO `sp_place` VALUES ('743', '45', ',2,45,743,', '3', '莱什诺', 'Leszno', 'laishinuo', 'LEZ');
INSERT INTO `sp_place` VALUES ('744', '45', ',2,45,744,', '3', '卢布林', 'Lublin', 'lubulin', 'LUL');
INSERT INTO `sp_place` VALUES ('745', '45', ',2,45,745,', '3', '鲁达', 'Ruda Sl', 'luda', 'RDS');
INSERT INTO `sp_place` VALUES ('746', '45', ',2,45,746,', '3', '罗兹', 'Lodz', 'luozi', 'LOD');
INSERT INTO `sp_place` VALUES ('747', '45', ',2,45,747,', '3', '绿山城', 'Zielona Gora', 'lvshancheng', 'IEG');
INSERT INTO `sp_place` VALUES ('748', '45', ',2,45,748,', '3', '米什洛维采', 'Mysłowice', 'mishiluoweicai', 'MYL');
INSERT INTO `sp_place` VALUES ('749', '45', ',2,45,749,', '3', '皮瓦', 'Piła', 'piwa', 'PIL');
INSERT INTO `sp_place` VALUES ('750', '45', ',2,45,750,', '3', '普热梅希尔', 'Przemysl', 'puremeixier', 'PRZ');
INSERT INTO `sp_place` VALUES ('751', '45', ',2,45,751,', '3', '普沃茨克', 'Plock', 'puwocike', 'PLO');
INSERT INTO `sp_place` VALUES ('752', '45', ',2,45,752,', '3', '切哈努夫', 'Ciechanow', 'qiehanufu', 'CIE');
INSERT INTO `sp_place` VALUES ('753', '45', ',2,45,753,', '3', '热舒夫', 'Rzeszow', 'reshufu', 'RZE');
INSERT INTO `sp_place` VALUES ('754', '45', ',2,45,754,', '3', '什切青', 'Szczecin', 'shiqieqing', 'SZZ');
INSERT INTO `sp_place` VALUES ('755', '45', ',2,45,755,', '3', '斯凯尔涅维采', 'Skierniewice', 'sikaiernieweicai', 'SKI');
INSERT INTO `sp_place` VALUES ('756', '45', ',2,45,756,', '3', '斯武普斯克', 'Slupsk', 'siwupusike', 'SLP');
INSERT INTO `sp_place` VALUES ('757', '45', ',2,45,757,', '3', '苏瓦乌基', 'Suwałki', 'suwawuji', 'SWL');
INSERT INTO `sp_place` VALUES ('758', '45', ',2,45,758,', '3', '索波特', 'Sopot', 'suobote', 'SOP');
INSERT INTO `sp_place` VALUES ('759', '45', ',2,45,759,', '3', '索斯诺维茨', 'Sosnowiec', 'suosinuoweici', 'SWC');
INSERT INTO `sp_place` VALUES ('760', '45', ',2,45,760,', '3', '塔尔努夫', 'Tarnow', 'taernufu', 'TAR');
INSERT INTO `sp_place` VALUES ('761', '45', ',2,45,761,', '3', '塔尔诺布热格', 'Tarnobrzeg', 'taernuoburege', 'QEP');
INSERT INTO `sp_place` VALUES ('762', '45', ',2,45,762,', '3', '特切', 'Tychy', 'teqie', 'TYY');
INSERT INTO `sp_place` VALUES ('763', '45', ',2,45,763,', '3', '托伦', 'Torun', 'tuolun', 'TOR');
INSERT INTO `sp_place` VALUES ('764', '45', ',2,45,764,', '3', '瓦乌布日赫', 'Walbrzych', 'wawuburihe', 'WZH');
INSERT INTO `sp_place` VALUES ('765', '45', ',2,45,765,', '3', '沃姆扎', 'Lomza', 'womuzha', 'QOY');
INSERT INTO `sp_place` VALUES ('766', '45', ',2,45,766,', '3', '希米亚诺维采', 'Siemianowice Sl', 'ximiyanuoweicai', 'SOW');
INSERT INTO `sp_place` VALUES ('767', '45', ',2,45,767,', '3', '希维诺乌伊希切', 'Swinoujscie', 'xiweinuowuyixiqie', 'SWI');
INSERT INTO `sp_place` VALUES ('768', '45', ',2,45,768,', '3', '希维托赫洛维采', 'Swietochłowice', 'xiweituoheluoweicai', 'SWT');
INSERT INTO `sp_place` VALUES ('769', '45', ',2,45,769,', '3', '谢德尔采', 'Siedlce', 'xiedeercai', 'SDC');
INSERT INTO `sp_place` VALUES ('770', '45', ',2,45,770,', '3', '谢拉兹', 'Sieradz', 'xielazi', 'SIR');
INSERT INTO `sp_place` VALUES ('771', '45', ',2,45,771,', '3', '新松奇', 'Nowy Sacz', 'xinsongqi', 'NOW');
INSERT INTO `sp_place` VALUES ('772', '45', ',2,45,772,', '3', '雅沃兹诺', 'Jaworzno', 'yawozinuo', 'JAW');
INSERT INTO `sp_place` VALUES ('773', '45', ',2,45,773,', '3', '耶莱尼亚古拉', 'Jelenia Gora', 'yelainiyagula', 'JEG');
INSERT INTO `sp_place` VALUES ('774', '45', ',2,45,774,', '3', '扎布热', 'Zabrze', 'zhabure', 'ZAB');
INSERT INTO `sp_place` VALUES ('775', '45', ',2,45,775,', '3', '扎莫希奇', 'Zamosc', 'zhamoxiqi', 'ZAM');
INSERT INTO `sp_place` VALUES ('776', '46', ',5,46,776,', '3', '奥尔托', 'El Alto', 'aoertuo', 'ALT');
INSERT INTO `sp_place` VALUES ('777', '46', ',5,46,777,', '3', '奥鲁罗', 'Oruro', 'aoluluo', 'ORU');
INSERT INTO `sp_place` VALUES ('778', '46', ',5,46,778,', '3', '贝尼', 'El Beni', 'beini', 'BEN');
INSERT INTO `sp_place` VALUES ('779', '46', ',5,46,779,', '3', '波多西', 'Potosi', 'boduoxi', 'POI');
INSERT INTO `sp_place` VALUES ('780', '46', ',5,46,780,', '3', '基拉科洛', 'Quillacollo', 'jilakeluo', 'QUI');
INSERT INTO `sp_place` VALUES ('781', '46', ',5,46,781,', '3', '科恰班巴', 'Cochabamba', 'keqiabanba', 'CBB');
INSERT INTO `sp_place` VALUES ('782', '46', ',5,46,782,', '3', '拉巴斯', 'La Paz', 'labasi', 'LPB');
INSERT INTO `sp_place` VALUES ('783', '46', ',5,46,783,', '3', '潘多', 'Pando', 'panduo', 'PAN');
INSERT INTO `sp_place` VALUES ('784', '46', ',5,46,784,', '3', '丘基萨卡', 'Chuquisaca', 'qiujisaka', 'CHU');
INSERT INTO `sp_place` VALUES ('785', '46', ',5,46,785,', '3', '萨卡巴', 'Sacaba', 'sakaba', 'SAC');
INSERT INTO `sp_place` VALUES ('786', '46', ',5,46,786,', '3', '圣克鲁斯', 'Santa Cruz', 'shengkelusi', 'SRZ');
INSERT INTO `sp_place` VALUES ('787', '46', ',5,46,787,', '3', '塔里哈', 'Tarija', 'taliha', 'TJA');
INSERT INTO `sp_place` VALUES ('788', '47', ',2,47,788,', '3', '波萨维纳', 'Posavski', 'bosaweina', 'FPO');
INSERT INTO `sp_place` VALUES ('789', '47', ',2,47,789,', '3', '波斯尼亚－波德里涅', 'Bosansko-Podrinjski', 'bosiniyabodelinie', 'FBP');
INSERT INTO `sp_place` VALUES ('790', '47', ',2,47,790,', '3', '多米斯拉夫格勒', 'Tomislavgrad', 'duomisilafugele', 'FTO');
INSERT INTO `sp_place` VALUES ('791', '47', ',2,47,791,', '3', '黑塞哥维那－涅雷特瓦', 'Hercegovacko-Neretvanski', 'heisaigeweinanieleitewa', 'FHN');
INSERT INTO `sp_place` VALUES ('792', '47', ',2,47,792,', '3', '萨拉热窝', 'Sarajevo', 'salarewo', 'FSA');
INSERT INTO `sp_place` VALUES ('793', '47', ',2,47,793,', '3', '图兹拉－波德里涅', 'Tuzlanski-Podrinjski', 'tuzilabodelinie', 'FTU');
INSERT INTO `sp_place` VALUES ('794', '47', ',2,47,794,', '3', '乌纳－萨纳', 'Unsko-Sanski', 'wunasana', 'FUS');
INSERT INTO `sp_place` VALUES ('795', '47', ',2,47,795,', '3', '西波斯尼亚', 'Hercegovacko-Bosanski', 'xibosiniya', 'FHB');
INSERT INTO `sp_place` VALUES ('796', '47', ',2,47,796,', '3', '西黑塞哥维那', 'Zapadno-Hercegovaki', 'xiheisaigeweina', 'FZH');
INSERT INTO `sp_place` VALUES ('797', '47', ',2,47,797,', '3', '泽尼察－多博伊', 'Zenicko-Dobojski', 'zenichaduoboyi', 'FZE');
INSERT INTO `sp_place` VALUES ('798', '47', ',2,47,798,', '3', '中波斯尼亚', 'Srednjo-Bosanski', 'zhongbosiniya', 'FSB');
INSERT INTO `sp_place` VALUES ('799', '49', ',4,49,799,', '3', '伯利兹', 'Belize', 'bolizi', 'BZ');
INSERT INTO `sp_place` VALUES ('800', '49', ',4,49,800,', '3', '橘园', 'Orange Walk', 'yuan', 'OW');
INSERT INTO `sp_place` VALUES ('801', '49', ',4,49,801,', '3', '卡约', 'Cayo', 'kayue', 'CY');
INSERT INTO `sp_place` VALUES ('802', '49', ',4,49,802,', '3', '科罗萨尔', 'Corozal', 'keluosaer', 'CR');
INSERT INTO `sp_place` VALUES ('803', '49', ',4,49,803,', '3', '斯坦港', 'Stann Creek', 'sitangang', 'SC');
INSERT INTO `sp_place` VALUES ('804', '49', ',4,49,804,', '3', '托莱多', 'Toledo', 'tuolaiduo', 'TO');
INSERT INTO `sp_place` VALUES ('805', '51', ',3,51,805,', '3', '巴雷', 'Bale', 'balei', 'BAL');
INSERT INTO `sp_place` VALUES ('806', '51', ',3,51,806,', '3', '巴姆', 'Bam', 'bamu', 'BAM');
INSERT INTO `sp_place` VALUES ('807', '51', ',3,51,807,', '3', '巴瓦', 'Banwa', 'bawa', 'BAN');
INSERT INTO `sp_place` VALUES ('808', '51', ',3,51,808,', '3', '巴泽加', 'Bazega', 'bazejia', 'BAZ');
INSERT INTO `sp_place` VALUES ('809', '51', ',3,51,809,', '3', '波尼', 'Poni', 'boni', 'PON');
INSERT INTO `sp_place` VALUES ('810', '51', ',3,51,810,', '3', '布尔古', 'Boulgou', 'buergu', 'BLG');
INSERT INTO `sp_place` VALUES ('811', '51', ',3,51,811,', '3', '布尔基恩德', 'Boulkiemde', 'buerjiende', 'BOK');
INSERT INTO `sp_place` VALUES ('812', '51', ',3,51,812,', '3', '布古里巴', 'Bougouriba', 'buguliba', 'BOR');
INSERT INTO `sp_place` VALUES ('813', '51', ',3,51,813,', '3', '冈祖尔古', 'Ganzourgou', 'gangzuergu', 'GAN');
INSERT INTO `sp_place` VALUES ('814', '51', ',3,51,814,', '3', '古尔马', 'Gourma', 'guerma', 'GOU');
INSERT INTO `sp_place` VALUES ('815', '51', ',3,51,815,', '3', '济罗', 'Ziro', 'jiluo', 'ZIR');
INSERT INTO `sp_place` VALUES ('816', '51', ',3,51,816,', '3', '卡焦戈', 'Kadiogo', 'kajiaoge', 'KAD');
INSERT INTO `sp_place` VALUES ('817', '51', ',3,51,817,', '3', '凯内杜古', 'Kenedougou', 'kaineidugu', 'KEN');
INSERT INTO `sp_place` VALUES ('818', '51', ',3,51,818,', '3', '科蒙加里', 'Komondjari', 'kemengjiali', 'KOO');
INSERT INTO `sp_place` VALUES ('819', '51', ',3,51,819,', '3', '科莫埃', 'Comoe', 'kemoai', 'COM');
INSERT INTO `sp_place` VALUES ('820', '51', ',3,51,820,', '3', '孔皮恩加', 'Kompienga', 'kongpienjia', 'KOP');
INSERT INTO `sp_place` VALUES ('821', '51', ',3,51,821,', '3', '孔西', 'Kossi', 'kongxi', 'KOS');
INSERT INTO `sp_place` VALUES ('822', '51', ',3,51,822,', '3', '库尔佩罗戈', 'Koulpelogo', 'kuerpeiluoge', 'KOL');
INSERT INTO `sp_place` VALUES ('823', '51', ',3,51,823,', '3', '库尔维奥戈', 'Kourweogo', 'kuerweiaoge', 'KOW');
INSERT INTO `sp_place` VALUES ('824', '51', ',3,51,824,', '3', '库里滕加', 'Kouritenga', 'kulijia', 'KOT');
INSERT INTO `sp_place` VALUES ('825', '51', ',3,51,825,', '3', '雷拉巴', 'Leraba', 'leilaba', 'LER');
INSERT INTO `sp_place` VALUES ('826', '51', ',3,51,826,', '3', '罗卢姆', 'Loroum', 'luolumu', 'LOR');
INSERT INTO `sp_place` VALUES ('827', '51', ',3,51,827,', '3', '穆翁', 'Mouhoun', 'muweng', 'MOU');
INSERT INTO `sp_place` VALUES ('828', '51', ',3,51,828,', '3', '纳门滕加', 'Namentenga', 'namenjia', 'NAM');
INSERT INTO `sp_place` VALUES ('829', '51', ',3,51,829,', '3', '纳乌里', 'Nahouri', 'nawuli', 'NAH');
INSERT INTO `sp_place` VALUES ('830', '51', ',3,51,830,', '3', '纳亚拉', 'Nayala', 'nayala', 'NAY');
INSERT INTO `sp_place` VALUES ('831', '51', ',3,51,831,', '3', '尼亚尼亚', 'Gnagna', 'niyaniya', 'GNA');
INSERT INTO `sp_place` VALUES ('832', '51', ',3,51,832,', '3', '努姆比埃尔', 'Noumbiel', 'numubiaier', 'NOU');
INSERT INTO `sp_place` VALUES ('833', '51', ',3,51,833,', '3', '帕索雷', 'Passore', 'pasuolei', 'PAS');
INSERT INTO `sp_place` VALUES ('834', '51', ',3,51,834,', '3', '塞诺', 'Seno', 'sainuo', 'SEN');
INSERT INTO `sp_place` VALUES ('835', '51', ',3,51,835,', '3', '桑吉', 'Sanguie', 'sangji', 'SAG');
INSERT INTO `sp_place` VALUES ('836', '51', ',3,51,836,', '3', '桑马滕加', 'Sanmatenga', 'sangmajia', 'SAM');
INSERT INTO `sp_place` VALUES ('837', '51', ',3,51,837,', '3', '苏鲁', 'Sourou', 'sulu', 'SOR');
INSERT INTO `sp_place` VALUES ('838', '51', ',3,51,838,', '3', '苏姆', 'Soum', 'sumu', 'SOM');
INSERT INTO `sp_place` VALUES ('839', '51', ',3,51,839,', '3', '塔波阿', 'Tapoa', 'taboa', 'TAP');
INSERT INTO `sp_place` VALUES ('840', '51', ',3,51,840,', '3', '图伊', 'Tuy', 'tuyi', 'TUY');
INSERT INTO `sp_place` VALUES ('841', '51', ',3,51,841,', '3', '乌埃', 'Houet', 'wuai', 'HOU');
INSERT INTO `sp_place` VALUES ('842', '51', ',3,51,842,', '3', '乌布里滕加', 'Oubritenga', 'wubulijia', 'OUB');
INSERT INTO `sp_place` VALUES ('843', '51', ',3,51,843,', '3', '乌达兰', 'Oudalan', 'wudalan', 'OUD');
INSERT INTO `sp_place` VALUES ('844', '51', ',3,51,844,', '3', '锡西里', 'Sissili', 'xixili', 'SIS');
INSERT INTO `sp_place` VALUES ('845', '51', ',3,51,845,', '3', '亚加', 'Yagha', 'yajia', 'YAG');
INSERT INTO `sp_place` VALUES ('846', '51', ',3,51,846,', '3', '亚滕加', 'Yatenga', 'yajia', 'YAT');
INSERT INTO `sp_place` VALUES ('847', '51', ',3,51,847,', '3', '伊奥巴', 'Ioba', 'yiaoba', 'IOA');
INSERT INTO `sp_place` VALUES ('848', '51', ',3,51,848,', '3', '宗德韦奥戈', 'Zoundweogo', 'zongdeweiaoge', 'ZOW');
INSERT INTO `sp_place` VALUES ('849', '51', ',3,51,849,', '3', '宗多马', 'Zondoma', 'zongduoma', 'ZOD');
INSERT INTO `sp_place` VALUES ('850', '52', ',3,52,850,', '3', '布班扎', 'Bubanza', 'bubanzha', 'BB');
INSERT INTO `sp_place` VALUES ('851', '52', ',3,52,851,', '3', '布鲁里', 'Bururi', 'bululi', 'BR');
INSERT INTO `sp_place` VALUES ('852', '52', ',3,52,852,', '3', '布琼布拉城市', 'Bujumbura Mairie', 'buqiongbulachengshi', 'BM');
INSERT INTO `sp_place` VALUES ('853', '52', ',3,52,853,', '3', '布琼布拉乡村', 'Bujumbura Rural', 'buqiongbulaxiangcun', 'BU');
INSERT INTO `sp_place` VALUES ('854', '52', ',3,52,854,', '3', '恩戈齐', 'Ngozi', 'engeqi', 'NG');
INSERT INTO `sp_place` VALUES ('855', '52', ',3,52,855,', '3', '基龙多', 'Kirundo', 'jilongduo', 'KI');
INSERT INTO `sp_place` VALUES ('856', '52', ',3,52,856,', '3', '基特加', 'Gitega', 'jitejia', 'GI');
INSERT INTO `sp_place` VALUES ('857', '52', ',3,52,857,', '3', '卡鲁济', 'Karuzi', 'kaluji', 'KR');
INSERT INTO `sp_place` VALUES ('858', '52', ',3,52,858,', '3', '卡扬扎', 'Kayanza', 'kayangzha', 'KY');
INSERT INTO `sp_place` VALUES ('859', '52', ',3,52,859,', '3', '坎库佐', 'Cankuzo', 'kankuzuo', 'CA');
INSERT INTO `sp_place` VALUES ('860', '52', ',3,52,860,', '3', '鲁塔纳', 'Rutana', 'lutana', 'RT');
INSERT INTO `sp_place` VALUES ('861', '52', ',3,52,861,', '3', '鲁伊吉', 'Ruyigi', 'luyiji', 'RY');
INSERT INTO `sp_place` VALUES ('862', '52', ',3,52,862,', '3', '马坎巴', 'Makamba', 'makanba', 'MA');
INSERT INTO `sp_place` VALUES ('863', '52', ',3,52,863,', '3', '穆拉姆维亚', 'Muramvya', 'mulamuweiya', 'MU');
INSERT INTO `sp_place` VALUES ('864', '52', ',3,52,864,', '3', '穆瓦洛', 'Mwaro', 'muwaluo', 'MW');
INSERT INTO `sp_place` VALUES ('865', '52', ',3,52,865,', '3', '穆因加', 'Muyinga', 'muyinjia', 'MY');
INSERT INTO `sp_place` VALUES ('866', '52', ',3,52,866,', '3', '锡比托凯', 'Cibitoke', 'xibituokai', 'CI');
INSERT INTO `sp_place` VALUES ('867', '54', ',1,54,867,', '3', '海州', 'Haeju', 'haizhou', 'HAE');
INSERT INTO `sp_place` VALUES ('868', '54', ',1,54,868,', '3', '惠山', 'Hyesan', 'huishan', 'HYE');
INSERT INTO `sp_place` VALUES ('869', '54', ',1,54,869,', '3', '江界', 'Kanggye', 'jiangjie', 'KAN');
INSERT INTO `sp_place` VALUES ('870', '54', ',1,54,870,', '3', '开城', 'Kaesong', 'kaicheng', 'KSN');
INSERT INTO `sp_place` VALUES ('871', '54', ',1,54,871,', '3', '罗先', 'Naseon', 'luoxian', 'NAS');
INSERT INTO `sp_place` VALUES ('872', '54', ',1,54,872,', '3', '南浦', 'Namp\'o', 'nanpu', 'NAM');
INSERT INTO `sp_place` VALUES ('873', '54', ',1,54,873,', '3', '平壤', 'Pyongyang', 'pingrang', 'FNJ');
INSERT INTO `sp_place` VALUES ('874', '54', ',1,54,874,', '3', '清津', 'Ch\'ongjin', 'qingjin', 'CHO');
INSERT INTO `sp_place` VALUES ('875', '54', ',1,54,875,', '3', '沙里院', 'Sariwon', 'shaliyuan', 'SAR');
INSERT INTO `sp_place` VALUES ('876', '54', ',1,54,876,', '3', '咸兴', 'Hamhung', 'xianxing', 'HAM');
INSERT INTO `sp_place` VALUES ('877', '54', ',1,54,877,', '3', '新义州', 'Sinuiju', 'xinyizhou', 'SII');
INSERT INTO `sp_place` VALUES ('878', '54', ',1,54,878,', '3', '元山', 'Wonsan', 'yuanshan', 'WON');
INSERT INTO `sp_place` VALUES ('879', '55', ',2,55,879,', '3', '奥胡斯', 'Aarhus', 'aohusi', 'AR');
INSERT INTO `sp_place` VALUES ('880', '55', ',2,55,880,', '3', '北日德兰', 'Nordjylland', 'beiridelan', 'VSV');
INSERT INTO `sp_place` VALUES ('881', '55', ',2,55,881,', '3', '博恩霍尔姆', 'Bornholm', 'boenhuoermu', 'BO');
INSERT INTO `sp_place` VALUES ('882', '55', ',2,55,882,', '3', '菲特烈堡', 'Frederiksborg', 'feiteliebao', 'FRE');
INSERT INTO `sp_place` VALUES ('883', '55', ',2,55,883,', '3', '菲茵', 'Fyn', 'feiyin', 'FY');
INSERT INTO `sp_place` VALUES ('884', '55', ',2,55,884,', '3', '哥本哈根', 'Copenhagen', 'gebenhagen', 'CPH');
INSERT INTO `sp_place` VALUES ('885', '55', ',2,55,885,', '3', '里伯', 'Ribe', 'libo', 'RIB');
INSERT INTO `sp_place` VALUES ('886', '55', ',2,55,886,', '3', '灵克宾', 'Ringkoebing', 'lingkebin', 'RKG');
INSERT INTO `sp_place` VALUES ('887', '55', ',2,55,887,', '3', '罗斯基勒', 'Roskilde', 'luosijile', 'RKE');
INSERT INTO `sp_place` VALUES ('888', '55', ',2,55,888,', '3', '南日德兰', 'Soenderjylland', 'nanridelan', 'VBI');
INSERT INTO `sp_place` VALUES ('889', '55', ',2,55,889,', '3', '斯多斯特姆', 'Storstroem', 'siduositemu', 'ST');
INSERT INTO `sp_place` VALUES ('890', '55', ',2,55,890,', '3', '维堡', 'Viborg', 'weibao', 'VIB');
INSERT INTO `sp_place` VALUES ('891', '55', ',2,55,891,', '3', '维厄勒', 'Vejle', 'weiele', 'VEJ');
INSERT INTO `sp_place` VALUES ('892', '55', ',2,55,892,', '3', '西希兰', 'Vestsjaelland', 'xixilan', 'VS');
INSERT INTO `sp_place` VALUES ('893', '56', ',2,56,893,', '3', '阿恩斯贝格', 'Arnsberg', 'aensibeige', 'ARN');
INSERT INTO `sp_place` VALUES ('894', '56', ',2,56,894,', '3', '爱尔福特', 'Erfurt', 'aierfute', 'ERF');
INSERT INTO `sp_place` VALUES ('895', '56', ',2,56,895,', '3', '安斯巴格', 'Ansbach', 'ansibage', 'ANS');
INSERT INTO `sp_place` VALUES ('896', '56', ',2,56,896,', '3', '奥格斯堡', 'Augsburg', 'aogesibao', 'AGB');
INSERT INTO `sp_place` VALUES ('897', '56', ',2,56,897,', '3', '柏林', 'Berlin', 'bailin', 'BE');
INSERT INTO `sp_place` VALUES ('898', '56', ',2,56,898,', '3', '拜伊罗特', 'Bayreuth', 'baiyiluote', 'BYU');
INSERT INTO `sp_place` VALUES ('899', '56', ',2,56,899,', '3', '比勒费尔德', 'Bielefeld', 'bilefeierde', 'BFE');
INSERT INTO `sp_place` VALUES ('900', '56', ',2,56,900,', '3', '波茨坦', 'Potsdam', 'bocitan', 'POT');
INSERT INTO `sp_place` VALUES ('901', '56', ',2,56,901,', '3', '波鸿', 'Bochum', 'bohong', 'BOM');
INSERT INTO `sp_place` VALUES ('902', '56', ',2,56,902,', '3', '不来梅', 'Bremen', 'bulaimei', 'HB');
INSERT INTO `sp_place` VALUES ('903', '56', ',2,56,903,', '3', '不伦瑞克', 'Brunswick', 'bulunruike', 'BRW');
INSERT INTO `sp_place` VALUES ('904', '56', ',2,56,904,', '3', '达姆施塔特', 'Darmstadt', 'damushitate', 'DAR');
INSERT INTO `sp_place` VALUES ('905', '56', ',2,56,905,', '3', '代特莫尔特', 'Detmold', 'daitemoerte', 'DET');
INSERT INTO `sp_place` VALUES ('906', '56', ',2,56,906,', '3', '德累斯顿', 'Dresden', 'deleisidun', 'DRS');
INSERT INTO `sp_place` VALUES ('907', '56', ',2,56,907,', '3', '德绍', 'Dessau', 'deshao', 'DES');
INSERT INTO `sp_place` VALUES ('908', '56', ',2,56,908,', '3', '杜塞尔多夫', 'Dusseldorf', 'dusaierduofu', 'DUS');
INSERT INTO `sp_place` VALUES ('909', '56', ',2,56,909,', '3', '法兰克福', 'Frankfurt', 'falankefu', 'FFO');
INSERT INTO `sp_place` VALUES ('910', '56', ',2,56,910,', '3', '弗赖堡', 'Freiburg', 'fulaibao', 'FBG');
INSERT INTO `sp_place` VALUES ('911', '56', ',2,56,911,', '3', '哈雷', 'Halle', 'halei', 'HAE');
INSERT INTO `sp_place` VALUES ('912', '56', ',2,56,912,', '3', '汉堡', 'Hamburg', 'hanbao', 'HH');
INSERT INTO `sp_place` VALUES ('913', '56', ',2,56,913,', '3', '汉诺威', 'Hannover', 'hannuowei', 'HAJ');
INSERT INTO `sp_place` VALUES ('914', '56', ',2,56,914,', '3', '基尔', 'Kiel', 'jier', 'KEL');
INSERT INTO `sp_place` VALUES ('915', '56', ',2,56,915,', '3', '吉森', 'GieBen', 'jisen', 'GBN');
INSERT INTO `sp_place` VALUES ('916', '56', ',2,56,916,', '3', '卡尔斯鲁厄', 'Karlsruhe', 'kaersilue', 'KAE');
INSERT INTO `sp_place` VALUES ('917', '56', ',2,56,917,', '3', '卡塞尔', 'Kassel', 'kasaier', 'KAS');
INSERT INTO `sp_place` VALUES ('918', '56', ',2,56,918,', '3', '开姆尼斯', 'Chemnitz', 'kaimunisi', 'CHE');
INSERT INTO `sp_place` VALUES ('919', '56', ',2,56,919,', '3', '科布伦次', 'Koblenz', 'kebulunci', 'KOB');
INSERT INTO `sp_place` VALUES ('920', '56', ',2,56,920,', '3', '科隆', 'Cologne', 'kelong', 'CGN');
INSERT INTO `sp_place` VALUES ('921', '56', ',2,56,921,', '3', '莱比锡', 'Leipzig', 'laibixi', 'LEJ');
INSERT INTO `sp_place` VALUES ('922', '56', ',2,56,922,', '3', '兰茨胡特', 'Landshut', 'lancihute', 'LDH');
INSERT INTO `sp_place` VALUES ('923', '56', ',2,56,923,', '3', '吕讷堡', 'Luneburg', 'lvbao', 'LBG');
INSERT INTO `sp_place` VALUES ('924', '56', ',2,56,924,', '3', '马格德堡', 'Magdeburg', 'magedebao', 'MAG');
INSERT INTO `sp_place` VALUES ('925', '56', ',2,56,925,', '3', '曼海姆', 'Mannheim', 'manhaimu', 'MHG');
INSERT INTO `sp_place` VALUES ('926', '56', ',2,56,926,', '3', '美因兹', 'Mainz', 'meiyinzi', 'MAI');
INSERT INTO `sp_place` VALUES ('927', '56', ',2,56,927,', '3', '明斯特', 'Muenster', 'mingsite', 'MUN');
INSERT INTO `sp_place` VALUES ('928', '56', ',2,56,928,', '3', '慕尼黑', 'Munich', 'munihei', 'MUC');
INSERT INTO `sp_place` VALUES ('929', '56', ',2,56,929,', '3', '纽伦堡', 'Nuremberg', 'niulunbao', 'NUE');
INSERT INTO `sp_place` VALUES ('930', '56', ',2,56,930,', '3', '什未林', 'Schwerin', 'shiweilin', 'SWH');
INSERT INTO `sp_place` VALUES ('931', '56', ',2,56,931,', '3', '斯图加特', 'Stuttgart', 'situjiate', 'STR');
INSERT INTO `sp_place` VALUES ('932', '56', ',2,56,932,', '3', '特里尔', 'Trier', 'telier', 'TRI');
INSERT INTO `sp_place` VALUES ('933', '56', ',2,56,933,', '3', '威斯巴登', 'Wiesbaden', 'weisibadeng', 'WIB');
INSERT INTO `sp_place` VALUES ('934', '56', ',2,56,934,', '3', '维尔茨堡', 'Wuerzburg', 'weiercibao', 'WUG');
INSERT INTO `sp_place` VALUES ('935', '57', ',1,57,935,', '3', '阿伊莱乌', 'Aileu', 'ayilaiwu', 'AL');
INSERT INTO `sp_place` VALUES ('936', '57', ',1,57,936,', '3', '阿伊纳罗', 'Ainaro', 'ayinaluo', 'AN');
INSERT INTO `sp_place` VALUES ('937', '57', ',1,57,937,', '3', '埃尔梅拉', 'Ermera', 'aiermeila', 'ER');
INSERT INTO `sp_place` VALUES ('938', '57', ',1,57,938,', '3', '安贝诺', 'Ambeno', 'anbeinuo', 'AM');
INSERT INTO `sp_place` VALUES ('939', '57', ',1,57,939,', '3', '包考', 'Baucau', 'baokao', 'BA');
INSERT INTO `sp_place` VALUES ('940', '57', ',1,57,940,', '3', '博博纳罗', 'Bobonaro', 'bobonaluo', 'BO');
INSERT INTO `sp_place` VALUES ('941', '57', ',1,57,941,', '3', '帝力', 'Dili', 'dili', 'DI');
INSERT INTO `sp_place` VALUES ('942', '57', ',1,57,942,', '3', '科瓦利马', 'Kovalima', 'kewalima', 'KO');
INSERT INTO `sp_place` VALUES ('943', '57', ',1,57,943,', '3', '劳滕', 'Lautem', 'lao', 'LA');
INSERT INTO `sp_place` VALUES ('944', '57', ',1,57,944,', '3', '利基卡', 'Liquica', 'lijika', 'LI');
INSERT INTO `sp_place` VALUES ('945', '57', ',1,57,945,', '3', '马纳图托', 'Manatuto', 'manatutuo', 'MT');
INSERT INTO `sp_place` VALUES ('946', '57', ',1,57,946,', '3', '马努法伊', 'Manofahi', 'manufayi', 'MF');
INSERT INTO `sp_place` VALUES ('947', '57', ',1,57,947,', '3', '维克克', 'Viqueque', 'weikeke', 'VI');
INSERT INTO `sp_place` VALUES ('948', '58', ',3,58,948,', '3', '滨海区', 'Maritime', 'binhaiqu', 'M');
INSERT INTO `sp_place` VALUES ('949', '58', ',3,58,949,', '3', '草原区', 'Savanes', 'caoyuanqu', 'S');
INSERT INTO `sp_place` VALUES ('950', '58', ',3,58,950,', '3', '高原区', 'Plateaux', 'gaoyuanqu', 'P');
INSERT INTO `sp_place` VALUES ('951', '58', ',3,58,951,', '3', '卡拉区', 'Kara', 'kalaqu', 'K');
INSERT INTO `sp_place` VALUES ('952', '58', ',3,58,952,', '3', '中部区', 'Centre', 'zhongbuqu', 'C');
INSERT INTO `sp_place` VALUES ('953', '61', ',2,61,953,', '3', '阿巴坎', 'Abakan', 'abakan', 'ABA');
INSERT INTO `sp_place` VALUES ('954', '61', ',2,61,954,', '3', '阿尔汉格尔斯克', 'Arkhangelsk', 'aerhangeersike', 'ARK');
INSERT INTO `sp_place` VALUES ('955', '61', ',2,61,955,', '3', '阿金斯科耶', 'Aginskoye', 'ajinsikeye', 'AGI');
INSERT INTO `sp_place` VALUES ('956', '61', ',2,61,956,', '3', '阿纳德尔', 'Anadyr', 'anadeer', 'DYR');
INSERT INTO `sp_place` VALUES ('957', '61', ',2,61,957,', '3', '阿斯特拉罕', 'Astrakhan', 'asitelahan', 'AST');
INSERT INTO `sp_place` VALUES ('958', '61', ',2,61,958,', '3', '埃利斯塔', 'Elista', 'ailisita', 'ESL');
INSERT INTO `sp_place` VALUES ('959', '61', ',2,61,959,', '3', '奥廖尔', 'Orel', 'aoliaoer', 'ORL');
INSERT INTO `sp_place` VALUES ('960', '61', ',2,61,960,', '3', '奥伦堡', 'Orenburg', 'aolunbao', 'ORE');
INSERT INTO `sp_place` VALUES ('961', '61', ',2,61,961,', '3', '巴尔瑙尔', 'Barnaul', 'baerer', 'BAX');
INSERT INTO `sp_place` VALUES ('962', '61', ',2,61,962,', '3', '奔萨', 'Penza', 'bensa', 'PNZ');
INSERT INTO `sp_place` VALUES ('963', '61', ',2,61,963,', '3', '彼得罗巴甫洛夫斯克', 'Petropavlovsk-Kamchatskiy', 'bideluobafuluofusike', 'PKC');
INSERT INTO `sp_place` VALUES ('964', '61', ',2,61,964,', '3', '彼得罗扎沃茨克', 'Petrozavodsk', 'bideluozhawocike', 'PES');
INSERT INTO `sp_place` VALUES ('965', '61', ',2,61,965,', '3', '彼尔姆', 'Perm', 'biermu', 'PER');
INSERT INTO `sp_place` VALUES ('966', '61', ',2,61,966,', '3', '比罗比詹', 'Birobidzan', 'biluobizhan', 'BBZ');
INSERT INTO `sp_place` VALUES ('967', '61', ',2,61,967,', '3', '别尔哥罗德', 'Belgorod', 'bieergeluode', 'BEL');
INSERT INTO `sp_place` VALUES ('968', '61', ',2,61,968,', '3', '伯力', 'Chabarovsk', 'boli', 'COK');
INSERT INTO `sp_place` VALUES ('969', '61', ',2,61,969,', '3', '布拉戈维申斯克', 'Blagoveshchensk', 'bulageweishensike', 'BQS');
INSERT INTO `sp_place` VALUES ('970', '61', ',2,61,970,', '3', '布良斯克', 'Bryansk', 'buliangsike', 'BRY');
INSERT INTO `sp_place` VALUES ('971', '61', ',2,61,971,', '3', '车里雅宾斯克', 'Chelyabinsk', 'cheliyabinsike', 'CHE');
INSERT INTO `sp_place` VALUES ('972', '61', ',2,61,972,', '3', '赤塔', 'Chita', 'chita', 'CHI');
INSERT INTO `sp_place` VALUES ('973', '61', ',2,61,973,', '3', '顿河畔罗斯托夫', 'Rostov-na-Donu', 'dunhepanluosituofu', 'ROS');
INSERT INTO `sp_place` VALUES ('974', '61', ',2,61,974,', '3', '鄂木斯克', 'Omsk', 'emusike', 'OMS');
INSERT INTO `sp_place` VALUES ('975', '61', ',2,61,975,', '3', '伏尔加格勒', 'Volgograd', 'fuerjiagele', 'VOG');
INSERT INTO `sp_place` VALUES ('976', '61', ',2,61,976,', '3', '弗拉基米尔', 'Vladimir', 'fulajimier', 'VMR');
INSERT INTO `sp_place` VALUES ('977', '61', ',2,61,977,', '3', '弗拉季高加索', 'Vladikavkaz', 'fulajigaojiasuo', 'VLA');
INSERT INTO `sp_place` VALUES ('978', '61', ',2,61,978,', '3', '戈尔诺－阿尔泰斯克', 'Gorno-Altajsk', 'geernuoaertaisike', 'GOA');
INSERT INTO `sp_place` VALUES ('979', '61', ',2,61,979,', '3', '格罗兹尼', 'Grozny', 'geluozini', 'GRV');
INSERT INTO `sp_place` VALUES ('980', '61', ',2,61,980,', '3', '海参崴', 'Vladivostok', 'haican', 'VVO');
INSERT INTO `sp_place` VALUES ('981', '61', ',2,61,981,', '3', '汉特－曼西斯克', 'Khanty-Mansiysk', 'hantemanxisike', 'KHM');
INSERT INTO `sp_place` VALUES ('982', '61', ',2,61,982,', '3', '基洛夫', 'Kirov', 'jiluofu', 'KIR');
INSERT INTO `sp_place` VALUES ('983', '61', ',2,61,983,', '3', '加里宁格勒', 'Kaliningrad', 'jialininggele', 'KGD');
INSERT INTO `sp_place` VALUES ('984', '61', ',2,61,984,', '3', '喀山', 'Kazan', 'kashan', 'KZN');
INSERT INTO `sp_place` VALUES ('985', '61', ',2,61,985,', '3', '卡卢加', 'Kaluga', 'kalujia', 'KLF');
INSERT INTO `sp_place` VALUES ('986', '61', ',2,61,986,', '3', '科斯特罗马', 'Kostroma', 'kesiteluoma', 'KOS');
INSERT INTO `sp_place` VALUES ('987', '61', ',2,61,987,', '3', '克拉斯诺达尔', 'Krasnodar', 'kelasinuodaer', 'KRR');
INSERT INTO `sp_place` VALUES ('988', '61', ',2,61,988,', '3', '克拉斯诺亚尔斯克', 'Krasnojarsk', 'kelasinuoyaersike', 'KYA');
INSERT INTO `sp_place` VALUES ('989', '61', ',2,61,989,', '3', '克麦罗沃', 'Kemerovo', 'kemailuowo', 'KEM');
INSERT INTO `sp_place` VALUES ('990', '61', ',2,61,990,', '3', '克孜勒', 'Kyzyl', 'kezile', 'KYZ');
INSERT INTO `sp_place` VALUES ('991', '61', ',2,61,991,', '3', '库德姆卡尔', 'Kudymkar', 'kudemukaer', 'KUD');
INSERT INTO `sp_place` VALUES ('992', '61', ',2,61,992,', '3', '库尔干', 'Kurgan', 'kuergan', 'KRO');
INSERT INTO `sp_place` VALUES ('993', '61', ',2,61,993,', '3', '库尔斯克', 'Kursk', 'kuersike', 'URS');
INSERT INTO `sp_place` VALUES ('994', '61', ',2,61,994,', '3', '利佩茨克', 'Lipeck', 'lipeicike', 'LIP');
INSERT INTO `sp_place` VALUES ('995', '61', ',2,61,995,', '3', '梁赞', 'Ryazan', 'liangzan', 'RYA');
INSERT INTO `sp_place` VALUES ('996', '61', ',2,61,996,', '3', '马哈奇卡拉', 'Makhachkala', 'mahaqikala', 'MCX');
INSERT INTO `sp_place` VALUES ('997', '61', ',2,61,997,', '3', '马加丹', 'Magadan', 'majiadan', 'MAG');
INSERT INTO `sp_place` VALUES ('998', '61', ',2,61,998,', '3', '马加斯', 'Magas', 'majiasi', 'IN');
INSERT INTO `sp_place` VALUES ('999', '61', ',2,61,999,', '3', '迈科普', 'Maykop', 'maikepu', 'MAY');
INSERT INTO `sp_place` VALUES ('1000', '61', ',2,61,1000,', '3', '摩尔曼斯克', 'Murmansk', 'moermansike', 'MMK');
INSERT INTO `sp_place` VALUES ('1001', '61', ',2,61,1001,', '3', '莫斯科', 'Moscow', 'mosike', 'MOW');
INSERT INTO `sp_place` VALUES ('1002', '61', ',2,61,1002,', '3', '纳尔奇克', 'Nalchik', 'naerqike', 'NAL');
INSERT INTO `sp_place` VALUES ('1003', '61', ',2,61,1003,', '3', '纳里扬马尔', 'Naryan-Mar', 'naliyangmaer', 'NNM');
INSERT INTO `sp_place` VALUES ('1004', '61', ',2,61,1004,', '3', '南萨哈林斯克', 'Juzno-Sachalinsk', 'nansahalinsike', 'JSA');
INSERT INTO `sp_place` VALUES ('1005', '61', ',2,61,1005,', '3', '诺夫哥罗德', 'Velikij Novgorod', 'nuofugeluode', 'VUS');
INSERT INTO `sp_place` VALUES ('1006', '61', ',2,61,1006,', '3', '帕拉纳', 'Palana', 'palana', 'PAL');
INSERT INTO `sp_place` VALUES ('1007', '61', ',2,61,1007,', '3', '普斯科夫', 'Pskov', 'pusikefu', 'PSK');
INSERT INTO `sp_place` VALUES ('1008', '61', ',2,61,1008,', '3', '切博克萨雷', 'Cheboksary', 'qiebokesalei', 'CSY');
INSERT INTO `sp_place` VALUES ('1009', '61', ',2,61,1009,', '3', '切尔克斯克', 'Cherkessk', 'qieerkesike', 'CKS');
INSERT INTO `sp_place` VALUES ('1010', '61', ',2,61,1010,', '3', '秋明', 'Tyumen', 'qiuming', 'TYU');
INSERT INTO `sp_place` VALUES ('1011', '61', ',2,61,1011,', '3', '萨拉托夫', 'Saratov', 'salatuofu', 'SAR');
INSERT INTO `sp_place` VALUES ('1012', '61', ',2,61,1012,', '3', '萨兰斯克', 'Saransk', 'salansike', 'SKX');
INSERT INTO `sp_place` VALUES ('1013', '61', ',2,61,1013,', '3', '萨列哈尔德', 'Salekhard', 'saliehaerde', 'SLY');
INSERT INTO `sp_place` VALUES ('1014', '61', ',2,61,1014,', '3', '萨马拉', 'Samara', 'samala', 'SAM');
INSERT INTO `sp_place` VALUES ('1015', '61', ',2,61,1015,', '3', '瑟克特夫卡尔', 'Syktyvkar', 'seketefukaer', 'SCW');
INSERT INTO `sp_place` VALUES ('1016', '61', ',2,61,1016,', '3', '圣彼得堡', 'St. Peterburg', 'shengbidebao', 'SPE');
INSERT INTO `sp_place` VALUES ('1017', '61', ',2,61,1017,', '3', '斯摩棱斯克', 'Smolensk', 'simolengsike', 'LNX');
INSERT INTO `sp_place` VALUES ('1018', '61', ',2,61,1018,', '3', '斯塔夫罗波尔', 'Stavropol', 'sitafuluoboer', 'STA');
INSERT INTO `sp_place` VALUES ('1019', '61', ',2,61,1019,', '3', '坦波夫', 'Tambov', 'tanbofu', 'TAM');
INSERT INTO `sp_place` VALUES ('1020', '61', ',2,61,1020,', '3', '特维尔', 'Tver', 'teweier', 'TVE');
INSERT INTO `sp_place` VALUES ('1021', '61', ',2,61,1021,', '3', '图拉', 'Tula', 'tula', 'TUL');
INSERT INTO `sp_place` VALUES ('1022', '61', ',2,61,1022,', '3', '托木斯克', 'Tomsk', 'tuomusike', 'TOM');
INSERT INTO `sp_place` VALUES ('1023', '61', ',2,61,1023,', '3', '沃罗涅什', 'Voronezh', 'woluonieshi', 'VOR');
INSERT INTO `sp_place` VALUES ('1024', '61', ',2,61,1024,', '3', '沃洛格达', 'Vologda', 'woluogeda', 'VLG');
INSERT INTO `sp_place` VALUES ('1025', '61', ',2,61,1025,', '3', '乌法', 'Ufa', 'wufa', 'UFA');
INSERT INTO `sp_place` VALUES ('1026', '61', ',2,61,1026,', '3', '乌兰乌德', 'Ulan-Ude', 'wulanwude', 'UUD');
INSERT INTO `sp_place` VALUES ('1027', '61', ',2,61,1027,', '3', '乌里扬诺夫斯克', 'Uljanovsk', 'wuliyangnuofusike', 'ULY');
INSERT INTO `sp_place` VALUES ('1028', '61', ',2,61,1028,', '3', '乌斯季奥尔登斯基', 'Ust-Ordynsky', 'wusijiaoerdengsiji', 'UOB');
INSERT INTO `sp_place` VALUES ('1029', '61', ',2,61,1029,', '3', '下诺夫哥罗德', 'Niznij Novgorod', 'xianuofugeluode', 'GOJ');
INSERT INTO `sp_place` VALUES ('1030', '61', ',2,61,1030,', '3', '新西伯利亚', 'Novosibirsk', 'xinxiboliya', 'NVS');
INSERT INTO `sp_place` VALUES ('1031', '61', ',2,61,1031,', '3', '雅库茨克', 'Jakutsk', 'yakucike', 'JAK');
INSERT INTO `sp_place` VALUES ('1032', '61', ',2,61,1032,', '3', '雅罗斯拉夫尔', 'Jaroslavl', 'yaluosilafuer', 'JAR');
INSERT INTO `sp_place` VALUES ('1033', '61', ',2,61,1033,', '3', '叶卡捷林堡', 'Jekaterinburg', 'yekajielinbao', 'JEK');
INSERT INTO `sp_place` VALUES ('1034', '61', ',2,61,1034,', '3', '伊尔库茨克', 'Irkutsk', 'yierkucike', 'IKT');
INSERT INTO `sp_place` VALUES ('1035', '61', ',2,61,1035,', '3', '伊热夫斯克', 'Izhevsk', 'yirefusike', 'IJK');
INSERT INTO `sp_place` VALUES ('1036', '61', ',2,61,1036,', '3', '伊万诺沃', 'Ivanovo', 'yiwannuowo', 'IVO');
INSERT INTO `sp_place` VALUES ('1037', '61', ',2,61,1037,', '3', '约什卡尔奥拉', 'Yoshkar-Ola', 'yueshikaeraola', 'YOL');
INSERT INTO `sp_place` VALUES ('1038', '62', ',5,62,1038,', '3', '阿苏艾', 'Azuay', 'asuai', 'A');
INSERT INTO `sp_place` VALUES ('1039', '62', ',5,62,1039,', '3', '埃尔奥罗', 'El Oro', 'aieraoluo', 'O');
INSERT INTO `sp_place` VALUES ('1040', '62', ',5,62,1040,', '3', '埃斯梅拉尔达斯', 'Esmeraldas', 'aisimeilaerdasi', 'E');
INSERT INTO `sp_place` VALUES ('1041', '62', ',5,62,1041,', '3', '玻利瓦尔', 'Bolivar', 'boliwaer', 'B');
INSERT INTO `sp_place` VALUES ('1042', '62', ',5,62,1042,', '3', '瓜亚斯', 'Guayas', 'guayasi', 'G');
INSERT INTO `sp_place` VALUES ('1043', '62', ',5,62,1043,', '3', '加拉帕戈斯', 'Galapagos', 'jialapagesi', 'W');
INSERT INTO `sp_place` VALUES ('1044', '62', ',5,62,1044,', '3', '卡尔奇', 'Carchi', 'kaerqi', 'C');
INSERT INTO `sp_place` VALUES ('1045', '62', ',5,62,1045,', '3', '卡尼亚尔', 'Canar', 'kaniyaer', 'F');
INSERT INTO `sp_place` VALUES ('1046', '62', ',5,62,1046,', '3', '科托帕希', 'Cotopaxi', 'ketuopaxi', 'X');
INSERT INTO `sp_place` VALUES ('1047', '62', ',5,62,1047,', '3', '洛哈', 'Loja', 'luoha', 'L');
INSERT INTO `sp_place` VALUES ('1048', '62', ',5,62,1048,', '3', '洛斯里奥斯', 'Los Rios', 'luosiliaosi', 'R');
INSERT INTO `sp_place` VALUES ('1049', '62', ',5,62,1049,', '3', '马纳比', 'Manabi', 'manabi', 'M');
INSERT INTO `sp_place` VALUES ('1050', '62', ',5,62,1050,', '3', '莫罗纳－圣地亚哥', 'Morona-Santiago', 'moluonashengdiyage', 'S');
INSERT INTO `sp_place` VALUES ('1051', '62', ',5,62,1051,', '3', '纳波，奥雷利亚纳', 'Napo, Orellana', 'naboaoleiliyana', 'D');
INSERT INTO `sp_place` VALUES ('1052', '62', ',5,62,1052,', '3', '帕斯塔萨', 'Pastaza', 'pasitasa', 'Y');
INSERT INTO `sp_place` VALUES ('1053', '62', ',5,62,1053,', '3', '皮钦查', 'Pichincha', 'piqincha', 'P');
INSERT INTO `sp_place` VALUES ('1054', '62', ',5,62,1054,', '3', '钦博拉索', 'Chimborazo', 'qinbolasuo', 'H');
INSERT INTO `sp_place` VALUES ('1055', '62', ',5,62,1055,', '3', '萨莫拉－钦奇佩', 'Zamora-Chinchipe', 'samolaqinqipei', 'Z');
INSERT INTO `sp_place` VALUES ('1056', '62', ',5,62,1056,', '3', '苏昆毕奥斯', 'Sucumbios', 'sukunbiaosi', 'U');
INSERT INTO `sp_place` VALUES ('1057', '62', ',5,62,1057,', '3', '通古拉瓦', 'Tungurahua', 'tonggulawa', 'T');
INSERT INTO `sp_place` VALUES ('1058', '62', ',5,62,1058,', '3', '因巴布拉', 'Imbabura', 'yinbabula', 'I');
INSERT INTO `sp_place` VALUES ('1059', '63', ',3,63,1059,', '3', '安塞巴', 'Anseba', 'ansaiba', 'KE');
INSERT INTO `sp_place` VALUES ('1060', '63', ',3,63,1060,', '3', '北红海', 'Semenawi Keyih Bahri', 'beihonghai', 'SK');
INSERT INTO `sp_place` VALUES ('1061', '63', ',3,63,1061,', '3', '加什·巴尔卡', 'Gash Barka', 'jiashi', 'BR');
INSERT INTO `sp_place` VALUES ('1062', '63', ',3,63,1062,', '3', '南部', 'Debub', 'nanbu', 'DE');
INSERT INTO `sp_place` VALUES ('1063', '63', ',3,63,1063,', '3', '南红海', 'Debubawi Keyih Bahri', 'nanhonghai', 'DK');
INSERT INTO `sp_place` VALUES ('1064', '63', ',3,63,1064,', '3', '中部', 'Maekel', 'zhongbu', 'MA');
INSERT INTO `sp_place` VALUES ('1065', '64', ',2,64,1065,', '3', '阿尔勒', 'Arles', 'aerle', 'ARL');
INSERT INTO `sp_place` VALUES ('1066', '64', ',2,64,1066,', '3', '阿雅克修', 'Ajaccio', 'ayakexiu', 'AJA');
INSERT INTO `sp_place` VALUES ('1067', '64', ',2,64,1067,', '3', '艾克斯', 'Aix-en-Provence', 'aikesi', 'QXB');
INSERT INTO `sp_place` VALUES ('1068', '64', ',2,64,1068,', '3', '奥尔良', 'Orleans', 'aoerliang', 'ORR');
INSERT INTO `sp_place` VALUES ('1069', '64', ',2,64,1069,', '3', '巴黎', 'Paris', 'bali', 'PAR');
INSERT INTO `sp_place` VALUES ('1070', '64', ',2,64,1070,', '3', '贝桑松', 'Besancon', 'beisangsong', 'BSN');
INSERT INTO `sp_place` VALUES ('1071', '64', ',2,64,1071,', '3', '第戎', 'Dijon', 'dirong', 'DIJ');
INSERT INTO `sp_place` VALUES ('1072', '64', ',2,64,1072,', '3', '弗雷瑞斯', 'Frejus', 'fuleiruisi', 'FRJ');
INSERT INTO `sp_place` VALUES ('1073', '64', ',2,64,1073,', '3', '卡昂', 'Caen', 'kaang', 'CFR');
INSERT INTO `sp_place` VALUES ('1074', '64', ',2,64,1074,', '3', '雷恩', 'Rennes', 'leien', 'RNS');
INSERT INTO `sp_place` VALUES ('1075', '64', ',2,64,1075,', '3', '里昂', 'Lyon', 'liang', 'LIO');
INSERT INTO `sp_place` VALUES ('1076', '64', ',2,64,1076,', '3', '里尔', 'Lille', 'lier', 'LLE');
INSERT INTO `sp_place` VALUES ('1077', '64', ',2,64,1077,', '3', '利摩日', 'Limoges', 'limori', 'LIG');
INSERT INTO `sp_place` VALUES ('1078', '64', ',2,64,1078,', '3', '鲁昂', 'Rouen', 'luang', 'URO');
INSERT INTO `sp_place` VALUES ('1079', '64', ',2,64,1079,', '3', '马赛', 'Marseille', 'masai', 'MRS');
INSERT INTO `sp_place` VALUES ('1080', '64', ',2,64,1080,', '3', '梅斯', 'Metz', 'meisi', 'MZM');
INSERT INTO `sp_place` VALUES ('1081', '64', ',2,64,1081,', '3', '蒙彼利埃', 'Montpellier', 'mengbiliai', 'MPL');
INSERT INTO `sp_place` VALUES ('1082', '64', ',2,64,1082,', '3', '南特', 'Nantes', 'nante', 'NTE');
INSERT INTO `sp_place` VALUES ('1083', '64', ',2,64,1083,', '3', '尼斯', 'Nice', 'nisi', 'NCE');
INSERT INTO `sp_place` VALUES ('1084', '64', ',2,64,1084,', '3', '沙隆', 'Chalons-en-Champagne', 'shalong', 'CSM');
INSERT INTO `sp_place` VALUES ('1085', '64', ',2,64,1085,', '3', '图卢兹', 'Toulouse', 'tuluzi', 'TLS');
INSERT INTO `sp_place` VALUES ('1086', '64', ',2,64,1086,', '3', '瓦朗斯', 'Valence', 'walangsi', 'VAA');
INSERT INTO `sp_place` VALUES ('1087', '64', ',2,64,1087,', '3', '亚眠', 'Amiens', 'yamian', 'AMI');
INSERT INTO `sp_place` VALUES ('1088', '70', ',1,70,1088,', '3', '达沃', 'Davao', 'dawo', 'DOR');
INSERT INTO `sp_place` VALUES ('1089', '70', ',1,70,1089,', '3', '卡卢坎', 'Caloocan', 'kalukan', 'CAO');
INSERT INTO `sp_place` VALUES ('1090', '70', ',1,70,1090,', '3', '马尼拉', 'Manila', 'manila', 'MNL');
INSERT INTO `sp_place` VALUES ('1091', '70', ',1,70,1091,', '3', '宿务', 'Cebu', 'suwu', 'CEB');
INSERT INTO `sp_place` VALUES ('1092', '72', ',2,72,1092,', '3', '埃斯波', 'Espoo', 'aisibo', 'ESP');
INSERT INTO `sp_place` VALUES ('1093', '72', ',2,72,1093,', '3', '奥卢', 'Oulu', 'aolu', 'OLU');
INSERT INTO `sp_place` VALUES ('1094', '72', ',2,72,1094,', '3', '波里', 'Pori', 'boli', 'POR');
INSERT INTO `sp_place` VALUES ('1095', '72', ',2,72,1095,', '3', '博尔沃', 'Porvoo', 'boerwo', 'PRV');
INSERT INTO `sp_place` VALUES ('1096', '72', ',2,72,1096,', '3', '海门林纳', 'Hameenlinna', 'haimenlinna', 'HMY');
INSERT INTO `sp_place` VALUES ('1097', '72', ',2,72,1097,', '3', '赫尔辛基', 'Helsinki', 'heerxinji', 'HEL');
INSERT INTO `sp_place` VALUES ('1098', '72', ',2,72,1098,', '3', '卡亚尼', 'Kajaani', 'kayani', 'KAJ');
INSERT INTO `sp_place` VALUES ('1099', '72', ',2,72,1099,', '3', '科科拉', 'Kokkola', 'kekela', 'KOK');
INSERT INTO `sp_place` VALUES ('1100', '72', ',2,72,1100,', '3', '科特卡', 'Kotka', 'keteka', 'KTK');
INSERT INTO `sp_place` VALUES ('1101', '72', ',2,72,1101,', '3', '库奥皮奥', 'Kuopio', 'kuaopiao', 'KUO');
INSERT INTO `sp_place` VALUES ('1102', '72', ',2,72,1102,', '3', '拉赫蒂', 'Lahti', 'lahedi', 'LHI');
INSERT INTO `sp_place` VALUES ('1103', '72', ',2,72,1103,', '3', '拉彭兰塔', 'Lappeenranta', 'lapenglanta', 'LPP');
INSERT INTO `sp_place` VALUES ('1104', '72', ',2,72,1104,', '3', '罗瓦涅米', 'Rovaniemi', 'luowaniemi', 'RVN');
INSERT INTO `sp_place` VALUES ('1105', '72', ',2,72,1105,', '3', '玛丽港', 'Mariehamn', 'maligang', 'MHQ');
INSERT INTO `sp_place` VALUES ('1106', '72', ',2,72,1106,', '3', '米凯利', 'Mikkeli', 'mikaili', 'MIK');
INSERT INTO `sp_place` VALUES ('1107', '72', ',2,72,1107,', '3', '坦佩雷', 'Tampere', 'tanpeilei', 'TMP');
INSERT INTO `sp_place` VALUES ('1108', '72', ',2,72,1108,', '3', '图尔库', 'Turku', 'tuerku', 'TKU');
INSERT INTO `sp_place` VALUES ('1109', '72', ',2,72,1109,', '3', '瓦萨', 'Vaasa', 'wasa', 'VAA');
INSERT INTO `sp_place` VALUES ('1110', '72', ',2,72,1110,', '3', '万塔', 'Vantaa', 'wanta', 'VAT');
INSERT INTO `sp_place` VALUES ('1111', '72', ',2,72,1111,', '3', '约恩苏', 'Joensuu', 'yueensu', 'JOE');
INSERT INTO `sp_place` VALUES ('1112', '73', ',3,73,1112,', '3', '保尔', 'Paul', 'baoer', 'PA');
INSERT INTO `sp_place` VALUES ('1113', '73', ',3,73,1113,', '3', '波多诺伏', 'Porto Novo', 'boduonuofu', 'PN');
INSERT INTO `sp_place` VALUES ('1114', '73', ',3,73,1114,', '3', '博阿维斯塔岛', 'Boa Vista', 'boaweisitadao', 'BV');
INSERT INTO `sp_place` VALUES ('1115', '73', ',3,73,1115,', '3', '布拉瓦岛', 'Brava', 'bulawadao', 'BR');
INSERT INTO `sp_place` VALUES ('1116', '73', ',3,73,1116,', '3', '大里贝拉', 'Ribeira Grande', 'dalibeila', 'RG');
INSERT INTO `sp_place` VALUES ('1117', '73', ',3,73,1117,', '3', '福古岛', 'Fogo', 'fugudao', 'FO');
INSERT INTO `sp_place` VALUES ('1118', '73', ',3,73,1118,', '3', '马尤岛', 'Maio', 'mayoudao', 'MA');
INSERT INTO `sp_place` VALUES ('1119', '73', ',3,73,1119,', '3', '莫斯特罗', 'Mosteiros', 'mositeluo', 'MO');
INSERT INTO `sp_place` VALUES ('1120', '73', ',3,73,1120,', '3', '普拉亚', 'Praia', 'pulaya', 'PR');
INSERT INTO `sp_place` VALUES ('1121', '73', ',3,73,1121,', '3', '萨尔岛', 'Sal', 'saerdao', 'SL');
INSERT INTO `sp_place` VALUES ('1122', '73', ',3,73,1122,', '3', '圣安唐岛', 'Santo Antao', 'shengantangdao', 'SA');
INSERT INTO `sp_place` VALUES ('1123', '73', ',3,73,1123,', '3', '圣地亚哥岛', 'Santiago', 'shengdiyagedao', 'IA');
INSERT INTO `sp_place` VALUES ('1124', '73', ',3,73,1124,', '3', '圣多明戈', 'Sao Domingos', 'shengduomingge', 'SD');
INSERT INTO `sp_place` VALUES ('1125', '73', ',3,73,1125,', '3', '圣菲利普', 'Sao Filipe', 'shengfeilipu', 'SF');
INSERT INTO `sp_place` VALUES ('1126', '73', ',3,73,1126,', '3', '圣卡塔琳娜', 'Santa Catarina', 'shengkatalinna', 'CA');
INSERT INTO `sp_place` VALUES ('1127', '73', ',3,73,1127,', '3', '圣克鲁斯', 'Santa Cruz', 'shengkelusi', 'CR');
INSERT INTO `sp_place` VALUES ('1128', '73', ',3,73,1128,', '3', '圣米戈尔', 'Sao Miguel', 'shengmigeer', 'SM');
INSERT INTO `sp_place` VALUES ('1129', '73', ',3,73,1129,', '3', '圣尼古拉岛', 'Sao Nicolau', 'shengniguladao', 'SN');
INSERT INTO `sp_place` VALUES ('1130', '73', ',3,73,1130,', '3', '圣维森特岛', 'Sao Vicente', 'shengweisentedao', 'SV');
INSERT INTO `sp_place` VALUES ('1131', '73', ',3,73,1131,', '3', '塔拉法尔', 'Tarrafal', 'talafaer', 'TA');
INSERT INTO `sp_place` VALUES ('1132', '78', ',5,78,1132,', '3', '阿劳卡', 'Arauca', 'alaoka', 'ARA');
INSERT INTO `sp_place` VALUES ('1133', '78', ',5,78,1133,', '3', '安提奥基亚', 'Antioquia', 'antiaojiya', 'ANT');
INSERT INTO `sp_place` VALUES ('1134', '78', ',5,78,1134,', '3', '北桑坦德', 'Norte de Santander', 'beisangtande', 'NDS');
INSERT INTO `sp_place` VALUES ('1135', '78', ',5,78,1135,', '3', '波哥大首都区', 'Bogota', 'bogedashouduqu', 'BDC');
INSERT INTO `sp_place` VALUES ('1136', '78', ',5,78,1136,', '3', '博利瓦尔', 'Bolivar', 'boliwaer', 'BOL');
INSERT INTO `sp_place` VALUES ('1137', '78', ',5,78,1137,', '3', '博亚卡', 'Boyaca', 'boyaka', 'BOY');
INSERT INTO `sp_place` VALUES ('1138', '78', ',5,78,1138,', '3', '大西洋', 'Atlantico', 'daxiyang', 'ATL');
INSERT INTO `sp_place` VALUES ('1139', '78', ',5,78,1139,', '3', '瓜维亚雷', 'Guaviare', 'guaweiyalei', 'GVR');
INSERT INTO `sp_place` VALUES ('1140', '78', ',5,78,1140,', '3', '瓜希拉', 'La Guajira', 'guaxila', 'GJR');
INSERT INTO `sp_place` VALUES ('1141', '78', ',5,78,1141,', '3', '瓜伊尼亚', 'Guainia', 'guayiniya', 'GNA');
INSERT INTO `sp_place` VALUES ('1142', '78', ',5,78,1142,', '3', '金迪奥', 'Quindio', 'jindiao', 'QUI');
INSERT INTO `sp_place` VALUES ('1143', '78', ',5,78,1143,', '3', '卡尔达斯', 'Caldas', 'kaerdasi', 'CAL');
INSERT INTO `sp_place` VALUES ('1144', '78', ',5,78,1144,', '3', '卡克塔', 'Caqueta', 'kaketa', 'CAQ');
INSERT INTO `sp_place` VALUES ('1145', '78', ',5,78,1145,', '3', '卡萨纳雷', 'Casanare', 'kasanalei', 'CAS');
INSERT INTO `sp_place` VALUES ('1146', '78', ',5,78,1146,', '3', '考卡', 'Cauca', 'kaoka', 'CAU');
INSERT INTO `sp_place` VALUES ('1147', '78', ',5,78,1147,', '3', '考卡山谷', 'Valle del Cauca', 'kaokashangu', 'VDC');
INSERT INTO `sp_place` VALUES ('1148', '78', ',5,78,1148,', '3', '科尔多巴', 'Cordoba', 'keerduoba', 'COR');
INSERT INTO `sp_place` VALUES ('1149', '78', ',5,78,1149,', '3', '昆迪纳马卡', 'Cundinamarca', 'kundinamaka', 'CAM');
INSERT INTO `sp_place` VALUES ('1150', '78', ',5,78,1150,', '3', '利萨拉尔达', 'Risaralda', 'lisalaerda', 'RIS');
INSERT INTO `sp_place` VALUES ('1151', '78', ',5,78,1151,', '3', '马格达雷那', 'Magdalena', 'magedaleina', 'MAG');
INSERT INTO `sp_place` VALUES ('1152', '78', ',5,78,1152,', '3', '梅塔', 'Meta', 'meita', 'MET');
INSERT INTO `sp_place` VALUES ('1153', '78', ',5,78,1153,', '3', '纳里尼奥', 'Narino', 'naliniao', 'NAR');
INSERT INTO `sp_place` VALUES ('1154', '78', ',5,78,1154,', '3', '普图马约', 'Putumayo', 'putumayue', 'PUT');
INSERT INTO `sp_place` VALUES ('1155', '78', ',5,78,1155,', '3', '乔科', 'Choco', 'qiaoke', 'CHO');
INSERT INTO `sp_place` VALUES ('1156', '78', ',5,78,1156,', '3', '塞萨尔', 'Cesar', 'saisaer', 'CES');
INSERT INTO `sp_place` VALUES ('1157', '78', ',5,78,1157,', '3', '桑坦德', 'Santander', 'sangtande', 'SAN');
INSERT INTO `sp_place` VALUES ('1158', '78', ',5,78,1158,', '3', '圣安德烈斯-普罗维登西亚', 'San Andres y Providencia', 'shengandeliesipuluoweidengxiya', 'SAP');
INSERT INTO `sp_place` VALUES ('1159', '78', ',5,78,1159,', '3', '苏克雷', 'Sucre', 'sukelei', 'SUC');
INSERT INTO `sp_place` VALUES ('1160', '78', ',5,78,1160,', '3', '托利马', 'Tolima', 'tuolima', 'TOL');
INSERT INTO `sp_place` VALUES ('1161', '78', ',5,78,1161,', '3', '维查达', 'Vichada', 'weichada', 'VIC');
INSERT INTO `sp_place` VALUES ('1162', '78', ',5,78,1162,', '3', '沃佩斯', 'Vaupes', 'wopeisi', 'VAU');
INSERT INTO `sp_place` VALUES ('1163', '78', ',5,78,1163,', '3', '乌伊拉', 'Huila', 'wuyila', 'HUI');
INSERT INTO `sp_place` VALUES ('1164', '78', ',5,78,1164,', '3', '亚马孙', 'Amazonas', 'yamasun', 'AMZ');
INSERT INTO `sp_place` VALUES ('1165', '79', ',4,79,1165,', '3', '阿拉胡埃拉', 'Alajuela', 'alahuaila', 'A');
INSERT INTO `sp_place` VALUES ('1166', '79', ',4,79,1166,', '3', '埃雷迪亚', 'Heredia', 'aileidiya', 'H');
INSERT INTO `sp_place` VALUES ('1167', '79', ',4,79,1167,', '3', '瓜纳卡斯特', 'Guanacaste', 'guanakasite', 'G');
INSERT INTO `sp_place` VALUES ('1168', '79', ',4,79,1168,', '3', '卡塔戈', 'Cartago', 'katage', 'C');
INSERT INTO `sp_place` VALUES ('1169', '79', ',4,79,1169,', '3', '利蒙', 'Limon', 'limeng', 'L');
INSERT INTO `sp_place` VALUES ('1170', '79', ',4,79,1170,', '3', '蓬塔雷纳斯', 'Puntarenas', 'pengtaleinasi', 'P');
INSERT INTO `sp_place` VALUES ('1171', '79', ',4,79,1171,', '3', '圣何塞', 'San Jose', 'shenghesai', 'SJ');
INSERT INTO `sp_place` VALUES ('1172', '83', ',4,83,1172,', '3', '奥尔金', 'Holguin', 'aoerjin', '11');
INSERT INTO `sp_place` VALUES ('1173', '83', ',4,83,1173,', '3', '比那尔德里奥', 'Pinar del Rio', 'binaerdeliao', '1');
INSERT INTO `sp_place` VALUES ('1174', '83', ',4,83,1174,', '3', '比亚克拉拉', 'Villa Clara', 'biyakelala', '5');
INSERT INTO `sp_place` VALUES ('1175', '83', ',4,83,1175,', '3', '格拉玛', 'Granma', 'gelama', '12');
INSERT INTO `sp_place` VALUES ('1176', '83', ',4,83,1176,', '3', '关塔那摩', 'Guantanamo', 'guantanamo', '14');
INSERT INTO `sp_place` VALUES ('1177', '83', ',4,83,1177,', '3', '哈瓦那', 'La Habana', 'hawana', '2');
INSERT INTO `sp_place` VALUES ('1178', '83', ',4,83,1178,', '3', '哈瓦那城', 'Ciudad de la Habana', 'hawanacheng', '3');
INSERT INTO `sp_place` VALUES ('1179', '83', ',4,83,1179,', '3', '卡马圭', 'Camaguey', 'kamagui', '9');
INSERT INTO `sp_place` VALUES ('1180', '83', ',4,83,1180,', '3', '拉斯图纳斯', 'Las Tunas', 'lasitunasi', '10');
INSERT INTO `sp_place` VALUES ('1181', '83', ',4,83,1181,', '3', '马坦萨斯', 'Matanzas', 'matansasi', '4');
INSERT INTO `sp_place` VALUES ('1182', '83', ',4,83,1182,', '3', '马亚里', 'Mayari', 'mayali', 'MAY');
INSERT INTO `sp_place` VALUES ('1183', '83', ',4,83,1183,', '3', '曼萨尼罗', 'Manzanillo', 'mansaniluo', 'MZO');
INSERT INTO `sp_place` VALUES ('1184', '83', ',4,83,1184,', '3', '青年岛特区', 'Isla de la Juventud', 'qingniandaotequ', '99');
INSERT INTO `sp_place` VALUES ('1185', '83', ',4,83,1185,', '3', '圣地亚哥', 'Santiago de Cuba', 'shengdiyage', '13');
INSERT INTO `sp_place` VALUES ('1186', '83', ',4,83,1186,', '3', '圣斯皮里图斯', 'Sancti Spiritus', 'shengsipilitusi', '7');
INSERT INTO `sp_place` VALUES ('1187', '83', ',4,83,1187,', '3', '西恩富戈斯', 'Cienfuegos', 'xienfugesi', '6');
INSERT INTO `sp_place` VALUES ('1188', '83', ',4,83,1188,', '3', '谢戈德阿维拉', 'Ciego de Avila', 'xiegedeaweila', '8');
INSERT INTO `sp_place` VALUES ('1189', '86', ',5,86,1189,', '3', '埃塞奎博群岛-西德梅拉拉', 'Essequibo Islands-West Demerara', 'aisaikuiboqundaoxidemeilala', 'EW');
INSERT INTO `sp_place` VALUES ('1190', '86', ',5,86,1190,', '3', '巴里马-瓦伊尼', 'Barima-Waini', 'balimawayini', 'BW');
INSERT INTO `sp_place` VALUES ('1191', '86', ',5,86,1191,', '3', '波默伦-苏佩纳姆', 'Pomeroon-Supenaam', 'bomolunsupeinamu', 'PM');
INSERT INTO `sp_place` VALUES ('1192', '86', ',5,86,1192,', '3', '波塔罗-锡帕鲁尼', 'Potaro-Siparuni', 'botaluoxipaluni', 'PI');
INSERT INTO `sp_place` VALUES ('1193', '86', ',5,86,1193,', '3', '德梅拉拉-马海卡', 'Demerara-Mahaica', 'demeilalamahaika', 'DM');
INSERT INTO `sp_place` VALUES ('1194', '86', ',5,86,1194,', '3', '东伯比斯-科兰太因', 'East Berbice-Corentyne', 'dongbobisikelantaiyin', 'EC');
INSERT INTO `sp_place` VALUES ('1195', '86', ',5,86,1195,', '3', '库尤尼-马扎鲁尼', 'Cuyuni-Mazaruni', 'kuyounimazhaluni', 'CM');
INSERT INTO `sp_place` VALUES ('1196', '86', ',5,86,1196,', '3', '马海卡-伯比斯', 'Mahaica-Berbice', 'mahaikabobisi', 'MB');
INSERT INTO `sp_place` VALUES ('1197', '86', ',5,86,1197,', '3', '上德梅拉拉-伯比斯', 'Upper Demerara-Berbice', 'shangdemeilalabobisi', 'UD');
INSERT INTO `sp_place` VALUES ('1198', '86', ',5,86,1198,', '3', '上塔库图-上埃塞奎博', 'Upper Takutu-Upper Essequibo', 'shangtakutushangaisaikuibo', 'UT');
INSERT INTO `sp_place` VALUES ('1199', '87', ',1,87,1199,', '3', '阿尔卡累克', 'Arkalyk', 'aerkaleike', 'AYK');
INSERT INTO `sp_place` VALUES ('1200', '87', ',1,87,1200,', '3', '阿克莫拉', 'Aqmola', 'akemola', 'AKM');
INSERT INTO `sp_place` VALUES ('1201', '87', ',1,87,1201,', '3', '阿克苏', 'Aksu', 'akesu', 'AKS');
INSERT INTO `sp_place` VALUES ('1202', '87', ',1,87,1202,', '3', '阿克托别', 'Aqtobe', 'aketuobie', 'AKT');
INSERT INTO `sp_place` VALUES ('1203', '87', ',1,87,1203,', '3', '阿拉木图', 'Almaty', 'alamutu', 'ALA');
INSERT INTO `sp_place` VALUES ('1204', '87', ',1,87,1204,', '3', '阿雷斯', 'Arys', 'aleisi', 'ARY');
INSERT INTO `sp_place` VALUES ('1205', '87', ',1,87,1205,', '3', '阿斯塔纳市', 'Astana', 'asitanashi', 'AST');
INSERT INTO `sp_place` VALUES ('1206', '87', ',1,87,1206,', '3', '阿特劳', 'Atyrau', 'atelao', 'ATY');
INSERT INTO `sp_place` VALUES ('1207', '87', ',1,87,1207,', '3', '埃基巴斯图兹', 'Ekibastuz', 'aijibasituzi', 'EKB');
INSERT INTO `sp_place` VALUES ('1208', '87', ',1,87,1208,', '3', '巴尔喀什', 'Balkhash', 'baerkashi', 'BXH');
INSERT INTO `sp_place` VALUES ('1209', '87', ',1,87,1209,', '3', '巴甫洛达尔', 'Pavlodar', 'bafuluodaer', 'PAV');
INSERT INTO `sp_place` VALUES ('1210', '87', ',1,87,1210,', '3', '北哈萨克斯坦', 'Soltustik Qazaqstan', 'beihasakesitan', 'SEV');
INSERT INTO `sp_place` VALUES ('1211', '87', ',1,87,1211,', '3', '东哈萨克斯坦', 'Shyghys Qazaqstan', 'donghasakesitan', 'VOS');
INSERT INTO `sp_place` VALUES ('1212', '87', ',1,87,1212,', '3', '济良诺夫斯克', 'Zyryanovsk', 'jiliangnuofusike', 'ZYR');
INSERT INTO `sp_place` VALUES ('1213', '87', ',1,87,1213,', '3', '江布尔', 'Zhambyl', 'jiangbuer', 'DMB');
INSERT INTO `sp_place` VALUES ('1214', '87', ',1,87,1214,', '3', '杰兹卡兹甘', 'Zhezkazgan', 'jiezikazigan', 'DZH');
INSERT INTO `sp_place` VALUES ('1215', '87', ',1,87,1215,', '3', '卡拉干达', 'Qaraghandy', 'kalaganda', 'KAR');
INSERT INTO `sp_place` VALUES ('1216', '87', ',1,87,1216,', '3', '卡拉扎尔', 'Karazhal', 'kalazhaer', 'KZO');
INSERT INTO `sp_place` VALUES ('1217', '87', ',1,87,1217,', '3', '卡普恰盖', 'Kapchagay', 'kapuqiagai', 'KAP');
INSERT INTO `sp_place` VALUES ('1218', '87', ',1,87,1218,', '3', '科斯塔奈', 'Qostanay', 'kesitanai', 'KST');
INSERT INTO `sp_place` VALUES ('1219', '87', ',1,87,1219,', '3', '克孜勒奥尔达', 'Qyzylorda', 'kezileaoerda', 'KZY');
INSERT INTO `sp_place` VALUES ('1220', '87', ',1,87,1220,', '3', '肯套', 'Kentau', 'kentao', 'KEN');
INSERT INTO `sp_place` VALUES ('1221', '87', ',1,87,1221,', '3', '库尔恰托夫', 'Kurchatov', 'kuerqiatuofu', 'KUR');
INSERT INTO `sp_place` VALUES ('1222', '87', ',1,87,1222,', '3', '利萨科夫斯克', 'Lisakovsk', 'lisakefusike', 'LKK');
INSERT INTO `sp_place` VALUES ('1223', '87', ',1,87,1223,', '3', '列宁诺戈尔斯克', 'Leninogorsk', 'lieningnuogeersike', 'LEN');
INSERT INTO `sp_place` VALUES ('1224', '87', ',1,87,1224,', '3', '鲁德内', 'Rudny', 'ludenei', 'RUD');
INSERT INTO `sp_place` VALUES ('1225', '87', ',1,87,1225,', '3', '曼格斯套', 'Mangghystau', 'mangesitao', 'MAN');
INSERT INTO `sp_place` VALUES ('1226', '87', ',1,87,1226,', '3', '南哈萨克斯坦', 'Ongtustik Qazaqstan', 'nanhasakesitan', 'KGT');
INSERT INTO `sp_place` VALUES ('1227', '87', ',1,87,1227,', '3', '萨兰', 'Saran', 'salan', 'SAR');
INSERT INTO `sp_place` VALUES ('1228', '87', ',1,87,1228,', '3', '塞梅伊', 'Semey', 'saimeiyi', 'SEM');
INSERT INTO `sp_place` VALUES ('1229', '87', ',1,87,1229,', '3', '沙赫京斯克', 'Shakhtinsk', 'shahejingsike', 'SAK');
INSERT INTO `sp_place` VALUES ('1230', '87', ',1,87,1230,', '3', '斯捷普诺戈尔斯克', 'Stepnogorsk', 'sijiepunuogeersike', 'STE');
INSERT INTO `sp_place` VALUES ('1231', '87', ',1,87,1231,', '3', '铁克利', 'Tekeli', 'tiekeli', 'TEK');
INSERT INTO `sp_place` VALUES ('1232', '87', ',1,87,1232,', '3', '铁米尔套', 'Temirtau', 'tiemiertao', 'TEM');
INSERT INTO `sp_place` VALUES ('1233', '87', ',1,87,1233,', '3', '突厥斯坦', 'Turkestan', 'tusitan', 'TUR');
INSERT INTO `sp_place` VALUES ('1234', '87', ',1,87,1234,', '3', '西哈萨克斯坦', 'Batys Qazaqstan', 'xihasakesitan', 'ZAP');
INSERT INTO `sp_place` VALUES ('1235', '87', ',1,87,1235,', '3', '扎纳奥津', 'Zhanaozen', 'zhanaaojin', 'ZHA');
INSERT INTO `sp_place` VALUES ('1236', '90', ',2,90,1236,', '3', '阿尔梅勒', 'Almere', 'aermeile', 'AER');
INSERT INTO `sp_place` VALUES ('1237', '90', ',2,90,1237,', '3', '阿默斯福特', 'Amersfoort', 'amosifute', 'AME');
INSERT INTO `sp_place` VALUES ('1238', '90', ',2,90,1238,', '3', '阿姆斯特丹', 'Amsterdam', 'amusitedan', 'AMS');
INSERT INTO `sp_place` VALUES ('1239', '90', ',2,90,1239,', '3', '阿纳姆', 'Arnhem', 'anamu', 'ARN');
INSERT INTO `sp_place` VALUES ('1240', '90', ',2,90,1240,', '3', '阿珀尔多伦', 'Apeldoorn', 'aerduolun', 'APE');
INSERT INTO `sp_place` VALUES ('1241', '90', ',2,90,1241,', '3', '阿森', 'Assen', 'asen', 'ASS');
INSERT INTO `sp_place` VALUES ('1242', '90', ',2,90,1242,', '3', '埃德', 'Ede', 'aide', 'EDE');
INSERT INTO `sp_place` VALUES ('1243', '90', ',2,90,1243,', '3', '埃门', 'Emmen', 'aimen', 'EMM');
INSERT INTO `sp_place` VALUES ('1244', '90', ',2,90,1244,', '3', '埃因霍芬', 'Eindhoven', 'aiyinhuofen', 'EIN');
INSERT INTO `sp_place` VALUES ('1245', '90', ',2,90,1245,', '3', '布雷达', 'Breda', 'buleida', 'BRD');
INSERT INTO `sp_place` VALUES ('1246', '90', ',2,90,1246,', '3', '蒂尔堡', 'Tilburg', 'dierbao', 'TLB');
INSERT INTO `sp_place` VALUES ('1247', '90', ',2,90,1247,', '3', '多德雷赫特', 'Dordrecht', 'duodeleihete', 'DOR');
INSERT INTO `sp_place` VALUES ('1248', '90', ',2,90,1248,', '3', '恩斯赫德', 'Enschede', 'ensihede', 'ENS');
INSERT INTO `sp_place` VALUES ('1249', '90', ',2,90,1249,', '3', '格罗宁根', 'Groningen', 'geluoninggen', 'GRQ');
INSERT INTO `sp_place` VALUES ('1250', '90', ',2,90,1250,', '3', '哈勒姆', 'Haarlem', 'halemu', 'HRA');
INSERT INTO `sp_place` VALUES ('1251', '90', ',2,90,1251,', '3', '海牙', 'Hague', 'haiya', 'HAG');
INSERT INTO `sp_place` VALUES ('1252', '90', ',2,90,1252,', '3', '霍夫多尔普', 'Hoofddorp', 'huofuduoerpu', 'HFD');
INSERT INTO `sp_place` VALUES ('1253', '90', ',2,90,1253,', '3', '莱顿', 'Leiden', 'laidun', 'LID');
INSERT INTO `sp_place` VALUES ('1254', '90', ',2,90,1254,', '3', '莱利斯塔德', 'Lelystad', 'lailisitade', 'LEY');
INSERT INTO `sp_place` VALUES ('1255', '90', ',2,90,1255,', '3', '鹿特丹', 'Rotterdam', 'lutedan', 'RTM');
INSERT INTO `sp_place` VALUES ('1256', '90', ',2,90,1256,', '3', '吕伐登', 'Leeuwarden', 'lvfadeng', 'LWR');
INSERT INTO `sp_place` VALUES ('1257', '90', ',2,90,1257,', '3', '马斯特里赫特', 'Maastricht', 'masitelihete', 'MST');
INSERT INTO `sp_place` VALUES ('1258', '90', ',2,90,1258,', '3', '米德尔堡', 'Middelburg', 'mideerbao', 'MDL');
INSERT INTO `sp_place` VALUES ('1259', '90', ',2,90,1259,', '3', '奈梅亨', 'Nijmegen', 'naimeiheng', 'NIJ');
INSERT INTO `sp_place` VALUES ('1260', '90', ',2,90,1260,', '3', '斯海尔托亨博思', '\'s-Hertogenbosch', 'sihaiertuohengbosi', 'HTB');
INSERT INTO `sp_place` VALUES ('1261', '90', ',2,90,1261,', '3', '乌得勒支', 'Utrecht', 'wudelezhi', 'UTC');
INSERT INTO `sp_place` VALUES ('1262', '90', ',2,90,1262,', '3', '兹沃勒', 'Zwolle', 'ziwole', 'ZWO');
INSERT INTO `sp_place` VALUES ('1263', '90', ',2,90,1263,', '3', '佐特尔梅', 'Zoetermeer', 'zuoteermei', 'ZTM');
INSERT INTO `sp_place` VALUES ('1264', '93', ',4,93,1264,', '3', '阿特兰蒂达', 'Atlantida', 'atelandida', 'AT');
INSERT INTO `sp_place` VALUES ('1265', '93', ',4,93,1265,', '3', '埃尔帕拉伊索', 'El Paraiso', 'aierpalayisuo', 'PA');
INSERT INTO `sp_place` VALUES ('1266', '93', ',4,93,1266,', '3', '奥科特佩克', 'Ocotepeque', 'aoketepeike', 'OC');
INSERT INTO `sp_place` VALUES ('1267', '93', ',4,93,1267,', '3', '奥兰乔', 'Olancho', 'aolanqiao', 'OL');
INSERT INTO `sp_place` VALUES ('1268', '93', ',4,93,1268,', '3', '弗朗西斯科-莫拉桑', 'Francisco Morazan', 'fulangxisikemolasang', 'FM');
INSERT INTO `sp_place` VALUES ('1269', '93', ',4,93,1269,', '3', '格拉西亚斯-阿迪奥斯', 'Gracias a Dios', 'gelaxiyasiadiaosi', 'GD');
INSERT INTO `sp_place` VALUES ('1270', '93', ',4,93,1270,', '3', '海湾群岛', 'Islas de la Bahia', 'haiwanqundao', 'IB');
INSERT INTO `sp_place` VALUES ('1271', '93', ',4,93,1271,', '3', '科尔特斯', 'Cortes', 'keertesi', 'CR');
INSERT INTO `sp_place` VALUES ('1272', '93', ',4,93,1272,', '3', '科隆', 'Colon', 'kelong', 'CL');
INSERT INTO `sp_place` VALUES ('1273', '93', ',4,93,1273,', '3', '科马亚瓜', 'Comayagua', 'kemayagua', 'CM');
INSERT INTO `sp_place` VALUES ('1274', '93', ',4,93,1274,', '3', '科潘', 'Copan', 'kepan', 'CP');
INSERT INTO `sp_place` VALUES ('1275', '93', ',4,93,1275,', '3', '拉巴斯', 'La Paz', 'labasi', 'PZ');
INSERT INTO `sp_place` VALUES ('1276', '93', ',4,93,1276,', '3', '伦皮拉', 'Lempira', 'lunpila', 'LE');
INSERT INTO `sp_place` VALUES ('1277', '93', ',4,93,1277,', '3', '乔卢特卡', 'Choluteca', 'qiaoluteka', 'CH');
INSERT INTO `sp_place` VALUES ('1278', '93', ',4,93,1278,', '3', '乔罗马', 'Choloma', 'qiaoluoma', 'CHO');
INSERT INTO `sp_place` VALUES ('1279', '93', ',4,93,1279,', '3', '山谷', 'Valle', 'shangu', 'VA');
INSERT INTO `sp_place` VALUES ('1280', '93', ',4,93,1280,', '3', '圣巴巴拉', 'Santa Barbara', 'shengbabala', 'SB');
INSERT INTO `sp_place` VALUES ('1281', '93', ',4,93,1281,', '3', '因蒂布卡', 'Intibuca', 'yindibuka', 'IN');
INSERT INTO `sp_place` VALUES ('1282', '93', ',4,93,1282,', '3', '约罗', 'Yoro', 'yueluo', 'YO');
INSERT INTO `sp_place` VALUES ('1283', '94', ',6,94,1283,', '3', '菲尼克斯群岛', 'Phoenix Islands', 'feinikesiqundao', 'PHO');
INSERT INTO `sp_place` VALUES ('1284', '94', ',6,94,1284,', '3', '吉尔伯特群岛', 'Gilberts Islands', 'jierbotequndao', 'GIL');
INSERT INTO `sp_place` VALUES ('1285', '94', ',6,94,1285,', '3', '莱恩群岛', 'Line Islands', 'laienqundao', 'LIN');
INSERT INTO `sp_place` VALUES ('1286', '95', ',3,95,1286,', '3', '阿里萨比赫区', 'Ali Sabih', 'alisabihequ', 'S');
INSERT INTO `sp_place` VALUES ('1287', '95', ',3,95,1287,', '3', '奥博克区', 'Obock', 'aobokequ', 'O');
INSERT INTO `sp_place` VALUES ('1288', '95', ',3,95,1288,', '3', '迪基勒区', 'Dikhil', 'dijilequ', 'K');
INSERT INTO `sp_place` VALUES ('1289', '95', ',3,95,1289,', '3', '塔朱拉区', 'Tadjoura', 'tazhulaqu', 'T');
INSERT INTO `sp_place` VALUES ('1290', '96', ',1,96,1290,', '3', '奥什', 'Osh', 'aoshi', 'O');
INSERT INTO `sp_place` VALUES ('1291', '96', ',1,96,1291,', '3', '巴特肯', 'Batken', 'bateken', 'B');
INSERT INTO `sp_place` VALUES ('1292', '96', ',1,96,1292,', '3', '比什凯克市', 'Bishkek', 'bishikaikeshi', 'GB');
INSERT INTO `sp_place` VALUES ('1293', '96', ',1,96,1293,', '3', '楚河', 'Chuy', 'chuhe', 'C');
INSERT INTO `sp_place` VALUES ('1294', '96', ',1,96,1294,', '3', '贾拉拉巴德', 'Jalal-Abad', 'jialalabade', 'J');
INSERT INTO `sp_place` VALUES ('1295', '96', ',1,96,1295,', '3', '卡拉巴尔塔', 'Karabalta', 'kalabaerta', 'KBA');
INSERT INTO `sp_place` VALUES ('1296', '96', ',1,96,1296,', '3', '卡拉库尔', 'Kara-Kol', 'kalakuer', 'KKO');
INSERT INTO `sp_place` VALUES ('1297', '96', ',1,96,1297,', '3', '坎特', 'Kant', 'kante', 'KAN');
INSERT INTO `sp_place` VALUES ('1298', '96', ',1,96,1298,', '3', '科克扬加克', 'Kok-Jangak', 'kekeyangjiake', 'KJ');
INSERT INTO `sp_place` VALUES ('1299', '96', ',1,96,1299,', '3', '迈利赛', 'Mailuu-Suu', 'mailisai', 'MS');
INSERT INTO `sp_place` VALUES ('1300', '96', ',1,96,1300,', '3', '纳伦', 'Naryn', 'nalun', 'N');
INSERT INTO `sp_place` VALUES ('1301', '96', ',1,96,1301,', '3', '苏卢克图', 'Suluktu', 'suluketu', 'SU');
INSERT INTO `sp_place` VALUES ('1302', '96', ',1,96,1302,', '3', '塔拉斯', 'Talas', 'talasi', 'T');
INSERT INTO `sp_place` VALUES ('1303', '96', ',1,96,1303,', '3', '塔什库梅尔', 'Tash-Kumyr', 'tashikumeier', 'TK');
INSERT INTO `sp_place` VALUES ('1304', '96', ',1,96,1304,', '3', '乌兹根', 'Uzgen', 'wuzigen', 'UG');
INSERT INTO `sp_place` VALUES ('1305', '96', ',1,96,1305,', '3', '伊塞克湖', 'Ysyk-Kol', 'yisaikehu', 'Y');
INSERT INTO `sp_place` VALUES ('1306', '97', ',3,97,1306,', '3', '博凯', 'Boke', 'bokai', 'BOK');
INSERT INTO `sp_place` VALUES ('1307', '97', ',3,97,1307,', '3', '恩泽雷科雷', 'Nzerekore', 'enzeleikelei', 'NZR');
INSERT INTO `sp_place` VALUES ('1308', '97', ',3,97,1308,', '3', '法拉纳', 'Faranah', 'falana', 'FRN');
INSERT INTO `sp_place` VALUES ('1309', '97', ',3,97,1309,', '3', '金迪亚', 'Kindia', 'jindiya', 'KND');
INSERT INTO `sp_place` VALUES ('1310', '97', ',3,97,1310,', '3', '康康', 'Kankan', 'kangkang', 'KNK');
INSERT INTO `sp_place` VALUES ('1311', '97', ',3,97,1311,', '3', '科纳克里', 'Conakry', 'kenakeli', 'CNK');
INSERT INTO `sp_place` VALUES ('1312', '97', ',3,97,1312,', '3', '拉贝', 'Labe', 'labei', 'LAB');
INSERT INTO `sp_place` VALUES ('1313', '97', ',3,97,1313,', '3', '玛木', 'Mamou', 'mamu', 'MAM');
INSERT INTO `sp_place` VALUES ('1314', '99', ',4,99,1314,', '3', '阿伯茨福', 'Abbotsford', 'abocifu', 'ABB');
INSERT INTO `sp_place` VALUES ('1315', '99', ',4,99,1315,', '3', '埃德蒙顿', 'Edmonton', 'aidemengdun', 'EDM');
INSERT INTO `sp_place` VALUES ('1316', '99', ',4,99,1316,', '3', '奥沙瓦', 'Oshawa', 'aoshawa', 'OSH');
INSERT INTO `sp_place` VALUES ('1317', '99', ',4,99,1317,', '3', '巴里', 'Barrie', 'bali', 'BAR');
INSERT INTO `sp_place` VALUES ('1318', '99', ',4,99,1318,', '3', '布列塔尼角', 'Cape Breton', 'bulietanijiao', 'CBR');
INSERT INTO `sp_place` VALUES ('1319', '99', ',4,99,1319,', '3', '多伦多', 'Toronto', 'duolunduo', 'TOR');
INSERT INTO `sp_place` VALUES ('1320', '99', ',4,99,1320,', '3', '弗雷德里顿', 'Fredericton', 'fuleidelidun', 'FRE');
INSERT INTO `sp_place` VALUES ('1321', '99', ',4,99,1321,', '3', '圭尔夫', 'Guelph', 'guierfu', 'GLP');
INSERT INTO `sp_place` VALUES ('1322', '99', ',4,99,1322,', '3', '哈利法克斯', 'Halifax', 'halifakesi', 'HAL');
INSERT INTO `sp_place` VALUES ('1323', '99', ',4,99,1323,', '3', '哈密尔顿', 'Hamilton', 'hamierdun', 'HAM');
INSERT INTO `sp_place` VALUES ('1324', '99', ',4,99,1324,', '3', '怀特霍斯', 'Whitehorse', 'huaitehuosi', 'YXY');
INSERT INTO `sp_place` VALUES ('1325', '99', ',4,99,1325,', '3', '基劳纳', 'Kelowna', 'jilaona', 'KWL');
INSERT INTO `sp_place` VALUES ('1326', '99', ',4,99,1326,', '3', '基奇纳', 'Brampton', 'jiqina', 'BRP');
INSERT INTO `sp_place` VALUES ('1327', '99', ',4,99,1327,', '3', '金斯敦', 'Kingston', 'jinsidun', 'KGN');
INSERT INTO `sp_place` VALUES ('1328', '99', ',4,99,1328,', '3', '卡里加里', 'Calgary', 'kalijiali', 'CAL');
INSERT INTO `sp_place` VALUES ('1329', '99', ',4,99,1329,', '3', '魁北克', 'Quebec', 'kuibeike', 'QUE');
INSERT INTO `sp_place` VALUES ('1330', '99', ',4,99,1330,', '3', '里贾纳', 'Regina', 'lijiana', 'REG');
INSERT INTO `sp_place` VALUES ('1331', '99', ',4,99,1331,', '3', '伦敦', 'London', 'lundun', 'LOD');
INSERT INTO `sp_place` VALUES ('1332', '99', ',4,99,1332,', '3', '蒙特利尔', 'Montreal', 'mengtelier', 'MTR');
INSERT INTO `sp_place` VALUES ('1333', '99', ',4,99,1333,', '3', '萨德伯里', 'Sudbury', 'sadeboli', 'SUD');
INSERT INTO `sp_place` VALUES ('1334', '99', ',4,99,1334,', '3', '萨斯卡通', 'Saskatoon', 'sasikatong', 'SAK');
INSERT INTO `sp_place` VALUES ('1335', '99', ',4,99,1335,', '3', '三河城', 'Trois-Rivieres', 'sanhecheng', 'TRR');
INSERT INTO `sp_place` VALUES ('1336', '99', ',4,99,1336,', '3', '桑德贝', 'Thunder Bay', 'sangdebei', 'THU');
INSERT INTO `sp_place` VALUES ('1337', '99', ',4,99,1337,', '3', '舍布鲁克', 'Sherbrooke', 'shebuluke', 'SBE');
INSERT INTO `sp_place` VALUES ('1338', '99', ',4,99,1338,', '3', '圣卡塔琳娜', 'St. Catharines', 'shengkatalinna', 'SCA');
INSERT INTO `sp_place` VALUES ('1339', '99', ',4,99,1339,', '3', '圣约翰斯', 'Saint-John\'s', 'shengyuehansi', 'SJB');
INSERT INTO `sp_place` VALUES ('1340', '99', ',4,99,1340,', '3', '维多利亚', 'Victoria', 'weiduoliya', 'VIC');
INSERT INTO `sp_place` VALUES ('1341', '99', ',4,99,1341,', '3', '温哥华', 'Vancouver', 'wengehua', 'VAN');
INSERT INTO `sp_place` VALUES ('1342', '99', ',4,99,1342,', '3', '温尼伯', 'Winnipeg', 'wennibo', 'WNP');
INSERT INTO `sp_place` VALUES ('1343', '99', ',4,99,1343,', '3', '温莎', 'Windsor', 'wensha', 'WDR');
INSERT INTO `sp_place` VALUES ('1344', '99', ',4,99,1344,', '3', '渥太华', 'Ottawa', 'taihua', 'OTT');
INSERT INTO `sp_place` VALUES ('1345', '99', ',4,99,1345,', '3', '夏洛特敦', 'Charlottetown', 'xialuotedun', 'CHA');
INSERT INTO `sp_place` VALUES ('1346', '99', ',4,99,1346,', '3', '耶洛奈夫', 'Yellowknife', 'yeluonaifu', 'YZF');
INSERT INTO `sp_place` VALUES ('1347', '99', ',4,99,1347,', '3', '伊魁特', 'Iqaluit', 'yikuite', 'IQL');
INSERT INTO `sp_place` VALUES ('1348', '100', ',3,100,1348,', '3', '阿散蒂', 'Ashanti', 'asandi', 'AS');
INSERT INTO `sp_place` VALUES ('1349', '100', ',3,100,1349,', '3', '奥布阿西', 'Obuasi', 'aobuaxi', 'OBU');
INSERT INTO `sp_place` VALUES ('1350', '100', ',3,100,1350,', '3', '北部', 'Northern', 'beibu', 'NO');
INSERT INTO `sp_place` VALUES ('1351', '100', ',3,100,1351,', '3', '布朗阿哈福', 'Brong Ahafo', 'bulangahafu', 'BA');
INSERT INTO `sp_place` VALUES ('1352', '100', ',3,100,1352,', '3', '大阿克拉', 'Greater Accra', 'daakela', 'GA');
INSERT INTO `sp_place` VALUES ('1353', '100', ',3,100,1353,', '3', '东部', 'Eastern', 'dongbu', 'EA');
INSERT INTO `sp_place` VALUES ('1354', '100', ',3,100,1354,', '3', '上东部', 'Upper East', 'shangdongbu', 'UE');
INSERT INTO `sp_place` VALUES ('1355', '100', ',3,100,1355,', '3', '上西部', 'Upper West', 'shangxibu', 'UW');
INSERT INTO `sp_place` VALUES ('1356', '100', ',3,100,1356,', '3', '沃尔特', 'Volta', 'woerte', 'VO');
INSERT INTO `sp_place` VALUES ('1357', '100', ',3,100,1357,', '3', '西部', 'Western', 'xibu', 'WE');
INSERT INTO `sp_place` VALUES ('1358', '100', ',3,100,1358,', '3', '中部', 'Central', 'zhongbu', 'CE');
INSERT INTO `sp_place` VALUES ('1359', '101', ',3,101,1359,', '3', '奥果韦-洛洛', 'Ogooue-Lolo', 'aoguoweiluoluo', 'OL');
INSERT INTO `sp_place` VALUES ('1360', '101', ',3,101,1360,', '3', '奥果韦-伊温多', 'Ogooue-Ivindo', 'aoguoweiyiwenduo', 'OI');
INSERT INTO `sp_place` VALUES ('1361', '101', ',3,101,1361,', '3', '滨海奥果韦', 'Ogooue-Maritime', 'binhaiaoguowei', 'OM');
INSERT INTO `sp_place` VALUES ('1362', '101', ',3,101,1362,', '3', '恩古涅', 'Ngounie', 'engunie', 'NG');
INSERT INTO `sp_place` VALUES ('1363', '101', ',3,101,1363,', '3', '河口', 'Estuaire', 'hekou', 'ES');
INSERT INTO `sp_place` VALUES ('1364', '101', ',3,101,1364,', '3', '尼扬加', 'Nyanga', 'niyangjia', 'NY');
INSERT INTO `sp_place` VALUES ('1365', '101', ',3,101,1365,', '3', '上奥果韦', 'Haut-Ogooue', 'shangaoguowei', 'HO');
INSERT INTO `sp_place` VALUES ('1366', '101', ',3,101,1366,', '3', '沃勒-恩特姆', 'Woleu-Ntem', 'woleentemu', 'WN');
INSERT INTO `sp_place` VALUES ('1367', '101', ',3,101,1367,', '3', '中奥果韦', 'Moyen-Ogooue', 'zhongaoguowei', 'MO');
INSERT INTO `sp_place` VALUES ('1368', '102', ',1,102,1368,', '3', '奥多棉吉', 'Otdar Mean Chey', 'aoduomianji', 'OC');
INSERT INTO `sp_place` VALUES ('1369', '102', ',1,102,1369,', '3', '白马市', 'Krong Keb', 'baimashi', 'KB');
INSERT INTO `sp_place` VALUES ('1370', '102', ',1,102,1370,', '3', '柏威夏', 'Preah Vihear', 'baiweixia', 'PR');
INSERT INTO `sp_place` VALUES ('1371', '102', ',1,102,1371,', '3', '拜林市', 'Krong Pailin', 'bailinshi', 'PL');
INSERT INTO `sp_place` VALUES ('1372', '102', ',1,102,1372,', '3', '班迭棉吉', 'Banteay Mean Chey', 'bandiemianji', 'BM');
INSERT INTO `sp_place` VALUES ('1373', '102', ',1,102,1373,', '3', '磅清扬', 'Kampong Chhnang', 'bangqingyang', 'KZC');
INSERT INTO `sp_place` VALUES ('1374', '102', ',1,102,1374,', '3', '磅士卑', 'Kampong Spoe', 'bangshibei', 'KO');
INSERT INTO `sp_place` VALUES ('1375', '102', ',1,102,1375,', '3', '磅同', 'Kampong Thum', 'bangtong', 'KZK');
INSERT INTO `sp_place` VALUES ('1376', '102', ',1,102,1376,', '3', '磅湛', 'Kampong Cham', 'bangzhan', 'KM');
INSERT INTO `sp_place` VALUES ('1377', '102', ',1,102,1377,', '3', '波罗勉', 'Prey Veng', 'boluomian', 'PG');
INSERT INTO `sp_place` VALUES ('1378', '102', ',1,102,1378,', '3', '茶胶', 'Takev', 'chajiao', 'TK');
INSERT INTO `sp_place` VALUES ('1379', '102', ',1,102,1379,', '3', '柴桢', 'Svay Rieng', 'chai', 'SVR');
INSERT INTO `sp_place` VALUES ('1380', '102', ',1,102,1380,', '3', '干丹', 'Kandal', 'gandan', 'KL');
INSERT INTO `sp_place` VALUES ('1381', '102', ',1,102,1381,', '3', '戈公', 'Kaoh Kong', 'gegong', 'KKZ');
INSERT INTO `sp_place` VALUES ('1382', '102', ',1,102,1382,', '3', '贡布', 'Kampot', 'gongbu', 'KMT');
INSERT INTO `sp_place` VALUES ('1383', '102', ',1,102,1383,', '3', '金边市', 'Phnum Penh', 'jinbianshi', 'PNH');
INSERT INTO `sp_place` VALUES ('1384', '102', ',1,102,1384,', '3', '桔井', 'Kracheh', 'jiejing', 'KH');
INSERT INTO `sp_place` VALUES ('1385', '102', ',1,102,1385,', '3', '腊塔纳基里', 'Rotanak Kiri', 'latanajili', 'RBE');
INSERT INTO `sp_place` VALUES ('1386', '102', ',1,102,1386,', '3', '马德望', 'Bat Dambang', 'madewang', 'BA');
INSERT INTO `sp_place` VALUES ('1387', '102', ',1,102,1387,', '3', '蒙多基里', 'Mondol Kiri', 'mengduojili', 'MWV');
INSERT INTO `sp_place` VALUES ('1388', '102', ',1,102,1388,', '3', '菩萨', 'Pouthĭsat', 'pusa', 'PO');
INSERT INTO `sp_place` VALUES ('1389', '102', ',1,102,1389,', '3', '上丁', 'Stoeng Treng', 'shangding', 'TNX');
INSERT INTO `sp_place` VALUES ('1390', '102', ',1,102,1390,', '3', '西哈努克市', 'Krong Preah', 'xihanukeshi', 'KA');
INSERT INTO `sp_place` VALUES ('1391', '102', ',1,102,1391,', '3', '暹粒', 'Siem Reab', 'li', 'REP');
INSERT INTO `sp_place` VALUES ('1392', '103', ',2,103,1392,', '3', '奥洛穆茨', 'Olomoucky', 'aoluomuci', 'OL');
INSERT INTO `sp_place` VALUES ('1393', '103', ',2,103,1393,', '3', '比尔森', 'Plzensky', 'biersen', 'PL');
INSERT INTO `sp_place` VALUES ('1394', '103', ',2,103,1394,', '3', '布拉格直辖市', 'Prague', 'bulagezhixiashi', 'PR');
INSERT INTO `sp_place` VALUES ('1395', '103', ',2,103,1395,', '3', '赫拉德茨-克拉洛韦', 'Kralovehradecky', 'heladecikelaluowei', 'KR');
INSERT INTO `sp_place` VALUES ('1396', '103', ',2,103,1396,', '3', '卡罗维发利', 'Karlovarsky', 'kaluoweifali', 'KA');
INSERT INTO `sp_place` VALUES ('1397', '103', ',2,103,1397,', '3', '利贝雷克', 'Liberecky', 'libeileike', 'LI');
INSERT INTO `sp_place` VALUES ('1398', '103', ',2,103,1398,', '3', '摩拉维亚-西里西亚', 'Moravskoslezsky', 'molaweiyaxilixiya', 'MO');
INSERT INTO `sp_place` VALUES ('1399', '103', ',2,103,1399,', '3', '南摩拉维亚', 'Jihomoravsky', 'nanmolaweiya', 'JC');
INSERT INTO `sp_place` VALUES ('1400', '103', ',2,103,1400,', '3', '帕尔杜比采', 'Pardubicky', 'paerdubicai', 'PA');
INSERT INTO `sp_place` VALUES ('1401', '103', ',2,103,1401,', '3', '维索基纳', 'Vysocina', 'weisuojina', 'VY');
INSERT INTO `sp_place` VALUES ('1402', '103', ',2,103,1402,', '3', '乌斯季', 'Ustecky', 'wusiji', 'US');
INSERT INTO `sp_place` VALUES ('1403', '103', ',2,103,1403,', '3', '中捷克', 'Stredocesky', 'zhongjieke', 'ST');
INSERT INTO `sp_place` VALUES ('1404', '103', ',2,103,1404,', '3', '兹林', 'Zlinsky', 'zilin', 'ZL');
INSERT INTO `sp_place` VALUES ('1405', '104', ',3,104,1405,', '3', '北马塔贝莱兰', 'Matabeleland North', 'beimatabeilailan', 'MN');
INSERT INTO `sp_place` VALUES ('1406', '104', ',3,104,1406,', '3', '布拉瓦约', 'Bulawayo', 'bulawayue', 'BU');
INSERT INTO `sp_place` VALUES ('1407', '104', ',3,104,1407,', '3', '东马绍纳兰', 'Mashonaland East', 'dongmashaonalan', 'ME');
INSERT INTO `sp_place` VALUES ('1408', '104', ',3,104,1408,', '3', '哈拉雷', 'Harare', 'halalei', 'HA');
INSERT INTO `sp_place` VALUES ('1409', '104', ',3,104,1409,', '3', '马尼卡兰', 'Manicaland', 'manikalan', 'ML');
INSERT INTO `sp_place` VALUES ('1410', '104', ',3,104,1410,', '3', '马斯温戈', 'Masvingo', 'masiwenge', 'MV');
INSERT INTO `sp_place` VALUES ('1411', '104', ',3,104,1411,', '3', '南马塔贝莱兰', 'Matabeleland South', 'nanmatabeilailan', 'MS');
INSERT INTO `sp_place` VALUES ('1412', '104', ',3,104,1412,', '3', '西马绍纳兰', 'Mashonaland West', 'ximashaonalan', 'MW');
INSERT INTO `sp_place` VALUES ('1413', '104', ',3,104,1413,', '3', '中部', 'Midlands', 'zhongbu', 'MD');
INSERT INTO `sp_place` VALUES ('1414', '104', ',3,104,1414,', '3', '中马绍纳兰', 'Mashonaland Central', 'zhongmashaonalan', 'MC');
INSERT INTO `sp_place` VALUES ('1415', '105', ',3,105,1415,', '3', '阿达马瓦', 'Adamaoua', 'adamawa', 'ADA');
INSERT INTO `sp_place` VALUES ('1416', '105', ',3,105,1416,', '3', '北部', 'Nord', 'beibu', 'NOR');
INSERT INTO `sp_place` VALUES ('1417', '105', ',3,105,1417,', '3', '北端', 'Extreme-Nord', 'beiduan', 'EXN');
INSERT INTO `sp_place` VALUES ('1418', '105', ',3,105,1418,', '3', '滨海', 'Littoral', 'binhai', 'LIT');
INSERT INTO `sp_place` VALUES ('1419', '105', ',3,105,1419,', '3', '东部', 'Est', 'dongbu', 'EST');
INSERT INTO `sp_place` VALUES ('1420', '105', ',3,105,1420,', '3', '南部', 'Sud', 'nanbu', 'SUD');
INSERT INTO `sp_place` VALUES ('1421', '105', ',3,105,1421,', '3', '西北', 'Nord-Oueste', 'xibei', 'NOT');
INSERT INTO `sp_place` VALUES ('1422', '105', ',3,105,1422,', '3', '西部', 'Ouest', 'xibu', 'OUE');
INSERT INTO `sp_place` VALUES ('1423', '105', ',3,105,1423,', '3', '西南', 'Sud-Oueste', 'xinan', 'SOU');
INSERT INTO `sp_place` VALUES ('1424', '105', ',3,105,1424,', '3', '中央', 'Centre', 'zhongyang', 'CEN');
INSERT INTO `sp_place` VALUES ('1425', '106', ',1,106,1425,', '3', '北部', 'Madinat ach Shamal', 'beibu', 'MS');
INSERT INTO `sp_place` VALUES ('1426', '106', ',1,106,1426,', '3', '多哈', 'Ad Dawhah', 'duoha', 'DW');
INSERT INTO `sp_place` VALUES ('1427', '106', ',1,106,1427,', '3', '古韦里耶', 'Al Ghuwariyah', 'guweiliye', 'GW');
INSERT INTO `sp_place` VALUES ('1428', '106', ',1,106,1428,', '3', '豪尔', 'Al Khawr', 'haoer', 'KR');
INSERT INTO `sp_place` VALUES ('1429', '106', ',1,106,1429,', '3', '杰里扬拜特奈', 'Jariyan al Batnah', 'jieliyangbaitenai', 'JB');
INSERT INTO `sp_place` VALUES ('1430', '106', ',1,106,1430,', '3', '赖扬', 'Ar Rayyan', 'laiyang', 'RN');
INSERT INTO `sp_place` VALUES ('1431', '106', ',1,106,1431,', '3', '沃克拉', 'Al Wakrah', 'wokela', 'WK');
INSERT INTO `sp_place` VALUES ('1432', '106', ',1,106,1432,', '3', '乌姆锡拉勒', 'Umm Salal', 'wumuxilale', 'UL');
INSERT INTO `sp_place` VALUES ('1433', '106', ',1,106,1433,', '3', '朱迈利耶', 'Al Jumaliyah', 'zhumailiye', 'JM');
INSERT INTO `sp_place` VALUES ('1434', '110', ',3,110,1434,', '3', '阿涅比', 'Agnebi', 'aniebi', 'AG');
INSERT INTO `sp_place` VALUES ('1435', '110', ',3,110,1435,', '3', '巴芬', 'Bafing', 'bafen', 'BF');
INSERT INTO `sp_place` VALUES ('1436', '110', ',3,110,1436,', '3', '邦达马河谷', 'Vallee du Bandama', 'bangdamahegu', 'VB');
INSERT INTO `sp_place` VALUES ('1437', '110', ',3,110,1437,', '3', '登盖莱', 'Denguele', 'denggailai', 'DE');
INSERT INTO `sp_place` VALUES ('1438', '110', ',3,110,1438,', '3', '恩济－科莫埃', 'Nzi-Comoe', 'enjikemoai', 'NC');
INSERT INTO `sp_place` VALUES ('1439', '110', ',3,110,1439,', '3', '弗罗马格尔', 'Fromager', 'fuluomageer', 'FR');
INSERT INTO `sp_place` VALUES ('1440', '110', ',3,110,1440,', '3', '湖泊', 'Lacs', 'hubo', 'LC');
INSERT INTO `sp_place` VALUES ('1441', '110', ',3,110,1441,', '3', '马拉韦', 'Marahoue', 'malawei', 'MR');
INSERT INTO `sp_place` VALUES ('1442', '110', ',3,110,1442,', '3', '南邦达马', 'Sud-Bandama', 'nanbangdama', 'SB');
INSERT INTO `sp_place` VALUES ('1443', '110', ',3,110,1443,', '3', '南科莫埃', 'Sud-Comoe', 'nankemoai', 'SC');
INSERT INTO `sp_place` VALUES ('1444', '110', ',3,110,1444,', '3', '萨桑德拉', 'Haut-Sassandra', 'sasangdela', 'HT');
INSERT INTO `sp_place` VALUES ('1445', '110', ',3,110,1445,', '3', '萨瓦纳', 'Savanes', 'sawana', 'SV');
INSERT INTO `sp_place` VALUES ('1446', '110', ',3,110,1446,', '3', '山地', 'Montagnes', 'shandi', 'DH');
INSERT INTO `sp_place` VALUES ('1447', '110', ',3,110,1447,', '3', '沃罗杜古', 'Worodougou', 'woluodugu', 'WR');
INSERT INTO `sp_place` VALUES ('1448', '110', ',3,110,1448,', '3', '下萨桑德拉', 'Bas-Sassandra', 'xiasasangdela', 'BS');
INSERT INTO `sp_place` VALUES ('1449', '110', ',3,110,1449,', '3', '泻湖', 'Lagunes', 'xiehu', 'LG');
INSERT INTO `sp_place` VALUES ('1450', '110', ',3,110,1450,', '3', '赞赞', 'Zanzan', 'zanzan', 'ZA');
INSERT INTO `sp_place` VALUES ('1451', '110', ',3,110,1451,', '3', '中卡瓦利', 'Moyen-Cavally', 'zhongkawali', 'MV');
INSERT INTO `sp_place` VALUES ('1452', '110', ',3,110,1452,', '3', '中科莫埃', 'Moyen-Comoe', 'zhongkemoai', 'MC');
INSERT INTO `sp_place` VALUES ('1453', '112', ',2,112,1453,', '3', '奥西耶克-巴拉尼亚', 'Osjecko-Baranjska', 'aoxiyekebalaniya', '14');
INSERT INTO `sp_place` VALUES ('1454', '112', ',2,112,1454,', '3', '别洛瓦尔-比洛戈拉', 'Bjelovarsko-Bilogorska', 'bieluowaerbiluogela', '7');
INSERT INTO `sp_place` VALUES ('1455', '112', ',2,112,1455,', '3', '滨海和山区', 'Primorsko-Goranska', 'binhaiheshanqu', '8');
INSERT INTO `sp_place` VALUES ('1456', '112', ',2,112,1456,', '3', '波热加-斯拉沃尼亚', 'Pozega-Slavonia', 'borejiasilawoniya', '11');
INSERT INTO `sp_place` VALUES ('1457', '112', ',2,112,1457,', '3', '布罗德-波萨维纳', 'Brodsko-Posavska', 'buluodebosaweina', '12');
INSERT INTO `sp_place` VALUES ('1458', '112', ',2,112,1458,', '3', '杜布罗夫斯克-内雷特瓦', 'Dubrovacko-Neretvanska', 'dubuluofusikeneileitewa', '19');
INSERT INTO `sp_place` VALUES ('1459', '112', ',2,112,1459,', '3', '卡尔洛瓦茨', 'Karlovacka', 'kaerluowaci', '4');
INSERT INTO `sp_place` VALUES ('1460', '112', ',2,112,1460,', '3', '科普里夫尼察-克里热夫齐', 'Koprivnicko-Krizevacka', 'kepulifunichakelirefuqi', '6');
INSERT INTO `sp_place` VALUES ('1461', '112', ',2,112,1461,', '3', '克拉皮纳-扎戈列', 'Krapinsko-Zagorska', 'kelapinazhagelie', '2');
INSERT INTO `sp_place` VALUES ('1462', '112', ',2,112,1462,', '3', '利卡-塞尼', 'Licko-Senjska', 'likasaini', '9');
INSERT INTO `sp_place` VALUES ('1463', '112', ',2,112,1463,', '3', '梅吉穆列', 'Medimurska', 'meijimulie', '20');
INSERT INTO `sp_place` VALUES ('1464', '112', ',2,112,1464,', '3', '萨格勒布', 'Zagrebacka', 'sagelebu', '1');
INSERT INTO `sp_place` VALUES ('1465', '112', ',2,112,1465,', '3', '萨格勒布市', 'Grad Zagreb', 'sagelebushi', '21');
INSERT INTO `sp_place` VALUES ('1466', '112', ',2,112,1466,', '3', '斯普利特-达尔马提亚', 'Splitsko-Dalmatinska', 'sipulitedaermatiya', '17');
INSERT INTO `sp_place` VALUES ('1467', '112', ',2,112,1467,', '3', '瓦拉日丁', 'Varazdinska', 'walariding', '5');
INSERT INTO `sp_place` VALUES ('1468', '112', ',2,112,1468,', '3', '维罗维蒂察-波德拉维纳', 'Viroviticko-Podravska', 'weiluoweidichabodelaweina', '10');
INSERT INTO `sp_place` VALUES ('1469', '112', ',2,112,1469,', '3', '武科瓦尔-斯里耶姆', 'Vukovarsko-Srijemska', 'wukewaersiliyemu', '16');
INSERT INTO `sp_place` VALUES ('1470', '112', ',2,112,1470,', '3', '希贝尼克-克宁', 'Sibensko-Kninska', 'xibeinikekening', '15');
INSERT INTO `sp_place` VALUES ('1471', '112', ',2,112,1471,', '3', '锡萨克-莫斯拉维纳', 'Sisacko-Moslavacka', 'xisakemosilaweina', '3');
INSERT INTO `sp_place` VALUES ('1472', '112', ',2,112,1472,', '3', '伊斯特拉', 'Istarska', 'yisitela', '18');
INSERT INTO `sp_place` VALUES ('1473', '112', ',2,112,1473,', '3', '扎达尔', 'Zadarska', 'zhadaer', '13');
INSERT INTO `sp_place` VALUES ('1474', '113', ',3,113,1474,', '3', '埃尔格约-马拉奎特', 'Elgeyo-Marakwet', 'aiergeyuemalakuite', 'EMA');
INSERT INTO `sp_place` VALUES ('1475', '113', ',3,113,1475,', '3', '巴林戈', 'Baringo', 'balinge', 'BAR');
INSERT INTO `sp_place` VALUES ('1476', '113', ',3,113,1476,', '3', '邦戈马', 'Bungoma', 'banggema', 'BUN');
INSERT INTO `sp_place` VALUES ('1477', '113', ',3,113,1477,', '3', '博美特', 'Bomet', 'bomeite', 'BOM');
INSERT INTO `sp_place` VALUES ('1478', '113', ',3,113,1478,', '3', '布希亚', 'Busia', 'buxiya', 'BUS');
INSERT INTO `sp_place` VALUES ('1479', '113', ',3,113,1479,', '3', '恩布', 'Embu', 'enbu', 'EMB');
INSERT INTO `sp_place` VALUES ('1480', '113', ',3,113,1480,', '3', '霍马湾', 'Homa Bay', 'huomawan', 'HOB');
INSERT INTO `sp_place` VALUES ('1481', '113', ',3,113,1481,', '3', '基安布', 'Kiambu', 'jianbu', 'KIA');
INSERT INTO `sp_place` VALUES ('1482', '113', ',3,113,1482,', '3', '基里菲', 'Kilifi', 'jilifei', 'KIL');
INSERT INTO `sp_place` VALUES ('1483', '113', ',3,113,1483,', '3', '基里尼亚加', 'Kirinyaga', 'jiliniyajia', 'KIR');
INSERT INTO `sp_place` VALUES ('1484', '113', ',3,113,1484,', '3', '基苏木', 'Kisumu', 'jisumu', 'KIS');
INSERT INTO `sp_place` VALUES ('1485', '113', ',3,113,1485,', '3', '基图伊', 'Kitui', 'jituyi', 'KIT');
INSERT INTO `sp_place` VALUES ('1486', '113', ',3,113,1486,', '3', '基西', 'Kisii', 'jixi', 'KII');
INSERT INTO `sp_place` VALUES ('1487', '113', ',3,113,1487,', '3', '加里萨', 'Garissa', 'jialisa', 'GAS');
INSERT INTO `sp_place` VALUES ('1488', '113', ',3,113,1488,', '3', '卡卡梅加', 'Kakamega', 'kakameijia', 'KAK');
INSERT INTO `sp_place` VALUES ('1489', '113', ',3,113,1489,', '3', '卡耶亚多', 'Kajiado', 'kayeyaduo', 'KAJ');
INSERT INTO `sp_place` VALUES ('1490', '113', ',3,113,1490,', '3', '凯里乔', 'Kericho', 'kailiqiao', 'KEY');
INSERT INTO `sp_place` VALUES ('1491', '113', ',3,113,1491,', '3', '夸勒', 'Kwale', 'kuale', 'KWA');
INSERT INTO `sp_place` VALUES ('1492', '113', ',3,113,1492,', '3', '拉木', 'Lamu', 'lamu', 'LAU');
INSERT INTO `sp_place` VALUES ('1493', '113', ',3,113,1493,', '3', '莱基皮亚', 'Laikipia', 'laijipiya', 'LAI');
INSERT INTO `sp_place` VALUES ('1494', '113', ',3,113,1494,', '3', '马查科斯', 'Machakos', 'machakesi', 'MAC');
INSERT INTO `sp_place` VALUES ('1495', '113', ',3,113,1495,', '3', '马瓜尼', 'Makueni', 'maguani', 'MAK');
INSERT INTO `sp_place` VALUES ('1496', '113', ',3,113,1496,', '3', '马萨布布', 'Marsabit', 'masabubu', 'RBT');
INSERT INTO `sp_place` VALUES ('1497', '113', ',3,113,1497,', '3', '曼德拉', 'Mandera', 'mandela', 'MAN');
INSERT INTO `sp_place` VALUES ('1498', '113', ',3,113,1498,', '3', '梅鲁', 'Meru', 'meilu', 'MER');
INSERT INTO `sp_place` VALUES ('1499', '113', ',3,113,1499,', '3', '蒙巴萨', 'Mombasa', 'mengbasa', 'MOM');
INSERT INTO `sp_place` VALUES ('1500', '113', ',3,113,1500,', '3', '米戈利', 'Migori', 'migeli', 'MIG');
INSERT INTO `sp_place` VALUES ('1501', '113', ',3,113,1501,', '3', '穆兰卡', 'Muranga', 'mulanka', 'MUR');
INSERT INTO `sp_place` VALUES ('1502', '113', ',3,113,1502,', '3', '纳库鲁', 'Nakuru', 'nakulu', 'NUU');
INSERT INTO `sp_place` VALUES ('1503', '113', ',3,113,1503,', '3', '纳罗克', 'Narok', 'naluoke', 'NAR');
INSERT INTO `sp_place` VALUES ('1504', '113', ',3,113,1504,', '3', '南迪', 'Nandi', 'nandi', 'NAN');
INSERT INTO `sp_place` VALUES ('1505', '113', ',3,113,1505,', '3', '内罗毕', 'Nairobi', 'neiluobi', 'NA');
INSERT INTO `sp_place` VALUES ('1506', '113', ',3,113,1506,', '3', '尼蒂', 'Nithi', 'nidi', 'NIT');
INSERT INTO `sp_place` VALUES ('1507', '113', ',3,113,1507,', '3', '尼亚米拉', 'Nyamira', 'niyamila', 'NYM');
INSERT INTO `sp_place` VALUES ('1508', '113', ',3,113,1508,', '3', '年达鲁阿', 'Nyandarua', 'niandalua', 'NYN');
INSERT INTO `sp_place` VALUES ('1509', '113', ',3,113,1509,', '3', '涅里', 'Nyeri', 'nieli', 'NYE');
INSERT INTO `sp_place` VALUES ('1510', '113', ',3,113,1510,', '3', '桑布卢', 'Samburu', 'sangbulu', 'UAS');
INSERT INTO `sp_place` VALUES ('1511', '113', ',3,113,1511,', '3', '塔纳河', 'Tana River', 'tanahe', 'TRI');
INSERT INTO `sp_place` VALUES ('1512', '113', ',3,113,1512,', '3', '泰塔塔维塔', 'Taita-Taveta', 'taitataweita', 'TTA');
INSERT INTO `sp_place` VALUES ('1513', '113', ',3,113,1513,', '3', '特兰斯-恩佐亚', 'Trans-Nzoia', 'telansienzuoya', 'TNZ');
INSERT INTO `sp_place` VALUES ('1514', '113', ',3,113,1514,', '3', '图尔卡纳', 'Turkana', 'tuerkana', 'TUR');
INSERT INTO `sp_place` VALUES ('1515', '113', ',3,113,1515,', '3', '瓦吉尔', 'Wajir', 'wajier', 'WJR');
INSERT INTO `sp_place` VALUES ('1516', '113', ',3,113,1516,', '3', '瓦辛基苏', 'Uasin Gishu', 'waxinjisu', 'UGI');
INSERT INTO `sp_place` VALUES ('1517', '113', ',3,113,1517,', '3', '韦希加', 'Vihiga', 'weixijia', 'VIH');
INSERT INTO `sp_place` VALUES ('1518', '113', ',3,113,1518,', '3', '西波克特', 'West Pokot', 'xibokete', 'WPO');
INSERT INTO `sp_place` VALUES ('1519', '113', ',3,113,1519,', '3', '夏亚', 'Siaya', 'xiaya', 'SIA');
INSERT INTO `sp_place` VALUES ('1520', '113', ',3,113,1520,', '3', '伊希约洛', 'Isiolo', 'yixiyueluo', 'ISI');
INSERT INTO `sp_place` VALUES ('1521', '113', ',3,113,1521,', '3', '中央', 'Central', 'zhongyang', 'CE');
INSERT INTO `sp_place` VALUES ('1522', '115', ',2,115,1522,', '3', '阿卢克斯内', 'Aluksnes', 'alukesinei', 'ALU');
INSERT INTO `sp_place` VALUES ('1523', '115', ',2,115,1523,', '3', '爱兹克劳克雷', 'Aizkraukles', 'aizikelaokelei', 'AIZ');
INSERT INTO `sp_place` VALUES ('1524', '115', ',2,115,1524,', '3', '奥格雷', 'Ogres', 'aogelei', 'OGR');
INSERT INTO `sp_place` VALUES ('1525', '115', ',2,115,1525,', '3', '巴尔维', 'Balvu', 'baerwei', 'BAL');
INSERT INTO `sp_place` VALUES ('1526', '115', ',2,115,1526,', '3', '包斯卡', 'Bauskas', 'baosika', 'BAU');
INSERT INTO `sp_place` VALUES ('1527', '115', ',2,115,1527,', '3', '采西斯', 'Cesu', 'caixisi', 'CES');
INSERT INTO `sp_place` VALUES ('1528', '115', ',2,115,1528,', '3', '多贝莱', 'Dobeles', 'duobeilai', 'DOB');
INSERT INTO `sp_place` VALUES ('1529', '115', ',2,115,1529,', '3', '古尔贝内', 'Gulbenes', 'guerbeinei', 'GUL');
INSERT INTO `sp_place` VALUES ('1530', '115', ',2,115,1530,', '3', '杰卡布皮尔斯', 'Jekabpils', 'jiekabupiersi', 'JEK');
INSERT INTO `sp_place` VALUES ('1531', '115', ',2,115,1531,', '3', '克拉斯拉瓦', 'Kraslavas', 'kelasilawa', 'KRA');
INSERT INTO `sp_place` VALUES ('1532', '115', ',2,115,1532,', '3', '库尔迪加', 'Kuldigas', 'kuerdijia', 'KUL');
INSERT INTO `sp_place` VALUES ('1533', '115', ',2,115,1533,', '3', '雷泽克内', 'Rezeknes', 'leizekenei', 'RZR');
INSERT INTO `sp_place` VALUES ('1534', '115', ',2,115,1534,', '3', '里加', 'Rigas', 'lijia', 'RGA');
INSERT INTO `sp_place` VALUES ('1535', '115', ',2,115,1535,', '3', '利耶帕亚', 'Liepajas', 'liyepaya', 'LPK');
INSERT INTO `sp_place` VALUES ('1536', '115', ',2,115,1536,', '3', '林巴济', 'Limbazu', 'linbaji', 'LIM');
INSERT INTO `sp_place` VALUES ('1537', '115', ',2,115,1537,', '3', '卢扎', 'Ludzas', 'luzha', 'LUD');
INSERT INTO `sp_place` VALUES ('1538', '115', ',2,115,1538,', '3', '马多纳', 'Madonas', 'maduona', 'MAD');
INSERT INTO `sp_place` VALUES ('1539', '115', ',2,115,1539,', '3', '普雷利', 'Preilu', 'puleili', 'PRE');
INSERT INTO `sp_place` VALUES ('1540', '115', ',2,115,1540,', '3', '萨尔杜斯', 'Saldus', 'saerdusi', 'SAL');
INSERT INTO `sp_place` VALUES ('1541', '115', ',2,115,1541,', '3', '塔尔西', 'Talsu', 'taerxi', 'TAL');
INSERT INTO `sp_place` VALUES ('1542', '115', ',2,115,1542,', '3', '陶格夫皮尔斯', 'Daugavpils', 'taogefupiersi', 'DGR');
INSERT INTO `sp_place` VALUES ('1543', '115', ',2,115,1543,', '3', '图库马', 'Tukuma', 'tukuma', 'TUK');
INSERT INTO `sp_place` VALUES ('1544', '115', ',2,115,1544,', '3', '瓦尔加', 'Valkas', 'waerjia', 'VLK');
INSERT INTO `sp_place` VALUES ('1545', '115', ',2,115,1545,', '3', '瓦尔米耶拉', 'Valmieras', 'waermiyela', 'VLM');
INSERT INTO `sp_place` VALUES ('1546', '115', ',2,115,1546,', '3', '文茨皮尔斯', 'Ventspils', 'wencipiersi', 'VSL');
INSERT INTO `sp_place` VALUES ('1547', '115', ',2,115,1547,', '3', '叶尔加瓦', 'Jelgavas', 'yeerjiawa', 'JGR');
INSERT INTO `sp_place` VALUES ('1548', '116', ',3,116,1548,', '3', '伯里亚', 'Berea', 'boliya', 'D');
INSERT INTO `sp_place` VALUES ('1549', '116', ',3,116,1549,', '3', '布塔布泰', 'Butha-Buthe', 'butabutai', 'B');
INSERT INTO `sp_place` VALUES ('1550', '116', ',3,116,1550,', '3', '古廷', 'Quthing', 'guting', 'G');
INSERT INTO `sp_place` VALUES ('1551', '116', ',3,116,1551,', '3', '加查斯内克', 'Qachas Nek', 'jiachasineike', 'H');
INSERT INTO `sp_place` VALUES ('1552', '116', ',3,116,1552,', '3', '莱里贝', 'Leribe', 'lailibei', 'C');
INSERT INTO `sp_place` VALUES ('1553', '116', ',3,116,1553,', '3', '马费滕', 'Mafeteng', 'mafei', 'E');
INSERT INTO `sp_place` VALUES ('1554', '116', ',3,116,1554,', '3', '马塞卢', 'Maseru', 'masailu', 'A');
INSERT INTO `sp_place` VALUES ('1555', '116', ',3,116,1555,', '3', '莫哈莱斯胡克', 'Mohales Hoek', 'mohalaisihuke', 'F');
INSERT INTO `sp_place` VALUES ('1556', '116', ',3,116,1556,', '3', '莫霍特隆', 'Mokhotlong', 'mohuotelong', 'J');
INSERT INTO `sp_place` VALUES ('1557', '116', ',3,116,1557,', '3', '塔巴采卡', 'Thaba-Tseka', 'tabacaika', 'K');
INSERT INTO `sp_place` VALUES ('1558', '117', ',1,117,1558,', '3', '阿速坡', 'Attapu', 'asupo', 'AT');
INSERT INTO `sp_place` VALUES ('1559', '117', ',1,117,1559,', '3', '波里坎赛', 'Bolikhamxai', 'bolikansai', 'BL');
INSERT INTO `sp_place` VALUES ('1560', '117', ',1,117,1560,', '3', '博乔', 'Bokeo', 'boqiao', 'BK');
INSERT INTO `sp_place` VALUES ('1561', '117', ',1,117,1561,', '3', '川圹', 'Xiangkhoang', 'chuan', 'XI');
INSERT INTO `sp_place` VALUES ('1562', '117', ',1,117,1562,', '3', '丰沙里', 'Phongsali', 'fengshali', 'PH');
INSERT INTO `sp_place` VALUES ('1563', '117', ',1,117,1563,', '3', '甘蒙', 'Khammouan', 'ganmeng', 'KH');
INSERT INTO `sp_place` VALUES ('1564', '117', ',1,117,1564,', '3', '华潘', 'Houaphan', 'huapan', 'HO');
INSERT INTO `sp_place` VALUES ('1565', '117', ',1,117,1565,', '3', '琅勃拉邦', 'Louangphrabang', 'langbolabang', 'LP');
INSERT INTO `sp_place` VALUES ('1566', '117', ',1,117,1566,', '3', '琅南塔', 'Louang Namtha', 'langnanta', 'LM');
INSERT INTO `sp_place` VALUES ('1567', '117', ',1,117,1567,', '3', '赛宋本行政特区', 'Xaisomboun', 'saisongbenxingzhengtequ', 'XN');
INSERT INTO `sp_place` VALUES ('1568', '117', ',1,117,1568,', '3', '色贡', 'Xekong', 'segong', 'XE');
INSERT INTO `sp_place` VALUES ('1569', '117', ',1,117,1569,', '3', '沙拉湾', 'Saravan', 'shalawan', 'SL');
INSERT INTO `sp_place` VALUES ('1570', '117', ',1,117,1570,', '3', '沙湾拿吉', 'Savannakhet', 'shawannaji', 'SV');
INSERT INTO `sp_place` VALUES ('1571', '117', ',1,117,1571,', '3', '沙耶武里', 'Xaignabouri', 'shayewuli', 'XA');
INSERT INTO `sp_place` VALUES ('1572', '117', ',1,117,1572,', '3', '万象', 'Vientiane', 'wanxiang', 'VI');
INSERT INTO `sp_place` VALUES ('1573', '117', ',1,117,1573,', '3', '乌多姆赛', 'Oudomxai', 'wuduomusai', 'OU');
INSERT INTO `sp_place` VALUES ('1574', '117', ',1,117,1574,', '3', '占巴塞', 'Champasak', 'zhanbasai', 'CH');
INSERT INTO `sp_place` VALUES ('1575', '118', ',1,118,1575,', '3', '北部', 'Ash-Shamal', 'beibu', 'AS');
INSERT INTO `sp_place` VALUES ('1576', '118', ',1,118,1576,', '3', '贝卡', 'Al-Biqa', 'beika', 'BI');
INSERT INTO `sp_place` VALUES ('1577', '118', ',1,118,1577,', '3', '贝鲁特', 'Bayrut', 'beilute', 'BA');
INSERT INTO `sp_place` VALUES ('1578', '118', ',1,118,1578,', '3', '黎巴嫩山', 'Jabal Lubnan', 'libanenshan', 'JL');
INSERT INTO `sp_place` VALUES ('1579', '118', ',1,118,1579,', '3', '奈拜提耶市', 'An-Nabatiyah', 'naibaitiyeshi', 'NA');
INSERT INTO `sp_place` VALUES ('1580', '118', ',1,118,1580,', '3', '南部', 'Al-Janub', 'nanbu', 'JA');
INSERT INTO `sp_place` VALUES ('1581', '119', ',3,119,1581,', '3', '巴波卢', 'Gbarpolu', 'babolu', 'GBA');
INSERT INTO `sp_place` VALUES ('1582', '119', ',3,119,1582,', '3', '邦', 'Bong', 'bang', 'BG');
INSERT INTO `sp_place` VALUES ('1583', '119', ',3,119,1583,', '3', '博波卢', 'Bopolu', 'bobolu', 'BOP');
INSERT INTO `sp_place` VALUES ('1584', '119', ',3,119,1584,', '3', '博米', 'Bomi', 'bomi', 'BM');
INSERT INTO `sp_place` VALUES ('1585', '119', ',3,119,1585,', '3', '大巴萨', 'Grand Bassa', 'dabasa', 'GB');
INSERT INTO `sp_place` VALUES ('1586', '119', ',3,119,1586,', '3', '大吉德', 'Grand Gedeh', 'dajide', 'GG');
INSERT INTO `sp_place` VALUES ('1587', '119', ',3,119,1587,', '3', '大角山', 'Grand Cape Mount', 'dajiaoshan', 'CM');
INSERT INTO `sp_place` VALUES ('1588', '119', ',3,119,1588,', '3', '大克鲁', 'Grand Kru', 'dakelu', 'GK');
INSERT INTO `sp_place` VALUES ('1589', '119', ',3,119,1589,', '3', '菲什敦', 'Fish Town', 'feishidun', 'FT');
INSERT INTO `sp_place` VALUES ('1590', '119', ',3,119,1590,', '3', '吉河', 'River Gee', 'jihe', 'RG');
INSERT INTO `sp_place` VALUES ('1591', '119', ',3,119,1591,', '3', '里弗塞斯', 'River Cess', 'lifusaisi', 'RI');
INSERT INTO `sp_place` VALUES ('1592', '119', ',3,119,1592,', '3', '洛法', 'Lofa', 'luofa', 'LO');
INSERT INTO `sp_place` VALUES ('1593', '119', ',3,119,1593,', '3', '马吉比', 'Margibi', 'majibi', 'MG');
INSERT INTO `sp_place` VALUES ('1594', '119', ',3,119,1594,', '3', '马里兰', 'Maryland', 'malilan', 'MY');
INSERT INTO `sp_place` VALUES ('1595', '119', ',3,119,1595,', '3', '蒙特塞拉多', 'Montserrado', 'mengtesailaduo', 'MO');
INSERT INTO `sp_place` VALUES ('1596', '119', ',3,119,1596,', '3', '宁巴', 'Nimba', 'ningba', 'NI');
INSERT INTO `sp_place` VALUES ('1597', '119', ',3,119,1597,', '3', '锡诺', 'Sinoe', 'xinuo', 'SI');
INSERT INTO `sp_place` VALUES ('1598', '121', ',2,121,1598,', '3', '阿利图斯', 'Alytus', 'alitusi', 'AL');
INSERT INTO `sp_place` VALUES ('1599', '121', ',2,121,1599,', '3', '考纳斯', 'Kaunas', 'kaonasi', 'KA');
INSERT INTO `sp_place` VALUES ('1600', '121', ',2,121,1600,', '3', '克莱佩达', 'Klaipeda', 'kelaipeida', 'KL');
INSERT INTO `sp_place` VALUES ('1601', '121', ',2,121,1601,', '3', '马里扬泊列', 'Marijampole', 'maliyangbolie', 'MA');
INSERT INTO `sp_place` VALUES ('1602', '121', ',2,121,1602,', '3', '帕涅韦日斯', 'Panevezys', 'panieweirisi', 'PA');
INSERT INTO `sp_place` VALUES ('1603', '121', ',2,121,1603,', '3', '陶拉格', 'Taurages', 'taolage', 'TA');
INSERT INTO `sp_place` VALUES ('1604', '121', ',2,121,1604,', '3', '特尔希艾', 'Telsiu', 'teerxiai', 'TE');
INSERT INTO `sp_place` VALUES ('1605', '121', ',2,121,1605,', '3', '维尔纽斯', 'Vilnius', 'weierniusi', 'VI');
INSERT INTO `sp_place` VALUES ('1606', '121', ',2,121,1606,', '3', '乌田纳', 'Utenos', 'wutianna', 'UT');
INSERT INTO `sp_place` VALUES ('1607', '121', ',2,121,1607,', '3', '希奥利艾', 'Siauliai', 'xiaoliai', 'SI');
INSERT INTO `sp_place` VALUES ('1608', '121', ',2,121,1608,', '3', '亚克曼', 'Akmenes', 'yakeman', 'AKM');
INSERT INTO `sp_place` VALUES ('1609', '124', ',2,124,1609,', '3', '迪基希', 'Diekirch', 'dijixi', 'DD');
INSERT INTO `sp_place` VALUES ('1610', '124', ',2,124,1610,', '3', '格雷文马赫', 'Grevenmacher', 'geleiwenmahe', 'GG');
INSERT INTO `sp_place` VALUES ('1611', '124', ',2,124,1611,', '3', '卢森堡', 'Luxembourg', 'lusenbao', 'LL');
INSERT INTO `sp_place` VALUES ('1612', '125', ',3,125,1612,', '3', '比温巴', 'Byumba', 'biwenba', 'BY');
INSERT INTO `sp_place` VALUES ('1613', '125', ',3,125,1613,', '3', '布塔雷', 'Butare', 'butalei', 'BU');
INSERT INTO `sp_place` VALUES ('1614', '125', ',3,125,1614,', '3', '恩延扎', 'Nyanza', 'enyanzha', 'NY');
INSERT INTO `sp_place` VALUES ('1615', '125', ',3,125,1615,', '3', '基本古', 'Kibungo', 'jibengu', 'KG');
INSERT INTO `sp_place` VALUES ('1616', '125', ',3,125,1616,', '3', '基布耶', 'Kibuye', 'jibuye', 'KY');
INSERT INTO `sp_place` VALUES ('1617', '125', ',3,125,1617,', '3', '基加利-恩加利', 'Kigali-Ngali', 'jijialienjiali', 'KR');
INSERT INTO `sp_place` VALUES ('1618', '125', ',3,125,1618,', '3', '基加利市', 'Kigali-Ville', 'jijialishi', 'KV');
INSERT INTO `sp_place` VALUES ('1619', '125', ',3,125,1619,', '3', '吉孔戈罗', 'Gikongoro', 'jikonggeluo', 'GK');
INSERT INTO `sp_place` VALUES ('1620', '125', ',3,125,1620,', '3', '吉塞尼', 'Gisenyi', 'jisaini', 'GS');
INSERT INTO `sp_place` VALUES ('1621', '125', ',3,125,1621,', '3', '吉塔拉马', 'Gitarama', 'jitalama', 'GT');
INSERT INTO `sp_place` VALUES ('1622', '125', ',3,125,1622,', '3', '卡布加', 'Kabuga', 'kabujia', 'KA');
INSERT INTO `sp_place` VALUES ('1623', '125', ',3,125,1623,', '3', '卢瓦马加纳', 'Rwamagana', 'luwamajiana', 'RW');
INSERT INTO `sp_place` VALUES ('1624', '125', ',3,125,1624,', '3', '鲁汉戈', 'Ruhango', 'luhange', 'RH');
INSERT INTO `sp_place` VALUES ('1625', '125', ',3,125,1625,', '3', '鲁亨盖里', 'Ruhengeri', 'luhenggaili', 'RU');
INSERT INTO `sp_place` VALUES ('1626', '125', ',3,125,1626,', '3', '尚古古', 'Cyangugu', 'shanggugu', 'CY');
INSERT INTO `sp_place` VALUES ('1627', '125', ',3,125,1627,', '3', '乌姆塔拉', 'Umutara', 'wumutala', 'UM');
INSERT INTO `sp_place` VALUES ('1628', '126', ',2,126,1628,', '3', '阿尔巴尤利亚', 'Alba Iulia', 'aerbayouliya', 'AL');
INSERT INTO `sp_place` VALUES ('1629', '126', ',2,126,1629,', '3', '阿拉德', 'Arad', 'alade', 'AR');
INSERT INTO `sp_place` VALUES ('1630', '126', ',2,126,1630,', '3', '奥拉迪亚', 'Oradea', 'aoladiya', 'OR');
INSERT INTO `sp_place` VALUES ('1631', '126', ',2,126,1631,', '3', '巴克乌', 'Bacau', 'bakewu', 'BA');
INSERT INTO `sp_place` VALUES ('1632', '126', ',2,126,1632,', '3', '巴亚马雷', 'Baia Mare', 'bayamalei', 'BM');
INSERT INTO `sp_place` VALUES ('1633', '126', ',2,126,1633,', '3', '比斯特里察', 'Bistrita', 'bisitelicha', 'BN');
INSERT INTO `sp_place` VALUES ('1634', '126', ',2,126,1634,', '3', '博托沙尼', 'Botosani', 'botuoshani', 'BO');
INSERT INTO `sp_place` VALUES ('1635', '126', ',2,126,1635,', '3', '布加勒斯特', 'Bucuresti', 'bujialesite', 'BC');
INSERT INTO `sp_place` VALUES ('1636', '126', ',2,126,1636,', '3', '布拉索夫', 'Brasov', 'bulasuofu', 'BS');
INSERT INTO `sp_place` VALUES ('1637', '126', ',2,126,1637,', '3', '布勒伊拉', 'Braila', 'buleyila', 'BL');
INSERT INTO `sp_place` VALUES ('1638', '126', ',2,126,1638,', '3', '布泽乌', 'Buzau', 'buzewu', 'BZ');
INSERT INTO `sp_place` VALUES ('1639', '126', ',2,126,1639,', '3', '德罗贝塔-塞维林堡', 'Drobeta-Turnu Severin', 'deluobeitasaiweilinbao', 'DT');
INSERT INTO `sp_place` VALUES ('1640', '126', ',2,126,1640,', '3', '德瓦', 'Deva', 'dewa', 'DE');
INSERT INTO `sp_place` VALUES ('1641', '126', ',2,126,1641,', '3', '蒂米什瓦拉', 'Timisoara', 'dimishiwala', 'TI');
INSERT INTO `sp_place` VALUES ('1642', '126', ',2,126,1642,', '3', '福克沙尼', 'Focsani', 'fukeshani', 'FO');
INSERT INTO `sp_place` VALUES ('1643', '126', ',2,126,1643,', '3', '加拉茨', 'Galati', 'jialaci', 'GL');
INSERT INTO `sp_place` VALUES ('1644', '126', ',2,126,1644,', '3', '久尔久', 'Giurgiu', 'jiuerjiu', 'GG');
INSERT INTO `sp_place` VALUES ('1645', '126', ',2,126,1645,', '3', '康斯坦察', 'Constanta', 'kangsitancha', 'CT');
INSERT INTO `sp_place` VALUES ('1646', '126', ',2,126,1646,', '3', '克拉约瓦', 'Craiova', 'kelayuewa', 'DO');
INSERT INTO `sp_place` VALUES ('1647', '126', ',2,126,1647,', '3', '克勒拉希', 'Calarasi', 'kelelaxi', 'CR');
INSERT INTO `sp_place` VALUES ('1648', '126', ',2,126,1648,', '3', '克卢日纳波卡', 'Cluj-Napoca', 'kelurinaboka', 'CN');
INSERT INTO `sp_place` VALUES ('1649', '126', ',2,126,1649,', '3', '勒姆尼库沃尔恰', 'XRimnicu Vilcea', 'lemunikuwoerqia', 'VI');
INSERT INTO `sp_place` VALUES ('1650', '126', ',2,126,1650,', '3', '雷希察', 'Resita', 'leixicha', 'RE');
INSERT INTO `sp_place` VALUES ('1651', '126', ',2,126,1651,', '3', '梅尔库里亚丘克', 'Miercurea-Ciuc', 'meierkuliyaqiuke', 'MC');
INSERT INTO `sp_place` VALUES ('1652', '126', ',2,126,1652,', '3', '皮特什蒂', 'Pitesti', 'piteshidi', 'PI');
INSERT INTO `sp_place` VALUES ('1653', '126', ',2,126,1653,', '3', '皮亚特拉尼亚姆茨', 'Piatra Neamt', 'piyatelaniyamuci', 'PN');
INSERT INTO `sp_place` VALUES ('1654', '126', ',2,126,1654,', '3', '普洛耶什蒂', 'Ploiesti', 'puluoyeshidi', 'PL');
INSERT INTO `sp_place` VALUES ('1655', '126', ',2,126,1655,', '3', '萨图·马雷', 'Satu Mare', 'satu', 'SM');
INSERT INTO `sp_place` VALUES ('1656', '126', ',2,126,1656,', '3', '圣格奥尔基', 'Sfantu-Gheorghe', 'shenggeaoerji', 'SG');
INSERT INTO `sp_place` VALUES ('1657', '126', ',2,126,1657,', '3', '斯拉蒂纳', 'Slatina', 'siladina', 'ST');
INSERT INTO `sp_place` VALUES ('1658', '126', ',2,126,1658,', '3', '斯洛博齐亚', 'Slobozia', 'siluoboqiya', 'SB');
INSERT INTO `sp_place` VALUES ('1659', '126', ',2,126,1659,', '3', '苏恰瓦', 'Suceava', 'suqiawa', 'SU');
INSERT INTO `sp_place` VALUES ('1660', '126', ',2,126,1660,', '3', '特尔戈维什泰', 'Targovişte', 'teergeweishitai', 'TA');
INSERT INTO `sp_place` VALUES ('1661', '126', ',2,126,1661,', '3', '特尔古穆列什', 'Tirgu Mures', 'teergumulieshi', 'TM');
INSERT INTO `sp_place` VALUES ('1662', '126', ',2,126,1662,', '3', '特尔古日乌', 'Tirgu-Jiu', 'teerguriwu', 'TJ');
INSERT INTO `sp_place` VALUES ('1663', '126', ',2,126,1663,', '3', '图尔恰', 'Tulcea', 'tuerqia', 'TU');
INSERT INTO `sp_place` VALUES ('1664', '126', ',2,126,1664,', '3', '瓦斯卢伊', 'Vaslui', 'wasiluyi', 'VA');
INSERT INTO `sp_place` VALUES ('1665', '126', ',2,126,1665,', '3', '锡比乌', 'Sibiu', 'xibiwu', 'SO');
INSERT INTO `sp_place` VALUES ('1666', '126', ',2,126,1666,', '3', '雅西', 'Iasi', 'yaxi', 'IS');
INSERT INTO `sp_place` VALUES ('1667', '126', ',2,126,1667,', '3', '亚厉山德里亚', 'Alexandria', 'yalishandeliya', 'AD');
INSERT INTO `sp_place` VALUES ('1668', '126', ',2,126,1668,', '3', '扎勒乌', 'Zalau', 'zhalewu', 'ZA');
INSERT INTO `sp_place` VALUES ('1669', '127', ',3,127,1669,', '3', '安齐拉纳纳', 'Antsiranana', 'anqilanana', 'AS');
INSERT INTO `sp_place` VALUES ('1670', '127', ',3,127,1670,', '3', '菲亚纳兰楚阿', 'Fianarantsoa', 'feiyanalanchua', 'FN');
INSERT INTO `sp_place` VALUES ('1671', '127', ',3,127,1671,', '3', '马哈赞加', 'Mahajanga', 'mahazanjia', 'MJ');
INSERT INTO `sp_place` VALUES ('1672', '127', ',3,127,1672,', '3', '塔那那利佛', 'Antananarivo', 'tananalifo', 'AN');
INSERT INTO `sp_place` VALUES ('1673', '127', ',3,127,1673,', '3', '图阿马西拉', 'Toamasina', 'tuamaxila', 'TM');
INSERT INTO `sp_place` VALUES ('1674', '127', ',3,127,1674,', '3', '图利亚拉', 'Toliary', 'tuliyala', 'TL');
INSERT INTO `sp_place` VALUES ('1675', '128', ',1,128,1675,', '3', '阿杜', 'Addu Atoll', 'adu', 'ADD');
INSERT INTO `sp_place` VALUES ('1676', '128', ',1,128,1676,', '3', '北阿里', 'North Ari Atoll', 'beiali', 'AAD');
INSERT INTO `sp_place` VALUES ('1677', '128', ',1,128,1677,', '3', '北蒂拉杜马蒂', 'North Thiladhunmathi', 'beidiladumadi', 'THD');
INSERT INTO `sp_place` VALUES ('1678', '128', ',1,128,1678,', '3', '北马洛斯马杜卢', 'North Maalhosmadhulu', 'beimaluosimadulu', 'MAD');
INSERT INTO `sp_place` VALUES ('1679', '128', ',1,128,1679,', '3', '北米拉杜马杜卢', 'North Miladhunmadhulu', 'beimiladumadulu', 'MLD');
INSERT INTO `sp_place` VALUES ('1680', '128', ',1,128,1680,', '3', '北尼兰杜', 'North Nilandhe Atoll', 'beinilandu', 'NAD');
INSERT INTO `sp_place` VALUES ('1681', '128', ',1,128,1681,', '3', '北苏瓦迪瓦', 'North Huvadhu Atoll', 'beisuwadiwa', 'HAD');
INSERT INTO `sp_place` VALUES ('1682', '128', ',1,128,1682,', '3', '法迪福卢', 'Faadhippolhu', 'fadifulu', 'FAA');
INSERT INTO `sp_place` VALUES ('1683', '128', ',1,128,1683,', '3', '费利杜', 'Felidhu Atoll', 'feilidu', 'FEA');
INSERT INTO `sp_place` VALUES ('1684', '128', ',1,128,1684,', '3', '福阿穆拉库', 'Foammulah', 'fuamulaku', 'FMU');
INSERT INTO `sp_place` VALUES ('1685', '128', ',1,128,1685,', '3', '哈杜马蒂', 'Hadhdhunmathi', 'hadumadi', 'HDH');
INSERT INTO `sp_place` VALUES ('1686', '128', ',1,128,1686,', '3', '科卢马杜卢', 'Kolhumadulu', 'kelumadulu', 'KLH');
INSERT INTO `sp_place` VALUES ('1687', '128', ',1,128,1687,', '3', '马累', 'Male', 'malei', 'MAL');
INSERT INTO `sp_place` VALUES ('1688', '128', ',1,128,1688,', '3', '马累岛', 'Male Atoll', 'maleidao', 'MAA');
INSERT INTO `sp_place` VALUES ('1689', '128', ',1,128,1689,', '3', '穆拉库', 'Mulakatholhu', 'mulaku', 'MUA');
INSERT INTO `sp_place` VALUES ('1690', '128', ',1,128,1690,', '3', '南阿里', 'South Ari Atoll', 'nanali', 'AAU');
INSERT INTO `sp_place` VALUES ('1691', '128', ',1,128,1691,', '3', '南蒂拉杜马蒂', 'South Thiladhunmathi', 'nandiladumadi', 'THU');
INSERT INTO `sp_place` VALUES ('1692', '128', ',1,128,1692,', '3', '南马洛斯马杜卢', 'South Maalhosmadulu', 'nanmaluosimadulu', 'MAU');
INSERT INTO `sp_place` VALUES ('1693', '128', ',1,128,1693,', '3', '南米拉杜马杜卢', 'South Miladhunmadhulu', 'nanmiladumadulu', 'MLU');
INSERT INTO `sp_place` VALUES ('1694', '128', ',1,128,1694,', '3', '南尼兰杜', 'South Nilandhe Atoll', 'nannilandu', 'NAU');
INSERT INTO `sp_place` VALUES ('1695', '128', ',1,128,1695,', '3', '南苏瓦迪瓦', 'South Huvadhu Atoll', 'nansuwadiwa', 'HAU');
INSERT INTO `sp_place` VALUES ('1696', '130', ',3,130,1696,', '3', '北部区', 'Northern', 'beibuqu', 'N');
INSERT INTO `sp_place` VALUES ('1697', '130', ',3,130,1697,', '3', '南部区', 'Southern', 'nanbuqu', 'S');
INSERT INTO `sp_place` VALUES ('1698', '130', ',3,130,1698,', '3', '中央区', 'Central', 'zhongyangqu', 'C');
INSERT INTO `sp_place` VALUES ('1699', '132', ',3,132,1699,', '3', '巴马科首都区', 'Bamako', 'bamakeshouduqu', 'CD');
INSERT INTO `sp_place` VALUES ('1700', '132', ',3,132,1700,', '3', '基达尔', 'Kidal', 'jidaer', 'KD');
INSERT INTO `sp_place` VALUES ('1701', '132', ',3,132,1701,', '3', '加奥', 'Gao', 'jiaao', 'GA');
INSERT INTO `sp_place` VALUES ('1702', '132', ',3,132,1702,', '3', '卡伊', 'Kayes', 'kayi', 'KY');
INSERT INTO `sp_place` VALUES ('1703', '132', ',3,132,1703,', '3', '库利科罗', 'Koulikoro', 'kulikeluo', 'KL');
INSERT INTO `sp_place` VALUES ('1704', '132', ',3,132,1704,', '3', '莫普提', 'Mopti', 'moputi', 'MP');
INSERT INTO `sp_place` VALUES ('1705', '132', ',3,132,1705,', '3', '塞古', 'Segou', 'saigu', 'SG');
INSERT INTO `sp_place` VALUES ('1706', '132', ',3,132,1706,', '3', '通布图', 'Tombouctou', 'tongbutu', 'TB');
INSERT INTO `sp_place` VALUES ('1707', '132', ',3,132,1707,', '3', '锡卡索', 'Sikasso', 'xikasuo', 'SK');
INSERT INTO `sp_place` VALUES ('1708', '139', ',3,139,1708,', '3', '阿德拉尔', 'Adrar', 'adelaer', 'AD');
INSERT INTO `sp_place` VALUES ('1709', '139', ',3,139,1709,', '3', '阿萨巴', 'El-Acaba', 'asaba', 'AS');
INSERT INTO `sp_place` VALUES ('1710', '139', ',3,139,1710,', '3', '卜拉克纳', 'Brakna', 'bolakena', 'BR');
INSERT INTO `sp_place` VALUES ('1711', '139', ',3,139,1711,', '3', '东胡德', 'Hodh el-Gharbi', 'donghude', 'HG');
INSERT INTO `sp_place` VALUES ('1712', '139', ',3,139,1712,', '3', '戈尔戈勒', 'Gorgol', 'geergele', 'GO');
INSERT INTO `sp_place` VALUES ('1713', '139', ',3,139,1713,', '3', '吉迪马卡', 'Guidimaka', 'jidimaka', 'GM');
INSERT INTO `sp_place` VALUES ('1714', '139', ',3,139,1714,', '3', '努瓦迪布湾', 'Dakhlet Nouadhibou', 'nuwadibuwan', 'DN');
INSERT INTO `sp_place` VALUES ('1715', '139', ',3,139,1715,', '3', '努瓦克肖特特区', 'Nouakchott', 'nuwakexiaotetequ', 'NO');
INSERT INTO `sp_place` VALUES ('1716', '139', ',3,139,1716,', '3', '塔甘特', 'Tagant', 'tagante', 'TA');
INSERT INTO `sp_place` VALUES ('1717', '139', ',3,139,1717,', '3', '特拉扎', 'Trarza', 'telazha', 'TR');
INSERT INTO `sp_place` VALUES ('1718', '139', ',3,139,1718,', '3', '提里斯-宰穆尔', 'Tiris Zemmour', 'tilisizaimuer', 'TZ');
INSERT INTO `sp_place` VALUES ('1719', '139', ',3,139,1719,', '3', '西胡德', 'Hodh ech-Chargui', 'xihude', 'HC');
INSERT INTO `sp_place` VALUES ('1720', '139', ',3,139,1720,', '3', '因希里', 'Inchiri', 'yinxili', 'IN');
INSERT INTO `sp_place` VALUES ('1721', '141', ',6,141,1721,', '3', '阿纳', 'Aana', 'ana', 'AAN');
INSERT INTO `sp_place` VALUES ('1722', '141', ',6,141,1722,', '3', '阿图阿', 'Atua', 'atua', 'ATU');
INSERT INTO `sp_place` VALUES ('1723', '141', ',6,141,1723,', '3', '艾加伊勒泰', 'Aigaile Tai', 'aijiayiletai', 'AIT');
INSERT INTO `sp_place` VALUES ('1724', '141', ',6,141,1724,', '3', '法塞莱莱阿加', 'Faasaleleaga', 'fasailailaiajia', 'FAA');
INSERT INTO `sp_place` VALUES ('1725', '141', ',6,141,1725,', '3', '加盖福毛加', 'Gagaifomauga', 'jiagaifumaojia', 'GFG');
INSERT INTO `sp_place` VALUES ('1726', '141', ',6,141,1726,', '3', '加加埃毛加', 'Gagaemauga', 'jiajiaaimaojia', 'GMG');
INSERT INTO `sp_place` VALUES ('1727', '141', ',6,141,1727,', '3', '帕劳利', 'Palauli', 'palaoli', 'PAL');
INSERT INTO `sp_place` VALUES ('1728', '141', ',6,141,1728,', '3', '萨图帕伊泰阿', 'Satupaitea', 'satupayitaia', 'SAT');
INSERT INTO `sp_place` VALUES ('1729', '141', ',6,141,1729,', '3', '萨瓦伊岛', 'Savaii', 'sawayidao', 'SAV');
INSERT INTO `sp_place` VALUES ('1730', '141', ',6,141,1730,', '3', '图阿马萨加', 'Tuamasaga', 'tuamasajia', 'TUA');
INSERT INTO `sp_place` VALUES ('1731', '141', ',6,141,1731,', '3', '瓦奥福诺蒂', 'Vaao Fonoti', 'waaofunuodi', 'VAF');
INSERT INTO `sp_place` VALUES ('1732', '141', ',6,141,1732,', '3', '韦西加诺', 'Vaisigano', 'weixijianuo', 'VAI');
INSERT INTO `sp_place` VALUES ('1733', '141', ',6,141,1733,', '3', '乌波卢岛', 'Upolu', 'wuboludao', 'UPO');
INSERT INTO `sp_place` VALUES ('1734', '143', ',1,143,1734,', '3', '巴彦洪格尔', 'Bayanhongor', 'bayanhonggeer', '69');
INSERT INTO `sp_place` VALUES ('1735', '143', ',1,143,1735,', '3', '巴彦乌勒盖', 'Bayan-Ulgiy', 'bayanwulegai', '71');
INSERT INTO `sp_place` VALUES ('1736', '143', ',1,143,1736,', '3', '布尔干', 'Bulgan', 'buergan', '67');
INSERT INTO `sp_place` VALUES ('1737', '143', ',1,143,1737,', '3', '达尔汗乌勒', 'Darhan-Uul', 'daerhanwule', '37');
INSERT INTO `sp_place` VALUES ('1738', '143', ',1,143,1738,', '3', '东方', 'Dornod', 'dongfang', '61');
INSERT INTO `sp_place` VALUES ('1739', '143', ',1,143,1739,', '3', '东戈壁', 'Dornogovi', 'donggebi', '63');
INSERT INTO `sp_place` VALUES ('1740', '143', ',1,143,1740,', '3', '鄂尔浑', 'Orhon', 'eerhun', '35');
INSERT INTO `sp_place` VALUES ('1741', '143', ',1,143,1741,', '3', '戈壁阿尔泰', 'Govi-Altay', 'gebiaertai', '65');
INSERT INTO `sp_place` VALUES ('1742', '143', ',1,143,1742,', '3', '戈壁苏木贝尔', 'Govisumber', 'gebisumubeier', '64');
INSERT INTO `sp_place` VALUES ('1743', '143', ',1,143,1743,', '3', '后杭爱', 'Arhangay', 'houhangai', '73');
INSERT INTO `sp_place` VALUES ('1744', '143', ',1,143,1744,', '3', '科布多', 'Hovd', 'kebuduo', '43');
INSERT INTO `sp_place` VALUES ('1745', '143', ',1,143,1745,', '3', '肯特', 'Hentiy', 'kente', '39');
INSERT INTO `sp_place` VALUES ('1746', '143', ',1,143,1746,', '3', '库苏古尔', 'Hovsgol', 'kusuguer', '41');
INSERT INTO `sp_place` VALUES ('1747', '143', ',1,143,1747,', '3', '南戈壁', 'Umnogovi', 'nangebi', 'UMN');
INSERT INTO `sp_place` VALUES ('1748', '143', ',1,143,1748,', '3', '前杭爱', 'Uvorhangay', 'qianhangai', 'UVO');
INSERT INTO `sp_place` VALUES ('1749', '143', ',1,143,1749,', '3', '色楞格', 'Selenge', 'selengge', '49');
INSERT INTO `sp_place` VALUES ('1750', '143', ',1,143,1750,', '3', '苏赫巴托尔', 'Suhbaatar', 'suhebatuoer', '51');
INSERT INTO `sp_place` VALUES ('1751', '143', ',1,143,1751,', '3', '乌布苏', 'Uvs', 'wubusu', '46');
INSERT INTO `sp_place` VALUES ('1752', '143', ',1,143,1752,', '3', '乌兰巴托市', 'Ulaanbaatar hot', 'wulanbatuoshi', '1');
INSERT INTO `sp_place` VALUES ('1753', '143', ',1,143,1753,', '3', '扎布汗', 'Dzavhan', 'zhabuhan', '57');
INSERT INTO `sp_place` VALUES ('1754', '143', ',1,143,1754,', '3', '中戈壁', 'Dundgovi', 'zhonggebi', '59');
INSERT INTO `sp_place` VALUES ('1755', '143', ',1,143,1755,', '3', '中央', 'Tov', 'zhongyang', '47');
INSERT INTO `sp_place` VALUES ('1756', '145', ',1,145,1756,', '3', '达卡', 'Dhaka', 'daka', 'DAC');
INSERT INTO `sp_place` VALUES ('1757', '145', ',1,145,1757,', '3', '吉大港', 'Chittagong', 'jidagang', 'CGP');
INSERT INTO `sp_place` VALUES ('1758', '145', ',1,145,1758,', '3', '库尔纳', 'Khulna', 'kuerna', 'KHL');
INSERT INTO `sp_place` VALUES ('1759', '147', ',5,147,1759,', '3', '阿雷基帕', 'Arequipa', 'aleijipa', 'AR');
INSERT INTO `sp_place` VALUES ('1760', '147', ',5,147,1760,', '3', '阿普里马克', 'Apurimac', 'apulimake', 'AP');
INSERT INTO `sp_place` VALUES ('1761', '147', ',5,147,1761,', '3', '阿亚库乔', 'Ayacucho', 'ayakuqiao', 'AY');
INSERT INTO `sp_place` VALUES ('1762', '147', ',5,147,1762,', '3', '安卡什', 'Ancash', 'ankashi', 'AN');
INSERT INTO `sp_place` VALUES ('1763', '147', ',5,147,1763,', '3', '胡利亚卡', 'Juliaca', 'huliyaka', 'JUL');
INSERT INTO `sp_place` VALUES ('1764', '147', ',5,147,1764,', '3', '胡宁', 'Junin', 'huning', 'JU');
INSERT INTO `sp_place` VALUES ('1765', '147', ',5,147,1765,', '3', '卡哈马卡', 'Cajamarca', 'kahamaka', 'CJ');
INSERT INTO `sp_place` VALUES ('1766', '147', ',5,147,1766,', '3', '卡亚俄', 'Callao', 'kayae', 'CL');
INSERT INTO `sp_place` VALUES ('1767', '147', ',5,147,1767,', '3', '库斯科', 'Cusco', 'kusike', 'CU');
INSERT INTO `sp_place` VALUES ('1768', '147', ',5,147,1768,', '3', '拉利伯塔德', 'La Libertad', 'lalibotade', 'LD');
INSERT INTO `sp_place` VALUES ('1769', '147', ',5,147,1769,', '3', '兰巴耶克', 'Lambayeque', 'lanbayeke', 'LY');
INSERT INTO `sp_place` VALUES ('1770', '147', ',5,147,1770,', '3', '利马', 'Lima', 'lima', 'LI');
INSERT INTO `sp_place` VALUES ('1771', '147', ',5,147,1771,', '3', '洛雷托', 'Loreto', 'luoleituo', 'LO');
INSERT INTO `sp_place` VALUES ('1772', '147', ',5,147,1772,', '3', '马德雷德迪奥斯', 'Madre de Dios', 'madeleidediaosi', 'MD');
INSERT INTO `sp_place` VALUES ('1773', '147', ',5,147,1773,', '3', '莫克瓜', 'Moquegua', 'mokegua', 'MO');
INSERT INTO `sp_place` VALUES ('1774', '147', ',5,147,1774,', '3', '帕斯科', 'Pasco', 'pasike', 'PA');
INSERT INTO `sp_place` VALUES ('1775', '147', ',5,147,1775,', '3', '皮乌拉', 'Piura', 'piwula', 'PI');
INSERT INTO `sp_place` VALUES ('1776', '147', ',5,147,1776,', '3', '普诺', 'Puno', 'punuo', 'PU');
INSERT INTO `sp_place` VALUES ('1777', '147', ',5,147,1777,', '3', '钦博特', 'Chimbote', 'qinbote', 'CHM');
INSERT INTO `sp_place` VALUES ('1778', '147', ',5,147,1778,', '3', '钦查阿尔塔', 'Chincha Alta', 'qinchaaerta', 'CHI');
INSERT INTO `sp_place` VALUES ('1779', '147', ',5,147,1779,', '3', '圣马丁', 'San Martin', 'shengmading', 'SM');
INSERT INTO `sp_place` VALUES ('1780', '147', ',5,147,1780,', '3', '苏拉纳', 'Sullana', 'sulana', 'SUL');
INSERT INTO `sp_place` VALUES ('1781', '147', ',5,147,1781,', '3', '塔克纳', 'Tacna', 'takena', 'TA');
INSERT INTO `sp_place` VALUES ('1782', '147', ',5,147,1782,', '3', '通贝斯', 'Tumbes', 'tongbeisi', 'TU');
INSERT INTO `sp_place` VALUES ('1783', '147', ',5,147,1783,', '3', '瓦努科', 'Huanuco', 'wanuke', 'HO');
INSERT INTO `sp_place` VALUES ('1784', '147', ',5,147,1784,', '3', '万卡维利卡', 'Huancavelica', 'wankaweilika', 'HV');
INSERT INTO `sp_place` VALUES ('1785', '147', ',5,147,1785,', '3', '乌卡亚利', 'Ucayali', 'wukayali', 'UC');
INSERT INTO `sp_place` VALUES ('1786', '147', ',5,147,1786,', '3', '亚马孙', 'Amazonas', 'yamasun', 'AM');
INSERT INTO `sp_place` VALUES ('1787', '147', ',5,147,1787,', '3', '伊卡', 'Ica', 'yika', 'IC');
INSERT INTO `sp_place` VALUES ('1788', '148', ',1,148,1788,', '3', '勃固省', 'Bago', 'bogusheng', 'BG');
INSERT INTO `sp_place` VALUES ('1789', '148', ',1,148,1789,', '3', '掸邦', 'Shan', 'danbang', 'SH');
INSERT INTO `sp_place` VALUES ('1790', '148', ',1,148,1790,', '3', '德林达依省', 'Tanintharyi', 'delindayisheng', 'TN');
INSERT INTO `sp_place` VALUES ('1791', '148', ',1,148,1791,', '3', '克伦邦', 'Kayin', 'kelunbang', 'KN');
INSERT INTO `sp_place` VALUES ('1792', '148', ',1,148,1792,', '3', '克钦邦', 'Kachin', 'keqinbang', 'KC');
INSERT INTO `sp_place` VALUES ('1793', '148', ',1,148,1793,', '3', '克耶邦', 'Kayah', 'keyebang', 'KH');
INSERT INTO `sp_place` VALUES ('1794', '148', ',1,148,1794,', '3', '马圭省', 'Magway', 'maguisheng', 'MG');
INSERT INTO `sp_place` VALUES ('1795', '148', ',1,148,1795,', '3', '曼德勒省', 'Mandalay', 'mandelesheng', 'MD');
INSERT INTO `sp_place` VALUES ('1796', '148', ',1,148,1796,', '3', '孟邦', 'Mon', 'mengbang', 'MN');
INSERT INTO `sp_place` VALUES ('1797', '148', ',1,148,1797,', '3', '钦邦', 'Chin', 'qinbang', 'CH');
INSERT INTO `sp_place` VALUES ('1798', '148', ',1,148,1798,', '3', '若开邦', 'Rakhine', 'ruokaibang', 'RK');
INSERT INTO `sp_place` VALUES ('1799', '148', ',1,148,1799,', '3', '实皆省', 'Sagaing', 'shijiesheng', 'SG');
INSERT INTO `sp_place` VALUES ('1800', '148', ',1,148,1800,', '3', '仰光省', 'Yangon', 'yangguangsheng', 'YG');
INSERT INTO `sp_place` VALUES ('1801', '148', ',1,148,1801,', '3', '伊洛瓦底省', 'Ayeyarwady', 'yiluowadisheng', 'AY');
INSERT INTO `sp_place` VALUES ('1802', '150', ',3,150,1802,', '3', '丹吉尔', 'Tangier', 'danjier', 'TGR');
INSERT INTO `sp_place` VALUES ('1803', '150', ',3,150,1803,', '3', '得土安', 'Tetouan', 'detuan', 'TET');
INSERT INTO `sp_place` VALUES ('1804', '150', ',3,150,1804,', '3', '非斯', 'Fes', 'feisi', 'FES');
INSERT INTO `sp_place` VALUES ('1805', '150', ',3,150,1805,', '3', '卡萨布兰卡', 'Casablanca', 'kasabulanka', 'CBL');
INSERT INTO `sp_place` VALUES ('1806', '150', ',3,150,1806,', '3', '拉巴特', 'Rabat', 'labate', 'RSA');
INSERT INTO `sp_place` VALUES ('1807', '150', ',3,150,1807,', '3', '马拉喀什', 'Marrakech', 'malakashi', 'MRK');
INSERT INTO `sp_place` VALUES ('1808', '150', ',3,150,1808,', '3', '梅克内斯', 'Meknes', 'meikeneisi', 'MKN');
INSERT INTO `sp_place` VALUES ('1809', '150', ',3,150,1809,', '3', '乌季达', 'Oujda', 'wujida', 'OUJ');
INSERT INTO `sp_place` VALUES ('1810', '150', ',3,150,1810,', '3', '西撒哈拉', 'Western Sahara', 'xisahala', 'WSH');
INSERT INTO `sp_place` VALUES ('1811', '153', ',4,153,1811,', '3', '阿瓜斯卡连斯特', 'Aguascalientes', 'aguasikaliansite', 'AGU');
INSERT INTO `sp_place` VALUES ('1812', '153', ',4,153,1812,', '3', '阿卡普尔科', 'Acapulco', 'akapuerke', 'ACA');
INSERT INTO `sp_place` VALUES ('1813', '153', ',4,153,1813,', '3', '埃莫西约', 'Hermosillo', 'aimoxiyue', 'HMO');
INSERT INTO `sp_place` VALUES ('1814', '153', ',4,153,1814,', '3', '埃佩切', 'Campeche', 'aipeiqie', 'CAM');
INSERT INTO `sp_place` VALUES ('1815', '153', ',4,153,1815,', '3', '奥夫雷贡城', 'Obregon', 'aofuleigongcheng', 'OBR');
INSERT INTO `sp_place` VALUES ('1816', '153', ',4,153,1816,', '3', '奥里萨巴', 'Orizaba', 'aolisaba', 'ORI');
INSERT INTO `sp_place` VALUES ('1817', '153', ',4,153,1817,', '3', '巴利城', 'Valles', 'balicheng', 'VHM');
INSERT INTO `sp_place` VALUES ('1818', '153', ',4,153,1818,', '3', '巴亚尔塔港', 'Puerto Vallarta', 'bayaertagang', 'PVR');
INSERT INTO `sp_place` VALUES ('1819', '153', ',4,153,1819,', '3', '比利亚埃尔莫萨', 'Villahermosa', 'biliyaaiermosa', 'VSA');
INSERT INTO `sp_place` VALUES ('1820', '153', ',4,153,1820,', '3', '波萨里卡', 'Poza Rica de Hidalgo', 'bosalika', 'PRH');
INSERT INTO `sp_place` VALUES ('1821', '153', ',4,153,1821,', '3', '蒂华纳', 'Tijuana', 'dihuana', 'TIJ');
INSERT INTO `sp_place` VALUES ('1822', '153', ',4,153,1822,', '3', '杜兰戈', 'Durango', 'dulange', 'DUR');
INSERT INTO `sp_place` VALUES ('1823', '153', ',4,153,1823,', '3', '恩塞纳达', 'Ensenada', 'ensainada', 'ESE');
INSERT INTO `sp_place` VALUES ('1824', '153', ',4,153,1824,', '3', '瓜达拉哈拉', 'Guadalajara', 'guadalahala', 'GDL');
INSERT INTO `sp_place` VALUES ('1825', '153', ',4,153,1825,', '3', '瓜纳华托', 'Guanajuato', 'guanahuatuo', 'GUA');
INSERT INTO `sp_place` VALUES ('1826', '153', ',4,153,1826,', '3', '哈拉帕', 'Jalapa', 'halapa', 'JAL');
INSERT INTO `sp_place` VALUES ('1827', '153', ',4,153,1827,', '3', '华雷斯', 'Juarez', 'hualeisi', 'JUZ');
INSERT INTO `sp_place` VALUES ('1828', '153', ',4,153,1828,', '3', '华雷斯港', 'Benito Juare', 'hualeisigang', 'BJU');
INSERT INTO `sp_place` VALUES ('1829', '153', ',4,153,1829,', '3', '卡门', 'Carmen', 'kamen', 'CAR');
INSERT INTO `sp_place` VALUES ('1830', '153', ',4,153,1830,', '3', '科利马', 'Colima', 'kelima', 'COL');
INSERT INTO `sp_place` VALUES ('1831', '153', ',4,153,1831,', '3', '克雷塔罗', 'Queretaro', 'keleitaluo', 'QUE');
INSERT INTO `sp_place` VALUES ('1832', '153', ',4,153,1832,', '3', '库埃纳瓦卡', 'Cuernavaca', 'kuainawaka', 'CVC');
INSERT INTO `sp_place` VALUES ('1833', '153', ',4,153,1833,', '3', '库利阿坎', 'Culiacan', 'kuliakan', 'CUL');
INSERT INTO `sp_place` VALUES ('1834', '153', ',4,153,1834,', '3', '夸察夸拉克斯', 'Coatzacoalcos', 'kuachakualakesi', 'COA');
INSERT INTO `sp_place` VALUES ('1835', '153', ',4,153,1835,', '3', '拉巴斯', 'La Paz', 'labasi', 'LAP');
INSERT INTO `sp_place` VALUES ('1836', '153', ',4,153,1836,', '3', '莱昂', 'Leon', 'laiang', 'LEN');
INSERT INTO `sp_place` VALUES ('1837', '153', ',4,153,1837,', '3', '雷诺萨', 'Reynosa', 'leinuosa', 'REX');
INSERT INTO `sp_place` VALUES ('1838', '153', ',4,153,1838,', '3', '洛斯莫奇斯', 'Los Mochis', 'luosimoqisi', 'LMM');
INSERT INTO `sp_place` VALUES ('1839', '153', ',4,153,1839,', '3', '马萨特兰', 'Mazatlan', 'masatelan', 'MZT');
INSERT INTO `sp_place` VALUES ('1840', '153', ',4,153,1840,', '3', '马塔莫罗斯', 'Matamoros', 'matamoluosi', 'MAM');
INSERT INTO `sp_place` VALUES ('1841', '153', ',4,153,1841,', '3', '梅里达', 'Merida', 'meilida', 'MID');
INSERT INTO `sp_place` VALUES ('1842', '153', ',4,153,1842,', '3', '蒙克洛瓦', 'Monclova', 'mengkeluowa', 'LOV');
INSERT INTO `sp_place` VALUES ('1843', '153', ',4,153,1843,', '3', '蒙特雷', 'Monterrey', 'mengtelei', 'MTY');
INSERT INTO `sp_place` VALUES ('1844', '153', ',4,153,1844,', '3', '莫雷利亚', 'Morelia', 'moleiliya', 'MLM');
INSERT INTO `sp_place` VALUES ('1845', '153', ',4,153,1845,', '3', '墨西哥城', 'Mexico City', 'moxigecheng', 'MEX');
INSERT INTO `sp_place` VALUES ('1846', '153', ',4,153,1846,', '3', '墨西卡利', 'Mexicali', 'moxikali', 'MXL');
INSERT INTO `sp_place` VALUES ('1847', '153', ',4,153,1847,', '3', '诺加莱斯', 'Nogales', 'nuojialaisi', 'NOG');
INSERT INTO `sp_place` VALUES ('1848', '153', ',4,153,1848,', '3', '帕丘卡', 'Pachuca', 'paqiuka', 'PAC');
INSERT INTO `sp_place` VALUES ('1849', '153', ',4,153,1849,', '3', '普埃布拉', 'Puebla', 'puaibula', 'PUE');
INSERT INTO `sp_place` VALUES ('1850', '153', ',4,153,1850,', '3', '奇尔潘辛戈', 'Chilpancingo', 'qierpanxinge', 'CHI');
INSERT INTO `sp_place` VALUES ('1851', '153', ',4,153,1851,', '3', '奇瓦瓦', 'Chihuahua', 'qiwawa', 'CHH');
INSERT INTO `sp_place` VALUES ('1852', '153', ',4,153,1852,', '3', '切图马尔', 'Cheturnal', 'qietumaer', 'CTM');
INSERT INTO `sp_place` VALUES ('1853', '153', ',4,153,1853,', '3', '萨尔蒂约', 'Saltillo', 'saerdiyue', 'SLW');
INSERT INTO `sp_place` VALUES ('1854', '153', ',4,153,1854,', '3', '萨卡特卡斯', 'Zacatecas', 'sakatekasi', 'ZAC');
INSERT INTO `sp_place` VALUES ('1855', '153', ',4,153,1855,', '3', '塞拉亚', 'Celaya', 'sailaya', 'CLY');
INSERT INTO `sp_place` VALUES ('1856', '153', ',4,153,1856,', '3', '圣路易斯波托亚', 'San Luis Potosi', 'shengluyisibotuoya', 'SLP');
INSERT INTO `sp_place` VALUES ('1857', '153', ',4,153,1857,', '3', '塔帕丘拉', 'Tapachula', 'tapaqiula', 'TAP');
INSERT INTO `sp_place` VALUES ('1858', '153', ',4,153,1858,', '3', '坦皮科', 'Tampico', 'tanpike', 'TAM');
INSERT INTO `sp_place` VALUES ('1859', '153', ',4,153,1859,', '3', '特拉斯卡拉', 'Tlaxcala', 'telasikala', 'TLA');
INSERT INTO `sp_place` VALUES ('1860', '153', ',4,153,1860,', '3', '特皮克', 'Tepic', 'tepike', 'TPQ');
INSERT INTO `sp_place` VALUES ('1861', '153', ',4,153,1861,', '3', '特瓦坎', 'Tehuacan', 'tewakan', 'TCN');
INSERT INTO `sp_place` VALUES ('1862', '153', ',4,153,1862,', '3', '图斯特拉-古铁雷斯', 'Tuxtla Gutierrez', 'tusitelagutieleisi', 'TGZ');
INSERT INTO `sp_place` VALUES ('1863', '153', ',4,153,1863,', '3', '托雷翁', 'Torreon', 'tuoleiweng', 'TRC');
INSERT INTO `sp_place` VALUES ('1864', '153', ',4,153,1864,', '3', '托卢卡', 'Toluca', 'tuoluka', 'TLC');
INSERT INTO `sp_place` VALUES ('1865', '153', ',4,153,1865,', '3', '瓦哈卡', 'Oaxaca', 'wahaka', 'OAX');
INSERT INTO `sp_place` VALUES ('1866', '153', ',4,153,1866,', '3', '维多利亚城', 'Victoria', 'weiduoliyacheng', 'VIC');
INSERT INTO `sp_place` VALUES ('1867', '153', ',4,153,1867,', '3', '韦拉克鲁斯', 'Veracruz', 'weilakelusi', 'VER');
INSERT INTO `sp_place` VALUES ('1868', '153', ',4,153,1868,', '3', '乌鲁阿潘', 'Uruapan', 'wuluapan', 'UPN');
INSERT INTO `sp_place` VALUES ('1869', '153', ',4,153,1869,', '3', '新拉雷多', 'Nuevo Laredo', 'xinlaleiduo', 'NLE');
INSERT INTO `sp_place` VALUES ('1870', '153', ',4,153,1870,', '3', '伊拉普阿托', 'Irapuato', 'yilapuatuo', 'IRP');
INSERT INTO `sp_place` VALUES ('1871', '154', ',3,154,1871,', '3', '埃龙戈', 'Erongo', 'ailongge', 'ER');
INSERT INTO `sp_place` VALUES ('1872', '154', ',3,154,1872,', '3', '奥汉圭纳', 'Ohangwena', 'aohanguina', 'OW');
INSERT INTO `sp_place` VALUES ('1873', '154', ',3,154,1873,', '3', '奥卡万戈', 'Okavango', 'aokawange', 'KV');
INSERT INTO `sp_place` VALUES ('1874', '154', ',3,154,1874,', '3', '奥马赫科', 'Omaheke', 'aomaheke', 'OK');
INSERT INTO `sp_place` VALUES ('1875', '154', ',3,154,1875,', '3', '奥姆沙蒂', 'Omusati', 'aomushadi', 'OT');
INSERT INTO `sp_place` VALUES ('1876', '154', ',3,154,1876,', '3', '奥乔宗蒂约巴', 'Otjozondjupa', 'aoqiaozongdiyueba', 'OJ');
INSERT INTO `sp_place` VALUES ('1877', '154', ',3,154,1877,', '3', '奥沙纳', 'Oshana', 'aoshana', 'ON');
INSERT INTO `sp_place` VALUES ('1878', '154', ',3,154,1878,', '3', '奥希科托', 'Oshikoto', 'aoxiketuo', 'OO');
INSERT INTO `sp_place` VALUES ('1879', '154', ',3,154,1879,', '3', '哈达普', 'Hardap', 'hadapu', 'HA');
INSERT INTO `sp_place` VALUES ('1880', '154', ',3,154,1880,', '3', '霍马斯', 'Khomas', 'huomasi', 'KH');
INSERT INTO `sp_place` VALUES ('1881', '154', ',3,154,1881,', '3', '卡拉斯', 'Karas', 'kalasi', 'KR');
INSERT INTO `sp_place` VALUES ('1882', '154', ',3,154,1882,', '3', '卡普里维', 'Caprivi', 'kapuliwei', 'CA');
INSERT INTO `sp_place` VALUES ('1883', '154', ',3,154,1883,', '3', '库内内', 'Kunene', 'kuneinei', 'KU');
INSERT INTO `sp_place` VALUES ('1884', '155', ',3,155,1884,', '3', '阿平顿', 'Upington', 'apingdun', 'UTN');
INSERT INTO `sp_place` VALUES ('1885', '155', ',3,155,1885,', '3', '艾利弗山', 'Mount Ayliff', 'ailifushan', 'MAY');
INSERT INTO `sp_place` VALUES ('1886', '155', ',3,155,1886,', '3', '彼德马里茨堡', 'Pietermaritzburg', 'bidemalicibao', 'PZB');
INSERT INTO `sp_place` VALUES ('1887', '155', ',3,155,1887,', '3', '彼德斯堡', 'Pietersburg', 'bidesibao', 'PTG');
INSERT INTO `sp_place` VALUES ('1888', '155', ',3,155,1888,', '3', '比勒陀利亚', 'Pretoria', 'biletuoliya', 'PRY');
INSERT INTO `sp_place` VALUES ('1889', '155', ',3,155,1889,', '3', '比索', 'Bisho', 'bisuo', 'BIY');
INSERT INTO `sp_place` VALUES ('1890', '155', ',3,155,1890,', '3', '布雷达斯多普', 'Bredasdorp', 'buleidasiduopu', 'BDD');
INSERT INTO `sp_place` VALUES ('1891', '155', ',3,155,1891,', '3', '布隆方丹', 'Bloemfontein', 'bulongfangdan', 'BFN');
INSERT INTO `sp_place` VALUES ('1892', '155', ',3,155,1892,', '3', '布隆克斯特斯普利特', 'Bronkhorstspruit', 'bulongkesitesipulite', 'BHT');
INSERT INTO `sp_place` VALUES ('1893', '155', ',3,155,1893,', '3', '德阿尔', 'De Aar', 'deaer', 'DAA');
INSERT INTO `sp_place` VALUES ('1894', '155', ',3,155,1894,', '3', '德班', 'Durban', 'deban', 'DUR');
INSERT INTO `sp_place` VALUES ('1895', '155', ',3,155,1895,', '3', '邓迪', 'Dundee', 'dengdi', 'DUN');
INSERT INTO `sp_place` VALUES ('1896', '155', ',3,155,1896,', '3', '东巴克利', 'Barkley East', 'dongbakeli', 'BAE');
INSERT INTO `sp_place` VALUES ('1897', '155', ',3,155,1897,', '3', '东伦敦', 'East London', 'donglundun', 'ELS');
INSERT INTO `sp_place` VALUES ('1898', '155', ',3,155,1898,', '3', '弗雷堡', 'Vryburg', 'fuleibao', 'VRU');
INSERT INTO `sp_place` VALUES ('1899', '155', ',3,155,1899,', '3', '弗里尼欣', 'Vereeniging', 'fulinixin', 'VGG');
INSERT INTO `sp_place` VALUES ('1900', '155', ',3,155,1900,', '3', '格罗布莱斯达尔', 'Groblersdal', 'geluobulaisidaer', 'GBD');
INSERT INTO `sp_place` VALUES ('1901', '155', ',3,155,1901,', '3', '基雅尼', 'Giyani', 'jiyani', 'GIY');
INSERT INTO `sp_place` VALUES ('1902', '155', ',3,155,1902,', '3', '金伯利', 'Kimberley', 'jinboli', 'KIM');
INSERT INTO `sp_place` VALUES ('1903', '155', ',3,155,1903,', '3', '开普敦', 'Cape Town', 'kaipudun', 'CPT');
INSERT INTO `sp_place` VALUES ('1904', '155', ',3,155,1904,', '3', '克莱克斯多普', 'Klerksdorp', 'kelaikesiduopu', 'KXE');
INSERT INTO `sp_place` VALUES ('1905', '155', ',3,155,1905,', '3', '库鲁曼', 'Kuruman', 'kuluman', 'KMH');
INSERT INTO `sp_place` VALUES ('1906', '155', ',3,155,1906,', '3', '昆士敦', 'Queenstown', 'kunshidun', 'UTW');
INSERT INTO `sp_place` VALUES ('1907', '155', ',3,155,1907,', '3', '莱迪史密斯', 'Ladysmith', 'laidishimisi', 'LAY');
INSERT INTO `sp_place` VALUES ('1908', '155', ',3,155,1908,', '3', '兰德方丹', 'Randfontein', 'landefangdan', 'RFT');
INSERT INTO `sp_place` VALUES ('1909', '155', ',3,155,1909,', '3', '理查兹湾', 'Richards Bay', 'lichaziwan', 'RCB');
INSERT INTO `sp_place` VALUES ('1910', '155', ',3,155,1910,', '3', '利斯滕堡', 'Rustenburg', 'lisibao', 'RSB');
INSERT INTO `sp_place` VALUES ('1911', '155', ',3,155,1911,', '3', '米德尔堡', 'Middelburg', 'mideerbao', 'MDB');
INSERT INTO `sp_place` VALUES ('1912', '155', ',3,155,1912,', '3', '姆库泽', 'Mkuze', 'mukuze', 'MZQ');
INSERT INTO `sp_place` VALUES ('1913', '155', ',3,155,1913,', '3', '穆里斯堡', 'Moorreesburg', 'mulisibao', 'MOO');
INSERT INTO `sp_place` VALUES ('1914', '155', ',3,155,1914,', '3', '内尔斯普雷特', 'Nelspruit', 'neiersipuleite', 'NLP');
INSERT INTO `sp_place` VALUES ('1915', '155', ',3,155,1915,', '3', '尼尔斯特隆', 'Nylstroom', 'niersitelong', 'NYL');
INSERT INTO `sp_place` VALUES ('1916', '155', ',3,155,1916,', '3', '纽卡斯尔', 'Newcastle', 'niukasier', 'NCS');
INSERT INTO `sp_place` VALUES ('1917', '155', ',3,155,1917,', '3', '乔治', 'George', 'qiaozhi', 'GRJ');
INSERT INTO `sp_place` VALUES ('1918', '155', ',3,155,1918,', '3', '萨索尔堡', 'Sasolburg', 'sasuoerbao', 'SAS');
INSERT INTO `sp_place` VALUES ('1919', '155', ',3,155,1919,', '3', '瑟孔达', 'Secunda', 'sekongda', 'ZEC');
INSERT INTO `sp_place` VALUES ('1920', '155', ',3,155,1920,', '3', '特克索波', 'Ixopo', 'tekesuobo', 'IXO');
INSERT INTO `sp_place` VALUES ('1921', '155', ',3,155,1921,', '3', '特隆普斯堡', 'Trompsburg', 'telongpusibao', 'TPB');
INSERT INTO `sp_place` VALUES ('1922', '155', ',3,155,1922,', '3', '跳羚', 'Springbok', 'tiaoling', 'SBU');
INSERT INTO `sp_place` VALUES ('1923', '155', ',3,155,1923,', '3', '图拉马哈谢', 'Thulamahashe', 'tulamahaxie', 'TLH');
INSERT INTO `sp_place` VALUES ('1924', '155', ',3,155,1924,', '3', '托霍延杜', 'Thohoyandou', 'tuohuoyandu', 'THY');
INSERT INTO `sp_place` VALUES ('1925', '155', ',3,155,1925,', '3', '韦茨肖克', 'Witsieshoek', 'weicixiaoke', 'WSH');
INSERT INTO `sp_place` VALUES ('1926', '155', ',3,155,1926,', '3', '韦尔科姆', 'Welkom', 'weierkemu', 'WEL');
INSERT INTO `sp_place` VALUES ('1927', '155', ',3,155,1927,', '3', '乌伦迪', 'Ulundi', 'wulundi', 'ULD');
INSERT INTO `sp_place` VALUES ('1928', '155', ',3,155,1928,', '3', '乌姆塔塔', 'Umtata', 'wumutata', 'UTT');
INSERT INTO `sp_place` VALUES ('1929', '155', ',3,155,1929,', '3', '伍斯特', 'Worcester', 'wusite', 'WOR');
INSERT INTO `sp_place` VALUES ('1930', '155', ',3,155,1930,', '3', '西博福特', 'Beaufort West', 'xibofute', 'BEW');
INSERT INTO `sp_place` VALUES ('1931', '155', ',3,155,1931,', '3', '谢普斯通港', 'Port Shepstone', 'xiepusitonggang', 'PSS');
INSERT INTO `sp_place` VALUES ('1932', '155', ',3,155,1932,', '3', '伊丽莎白港', 'Port Elizabeth', 'yilishabaigang', 'PLZ');
INSERT INTO `sp_place` VALUES ('1933', '155', ',3,155,1933,', '3', '约翰内斯堡', 'Johannesburg', 'yuehanneisibao', 'JNB');
INSERT INTO `sp_place` VALUES ('1934', '159', ',1,159,1934,', '3', '巴格马蒂', 'Bagmati', 'bagemadi', 'BA');
INSERT INTO `sp_place` VALUES ('1935', '159', ',1,159,1935,', '3', '道拉吉里', 'Dhawalagiri', 'daolajili', 'DH');
INSERT INTO `sp_place` VALUES ('1936', '159', ',1,159,1936,', '3', '甘达基', 'Gandaki', 'gandaji', 'GA');
INSERT INTO `sp_place` VALUES ('1937', '159', ',1,159,1937,', '3', '戈西', 'Kosi', 'gexi', 'KO');
INSERT INTO `sp_place` VALUES ('1938', '159', ',1,159,1938,', '3', '格尔纳利', 'Karnali', 'geernali', 'KA');
INSERT INTO `sp_place` VALUES ('1939', '159', ',1,159,1939,', '3', '贾纳克布尔', 'Janakpur', 'jianakebuer', 'JA');
INSERT INTO `sp_place` VALUES ('1940', '159', ',1,159,1940,', '3', '拉布蒂', 'Rapti', 'labudi', 'RA');
INSERT INTO `sp_place` VALUES ('1941', '159', ',1,159,1941,', '3', '蓝毗尼', 'Lumbini', 'lanpini', 'LU');
INSERT INTO `sp_place` VALUES ('1942', '159', ',1,159,1942,', '3', '马哈卡利', 'Mahakali', 'mahakali', 'MA');
INSERT INTO `sp_place` VALUES ('1943', '159', ',1,159,1943,', '3', '梅吉', 'Mechi', 'meiji', 'ME');
INSERT INTO `sp_place` VALUES ('1944', '159', ',1,159,1944,', '3', '纳拉亚尼', 'Narayani', 'nalayani', 'NA');
INSERT INTO `sp_place` VALUES ('1945', '159', ',1,159,1945,', '3', '佩里', 'Bheri', 'peili', 'BH');
INSERT INTO `sp_place` VALUES ('1946', '159', ',1,159,1946,', '3', '萨加玛塔', 'Sogarmatha', 'sajiamata', 'SA');
INSERT INTO `sp_place` VALUES ('1947', '159', ',1,159,1947,', '3', '塞蒂', 'Seti', 'saidi', 'SE');
INSERT INTO `sp_place` VALUES ('1948', '160', ',4,160,1948,', '3', '埃斯特利', 'Esteli', 'aisiteli', 'ES');
INSERT INTO `sp_place` VALUES ('1949', '160', ',4,160,1949,', '3', '北大西洋', 'Atlantico Norte', 'beidaxiyang', 'AN');
INSERT INTO `sp_place` VALUES ('1950', '160', ',4,160,1950,', '3', '博阿科', 'Boaco', 'boake', 'BO');
INSERT INTO `sp_place` VALUES ('1951', '160', ',4,160,1951,', '3', '格拉纳达', 'Granada', 'gelanada', 'GR');
INSERT INTO `sp_place` VALUES ('1952', '160', ',4,160,1952,', '3', '卡拉索', 'Carazo', 'kalasuo', 'CA');
INSERT INTO `sp_place` VALUES ('1953', '160', ',4,160,1953,', '3', '莱昂', 'Leon', 'laiang', 'LE');
INSERT INTO `sp_place` VALUES ('1954', '160', ',4,160,1954,', '3', '里瓦斯', 'Rivas', 'liwasi', 'RV');
INSERT INTO `sp_place` VALUES ('1955', '160', ',4,160,1955,', '3', '马德里斯', 'Madriz', 'madelisi', 'MD');
INSERT INTO `sp_place` VALUES ('1956', '160', ',4,160,1956,', '3', '马那瓜', 'Managua', 'managua', 'MN');
INSERT INTO `sp_place` VALUES ('1957', '160', ',4,160,1957,', '3', '马萨亚', 'Masaya', 'masaya', 'MS');
INSERT INTO `sp_place` VALUES ('1958', '160', ',4,160,1958,', '3', '马塔加尔帕', 'Matagalpa', 'matajiaerpa', 'MT');
INSERT INTO `sp_place` VALUES ('1959', '160', ',4,160,1959,', '3', '南大西洋', 'Atlantico Sur', 'nandaxiyang', 'AS');
INSERT INTO `sp_place` VALUES ('1960', '160', ',4,160,1960,', '3', '奇南德加', 'Chinandega', 'qinandejia', 'CD');
INSERT INTO `sp_place` VALUES ('1961', '160', ',4,160,1961,', '3', '琼塔莱斯', 'Chontales', 'qiongtalaisi', 'CT');
INSERT INTO `sp_place` VALUES ('1962', '160', ',4,160,1962,', '3', '圣胡安河', 'Rio San Juan', 'shenghuanhe', 'SJ');
INSERT INTO `sp_place` VALUES ('1963', '160', ',4,160,1963,', '3', '希诺特加', 'Jinotega', 'xinuotejia', 'JI');
INSERT INTO `sp_place` VALUES ('1964', '160', ',4,160,1964,', '3', '新塞哥维亚', 'Nueva Segovia', 'xinsaigeweiya', 'NS');
INSERT INTO `sp_place` VALUES ('1965', '161', ',3,161,1965,', '3', '阿加德兹', 'Agadez', 'ajiadezi', 'AJY');
INSERT INTO `sp_place` VALUES ('1966', '161', ',3,161,1966,', '3', '迪法', 'Diffa', 'difa', 'DIF');
INSERT INTO `sp_place` VALUES ('1967', '161', ',3,161,1967,', '3', '蒂拉贝里', 'Tillaberi', 'dilabeili', 'TIL');
INSERT INTO `sp_place` VALUES ('1968', '161', ',3,161,1968,', '3', '多索', 'Dosso', 'duosuo', 'DSS');
INSERT INTO `sp_place` VALUES ('1969', '161', ',3,161,1969,', '3', '津德尔', 'Zinder', 'jindeer', 'ZND');
INSERT INTO `sp_place` VALUES ('1970', '161', ',3,161,1970,', '3', '马拉迪', 'Maradi', 'maladi', 'MFQ');
INSERT INTO `sp_place` VALUES ('1971', '161', ',3,161,1971,', '3', '尼亚美市', 'Niamey C.U.', 'niyameishi', 'NIM');
INSERT INTO `sp_place` VALUES ('1972', '161', ',3,161,1972,', '3', '塔瓦', 'Tahoua', 'tawa', 'THZ');
INSERT INTO `sp_place` VALUES ('1973', '162', ',3,162,1973,', '3', '阿比亚', 'Abuja', 'abiya', 'ABV');
INSERT INTO `sp_place` VALUES ('1974', '162', ',3,162,1974,', '3', '奥博莫绍', 'Ogbomosho', 'aobomoshao', 'OGB');
INSERT INTO `sp_place` VALUES ('1975', '162', ',3,162,1975,', '3', '卡诺', 'Kano', 'kanuo', 'KAN');
INSERT INTO `sp_place` VALUES ('1976', '162', ',3,162,1976,', '3', '拉各斯', 'Lagos', 'lagesi', 'LOS');
INSERT INTO `sp_place` VALUES ('1977', '162', ',3,162,1977,', '3', '伊巴丹', 'Ibadan', 'yibadan', 'IBA');
INSERT INTO `sp_place` VALUES ('1978', '164', ',2,164,1978,', '3', '阿克什胡斯', 'Akershus', 'akeshihusi', '2');
INSERT INTO `sp_place` VALUES ('1979', '164', ',2,164,1979,', '3', '奥普兰', 'Oppland', 'aopulan', '5');
INSERT INTO `sp_place` VALUES ('1980', '164', ',2,164,1980,', '3', '奥斯陆市', 'Oslo', 'aosilushi', '3');
INSERT INTO `sp_place` VALUES ('1981', '164', ',2,164,1981,', '3', '北特伦德拉格', 'Nord-Trondelag', 'beitelundelage', '17');
INSERT INTO `sp_place` VALUES ('1982', '164', ',2,164,1982,', '3', '布斯克吕', 'Buskerud', 'busikelv', '6');
INSERT INTO `sp_place` VALUES ('1983', '164', ',2,164,1983,', '3', '东阿格德尔', 'Aust-Agder', 'dongagedeer', '9');
INSERT INTO `sp_place` VALUES ('1984', '164', ',2,164,1984,', '3', '东福尔', 'Ostfold', 'dongfuer', '1');
INSERT INTO `sp_place` VALUES ('1985', '164', ',2,164,1985,', '3', '芬马克', 'Finnmark', 'fenmake', '20');
INSERT INTO `sp_place` VALUES ('1986', '164', ',2,164,1986,', '3', '海德马克', 'Hedmark', 'haidemake', '4');
INSERT INTO `sp_place` VALUES ('1987', '164', ',2,164,1987,', '3', '霍达兰', 'Hordaland', 'huodalan', '12');
INSERT INTO `sp_place` VALUES ('1988', '164', ',2,164,1988,', '3', '罗加兰', 'Rogaland', 'luojialan', '11');
INSERT INTO `sp_place` VALUES ('1989', '164', ',2,164,1989,', '3', '默勒－鲁姆斯达尔', 'More og Romsdal', 'molelumusidaer', '15');
INSERT INTO `sp_place` VALUES ('1990', '164', ',2,164,1990,', '3', '南特伦德拉格', 'Sor-Trondelag', 'nantelundelage', '16');
INSERT INTO `sp_place` VALUES ('1991', '164', ',2,164,1991,', '3', '诺尔兰', 'Nordland', 'nuoerlan', '18');
INSERT INTO `sp_place` VALUES ('1992', '164', ',2,164,1992,', '3', '松恩－菲尤拉讷', 'Sogn og Fjordane', 'songenfeiyoula', '14');
INSERT INTO `sp_place` VALUES ('1993', '164', ',2,164,1993,', '3', '泰勒马克', 'Telemark', 'tailemake', '8');
INSERT INTO `sp_place` VALUES ('1994', '164', ',2,164,1994,', '3', '特罗姆斯', 'Troms', 'teluomusi', '19');
INSERT INTO `sp_place` VALUES ('1995', '164', ',2,164,1995,', '3', '西阿格德尔', 'Vest-Agder', 'xiagedeer', '10');
INSERT INTO `sp_place` VALUES ('1996', '164', ',2,164,1996,', '3', '西福尔', 'Vestfold', 'xifuer', '7');
INSERT INTO `sp_place` VALUES ('1997', '168', ',2,168,1997,', '3', '滨海阿连特茹', 'Alentejo Litoral', 'binhaialianteru', 'ALL');
INSERT INTO `sp_place` VALUES ('1998', '168', ',2,168,1998,', '3', '滨海皮尼亚尔', 'Pinhal Litoral', 'binhaipiniyaer', 'PLT');
INSERT INTO `sp_place` VALUES ('1999', '168', ',2,168,1999,', '3', '波尔图', 'Porto', 'boertu', 'VDP');
INSERT INTO `sp_place` VALUES ('2000', '168', ',2,168,2000,', '3', '杜罗', 'Douro', 'duluo', 'MDR');
INSERT INTO `sp_place` VALUES ('2001', '168', ',2,168,2001,', '3', '恩特拉杜罗伏日', 'Entre Douro e Vouga', 'enteladuluofuri', 'EDV');
INSERT INTO `sp_place` VALUES ('2002', '168', ',2,168,2002,', '3', '法鲁', 'Faro', 'falu', 'FAO');
INSERT INTO `sp_place` VALUES ('2003', '168', ',2,168,2003,', '3', '丰沙尔', 'Funchal', 'fengshaer', 'FUN');
INSERT INTO `sp_place` VALUES ('2004', '168', ',2,168,2004,', '3', '卡瓦多', 'Cavado', 'kawaduo', 'CAV');
INSERT INTO `sp_place` VALUES ('2005', '168', ',2,168,2005,', '3', '科瓦贝拉', 'Cova da Beira', 'kewabeila', 'CLB');
INSERT INTO `sp_place` VALUES ('2006', '168', ',2,168,2006,', '3', '里斯本', 'Lisboa', 'lisiben', 'LIS');
INSERT INTO `sp_place` VALUES ('2007', '168', ',2,168,2007,', '3', '利巴特茹', 'Leziria do Tejo', 'libateru', 'LTE');
INSERT INTO `sp_place` VALUES ('2008', '168', ',2,168,2008,', '3', '梅地奥特茹', 'Medio Tejo', 'meidiaoteru', 'MTE');
INSERT INTO `sp_place` VALUES ('2009', '168', ',2,168,2009,', '3', '米尼奥-利马', 'Minho-Lima', 'miniaolima', 'MLI');
INSERT INTO `sp_place` VALUES ('2010', '168', ',2,168,2010,', '3', '内贝拉北', 'Beira Interior Norte', 'neibeilabei', 'BIN');
INSERT INTO `sp_place` VALUES ('2011', '168', ',2,168,2011,', '3', '内贝拉南', 'Beira Interior Sul', 'neibeilanan', 'BIS');
INSERT INTO `sp_place` VALUES ('2012', '168', ',2,168,2012,', '3', '内皮尼亚尔北', 'Pinhal Interior Norte', 'neipiniyaerbei', 'PIN');
INSERT INTO `sp_place` VALUES ('2013', '168', ',2,168,2013,', '3', '内皮尼亚尔南', 'Pinhal Interior Sul', 'neipiniyaernan', 'PIS');
INSERT INTO `sp_place` VALUES ('2014', '168', ',2,168,2014,', '3', '蓬塔德尔加达', 'Ponta Delgada', 'pengtadeerjiada', 'PDL');
INSERT INTO `sp_place` VALUES ('2015', '168', ',2,168,2015,', '3', '塞图巴尔半岛', 'Peninsula de Setubal', 'saitubaerbandao', 'PSE');
INSERT INTO `sp_place` VALUES ('2016', '168', ',2,168,2016,', '3', '山后', 'Serra da Estrela', 'shanhou', 'SES');
INSERT INTO `sp_place` VALUES ('2017', '168', ',2,168,2017,', '3', '上阿连特茹', 'Alto Alentejo', 'shangalianteru', 'AAT');
INSERT INTO `sp_place` VALUES ('2018', '168', ',2,168,2018,', '3', '上特拉斯山', 'Alto Tros-os-Montes', 'shangtelasishan', 'ATM');
INSERT INTO `sp_place` VALUES ('2019', '168', ',2,168,2019,', '3', '塔梅加', 'Tamega', 'tameijia', 'TAM');
INSERT INTO `sp_place` VALUES ('2020', '168', ',2,168,2020,', '3', '万福', 'Ave', 'wanfu', 'AES');
INSERT INTO `sp_place` VALUES ('2021', '168', ',2,168,2021,', '3', '西部', 'Oeste', 'xibu', 'OES');
INSERT INTO `sp_place` VALUES ('2022', '168', ',2,168,2022,', '3', '下阿连特茹', 'Baixo Alentejo', 'xiaalianteru', 'BAL');
INSERT INTO `sp_place` VALUES ('2023', '168', ',2,168,2023,', '3', '下伏日', 'Baixo Vouga', 'xiafuri', 'BVO');
INSERT INTO `sp_place` VALUES ('2024', '168', ',2,168,2024,', '3', '下蒙德古', 'Baixo Mondego', 'xiamengdegu', 'BMO');
INSERT INTO `sp_place` VALUES ('2025', '168', ',2,168,2025,', '3', '中阿连特茹', 'Alentejo Central', 'zhongalianteru', 'ALC');
INSERT INTO `sp_place` VALUES ('2026', '170', ',1,170,2026,', '3', '爱媛', 'Ehime', 'ai', '38');
INSERT INTO `sp_place` VALUES ('2027', '170', ',1,170,2027,', '3', '爱知', 'Aichi', 'aizhi', '23');
INSERT INTO `sp_place` VALUES ('2028', '170', ',1,170,2028,', '3', '北海道', 'Hokkaido', 'beihaidao', '1');
INSERT INTO `sp_place` VALUES ('2029', '170', ',1,170,2029,', '3', '兵库', 'Hyogo', 'bingku', '28');
INSERT INTO `sp_place` VALUES ('2030', '170', ',1,170,2030,', '3', '冲绳', 'Okinawa', 'chongsheng', '47');
INSERT INTO `sp_place` VALUES ('2031', '170', ',1,170,2031,', '3', '茨城', 'Ibaraki', 'cicheng', '8');
INSERT INTO `sp_place` VALUES ('2032', '170', ',1,170,2032,', '3', '大阪', 'Osaka', 'da', '27');
INSERT INTO `sp_place` VALUES ('2033', '170', ',1,170,2033,', '3', '大分', 'Oita', 'dafen', '44');
INSERT INTO `sp_place` VALUES ('2034', '170', ',1,170,2034,', '3', '岛根', 'Shimane', 'daogen', '32');
INSERT INTO `sp_place` VALUES ('2035', '170', ',1,170,2035,', '3', '徳岛', 'Tokushima', '', '36');
INSERT INTO `sp_place` VALUES ('2036', '170', ',1,170,2036,', '3', '东京', 'Tokyo', 'dongjing', '13');
INSERT INTO `sp_place` VALUES ('2037', '170', ',1,170,2037,', '3', '福岛', 'Fukushima', 'fudao', '7');
INSERT INTO `sp_place` VALUES ('2038', '170', ',1,170,2038,', '3', '福冈', 'Fukuoka', 'fugang', '40');
INSERT INTO `sp_place` VALUES ('2039', '170', ',1,170,2039,', '3', '福井', 'Fukui', 'fujing', '18');
INSERT INTO `sp_place` VALUES ('2040', '170', ',1,170,2040,', '3', '富山', 'Toyama', 'fushan', '16');
INSERT INTO `sp_place` VALUES ('2041', '170', ',1,170,2041,', '3', '冈山', 'Okayama', 'gangshan', '33');
INSERT INTO `sp_place` VALUES ('2042', '170', ',1,170,2042,', '3', '高知', 'Kochi', 'gaozhi', '39');
INSERT INTO `sp_place` VALUES ('2043', '170', ',1,170,2043,', '3', '宮城', 'Miyagi', '', '4');
INSERT INTO `sp_place` VALUES ('2044', '170', ',1,170,2044,', '3', '宫崎', 'Miyazaki', 'gongqi', '45');
INSERT INTO `sp_place` VALUES ('2045', '170', ',1,170,2045,', '3', '广岛', 'Hiroshima', 'guangdao', '34');
INSERT INTO `sp_place` VALUES ('2046', '170', ',1,170,2046,', '3', '和歌山', 'Wakayama', 'hegeshan', '30');
INSERT INTO `sp_place` VALUES ('2047', '170', ',1,170,2047,', '3', '京都', 'Kyoto', 'jingdu', '26');
INSERT INTO `sp_place` VALUES ('2048', '170', ',1,170,2048,', '3', '静冈', 'Shizuoka', 'jinggang', '22');
INSERT INTO `sp_place` VALUES ('2049', '170', ',1,170,2049,', '3', '枥木', 'Tochigi', 'mu', '9');
INSERT INTO `sp_place` VALUES ('2050', '170', ',1,170,2050,', '3', '鹿儿岛', 'Kagoshima', 'luerdao', '46');
INSERT INTO `sp_place` VALUES ('2051', '170', ',1,170,2051,', '3', '奈良', 'Nara', 'nailiang', '29');
INSERT INTO `sp_place` VALUES ('2052', '170', ',1,170,2052,', '3', '鸟取', 'Tottori', 'niaoqu', '31');
INSERT INTO `sp_place` VALUES ('2053', '170', ',1,170,2053,', '3', '岐阜', 'Gifu', 'fu', '21');
INSERT INTO `sp_place` VALUES ('2054', '170', ',1,170,2054,', '3', '埼玉', 'Saitama', '', '11');
INSERT INTO `sp_place` VALUES ('2055', '170', ',1,170,2055,', '3', '千叶', 'Chiba', 'qianye', '12');
INSERT INTO `sp_place` VALUES ('2056', '170', ',1,170,2056,', '3', '青森', 'Aomori', 'qingsen', '2');
INSERT INTO `sp_place` VALUES ('2057', '170', ',1,170,2057,', '3', '秋田', 'Akita', 'qiutian', '5');
INSERT INTO `sp_place` VALUES ('2058', '170', ',1,170,2058,', '3', '群马', 'Gunma', 'qunma', '10');
INSERT INTO `sp_place` VALUES ('2059', '170', ',1,170,2059,', '3', '三重', 'Mie', 'sanzhong', '24');
INSERT INTO `sp_place` VALUES ('2060', '170', ',1,170,2060,', '3', '山口', 'Yamaguchi', 'shankou', '35');
INSERT INTO `sp_place` VALUES ('2061', '170', ',1,170,2061,', '3', '山梨', 'Yamanashi', 'shanli', '19');
INSERT INTO `sp_place` VALUES ('2062', '170', ',1,170,2062,', '3', '山形', 'Yamagata', 'shanxing', '6');
INSERT INTO `sp_place` VALUES ('2063', '170', ',1,170,2063,', '3', '神奈川', 'Kanagawa', 'shennaichuan', '14');
INSERT INTO `sp_place` VALUES ('2064', '170', ',1,170,2064,', '3', '石川', 'Ishikawa', 'shichuan', '17');
INSERT INTO `sp_place` VALUES ('2065', '170', ',1,170,2065,', '3', '香川', 'Kagawa', 'xiangchuan', '37');
INSERT INTO `sp_place` VALUES ('2066', '170', ',1,170,2066,', '3', '新潟', 'Niigata', 'xin', '15');
INSERT INTO `sp_place` VALUES ('2067', '170', ',1,170,2067,', '3', '熊本', 'Kumamoto', 'xiongben', '43');
INSERT INTO `sp_place` VALUES ('2068', '170', ',1,170,2068,', '3', '岩手', 'Iwate', 'yanshou', '3');
INSERT INTO `sp_place` VALUES ('2069', '170', ',1,170,2069,', '3', '长崎', 'Nagasaki', 'changqi', '42');
INSERT INTO `sp_place` VALUES ('2070', '170', ',1,170,2070,', '3', '长野', 'Nagano', 'changye', '20');
INSERT INTO `sp_place` VALUES ('2071', '170', ',1,170,2071,', '3', '滋贺', 'Shiga', 'zihe', '25');
INSERT INTO `sp_place` VALUES ('2072', '170', ',1,170,2072,', '3', '佐贺', 'Saga', 'zuohe', '41');
INSERT INTO `sp_place` VALUES ('2073', '171', ',2,171,2073,', '3', '北博滕', 'Norrbottens', 'beibo', 'BD');
INSERT INTO `sp_place` VALUES ('2074', '171', ',2,171,2074,', '3', '布莱金厄', 'Blekinge', 'bulaijine', 'K');
INSERT INTO `sp_place` VALUES ('2075', '171', ',2,171,2075,', '3', '达拉纳', 'Dalarnas', 'dalana', 'DLN');
INSERT INTO `sp_place` VALUES ('2076', '171', ',2,171,2076,', '3', '东约特兰', 'Ustergotland', 'dongyuetelan', 'UGL');
INSERT INTO `sp_place` VALUES ('2077', '171', ',2,171,2077,', '3', '厄勒布鲁', 'Orebro', 'elebulu', 'T');
INSERT INTO `sp_place` VALUES ('2078', '171', ',2,171,2078,', '3', '哥得兰', 'Gotlands', 'gedelan', 'I');
INSERT INTO `sp_place` VALUES ('2079', '171', ',2,171,2079,', '3', '哈兰', 'Hallands', 'halan', 'N');
INSERT INTO `sp_place` VALUES ('2080', '171', ',2,171,2080,', '3', '卡尔马', 'Kalmar', 'kaerma', 'H');
INSERT INTO `sp_place` VALUES ('2081', '171', ',2,171,2081,', '3', '克鲁努贝里', 'Kronobergs', 'kelunubeili', 'G');
INSERT INTO `sp_place` VALUES ('2082', '171', ',2,171,2082,', '3', '南曼兰', 'Sodermanlands', 'nanmanlan', 'D');
INSERT INTO `sp_place` VALUES ('2083', '171', ',2,171,2083,', '3', '斯德哥尔摩', 'Stockholms', 'sidegeermo', 'AB');
INSERT INTO `sp_place` VALUES ('2084', '171', ',2,171,2084,', '3', '斯科耐', 'Skane', 'sikenai', 'M');
INSERT INTO `sp_place` VALUES ('2085', '171', ',2,171,2085,', '3', '韦姆兰', 'Varmlands', 'weimulan', 'S');
INSERT INTO `sp_place` VALUES ('2086', '171', ',2,171,2086,', '3', '乌普萨拉', 'Uppsala', 'wupusala', 'C');
INSERT INTO `sp_place` VALUES ('2087', '171', ',2,171,2087,', '3', '西博滕', 'Vasterbottens', 'xibo', 'AC');
INSERT INTO `sp_place` VALUES ('2088', '171', ',2,171,2088,', '3', '西曼兰', 'Vastmanlands', 'ximanlan', 'U');
INSERT INTO `sp_place` VALUES ('2089', '171', ',2,171,2089,', '3', '西诺尔兰', 'Vasternorrlands', 'xinuoerlan', 'Y');
INSERT INTO `sp_place` VALUES ('2090', '171', ',2,171,2090,', '3', '西约特兰', 'Vastra Gotalands', 'xiyuetelan', 'O');
INSERT INTO `sp_place` VALUES ('2091', '171', ',2,171,2091,', '3', '延雪平', 'Jonkopings', 'yanxueping', 'F');
INSERT INTO `sp_place` VALUES ('2092', '171', ',2,171,2092,', '3', '耶夫勒堡', 'Gavleborgs', 'yefulebao', 'X');
INSERT INTO `sp_place` VALUES ('2093', '171', ',2,171,2093,', '3', '耶姆特兰', 'Jamtlands', 'yemutelan', 'Z');
INSERT INTO `sp_place` VALUES ('2094', '172', ',2,172,2094,', '3', '阿尔高', 'Aargau', 'aergao', 'AG');
INSERT INTO `sp_place` VALUES ('2095', '172', ',2,172,2095,', '3', '巴塞尔城市', 'Basel－Sstadt', 'basaierchengshi', 'BS');
INSERT INTO `sp_place` VALUES ('2096', '172', ',2,172,2096,', '3', '巴塞尔乡村', 'Basel Landschaft', 'basaierxiangcun', 'BL');
INSERT INTO `sp_place` VALUES ('2097', '172', ',2,172,2097,', '3', '伯尔尼', 'Bern', 'boerni', 'BE');
INSERT INTO `sp_place` VALUES ('2098', '172', ',2,172,2098,', '3', '楚格', 'Zug', 'chuge', 'ZG');
INSERT INTO `sp_place` VALUES ('2099', '172', ',2,172,2099,', '3', '弗里堡', 'Freiburg', 'fulibao', 'FR');
INSERT INTO `sp_place` VALUES ('2100', '172', ',2,172,2100,', '3', '格拉鲁斯', 'Glarus', 'gelalusi', 'GL');
INSERT INTO `sp_place` VALUES ('2101', '172', ',2,172,2101,', '3', '格劳宾登', 'Graubünden', 'gelaobindeng', 'GR');
INSERT INTO `sp_place` VALUES ('2102', '172', ',2,172,2102,', '3', '卢塞恩', 'Luzern', 'lusaien', 'LU');
INSERT INTO `sp_place` VALUES ('2103', '172', ',2,172,2103,', '3', '洛桑', 'Lausanne', 'luosang', 'LA');
INSERT INTO `sp_place` VALUES ('2104', '172', ',2,172,2104,', '3', '纳沙泰尔', 'Neuchatel', 'nashataier', 'NE');
INSERT INTO `sp_place` VALUES ('2105', '172', ',2,172,2105,', '3', '内阿彭策尔', 'Appenzell Innerrhodn', 'neiapengceer', 'AI');
INSERT INTO `sp_place` VALUES ('2106', '172', ',2,172,2106,', '3', '日内瓦', 'Geneve', 'rineiwa', 'GE');
INSERT INTO `sp_place` VALUES ('2107', '172', ',2,172,2107,', '3', '汝拉', 'Jura', 'rula', 'JU');
INSERT INTO `sp_place` VALUES ('2108', '172', ',2,172,2108,', '3', '沙夫豪森', 'Schaffhausen', 'shafuhaosen', 'SH');
INSERT INTO `sp_place` VALUES ('2109', '172', ',2,172,2109,', '3', '上瓦尔登', 'Obwalden', 'shangwaerdeng', 'OW');
INSERT INTO `sp_place` VALUES ('2110', '172', ',2,172,2110,', '3', '圣加仑', 'St.Gallen', 'shengjialun', 'SG');
INSERT INTO `sp_place` VALUES ('2111', '172', ',2,172,2111,', '3', '施维茨', 'Schwyz', 'shiweici', 'SZ');
INSERT INTO `sp_place` VALUES ('2112', '172', ',2,172,2112,', '3', '苏黎世', 'Zurich', 'sulishi', 'ZH');
INSERT INTO `sp_place` VALUES ('2113', '172', ',2,172,2113,', '3', '索洛图恩', 'Solothurn', 'suoluotuen', 'SO');
INSERT INTO `sp_place` VALUES ('2114', '172', ',2,172,2114,', '3', '提契诺', 'Ticino', 'tiqinuo', 'TI');
INSERT INTO `sp_place` VALUES ('2115', '172', ',2,172,2115,', '3', '图尔高', 'Thurgau', 'tuergao', 'TG');
INSERT INTO `sp_place` VALUES ('2116', '172', ',2,172,2116,', '3', '瓦莱', 'Wallis', 'walai', 'VS');
INSERT INTO `sp_place` VALUES ('2117', '172', ',2,172,2117,', '3', '外阿彭策尔', 'Appenzell Ausserrhon', 'waiapengceer', 'AR');
INSERT INTO `sp_place` VALUES ('2118', '172', ',2,172,2118,', '3', '沃', 'Vaud', 'wo', 'VD');
INSERT INTO `sp_place` VALUES ('2119', '172', ',2,172,2119,', '3', '乌里', 'Uri', 'wuli', 'UR');
INSERT INTO `sp_place` VALUES ('2120', '172', ',2,172,2120,', '3', '下瓦尔登', 'Nidwalden', 'xiawaerdeng', 'NW');
INSERT INTO `sp_place` VALUES ('2121', '173', ',4,173,2121,', '3', '阿波帕', 'Apopa', 'abopa', 'APO');
INSERT INTO `sp_place` VALUES ('2122', '173', ',4,173,2122,', '3', '阿瓦查潘', 'Ahuachapan', 'awachapan', 'AH');
INSERT INTO `sp_place` VALUES ('2123', '173', ',4,173,2123,', '3', '滨海', 'Litoral', 'binhai', 'LI');
INSERT INTO `sp_place` VALUES ('2124', '173', ',4,173,2124,', '3', '查拉特南戈', 'Chalatenango', 'chalatenange', 'CH');
INSERT INTO `sp_place` VALUES ('2125', '173', ',4,173,2125,', '3', '德尔加多', 'Delgado', 'deerjiaduo', 'DE');
INSERT INTO `sp_place` VALUES ('2126', '173', ',4,173,2126,', '3', '基埃-恩特姆', 'Kie-Ntem', 'jiaientemu', 'KN');
INSERT INTO `sp_place` VALUES ('2127', '173', ',4,173,2127,', '3', '卡瓦尼亚斯', 'Cabanas', 'kawaniyasi', 'CA');
INSERT INTO `sp_place` VALUES ('2128', '173', ',4,173,2128,', '3', '库斯卡特兰', 'Cuscatlan', 'kusikatelan', 'CU');
INSERT INTO `sp_place` VALUES ('2129', '173', ',4,173,2129,', '3', '拉巴斯', 'La Paz', 'labasi', 'PZ');
INSERT INTO `sp_place` VALUES ('2130', '173', ',4,173,2130,', '3', '拉利伯塔德', 'La Libertad', 'lalibotade', 'LB');
INSERT INTO `sp_place` VALUES ('2131', '173', ',4,173,2131,', '3', '拉乌尼翁', 'La Union', 'lawuniweng', 'UN');
INSERT INTO `sp_place` VALUES ('2132', '173', ',4,173,2132,', '3', '梅基卡诺斯', 'Mejicanos', 'meijikanuosi', 'MEJ');
INSERT INTO `sp_place` VALUES ('2133', '173', ',4,173,2133,', '3', '莫拉桑', 'Morazan', 'molasang', 'MO');
INSERT INTO `sp_place` VALUES ('2134', '173', ',4,173,2134,', '3', '圣安娜', 'Santa Ana', 'shenganna', 'SA');
INSERT INTO `sp_place` VALUES ('2135', '173', ',4,173,2135,', '3', '圣米格尔', 'San Miguel', 'shengmigeer', 'SM');
INSERT INTO `sp_place` VALUES ('2136', '173', ',4,173,2136,', '3', '圣萨尔瓦多', 'San Salvador', 'shengsaerwaduo', 'SS');
INSERT INTO `sp_place` VALUES ('2137', '173', ',4,173,2137,', '3', '圣维森特', 'San Vicente', 'shengweisente', 'SV');
INSERT INTO `sp_place` VALUES ('2138', '173', ',4,173,2138,', '3', '松索纳特', 'Sonsonate', 'songsuonate', 'SO');
INSERT INTO `sp_place` VALUES ('2139', '173', ',4,173,2139,', '3', '索亚潘戈', 'Soyapango', 'suoyapange', 'SOY');
INSERT INTO `sp_place` VALUES ('2140', '173', ',4,173,2140,', '3', '韦莱-恩萨斯', 'Wele-Nzas', 'weilaiensasi', 'WN');
INSERT INTO `sp_place` VALUES ('2141', '173', ',4,173,2141,', '3', '乌苏卢坦', 'Usulutan', 'wusulutan', 'US');
INSERT INTO `sp_place` VALUES ('2142', '173', ',4,173,2142,', '3', '伊洛潘戈', 'Ilopango', 'yiluopange', 'IL');
INSERT INTO `sp_place` VALUES ('2143', '173', ',4,173,2143,', '3', '中南', 'Centro Sur', 'zhongnan', 'CS');
INSERT INTO `sp_place` VALUES ('2144', '175', ',2,175,2144,', '3', '贝尔格莱德', 'Beograd', 'beiergelaide', 'BEG');
INSERT INTO `sp_place` VALUES ('2145', '175', ',2,175,2145,', '3', '波德戈里察', 'Podgorica', 'bodegelicha', 'POD');
INSERT INTO `sp_place` VALUES ('2146', '175', ',2,175,2146,', '3', '克拉古涅瓦茨', 'Kragujevac', 'kelaguniewaci', 'KGV');
INSERT INTO `sp_place` VALUES ('2147', '175', ',2,175,2147,', '3', '尼什', 'Nis', 'nishi', 'INI');
INSERT INTO `sp_place` VALUES ('2148', '175', ',2,175,2148,', '3', '诺维萨德', 'Novi Sad', 'nuoweisade', 'NVS');
INSERT INTO `sp_place` VALUES ('2149', '175', ',2,175,2149,', '3', '普里什蒂纳', 'Pristina', 'pulishidina', 'PRN');
INSERT INTO `sp_place` VALUES ('2150', '175', ',2,175,2150,', '3', '苏博蒂察', 'Subotica', 'subodicha', 'SUB');
INSERT INTO `sp_place` VALUES ('2151', '175', ',2,175,2151,', '3', '泽蒙', 'Zemun', 'zemeng', 'ZEM');
INSERT INTO `sp_place` VALUES ('2152', '176', ',3,176,2152,', '3', '北部', 'Northern', 'beibu', 'N');
INSERT INTO `sp_place` VALUES ('2153', '176', ',3,176,2153,', '3', '东部', 'Eastern', 'dongbu', 'E');
INSERT INTO `sp_place` VALUES ('2154', '176', ',3,176,2154,', '3', '南部', 'Southern', 'nanbu', 'S');
INSERT INTO `sp_place` VALUES ('2155', '176', ',3,176,2155,', '3', '西部区', 'Western', 'xibuqu', 'W');
INSERT INTO `sp_place` VALUES ('2156', '177', ',3,177,2156,', '3', '达喀尔', 'Dakar', 'dakaer', 'DA');
INSERT INTO `sp_place` VALUES ('2157', '177', ',3,177,2157,', '3', '法蒂克', 'Fatick', 'fadike', 'FA');
INSERT INTO `sp_place` VALUES ('2158', '177', ',3,177,2158,', '3', '济金绍尔', 'Ziguinchor', 'jijinshaoer', 'ZI');
INSERT INTO `sp_place` VALUES ('2159', '177', ',3,177,2159,', '3', '捷斯', 'Thies', 'jiesi', 'TH');
INSERT INTO `sp_place` VALUES ('2160', '177', ',3,177,2160,', '3', '久尔贝勒', 'Diourbel', 'jiuerbeile', 'DI');
INSERT INTO `sp_place` VALUES ('2161', '177', ',3,177,2161,', '3', '考拉克', 'Kaolack', 'kaolake', 'KA');
INSERT INTO `sp_place` VALUES ('2162', '177', ',3,177,2162,', '3', '科尔达', 'Kolda', 'keerda', 'KO');
INSERT INTO `sp_place` VALUES ('2163', '177', ',3,177,2163,', '3', '卢加', 'Louga', 'lujia', 'LO');
INSERT INTO `sp_place` VALUES ('2164', '177', ',3,177,2164,', '3', '马塔姆', 'Matam', 'matamu', 'MA');
INSERT INTO `sp_place` VALUES ('2165', '177', ',3,177,2165,', '3', '圣路易', 'Saint-Louis', 'shengluyi', 'SL');
INSERT INTO `sp_place` VALUES ('2166', '177', ',3,177,2166,', '3', '坦巴昆达', 'Tambacounda', 'tanbakunda', 'TA');
INSERT INTO `sp_place` VALUES ('2167', '178', ',1,178,2167,', '3', '法马古斯塔', 'Famagusta', 'famagusita', '4');
INSERT INTO `sp_place` VALUES ('2168', '178', ',1,178,2168,', '3', '凯里尼亚', 'Kyrenia', 'kailiniya', '6');
INSERT INTO `sp_place` VALUES ('2169', '178', ',1,178,2169,', '3', '拉纳卡', 'Larnaca', 'lanaka', '3');
INSERT INTO `sp_place` VALUES ('2170', '178', ',1,178,2170,', '3', '利马索尔', 'Limassol', 'limasuoer', '2');
INSERT INTO `sp_place` VALUES ('2171', '178', ',1,178,2171,', '3', '尼科西亚', 'Nicosia', 'nikexiya', '1');
INSERT INTO `sp_place` VALUES ('2172', '178', ',1,178,2172,', '3', '帕福斯', 'Pafos', 'pafusi', '5');
INSERT INTO `sp_place` VALUES ('2173', '180', ',1,180,2173,', '3', '阿尔阿尔', 'Arar', 'aeraer', 'ARA');
INSERT INTO `sp_place` VALUES ('2174', '180', ',1,180,2174,', '3', '艾卜哈', 'Abha', 'aiboha', 'AHB');
INSERT INTO `sp_place` VALUES ('2175', '180', ',1,180,2175,', '3', '巴哈', 'Al Bahah', 'baha', 'BH');
INSERT INTO `sp_place` VALUES ('2176', '180', ',1,180,2176,', '3', '布赖代', 'Buraydah', 'bulaidai', 'BUR');
INSERT INTO `sp_place` VALUES ('2177', '180', ',1,180,2177,', '3', '达曼', 'Dammam', 'daman', 'DAM');
INSERT INTO `sp_place` VALUES ('2178', '180', ',1,180,2178,', '3', '哈费尔巴廷', 'Hafar al-Batin', 'hafeierbating', 'HBT');
INSERT INTO `sp_place` VALUES ('2179', '180', ',1,180,2179,', '3', '哈伊勒', 'Hail', 'hayile', 'HL');
INSERT INTO `sp_place` VALUES ('2180', '180', ',1,180,2180,', '3', '海米斯穆谢特', 'Khamis Mushayt', 'haimisimuxiete', 'KMX');
INSERT INTO `sp_place` VALUES ('2181', '180', ',1,180,2181,', '3', '海耶', 'Al-Kharj', 'haiye', 'AKH');
INSERT INTO `sp_place` VALUES ('2182', '180', ',1,180,2182,', '3', '胡富夫', 'Al-Hufuf', 'hufufu', 'HFF');
INSERT INTO `sp_place` VALUES ('2183', '180', ',1,180,2183,', '3', '吉达', 'Jiddah', 'jida', 'JED');
INSERT INTO `sp_place` VALUES ('2184', '180', ',1,180,2184,', '3', '吉赞', 'Jizan', 'jizan', 'JZ');
INSERT INTO `sp_place` VALUES ('2185', '180', ',1,180,2185,', '3', '利雅得', 'Riyad', 'liyade', 'RD');
INSERT INTO `sp_place` VALUES ('2186', '180', ',1,180,2186,', '3', '麦地那', 'Medina', 'maidina', 'MED');
INSERT INTO `sp_place` VALUES ('2187', '180', ',1,180,2187,', '3', '麦加', 'Makkah', 'maijia', 'ML');
INSERT INTO `sp_place` VALUES ('2188', '180', ',1,180,2188,', '3', '姆巴拉兹', 'Al-Mubarraz', 'mubalazi', 'MBR');
INSERT INTO `sp_place` VALUES ('2189', '180', ',1,180,2189,', '3', '纳季兰', 'Najran', 'najilan', 'NR');
INSERT INTO `sp_place` VALUES ('2190', '180', ',1,180,2190,', '3', '塞卡卡', 'Sakaka', 'saikaka', 'SAK');
INSERT INTO `sp_place` VALUES ('2191', '180', ',1,180,2191,', '3', '塔布克', 'Tabuk', 'tabuke', 'TB');
INSERT INTO `sp_place` VALUES ('2192', '180', ',1,180,2192,', '3', '塔伊夫', 'At Tarif', 'tayifu', 'TAR');
INSERT INTO `sp_place` VALUES ('2193', '180', ',1,180,2193,', '3', '延布', 'Yanbu al-Bahr', 'yanbu', 'YNB');
INSERT INTO `sp_place` VALUES ('2194', '180', ',1,180,2194,', '3', '朱拜勒', 'Al-Jubayl', 'zhubaile', 'JBI');
INSERT INTO `sp_place` VALUES ('2195', '189', ',1,189,2195,', '3', '阿努拉德普勒', 'Anuradhapura', 'anuladepule', 'ADP');
INSERT INTO `sp_place` VALUES ('2196', '189', ',1,189,2196,', '3', '安帕赖', 'Ampara', 'anpalai', 'AMP');
INSERT INTO `sp_place` VALUES ('2197', '189', ',1,189,2197,', '3', '巴杜勒', 'Badulla', 'badule', 'BAD');
INSERT INTO `sp_place` VALUES ('2198', '189', ',1,189,2198,', '3', '拜蒂克洛', 'Batticaloa', 'baidikeluo', 'BTC');
INSERT INTO `sp_place` VALUES ('2199', '189', ',1,189,2199,', '3', '波隆纳鲁沃', 'Polonnaruwa', 'bolongnaluwo', 'POL');
INSERT INTO `sp_place` VALUES ('2200', '189', ',1,189,2200,', '3', '汉班托特', 'Hambantota', 'hanbantuote', 'HBA');
INSERT INTO `sp_place` VALUES ('2201', '189', ',1,189,2201,', '3', '基里诺奇', 'Kilinochchi', 'jilinuoqi', 'KIL');
INSERT INTO `sp_place` VALUES ('2202', '189', ',1,189,2202,', '3', '加勒', 'Galle', 'jiale', 'GAL');
INSERT INTO `sp_place` VALUES ('2203', '189', ',1,189,2203,', '3', '加姆珀哈', 'Gampaha', 'jiamuha', 'GAM');
INSERT INTO `sp_place` VALUES ('2204', '189', ',1,189,2204,', '3', '贾夫纳', 'Jaffna', 'jiafuna', 'JAF');
INSERT INTO `sp_place` VALUES ('2205', '189', ',1,189,2205,', '3', '卡卢特勒', 'Kalutara', 'kalutele', 'KLT');
INSERT INTO `sp_place` VALUES ('2206', '189', ',1,189,2206,', '3', '凯格勒', 'Kegalle', 'kaigele', 'KEG');
INSERT INTO `sp_place` VALUES ('2207', '189', ',1,189,2207,', '3', '康提', 'Kandy', 'kangti', 'KAN');
INSERT INTO `sp_place` VALUES ('2208', '189', ',1,189,2208,', '3', '科伦坡', 'Colombo', 'kelunpo', 'CMB');
INSERT INTO `sp_place` VALUES ('2209', '189', ',1,189,2209,', '3', '库鲁内格勒', 'Kurunegala', 'kuluneigele', 'KUR');
INSERT INTO `sp_place` VALUES ('2210', '189', ',1,189,2210,', '3', '拉特纳普勒', 'Ratnapura', 'latenapule', 'RAT');
INSERT INTO `sp_place` VALUES ('2211', '189', ',1,189,2211,', '3', '马纳尔', 'Mannar', 'manaer', 'MAN');
INSERT INTO `sp_place` VALUES ('2212', '189', ',1,189,2212,', '3', '马特莱', 'Matale', 'matelai', 'MAT');
INSERT INTO `sp_place` VALUES ('2213', '189', ',1,189,2213,', '3', '马特勒', 'Matara', 'matele', 'MAA');
INSERT INTO `sp_place` VALUES ('2214', '189', ',1,189,2214,', '3', '莫讷勒格勒', 'Monaragala', 'molegele', 'MON');
INSERT INTO `sp_place` VALUES ('2215', '189', ',1,189,2215,', '3', '穆莱蒂武', 'Mullathivu', 'mulaidiwu', 'MUL');
INSERT INTO `sp_place` VALUES ('2216', '189', ',1,189,2216,', '3', '努沃勒埃利耶', 'Nuwara Eliya', 'nuwoleailiye', 'NUE');
INSERT INTO `sp_place` VALUES ('2217', '189', ',1,189,2217,', '3', '普塔勒姆', 'Puttalam', 'putalemu', 'PUT');
INSERT INTO `sp_place` VALUES ('2218', '189', ',1,189,2218,', '3', '亭可马里', 'Trincomalee', 'tingkemali', 'TRR');
INSERT INTO `sp_place` VALUES ('2219', '189', ',1,189,2219,', '3', '瓦武尼亚', 'Vavuniya', 'wawuniya', 'VAV');
INSERT INTO `sp_place` VALUES ('2220', '190', ',2,190,2220,', '3', '班斯卡-比斯特里察', 'Banskobystricky', 'bansikabisitelicha', 'BBY');
INSERT INTO `sp_place` VALUES ('2221', '190', ',2,190,2221,', '3', '布拉迪斯拉发', 'Bratislavsky', 'buladisilafa', 'BTS');
INSERT INTO `sp_place` VALUES ('2222', '190', ',2,190,2222,', '3', '科希策', 'Koricky', 'kexice', 'KOR');
INSERT INTO `sp_place` VALUES ('2223', '190', ',2,190,2223,', '3', '尼特拉', 'Nitriansky', 'nitela', 'NRA');
INSERT INTO `sp_place` VALUES ('2224', '190', ',2,190,2224,', '3', '普雷绍夫', 'Prerovsky', 'puleishaofu', 'POV');
INSERT INTO `sp_place` VALUES ('2225', '190', ',2,190,2225,', '3', '日利纳', 'Rilinsky', 'rilina', 'RIL');
INSERT INTO `sp_place` VALUES ('2226', '190', ',2,190,2226,', '3', '特尔纳瓦', 'Trnavsky', 'teernawa', 'TNA');
INSERT INTO `sp_place` VALUES ('2227', '190', ',2,190,2227,', '3', '特伦钦', 'Trenriansky', 'telunqin', 'TRE');
INSERT INTO `sp_place` VALUES ('2228', '191', ',2,191,2228,', '3', '奥巴尔诺-克拉', 'Obalno-kraska', 'aobaernuokela', 'OKR');
INSERT INTO `sp_place` VALUES ('2229', '191', ',2,191,2229,', '3', '奥斯雷德涅斯洛文', 'Osrednjeslovenska', 'aosileideniesiluowen', 'OSR');
INSERT INTO `sp_place` VALUES ('2230', '191', ',2,191,2230,', '3', '波德拉夫', 'Podravska', 'bodelafu', 'POD');
INSERT INTO `sp_place` VALUES ('2231', '191', ',2,191,2231,', '3', '波穆尔', 'Pomurska', 'bomuer', 'POM');
INSERT INTO `sp_place` VALUES ('2232', '191', ',2,191,2232,', '3', '多雷尼', 'Dolenjska', 'duoleini', 'DLJ');
INSERT INTO `sp_place` VALUES ('2233', '191', ',2,191,2233,', '3', '戈雷尼', 'Gorenjska', 'geleini', 'GSZ');
INSERT INTO `sp_place` VALUES ('2234', '191', ',2,191,2234,', '3', '戈里', 'Goriska', 'geli', 'GSK');
INSERT INTO `sp_place` VALUES ('2235', '191', ',2,191,2235,', '3', '科洛', 'Koroska', 'keluo', 'KOR');
INSERT INTO `sp_place` VALUES ('2236', '191', ',2,191,2236,', '3', '诺特拉尼', 'Notranjsko-kraska', 'nuotelani', 'NKR');
INSERT INTO `sp_place` VALUES ('2237', '191', ',2,191,2237,', '3', '萨维尼', 'Savinjska', 'saweini', 'SAV');
INSERT INTO `sp_place` VALUES ('2238', '191', ',2,191,2238,', '3', '斯波德涅波萨夫', 'Spodnjeposavska', 'sibodeniebosafu', 'SPO');
INSERT INTO `sp_place` VALUES ('2239', '191', ',2,191,2239,', '3', '扎萨夫', 'Zasavska', 'zhasafu', 'ZAS');
INSERT INTO `sp_place` VALUES ('2240', '194', ',3,194,2240,', '3', '北部', 'Ash-Shamaliyah', 'beibu', 'ASH');
INSERT INTO `sp_place` VALUES ('2241', '194', ',3,194,2241,', '3', '赤道', 'Al-Istiwaiyah', 'chidao', 'SIS');
INSERT INTO `sp_place` VALUES ('2242', '194', ',3,194,2242,', '3', '达尔富尔', 'Darfur', 'daerfuer', 'SDA');
INSERT INTO `sp_place` VALUES ('2243', '194', ',3,194,2243,', '3', '东部', 'Ash-Sharqiyah', 'dongbu', 'SHA');
INSERT INTO `sp_place` VALUES ('2244', '194', ',3,194,2244,', '3', '加扎勒河', 'Bahr al-Ghazal', 'jiazhalehe', 'SBG');
INSERT INTO `sp_place` VALUES ('2245', '194', ',3,194,2245,', '3', '喀土穆', 'Al-Khartum', 'katumu', 'KRT');
INSERT INTO `sp_place` VALUES ('2246', '194', ',3,194,2246,', '3', '科尔多凡', 'Kurdufan', 'keerduofan', 'GKU');
INSERT INTO `sp_place` VALUES ('2247', '194', ',3,194,2247,', '3', '上尼罗', 'Aali an-Nil', 'shangniluo', 'ANB');
INSERT INTO `sp_place` VALUES ('2248', '194', ',3,194,2248,', '3', '中部', 'Al Wasta', 'zhongbu', 'WDH');
INSERT INTO `sp_place` VALUES ('2249', '195', ',5,195,2249,', '3', '布罗科蓬多', 'Brokopondo', 'buluokepengduo', 'BR');
INSERT INTO `sp_place` VALUES ('2250', '195', ',5,195,2250,', '3', '科罗尼', 'Coronie', 'keluoni', 'CR');
INSERT INTO `sp_place` VALUES ('2251', '195', ',5,195,2251,', '3', '科默韦讷', 'Commewijne', 'kemowei', 'CM');
INSERT INTO `sp_place` VALUES ('2252', '195', ',5,195,2252,', '3', '马罗韦讷', 'Marowijne', 'maluowei', 'MA');
INSERT INTO `sp_place` VALUES ('2253', '195', ',5,195,2253,', '3', '尼克里', 'Nickerie', 'nikeli', 'NI');
INSERT INTO `sp_place` VALUES ('2254', '195', ',5,195,2254,', '3', '帕拉', 'Para', 'pala', 'PA');
INSERT INTO `sp_place` VALUES ('2255', '195', ',5,195,2255,', '3', '帕拉马里博', 'Paramaribo', 'palamalibo', 'PM');
INSERT INTO `sp_place` VALUES ('2256', '195', ',5,195,2256,', '3', '萨拉马卡', 'Saramacca', 'salamaka', 'SA');
INSERT INTO `sp_place` VALUES ('2257', '195', ',5,195,2257,', '3', '瓦尼卡', 'Wanica', 'wanika', 'WA');
INSERT INTO `sp_place` VALUES ('2258', '195', ',5,195,2258,', '3', '西帕里韦尼', 'Sipaliwini', 'xipaliweini', 'SI');
INSERT INTO `sp_place` VALUES ('2259', '196', ',6,196,2259,', '3', '瓜达尔卡纳尔', 'Guadalcanal', 'guadaerkanaer', 'GC');
INSERT INTO `sp_place` VALUES ('2260', '196', ',6,196,2260,', '3', '霍尼亚拉', 'Honiara', 'huoniyala', 'HO');
INSERT INTO `sp_place` VALUES ('2261', '196', ',6,196,2261,', '3', '拉纳尔和贝罗纳', 'Rennell and Bellona', 'lanaerhebeiluona', 'RB');
INSERT INTO `sp_place` VALUES ('2262', '196', ',6,196,2262,', '3', '马基拉', 'Makira', 'majila', 'MK');
INSERT INTO `sp_place` VALUES ('2263', '196', ',6,196,2263,', '3', '马莱塔', 'Malaita', 'malaita', 'ML');
INSERT INTO `sp_place` VALUES ('2264', '196', ',6,196,2264,', '3', '乔伊索', 'Choiseul', 'qiaoyisuo', 'CH');
INSERT INTO `sp_place` VALUES ('2265', '196', ',6,196,2265,', '3', '泰莫图', 'Temotu', 'taimotu', 'TM');
INSERT INTO `sp_place` VALUES ('2266', '196', ',6,196,2266,', '3', '西部', 'Western', 'xibu', 'WE');
INSERT INTO `sp_place` VALUES ('2267', '196', ',6,196,2267,', '3', '伊萨贝尔', 'Isabel', 'yisabeier', 'IS');
INSERT INTO `sp_place` VALUES ('2268', '196', ',6,196,2268,', '3', '中部群岛', 'Central Islands', 'zhongbuqundao', 'CE');
INSERT INTO `sp_place` VALUES ('2269', '198', ',1,198,2269,', '3', '杜尚别', 'Dushanbe', 'dushangbie', 'DYU');
INSERT INTO `sp_place` VALUES ('2270', '198', ',1,198,2270,', '3', '霍罗格', 'Khorugh', 'huoluoge', 'KHO');
INSERT INTO `sp_place` VALUES ('2271', '198', ',1,198,2271,', '3', '卡尼巴达姆', 'Kanibadam', 'kanibadamu', 'KAN');
INSERT INTO `sp_place` VALUES ('2272', '198', ',1,198,2272,', '3', '科法尔尼洪', 'Kofarnihon', 'kefaernihong', 'KOF');
INSERT INTO `sp_place` VALUES ('2273', '198', ',1,198,2273,', '3', '苦盏', 'Khujand', 'kuzhan', 'KHU');
INSERT INTO `sp_place` VALUES ('2274', '198', ',1,198,2274,', '3', '库尔干-秋别', 'Kurgan-Tjube', 'kuerganqiubie', 'KTJ');
INSERT INTO `sp_place` VALUES ('2275', '198', ',1,198,2275,', '3', '库洛布', 'Kulob', 'kuluobu', 'KLB');
INSERT INTO `sp_place` VALUES ('2276', '198', ',1,198,2276,', '3', '洛贡', 'Rogun', 'luogong', 'RGU');
INSERT INTO `sp_place` VALUES ('2277', '198', ',1,198,2277,', '3', '努雷克', 'Nurek', 'nuleike', 'NUR');
INSERT INTO `sp_place` VALUES ('2278', '198', ',1,198,2278,', '3', '彭吉肯特', 'Pendzhikent', 'pengjikente', 'PJK');
INSERT INTO `sp_place` VALUES ('2279', '198', ',1,198,2279,', '3', '萨班特', 'Sarband', 'sabante', 'SBA');
INSERT INTO `sp_place` VALUES ('2280', '198', ',1,198,2280,', '3', '塔博沙尔', 'Taboshar', 'taboshaer', 'TBS');
INSERT INTO `sp_place` VALUES ('2281', '198', ',1,198,2281,', '3', '图尔孙扎德', 'Tursunzade', 'tuersunzhade', 'TSZ');
INSERT INTO `sp_place` VALUES ('2282', '198', ',1,198,2282,', '3', '乌拉秋别', 'Ura-Tjube', 'wulaqiubie', 'UTJ');
INSERT INTO `sp_place` VALUES ('2283', '198', ',1,198,2283,', '3', '伊斯法拉', 'Isfara', 'yisifala', 'ISF');
INSERT INTO `sp_place` VALUES ('2284', '199', ',1,199,2284,', '3', '安纳乍能', 'Amnat Charoen', 'annazhaneng', '37');
INSERT INTO `sp_place` VALUES ('2285', '199', ',1,199,2285,', '3', '巴蜀', 'Prachuap Khiri Khan', 'bashu', '77');
INSERT INTO `sp_place` VALUES ('2286', '199', ',1,199,2286,', '3', '巴吞他尼', 'Pathum Thani', 'batuntani', '13');
INSERT INTO `sp_place` VALUES ('2287', '199', ',1,199,2287,', '3', '巴真', 'Prachin Buri', 'bazhen', '25');
INSERT INTO `sp_place` VALUES ('2288', '199', ',1,199,2288,', '3', '北碧', 'Kanchanaburi', 'beibi', '71');
INSERT INTO `sp_place` VALUES ('2289', '199', ',1,199,2289,', '3', '北标', 'Saraburi', 'beibiao', '19');
INSERT INTO `sp_place` VALUES ('2290', '199', ',1,199,2290,', '3', '北大年', 'Pattani', 'beidanian', '94');
INSERT INTO `sp_place` VALUES ('2291', '199', ',1,199,2291,', '3', '北揽', 'Samut Prakan', 'beilan', '11');
INSERT INTO `sp_place` VALUES ('2292', '199', ',1,199,2292,', '3', '北榄坡', 'Nakhon Sawan', 'beipo', '60');
INSERT INTO `sp_place` VALUES ('2293', '199', ',1,199,2293,', '3', '北柳', 'Chachoengsao', 'beiliu', '24');
INSERT INTO `sp_place` VALUES ('2294', '199', ',1,199,2294,', '3', '碧差汶', 'Phetchabun', 'bicha', '76');
INSERT INTO `sp_place` VALUES ('2295', '199', ',1,199,2295,', '3', '博达伦', 'Phatthalung', 'bodalun', '93');
INSERT INTO `sp_place` VALUES ('2296', '199', ',1,199,2296,', '3', '猜那', 'Chai Nat', 'caina', '18');
INSERT INTO `sp_place` VALUES ('2297', '199', ',1,199,2297,', '3', '猜也奔', 'Chaiyaphum', 'caiyeben', '36');
INSERT INTO `sp_place` VALUES ('2298', '199', ',1,199,2298,', '3', '程逸', 'Uttaradit', 'chengyi', '53');
INSERT INTO `sp_place` VALUES ('2299', '199', ',1,199,2299,', '3', '春蓬', 'Chumphon', 'chunpeng', '86');
INSERT INTO `sp_place` VALUES ('2300', '199', ',1,199,2300,', '3', '春武里', 'Chon Buri', 'chunwuli', '20');
INSERT INTO `sp_place` VALUES ('2301', '199', ',1,199,2301,', '3', '达', 'Tak', 'da', '63');
INSERT INTO `sp_place` VALUES ('2302', '199', ',1,199,2302,', '3', '达叻', 'Trat', 'da', '23');
INSERT INTO `sp_place` VALUES ('2303', '199', ',1,199,2303,', '3', '大城', 'Phra Nakhon Si Ayutthaya', 'dacheng', '14');
INSERT INTO `sp_place` VALUES ('2304', '199', ',1,199,2304,', '3', '董里', 'Trang', 'dongli', '92');
INSERT INTO `sp_place` VALUES ('2305', '199', ',1,199,2305,', '3', '佛丕', 'Phetchaburi', 'fo', '78');
INSERT INTO `sp_place` VALUES ('2306', '199', ',1,199,2306,', '3', '佛统', 'Nakhon Pathom', 'fotong', '73');
INSERT INTO `sp_place` VALUES ('2307', '199', ',1,199,2307,', '3', '甘烹碧', 'Kamphaeng Phet', 'ganpengbi', '62');
INSERT INTO `sp_place` VALUES ('2308', '199', ',1,199,2308,', '3', '红统', 'Ang Thong', 'hongtong', '15');
INSERT INTO `sp_place` VALUES ('2309', '199', ',1,199,2309,', '3', '华富里', 'Lop Buri', 'huafuli', '16');
INSERT INTO `sp_place` VALUES ('2310', '199', ',1,199,2310,', '3', '加拉信', 'Kalasin', 'jialaxin', '46');
INSERT INTO `sp_place` VALUES ('2311', '199', ',1,199,2311,', '3', '甲米', 'Krabi', 'jiami', '81');
INSERT INTO `sp_place` VALUES ('2312', '199', ',1,199,2312,', '3', '尖竹汶', 'Chanthaburi', 'jianzhu', '22');
INSERT INTO `sp_place` VALUES ('2313', '199', ',1,199,2313,', '3', '孔敬', 'Khon Kaen', 'kongjing', '40');
INSERT INTO `sp_place` VALUES ('2314', '199', ',1,199,2314,', '3', '拉农', 'Rayong', 'lanong', '21');
INSERT INTO `sp_place` VALUES ('2315', '199', ',1,199,2315,', '3', '廊开', 'Nong Khai', 'langkai', '43');
INSERT INTO `sp_place` VALUES ('2316', '199', ',1,199,2316,', '3', '廊莫那浦', 'Nong Bua Lamphu', 'langmonapu', '39');
INSERT INTO `sp_place` VALUES ('2317', '199', ',1,199,2317,', '3', '叻丕', 'Ratchaburi', '', '70');
INSERT INTO `sp_place` VALUES ('2318', '199', ',1,199,2318,', '3', '黎', 'Loei', 'li', '42');
INSERT INTO `sp_place` VALUES ('2319', '199', ',1,199,2319,', '3', '黎逸', 'Roi Et', 'liyi', '45');
INSERT INTO `sp_place` VALUES ('2320', '199', ',1,199,2320,', '3', '龙仔厝', 'Samut Sakhon', 'longzi', '74');
INSERT INTO `sp_place` VALUES ('2321', '199', ',1,199,2321,', '3', '罗勇', 'Ranong', 'luoyong', '85');
INSERT INTO `sp_place` VALUES ('2322', '199', ',1,199,2322,', '3', '洛坤', 'Nakhon Si Thammarat', 'luokun', '80');
INSERT INTO `sp_place` VALUES ('2323', '199', ',1,199,2323,', '3', '玛哈沙拉堪', 'Maha Sarakham', 'mahashalakan', '44');
INSERT INTO `sp_place` VALUES ('2324', '199', ',1,199,2324,', '3', '曼谷', 'Bangkok', 'mangu', '10');
INSERT INTO `sp_place` VALUES ('2325', '199', ',1,199,2325,', '3', '莫达汉', 'Mukdahan', 'modahan', '49');
INSERT INTO `sp_place` VALUES ('2326', '199', ',1,199,2326,', '3', '那空那育', 'Nakhon Nayok', 'nakongnayu', '26');
INSERT INTO `sp_place` VALUES ('2327', '199', ',1,199,2327,', '3', '那空帕农', 'Nakhon Phanom', 'nakongpanong', '48');
INSERT INTO `sp_place` VALUES ('2328', '199', ',1,199,2328,', '3', '难', 'Nan', 'nan', '55');
INSERT INTO `sp_place` VALUES ('2329', '199', ',1,199,2329,', '3', '南奔', 'Lamphun', 'nanben', '51');
INSERT INTO `sp_place` VALUES ('2330', '199', ',1,199,2330,', '3', '暖武里', 'Nonthaburi', 'nuanwuli', '12');
INSERT INTO `sp_place` VALUES ('2331', '199', ',1,199,2331,', '3', '帕', 'Phrae', 'pa', '54');
INSERT INTO `sp_place` VALUES ('2332', '199', ',1,199,2332,', '3', '帕尧', 'Phayao', 'payao', '56');
INSERT INTO `sp_place` VALUES ('2333', '199', ',1,199,2333,', '3', '攀牙', 'Phangnga', 'panya', '82');
INSERT INTO `sp_place` VALUES ('2334', '199', ',1,199,2334,', '3', '彭世洛', 'Phitsanulok', 'pengshiluo', '65');
INSERT INTO `sp_place` VALUES ('2335', '199', ',1,199,2335,', '3', '披集', 'Phichit', 'piji', '66');
INSERT INTO `sp_place` VALUES ('2336', '199', ',1,199,2336,', '3', '普吉', 'Phuket', 'puji', '83');
INSERT INTO `sp_place` VALUES ('2337', '199', ',1,199,2337,', '3', '清莱', 'Chiang Rai', 'qinglai', '57');
INSERT INTO `sp_place` VALUES ('2338', '199', ',1,199,2338,', '3', '清迈', 'Chiang Mai', 'qingmai', '50');
INSERT INTO `sp_place` VALUES ('2339', '199', ',1,199,2339,', '3', '色军', 'Sakon Nakhon', 'sejun', '47');
INSERT INTO `sp_place` VALUES ('2340', '199', ',1,199,2340,', '3', '沙敦', 'Satun', 'shadun', '91');
INSERT INTO `sp_place` VALUES ('2341', '199', ',1,199,2341,', '3', '沙缴', 'Sa Kaeo', 'shajiao', '27');
INSERT INTO `sp_place` VALUES ('2342', '199', ',1,199,2342,', '3', '四色菊', 'Si sa ket', 'siseju', '33');
INSERT INTO `sp_place` VALUES ('2343', '199', ',1,199,2343,', '3', '宋卡', 'Songkhla', 'songka', '90');
INSERT INTO `sp_place` VALUES ('2344', '199', ',1,199,2344,', '3', '素可泰', 'Sukhothai', 'suketai', '64');
INSERT INTO `sp_place` VALUES ('2345', '199', ',1,199,2345,', '3', '素叻', 'Surat Thani', 'su', '84');
INSERT INTO `sp_place` VALUES ('2346', '199', ',1,199,2346,', '3', '素林', 'Surin', 'sulin', '32');
INSERT INTO `sp_place` VALUES ('2347', '199', ',1,199,2347,', '3', '素攀武里', 'Suphan Buri', 'supanwuli', '72');
INSERT INTO `sp_place` VALUES ('2348', '199', ',1,199,2348,', '3', '陶公', 'Narathiwat', 'taogong', '96');
INSERT INTO `sp_place` VALUES ('2349', '199', ',1,199,2349,', '3', '乌隆', 'Udon Thani', 'wulong', '41');
INSERT INTO `sp_place` VALUES ('2350', '199', ',1,199,2350,', '3', '乌泰他尼', 'Uthai Thani', 'wutaitani', '61');
INSERT INTO `sp_place` VALUES ('2351', '199', ',1,199,2351,', '3', '乌汶', 'Ubon Ratchathani', 'wu', '34');
INSERT INTO `sp_place` VALUES ('2352', '199', ',1,199,2352,', '3', '武里南', 'Buri Ram', 'wulinan', '31');
INSERT INTO `sp_place` VALUES ('2353', '199', ',1,199,2353,', '3', '信武里', 'Sing Buri', 'xinwuli', '17');
INSERT INTO `sp_place` VALUES ('2354', '199', ',1,199,2354,', '3', '耶梭通', 'Yasothon', 'yesuotong', '35');
INSERT INTO `sp_place` VALUES ('2355', '199', ',1,199,2355,', '3', '也拉', 'Yala', 'yela', '95');
INSERT INTO `sp_place` VALUES ('2356', '199', ',1,199,2356,', '3', '夜丰颂', 'Mae Hong Son', 'yefengsong', '58');
INSERT INTO `sp_place` VALUES ('2357', '199', ',1,199,2357,', '3', '夜功', 'Samut Songkhram', 'yegong', '75');
INSERT INTO `sp_place` VALUES ('2358', '200', ',3,200,2358,', '3', '阿鲁沙', 'Arusha', 'alusha', 'AR');
INSERT INTO `sp_place` VALUES ('2359', '200', ',3,200,2359,', '3', '奔巴北', 'Kaskazini Pemba', 'benbabei', 'PN');
INSERT INTO `sp_place` VALUES ('2360', '200', ',3,200,2360,', '3', '奔巴南', 'Kusini Pemba', 'benbanan', 'PS');
INSERT INTO `sp_place` VALUES ('2361', '200', ',3,200,2361,', '3', '滨海', 'Pwani', 'binhai', 'PW');
INSERT INTO `sp_place` VALUES ('2362', '200', ',3,200,2362,', '3', '达累斯萨拉姆', 'Dar es Salaam', 'daleisisalamu', 'DS');
INSERT INTO `sp_place` VALUES ('2363', '200', ',3,200,2363,', '3', '多多马', 'Dodoma', 'duoduoma', 'DO');
INSERT INTO `sp_place` VALUES ('2364', '200', ',3,200,2364,', '3', '基戈马', 'Kigoma', 'jigema', 'KI');
INSERT INTO `sp_place` VALUES ('2365', '200', ',3,200,2365,', '3', '卡盖拉', 'Kagera', 'kagaila', 'KA');
INSERT INTO `sp_place` VALUES ('2366', '200', ',3,200,2366,', '3', '林迪', 'Lindi', 'lindi', 'LN');
INSERT INTO `sp_place` VALUES ('2367', '200', ',3,200,2367,', '3', '鲁夸', 'Rukwa', 'lukua', 'RK');
INSERT INTO `sp_place` VALUES ('2368', '200', ',3,200,2368,', '3', '鲁伍马', 'Ruvuma', 'luwuma', 'RV');
INSERT INTO `sp_place` VALUES ('2369', '200', ',3,200,2369,', '3', '马腊', 'Mara', 'mala', 'MR');
INSERT INTO `sp_place` VALUES ('2370', '200', ',3,200,2370,', '3', '曼亚拉', 'Manyara', 'manyala', 'MY');
INSERT INTO `sp_place` VALUES ('2371', '200', ',3,200,2371,', '3', '莫洛戈罗', 'Morogoro', 'moluogeluo', 'MO');
INSERT INTO `sp_place` VALUES ('2372', '200', ',3,200,2372,', '3', '姆贝亚', 'Mbeya', 'mubeiya', 'MB');
INSERT INTO `sp_place` VALUES ('2373', '200', ',3,200,2373,', '3', '姆特瓦拉', 'Mtwara', 'mutewala', 'MT');
INSERT INTO `sp_place` VALUES ('2374', '200', ',3,200,2374,', '3', '姆万扎', 'Mwanza', 'muwanzha', 'MW');
INSERT INTO `sp_place` VALUES ('2375', '200', ',3,200,2375,', '3', '乞力马扎罗', 'Kilimanjaro', 'qilimazhaluo', 'KJ');
INSERT INTO `sp_place` VALUES ('2376', '200', ',3,200,2376,', '3', '桑给巴尔', 'Zanzibar', 'sanggeibaer', 'ZN');
INSERT INTO `sp_place` VALUES ('2377', '200', ',3,200,2377,', '3', '桑给巴尔北', 'Kaskazini Unguja', 'sanggeibaerbei', 'UN');
INSERT INTO `sp_place` VALUES ('2378', '200', ',3,200,2378,', '3', '桑给巴尔南', 'Kusini Unguja', 'sanggeibaernan', 'US');
INSERT INTO `sp_place` VALUES ('2379', '200', ',3,200,2379,', '3', '桑给巴尔市和西', 'Mjini Magharibi', 'sanggeibaershihexi', 'MM');
INSERT INTO `sp_place` VALUES ('2380', '200', ',3,200,2380,', '3', '塔波拉', 'Tabora', 'tabola', 'TB');
INSERT INTO `sp_place` VALUES ('2381', '200', ',3,200,2381,', '3', '坦噶', 'Tanga', 'tanga', 'TN');
INSERT INTO `sp_place` VALUES ('2382', '200', ',3,200,2382,', '3', '辛吉达', 'Singida', 'xinjida', 'SI');
INSERT INTO `sp_place` VALUES ('2383', '200', ',3,200,2383,', '3', '欣延加', 'Shinyanga', 'xinyanjia', 'SH');
INSERT INTO `sp_place` VALUES ('2384', '200', ',3,200,2384,', '3', '伊林加', 'Iringa', 'yilinjia', 'IR');
INSERT INTO `sp_place` VALUES ('2385', '201', ',6,201,2385,', '3', '埃瓦', 'Eua', 'aiwa', 'E');
INSERT INTO `sp_place` VALUES ('2386', '201', ',6,201,2386,', '3', '哈派', 'Haapai', 'hapai', 'H');
INSERT INTO `sp_place` VALUES ('2387', '201', ',6,201,2387,', '3', '纽阿斯', 'Niuas', 'niuasi', 'N');
INSERT INTO `sp_place` VALUES ('2388', '201', ',6,201,2388,', '3', '汤加塔布', 'Tongatapu', 'tangjiatabu', 'T');
INSERT INTO `sp_place` VALUES ('2389', '201', ',6,201,2389,', '3', '瓦瓦乌', 'Vavau', 'wawawu', 'V');
INSERT INTO `sp_place` VALUES ('2390', '205', ',3,205,2390,', '3', '艾尔亚奈', 'Ariana', 'aieryanai', 'AR');
INSERT INTO `sp_place` VALUES ('2391', '205', ',3,205,2391,', '3', '巴杰', 'Beja', 'bajie', 'BJ');
INSERT INTO `sp_place` VALUES ('2392', '205', ',3,205,2392,', '3', '本阿鲁斯', 'Ben Arous', 'benalusi', 'BA');
INSERT INTO `sp_place` VALUES ('2393', '205', ',3,205,2393,', '3', '比塞大', 'Bizerte', 'bisaida', 'BI');
INSERT INTO `sp_place` VALUES ('2394', '205', ',3,205,2394,', '3', '吉比利', 'Kebili', 'jibili', 'KB');
INSERT INTO `sp_place` VALUES ('2395', '205', ',3,205,2395,', '3', '加贝斯', 'Gabes', 'jiabeisi', 'GB');
INSERT INTO `sp_place` VALUES ('2396', '205', ',3,205,2396,', '3', '加夫萨', 'Gafsa', 'jiafusa', 'GF');
INSERT INTO `sp_place` VALUES ('2397', '205', ',3,205,2397,', '3', '坚杜拜', 'Jendouba', 'jiandubai', 'JE');
INSERT INTO `sp_place` VALUES ('2398', '205', ',3,205,2398,', '3', '卡夫', 'Le Kef', 'kafu', 'LK');
INSERT INTO `sp_place` VALUES ('2399', '205', ',3,205,2399,', '3', '卡塞林', 'Kasserine', 'kasailin', 'KS');
INSERT INTO `sp_place` VALUES ('2400', '205', ',3,205,2400,', '3', '凯鲁万', 'Kairouan', 'kailuwan', 'KR');
INSERT INTO `sp_place` VALUES ('2401', '205', ',3,205,2401,', '3', '马赫迪耶', 'Mahdia', 'mahediye', 'MH');
INSERT INTO `sp_place` VALUES ('2402', '205', ',3,205,2402,', '3', '马努巴', 'Manouba', 'manuba', 'MN');
INSERT INTO `sp_place` VALUES ('2403', '205', ',3,205,2403,', '3', '梅德宁', 'Medenine', 'meidening', 'ME');
INSERT INTO `sp_place` VALUES ('2404', '205', ',3,205,2404,', '3', '莫纳斯提尔', 'Monastir', 'monasitier', 'MO');
INSERT INTO `sp_place` VALUES ('2405', '205', ',3,205,2405,', '3', '纳布勒', 'Nabeul', 'nabule', 'NA');
INSERT INTO `sp_place` VALUES ('2406', '205', ',3,205,2406,', '3', '斯法克斯', 'Sfax', 'sifakesi', 'SF');
INSERT INTO `sp_place` VALUES ('2407', '205', ',3,205,2407,', '3', '苏塞', 'Sousse', 'susai', 'SO');
INSERT INTO `sp_place` VALUES ('2408', '205', ',3,205,2408,', '3', '泰塔温', 'Tataouine', 'taitawen', 'TA');
INSERT INTO `sp_place` VALUES ('2409', '205', ',3,205,2409,', '3', '突尼斯', 'Tunis', 'tunisi', 'TU');
INSERT INTO `sp_place` VALUES ('2410', '205', ',3,205,2410,', '3', '托泽尔', 'Tozeur', 'tuozeer', 'TO');
INSERT INTO `sp_place` VALUES ('2411', '205', ',3,205,2411,', '3', '西迪布济德', 'Sidi Bouzid', 'xidibujide', 'SD');
INSERT INTO `sp_place` VALUES ('2412', '205', ',3,205,2412,', '3', '锡勒亚奈', 'Siliana', 'xileyanai', 'SL');
INSERT INTO `sp_place` VALUES ('2413', '205', ',3,205,2413,', '3', '宰格万', 'Zaghouan', 'zaigewan', 'ZA');
INSERT INTO `sp_place` VALUES ('2414', '207', ',1,207,2414,', '3', '阿达纳', 'Adana', 'adana', 'ADA');
INSERT INTO `sp_place` VALUES ('2415', '207', ',1,207,2415,', '3', '阿德亚曼', 'Adiyaman', 'adeyaman', 'ADI');
INSERT INTO `sp_place` VALUES ('2416', '207', ',1,207,2416,', '3', '阿尔达罕', 'Ardahan', 'aerdahan', 'ARD');
INSERT INTO `sp_place` VALUES ('2417', '207', ',1,207,2417,', '3', '阿尔特温', 'Artvin', 'aertewen', 'ART');
INSERT INTO `sp_place` VALUES ('2418', '207', ',1,207,2418,', '3', '阿菲永', 'Afyon', 'afeiyong', 'AFY');
INSERT INTO `sp_place` VALUES ('2419', '207', ',1,207,2419,', '3', '阿克萨赖', 'Aksaray', 'akesalai', 'AKS');
INSERT INTO `sp_place` VALUES ('2420', '207', ',1,207,2420,', '3', '阿勒', 'Agri', 'ale', 'AGR');
INSERT INTO `sp_place` VALUES ('2421', '207', ',1,207,2421,', '3', '阿马西亚', 'Amasya', 'amaxiya', 'AMA');
INSERT INTO `sp_place` VALUES ('2422', '207', ',1,207,2422,', '3', '埃迪尔内', 'Edirne', 'aidiernei', 'EDI');
INSERT INTO `sp_place` VALUES ('2423', '207', ',1,207,2423,', '3', '埃尔津詹', 'Erzincan', 'aierjinzhan', 'EZC');
INSERT INTO `sp_place` VALUES ('2424', '207', ',1,207,2424,', '3', '埃尔祖鲁姆', 'Erzurum', 'aierzulumu', 'EZR');
INSERT INTO `sp_place` VALUES ('2425', '207', ',1,207,2425,', '3', '埃拉泽', 'Elazig', 'ailaze', 'ELA');
INSERT INTO `sp_place` VALUES ('2426', '207', ',1,207,2426,', '3', '埃斯基谢希尔', 'Eskisehir', 'aisijixiexier', 'ESK');
INSERT INTO `sp_place` VALUES ('2427', '207', ',1,207,2427,', '3', '艾登', 'Aydin', 'aideng', 'AYI');
INSERT INTO `sp_place` VALUES ('2428', '207', ',1,207,2428,', '3', '安卡拉', 'Ankara', 'ankala', 'ANK');
INSERT INTO `sp_place` VALUES ('2429', '207', ',1,207,2429,', '3', '安塔利亚', 'Antalya', 'antaliya', 'ANT');
INSERT INTO `sp_place` VALUES ('2430', '207', ',1,207,2430,', '3', '奥尔杜', 'Ordu', 'aoerdu', 'ORD');
INSERT INTO `sp_place` VALUES ('2431', '207', ',1,207,2431,', '3', '巴尔腾', 'Bartin', 'baerteng', 'BAR');
INSERT INTO `sp_place` VALUES ('2432', '207', ',1,207,2432,', '3', '巴勒克埃西尔', 'Balikesir', 'balekeaixier', 'BAL');
INSERT INTO `sp_place` VALUES ('2433', '207', ',1,207,2433,', '3', '巴特曼', 'Batman', 'bateman', 'BAT');
INSERT INTO `sp_place` VALUES ('2434', '207', ',1,207,2434,', '3', '巴伊布尔特', 'Bayburt', 'bayibuerte', 'BAY');
INSERT INTO `sp_place` VALUES ('2435', '207', ',1,207,2435,', '3', '比莱吉克', 'Bilecik', 'bilaijike', 'BIL');
INSERT INTO `sp_place` VALUES ('2436', '207', ',1,207,2436,', '3', '比特利斯', 'Bitlis', 'bitelisi', 'BIT');
INSERT INTO `sp_place` VALUES ('2437', '207', ',1,207,2437,', '3', '宾格尔', 'Bingol', 'bingeer', 'BIN');
INSERT INTO `sp_place` VALUES ('2438', '207', ',1,207,2438,', '3', '博卢', 'Bolu', 'bolu', 'BOL');
INSERT INTO `sp_place` VALUES ('2439', '207', ',1,207,2439,', '3', '布尔杜尔', 'Burdur', 'buerduer', 'BRD');
INSERT INTO `sp_place` VALUES ('2440', '207', ',1,207,2440,', '3', '布尔萨', 'Bursa', 'buersa', 'BRS');
INSERT INTO `sp_place` VALUES ('2441', '207', ',1,207,2441,', '3', '昌克勒', 'Cankiri', 'changkele', 'CKR');
INSERT INTO `sp_place` VALUES ('2442', '207', ',1,207,2442,', '3', '代尼兹利', 'Denizli', 'dainizili', 'DEN');
INSERT INTO `sp_place` VALUES ('2443', '207', ',1,207,2443,', '3', '迪亚巴克尔', 'Diyarbakir', 'diyabakeer', 'DIY');
INSERT INTO `sp_place` VALUES ('2444', '207', ',1,207,2444,', '3', '凡', 'Van', 'fan', 'VAN');
INSERT INTO `sp_place` VALUES ('2445', '207', ',1,207,2445,', '3', '哈卡里', 'Hakkari', 'hakali', 'HKR');
INSERT INTO `sp_place` VALUES ('2446', '207', ',1,207,2446,', '3', '哈塔伊', 'Hatay', 'hatayi', 'HTY');
INSERT INTO `sp_place` VALUES ('2447', '207', ',1,207,2447,', '3', '基利斯', 'Kilis', 'jilisi', 'KLS');
INSERT INTO `sp_place` VALUES ('2448', '207', ',1,207,2448,', '3', '吉雷松', 'Giresun', 'jileisong', 'GIR');
INSERT INTO `sp_place` VALUES ('2449', '207', ',1,207,2449,', '3', '加济安泰普', 'Gaziantep', 'jiajiantaipu', 'GAZ');
INSERT INTO `sp_place` VALUES ('2450', '207', ',1,207,2450,', '3', '居米什哈内', 'Gumushane', 'jumishihanei', 'GMS');
INSERT INTO `sp_place` VALUES ('2451', '207', ',1,207,2451,', '3', '卡尔斯', 'Kars', 'kaersi', 'KRS');
INSERT INTO `sp_place` VALUES ('2452', '207', ',1,207,2452,', '3', '卡赫拉曼马拉什', 'Kahraman Maras', 'kahelamanmalashi', 'KAH');
INSERT INTO `sp_place` VALUES ('2453', '207', ',1,207,2453,', '3', '卡拉比克', 'Karabuk', 'kalabike', 'KRB');
INSERT INTO `sp_place` VALUES ('2454', '207', ',1,207,2454,', '3', '卡拉曼', 'Karaman', 'kalaman', 'KRM');
INSERT INTO `sp_place` VALUES ('2455', '207', ',1,207,2455,', '3', '卡斯塔莫努', 'Kastamonu', 'kasitamonu', 'KAS');
INSERT INTO `sp_place` VALUES ('2456', '207', ',1,207,2456,', '3', '开塞利', 'Kayseri', 'kaisaili', 'KAY');
INSERT INTO `sp_place` VALUES ('2457', '207', ',1,207,2457,', '3', '科贾埃利', 'Kocaeli', 'kejiaaili', 'KOC');
INSERT INTO `sp_place` VALUES ('2458', '207', ',1,207,2458,', '3', '柯克拉雷利', 'Kirklareli', 'kekelaleili', 'KLR');
INSERT INTO `sp_place` VALUES ('2459', '207', ',1,207,2459,', '3', '科尼亚', 'Konya', 'keniya', 'KON');
INSERT INTO `sp_place` VALUES ('2460', '207', ',1,207,2460,', '3', '克尔谢希尔', 'Kirsehir', 'keerxiexier', 'KRH');
INSERT INTO `sp_place` VALUES ('2461', '207', ',1,207,2461,', '3', '克勒克卡莱', 'Kirikkale', 'kelekekalai', 'KRK');
INSERT INTO `sp_place` VALUES ('2462', '207', ',1,207,2462,', '3', '拉飞', 'Urfa', 'lafei', 'URF');
INSERT INTO `sp_place` VALUES ('2463', '207', ',1,207,2463,', '3', '里泽', 'Rize', 'lize', 'RIZ');
INSERT INTO `sp_place` VALUES ('2464', '207', ',1,207,2464,', '3', '马尔丁', 'Mardin', 'maerding', 'MAR');
INSERT INTO `sp_place` VALUES ('2465', '207', ',1,207,2465,', '3', '马拉蒂亚', 'Malatya', 'maladiya', 'MAL');
INSERT INTO `sp_place` VALUES ('2466', '207', ',1,207,2466,', '3', '马尼萨', 'Manisa', 'manisa', 'MAN');
INSERT INTO `sp_place` VALUES ('2467', '207', ',1,207,2467,', '3', '穆拉', 'Mugla', 'mula', 'MUG');
INSERT INTO `sp_place` VALUES ('2468', '207', ',1,207,2468,', '3', '穆什', 'Mus', 'mushi', 'MUS');
INSERT INTO `sp_place` VALUES ('2469', '207', ',1,207,2469,', '3', '内夫谢希尔', 'Nevsehir', 'neifuxiexier', 'NEV');
INSERT INTO `sp_place` VALUES ('2470', '207', ',1,207,2470,', '3', '尼代', 'Nigde', 'nidai', 'NIG');
INSERT INTO `sp_place` VALUES ('2471', '207', ',1,207,2471,', '3', '恰纳卡莱', 'Canakkale', 'qianakalai', 'CKL');
INSERT INTO `sp_place` VALUES ('2472', '207', ',1,207,2472,', '3', '乔鲁姆', 'Corum', 'qiaolumu', 'COR');
INSERT INTO `sp_place` VALUES ('2473', '207', ',1,207,2473,', '3', '屈塔希亚', 'Kutahya', 'qutaxiya', 'KUT');
INSERT INTO `sp_place` VALUES ('2474', '207', ',1,207,2474,', '3', '萨卡里亚', 'Sakarya', 'sakaliya', 'SAK');
INSERT INTO `sp_place` VALUES ('2475', '207', ',1,207,2475,', '3', '萨姆松', 'Samsun', 'samusong', 'SAM');
INSERT INTO `sp_place` VALUES ('2476', '207', ',1,207,2476,', '3', '泰基尔达', 'Tekirdag', 'taijierda', 'TEL');
INSERT INTO `sp_place` VALUES ('2477', '207', ',1,207,2477,', '3', '特拉布宗', 'Trabzon', 'telabuzong', 'TRA');
INSERT INTO `sp_place` VALUES ('2478', '207', ',1,207,2478,', '3', '通杰利', 'Tunceli', 'tongjieli', 'TUN');
INSERT INTO `sp_place` VALUES ('2479', '207', ',1,207,2479,', '3', '托卡特', 'Tokat', 'tuokate', 'TOK');
INSERT INTO `sp_place` VALUES ('2480', '207', ',1,207,2480,', '3', '乌萨克', 'Usak', 'wusake', 'USK');
INSERT INTO `sp_place` VALUES ('2481', '207', ',1,207,2481,', '3', '锡尔纳克', 'Sirnak', 'xiernake', 'SIR');
INSERT INTO `sp_place` VALUES ('2482', '207', ',1,207,2482,', '3', '锡尔特', 'Siirt', 'xierte', 'SII');
INSERT INTO `sp_place` VALUES ('2483', '207', ',1,207,2483,', '3', '锡诺普', 'Sinop', 'xinuopu', 'SIN');
INSERT INTO `sp_place` VALUES ('2484', '207', ',1,207,2484,', '3', '锡瓦斯', 'Sivas', 'xiwasi', 'SIV');
INSERT INTO `sp_place` VALUES ('2485', '207', ',1,207,2485,', '3', '伊迪尔', 'Igdir', 'yidier', 'IGD');
INSERT INTO `sp_place` VALUES ('2486', '207', ',1,207,2486,', '3', '伊切尔', 'Icel', 'yiqieer', 'ICE');
INSERT INTO `sp_place` VALUES ('2487', '207', ',1,207,2487,', '3', '伊斯帕尔塔', 'Isparta', 'yisipaerta', 'ISP');
INSERT INTO `sp_place` VALUES ('2488', '207', ',1,207,2488,', '3', '伊斯坦布尔', 'Istanbul', 'yisitanbuer', 'IST');
INSERT INTO `sp_place` VALUES ('2489', '207', ',1,207,2489,', '3', '伊兹密尔', 'Izmir', 'yizimier', 'IZM');
INSERT INTO `sp_place` VALUES ('2490', '207', ',1,207,2490,', '3', '约兹加特', 'Yozgat', 'yuezijiate', 'YOZ');
INSERT INTO `sp_place` VALUES ('2491', '207', ',1,207,2491,', '3', '宗古尔达克', 'Zonguldak', 'zongguerdake', 'ZON');
INSERT INTO `sp_place` VALUES ('2492', '208', ',1,208,2492,', '3', '阿哈尔', 'Ahal', 'ahaer', 'A');
INSERT INTO `sp_place` VALUES ('2493', '208', ',1,208,2493,', '3', '阿什哈巴德市', 'Ashgabat', 'ashihabadeshi', 'ASB');
INSERT INTO `sp_place` VALUES ('2494', '208', ',1,208,2494,', '3', '巴尔坎', 'Balkan', 'baerkan', 'B');
INSERT INTO `sp_place` VALUES ('2495', '208', ',1,208,2495,', '3', '达沙古兹', 'Dashoguz', 'dashaguzi', 'D');
INSERT INTO `sp_place` VALUES ('2496', '208', ',1,208,2496,', '3', '列巴普', 'Lebap', 'liebapu', 'L');
INSERT INTO `sp_place` VALUES ('2497', '208', ',1,208,2497,', '3', '马雷', 'Mary', 'malei', 'M');
INSERT INTO `sp_place` VALUES ('2498', '208', ',1,208,2498,', '3', '涅比特达格', 'Nebitdag', 'niebitedage', 'NEB');
INSERT INTO `sp_place` VALUES ('2499', '211', ',6,211,2499,', '3', '马朗帕', 'Malampa', 'malangpa', 'MA');
INSERT INTO `sp_place` VALUES ('2500', '211', ',6,211,2500,', '3', '彭纳马', 'Penama', 'pengnama', 'PE');
INSERT INTO `sp_place` VALUES ('2501', '211', ',6,211,2501,', '3', '桑马', 'Sanma', 'sangma', 'SA');
INSERT INTO `sp_place` VALUES ('2502', '211', ',6,211,2502,', '3', '塔菲阿', 'Tafea', 'tafeia', 'TA');
INSERT INTO `sp_place` VALUES ('2503', '211', ',6,211,2503,', '3', '托尔巴', 'Torba', 'tuoerba', 'TO');
INSERT INTO `sp_place` VALUES ('2504', '211', ',6,211,2504,', '3', '谢法', 'Shefa', 'xiefa', 'SH');
INSERT INTO `sp_place` VALUES ('2505', '212', ',4,212,2505,', '3', '埃尔普罗格雷索', 'El Progreso', 'aierpuluogeleisuo', 'PR');
INSERT INTO `sp_place` VALUES ('2506', '212', ',4,212,2506,', '3', '埃斯昆特拉', 'Escuintla', 'aisikuntela', 'ES');
INSERT INTO `sp_place` VALUES ('2507', '212', ',4,212,2507,', '3', '哈拉帕', 'Jalapa', 'halapa', 'JA');
INSERT INTO `sp_place` VALUES ('2508', '212', ',4,212,2508,', '3', '胡蒂亚帕', 'Jutiapa', 'hudiyapa', 'JU');
INSERT INTO `sp_place` VALUES ('2509', '212', ',4,212,2509,', '3', '基切', 'Quiche', 'jiqie', 'QC');
INSERT INTO `sp_place` VALUES ('2510', '212', ',4,212,2510,', '3', '克萨尔特南戈', 'Quetzaltenango', 'kesaertenange', 'QZ');
INSERT INTO `sp_place` VALUES ('2511', '212', ',4,212,2511,', '3', '雷塔卢莱乌', 'Retalhuleu', 'leitalulaiwu', 'RE');
INSERT INTO `sp_place` VALUES ('2512', '212', ',4,212,2512,', '3', '米克斯科', 'Mixco', 'mikesike', 'MIX');
INSERT INTO `sp_place` VALUES ('2513', '212', ',4,212,2513,', '3', '佩滕', 'Peten', 'pei', 'PE');
INSERT INTO `sp_place` VALUES ('2514', '212', ',4,212,2514,', '3', '奇基穆拉', 'Chiquimula', 'qijimula', 'CQ');
INSERT INTO `sp_place` VALUES ('2515', '212', ',4,212,2515,', '3', '奇马尔特南戈', 'Chimaltenango', 'qimaertenange', 'CM');
INSERT INTO `sp_place` VALUES ('2516', '212', ',4,212,2516,', '3', '萨卡帕', 'Zacapa', 'sakapa', 'ZA');
INSERT INTO `sp_place` VALUES ('2517', '212', ',4,212,2517,', '3', '萨卡特佩克斯', 'Sacatepequez', 'sakatepeikesi', 'ST');
INSERT INTO `sp_place` VALUES ('2518', '212', ',4,212,2518,', '3', '上韦拉帕斯', 'Alta Verapaz', 'shangweilapasi', 'AV');
INSERT INTO `sp_place` VALUES ('2519', '212', ',4,212,2519,', '3', '圣罗莎', 'Santa Rosa', 'shengluosha', 'SR');
INSERT INTO `sp_place` VALUES ('2520', '212', ',4,212,2520,', '3', '圣马科斯', 'San Marcos', 'shengmakesi', 'SM');
INSERT INTO `sp_place` VALUES ('2521', '212', ',4,212,2521,', '3', '苏奇特佩克斯', 'Suchitepequez', 'suqitepeikesi', 'SU');
INSERT INTO `sp_place` VALUES ('2522', '212', ',4,212,2522,', '3', '索洛拉', 'Solola', 'suoluola', 'SO');
INSERT INTO `sp_place` VALUES ('2523', '212', ',4,212,2523,', '3', '托托尼卡潘', 'Totonicapan', 'tuotuonikapan', 'TO');
INSERT INTO `sp_place` VALUES ('2524', '212', ',4,212,2524,', '3', '危地马拉', 'Guatemala', 'weidimala', 'GU');
INSERT INTO `sp_place` VALUES ('2525', '212', ',4,212,2525,', '3', '韦韦特南戈', 'Huehuetenango', 'weiweitenange', 'HU');
INSERT INTO `sp_place` VALUES ('2526', '212', ',4,212,2526,', '3', '下韦拉帕斯', 'Baja Verapaz', 'xiaweilapasi', 'BV');
INSERT INTO `sp_place` VALUES ('2527', '212', ',4,212,2527,', '3', '新城', 'Villa Nueva', 'xincheng', 'VIN');
INSERT INTO `sp_place` VALUES ('2528', '212', ',4,212,2528,', '3', '伊萨瓦尔', 'Izabal', 'yisawaer', 'IZ');
INSERT INTO `sp_place` VALUES ('2529', '215', ',5,215,2529,', '3', '阿拉瓜', 'Aragua', 'alagua', 'D');
INSERT INTO `sp_place` VALUES ('2530', '215', ',5,215,2530,', '3', '阿马库罗三角洲', 'Delta Amacuro', 'amakuluosanjiaozhou', 'Y');
INSERT INTO `sp_place` VALUES ('2531', '215', ',5,215,2531,', '3', '阿普雷', 'Apure', 'apulei', 'C');
INSERT INTO `sp_place` VALUES ('2532', '215', ',5,215,2532,', '3', '安索阿特吉', 'Anzoategui', 'ansuoateji', 'B');
INSERT INTO `sp_place` VALUES ('2533', '215', ',5,215,2533,', '3', '巴里纳斯', 'Barinas', 'balinasi', 'E');
INSERT INTO `sp_place` VALUES ('2534', '215', ',5,215,2534,', '3', '玻利瓦尔', 'Bolivar', 'boliwaer', 'F');
INSERT INTO `sp_place` VALUES ('2535', '215', ',5,215,2535,', '3', '波图格萨', 'Portuguesa', 'botugesa', 'P');
INSERT INTO `sp_place` VALUES ('2536', '215', ',5,215,2536,', '3', '法尔孔', 'Falcon', 'faerkong', 'I');
INSERT INTO `sp_place` VALUES ('2537', '215', ',5,215,2537,', '3', '瓜里科', 'Guarico', 'gualike', 'J');
INSERT INTO `sp_place` VALUES ('2538', '215', ',5,215,2538,', '3', '加拉加斯', 'Caracas', 'jialajiasi', 'A');
INSERT INTO `sp_place` VALUES ('2539', '215', ',5,215,2539,', '3', '卡拉沃沃', 'Carabobo', 'kalawowo', 'G');
INSERT INTO `sp_place` VALUES ('2540', '215', ',5,215,2540,', '3', '科赫德斯', 'Cojedes', 'kehedesi', 'H');
INSERT INTO `sp_place` VALUES ('2541', '215', ',5,215,2541,', '3', '拉腊', 'Lara', 'lala', 'K');
INSERT INTO `sp_place` VALUES ('2542', '215', ',5,215,2542,', '3', '联邦属地', 'Dependencias Federales', 'lianbangshudi', 'W');
INSERT INTO `sp_place` VALUES ('2543', '215', ',5,215,2543,', '3', '梅里达', 'Merida', 'meilida', 'L');
INSERT INTO `sp_place` VALUES ('2544', '215', ',5,215,2544,', '3', '米兰达', 'Miranda', 'milanda', 'M');
INSERT INTO `sp_place` VALUES ('2545', '215', ',5,215,2545,', '3', '莫纳加斯', 'Monagas', 'monajiasi', 'N');
INSERT INTO `sp_place` VALUES ('2546', '215', ',5,215,2546,', '3', '苏克雷', 'Sucre', 'sukelei', 'R');
INSERT INTO `sp_place` VALUES ('2547', '215', ',5,215,2547,', '3', '苏利亚', 'Zulia', 'suliya', 'V');
INSERT INTO `sp_place` VALUES ('2548', '215', ',5,215,2548,', '3', '塔奇拉', 'Tachira', 'taqila', 'S');
INSERT INTO `sp_place` VALUES ('2549', '215', ',5,215,2549,', '3', '特鲁希略', 'Trujillo', 'teluxilue', 'T');
INSERT INTO `sp_place` VALUES ('2550', '215', ',5,215,2550,', '3', '新埃斯帕塔', 'Estado Nueva Esparta', 'xinaisipata', 'O');
INSERT INTO `sp_place` VALUES ('2551', '215', ',5,215,2551,', '3', '亚拉奎', 'Yaracuy', 'yalakui', 'U');
INSERT INTO `sp_place` VALUES ('2552', '215', ',5,215,2552,', '3', '亚马孙', 'Amazonas', 'yamasun', 'Z');
INSERT INTO `sp_place` VALUES ('2553', '217', ',3,217,2553,', '3', '阿鲁阿', 'Arua', 'alua', 'ARU');
INSERT INTO `sp_place` VALUES ('2554', '217', ',3,217,2554,', '3', '阿帕克', 'Apac', 'apake', 'APC');
INSERT INTO `sp_place` VALUES ('2555', '217', ',3,217,2555,', '3', '阿朱马尼', 'Adjumani', 'azhumani', 'ADJ');
INSERT INTO `sp_place` VALUES ('2556', '217', ',3,217,2556,', '3', '本迪布焦', 'Bundibugyo', 'bendibujiao', 'BUN');
INSERT INTO `sp_place` VALUES ('2557', '217', ',3,217,2557,', '3', '布吉里', 'Bugiri', 'bujili', 'BUG');
INSERT INTO `sp_place` VALUES ('2558', '217', ',3,217,2558,', '3', '布西亚', 'Busia', 'buxiya', 'BUS');
INSERT INTO `sp_place` VALUES ('2559', '217', ',3,217,2559,', '3', '布谢尼', 'Bushenyi', 'buxieni', 'BSH');
INSERT INTO `sp_place` VALUES ('2560', '217', ',3,217,2560,', '3', '恩通加莫', 'Ntungamo', 'entongjiamo', 'NTU');
INSERT INTO `sp_place` VALUES ('2561', '217', ',3,217,2561,', '3', '古卢', 'Gulu', 'gulu', 'GUL');
INSERT INTO `sp_place` VALUES ('2562', '217', ',3,217,2562,', '3', '霍伊马', 'Hoima', 'huoyima', 'HOI');
INSERT INTO `sp_place` VALUES ('2563', '217', ',3,217,2563,', '3', '基巴莱', 'Kibaale', 'jibalai', 'KBA');
INSERT INTO `sp_place` VALUES ('2564', '217', ',3,217,2564,', '3', '基博加', 'Kiboga', 'jibojia', 'KIB');
INSERT INTO `sp_place` VALUES ('2565', '217', ',3,217,2565,', '3', '基恩乔乔', 'Kyenjojo', 'jienqiaoqiao', 'KYE');
INSERT INTO `sp_place` VALUES ('2566', '217', ',3,217,2566,', '3', '基索罗', 'Kisoro', 'jisuoluo', 'KIS');
INSERT INTO `sp_place` VALUES ('2567', '217', ',3,217,2567,', '3', '基特古姆', 'Kitgum', 'jitegumu', 'KIT');
INSERT INTO `sp_place` VALUES ('2568', '217', ',3,217,2568,', '3', '金贾', 'Jinja', 'jinjia', 'JIN');
INSERT INTO `sp_place` VALUES ('2569', '217', ',3,217,2569,', '3', '卡巴莱', 'Kabale', 'kabalai', 'KBL');
INSERT INTO `sp_place` VALUES ('2570', '217', ',3,217,2570,', '3', '卡巴罗莱', 'Kabarole', 'kabaluolai', 'KAR');
INSERT INTO `sp_place` VALUES ('2571', '217', ',3,217,2571,', '3', '卡贝拉马伊多', 'Kaberamaido', 'kabeilamayiduo', 'KAB');
INSERT INTO `sp_place` VALUES ('2572', '217', ',3,217,2572,', '3', '卡兰加拉', 'Kalangala', 'kalanjiala', 'KAL');
INSERT INTO `sp_place` VALUES ('2573', '217', ',3,217,2573,', '3', '卡姆文盖', 'Kamwenge', 'kamuwengai', 'KAM');
INSERT INTO `sp_place` VALUES ('2574', '217', ',3,217,2574,', '3', '卡穆利', 'Kamuli', 'kamuli', 'KML');
INSERT INTO `sp_place` VALUES ('2575', '217', ',3,217,2575,', '3', '卡农古', 'Kanungu', 'kanonggu', 'KAN');
INSERT INTO `sp_place` VALUES ('2576', '217', ',3,217,2576,', '3', '卡普乔鲁瓦', 'Kapchorwa', 'kapuqiaoluwa', 'KPC');
INSERT INTO `sp_place` VALUES ('2577', '217', ',3,217,2577,', '3', '卡塞塞', 'Kasese', 'kasaisai', 'KAS');
INSERT INTO `sp_place` VALUES ('2578', '217', ',3,217,2578,', '3', '卡塔奎', 'Katakwi', 'katakui', 'KTK');
INSERT INTO `sp_place` VALUES ('2579', '217', ',3,217,2579,', '3', '卡永加', 'Kayunga', 'kayongjia', 'KAY');
INSERT INTO `sp_place` VALUES ('2580', '217', ',3,217,2580,', '3', '坎帕拉', 'Kampala', 'kanpala', 'KMP');
INSERT INTO `sp_place` VALUES ('2581', '217', ',3,217,2581,', '3', '科蒂多', 'Kotido', 'kediduo', 'KOT');
INSERT INTO `sp_place` VALUES ('2582', '217', ',3,217,2582,', '3', '库米', 'Kumi', 'kumi', 'KUM');
INSERT INTO `sp_place` VALUES ('2583', '217', ',3,217,2583,', '3', '拉卡伊', 'Rakai', 'lakayi', 'RAK');
INSERT INTO `sp_place` VALUES ('2584', '217', ',3,217,2584,', '3', '利拉', 'Lira', 'lila', 'LIR');
INSERT INTO `sp_place` VALUES ('2585', '217', ',3,217,2585,', '3', '卢韦罗', 'Luwero', 'luweiluo', 'LUW');
INSERT INTO `sp_place` VALUES ('2586', '217', ',3,217,2586,', '3', '鲁昆吉里', 'Rukungiri', 'lukunjili', 'RUK');
INSERT INTO `sp_place` VALUES ('2587', '217', ',3,217,2587,', '3', '马萨卡', 'Masaka', 'masaka', 'MAS');
INSERT INTO `sp_place` VALUES ('2588', '217', ',3,217,2588,', '3', '马辛迪', 'Masindi', 'maxindi', 'MSN');
INSERT INTO `sp_place` VALUES ('2589', '217', ',3,217,2589,', '3', '马尤盖', 'Mayuge', 'mayougai', 'MAY');
INSERT INTO `sp_place` VALUES ('2590', '217', ',3,217,2590,', '3', '莫罗托', 'Moroto', 'moluotuo', 'MRT');
INSERT INTO `sp_place` VALUES ('2591', '217', ',3,217,2591,', '3', '莫约', 'Moyo', 'moyue', 'MOY');
INSERT INTO `sp_place` VALUES ('2592', '217', ',3,217,2592,', '3', '姆巴拉拉', 'Mbarara', 'mubalala', 'MBR');
INSERT INTO `sp_place` VALUES ('2593', '217', ',3,217,2593,', '3', '姆巴莱', 'Mbale', 'mubalai', 'MBA');
INSERT INTO `sp_place` VALUES ('2594', '217', ',3,217,2594,', '3', '姆皮吉', 'Mpigi', 'mupiji', 'MPI');
INSERT INTO `sp_place` VALUES ('2595', '217', ',3,217,2595,', '3', '穆本德', 'Mubende', 'mubende', 'MUB');
INSERT INTO `sp_place` VALUES ('2596', '217', ',3,217,2596,', '3', '穆科诺', 'Mukono', 'mukenuo', 'MUK');
INSERT INTO `sp_place` VALUES ('2597', '217', ',3,217,2597,', '3', '纳卡皮里皮里特', 'Nakapiripirit', 'nakapilipilite', 'NAK');
INSERT INTO `sp_place` VALUES ('2598', '217', ',3,217,2598,', '3', '纳卡松戈拉', 'Nakasongola', 'nakasonggela', 'NKS');
INSERT INTO `sp_place` VALUES ('2599', '217', ',3,217,2599,', '3', '内比', 'Nebbi', 'neibi', 'NEB');
INSERT INTO `sp_place` VALUES ('2600', '217', ',3,217,2600,', '3', '帕德尔', 'Pader', 'padeer', 'PAD');
INSERT INTO `sp_place` VALUES ('2601', '217', ',3,217,2601,', '3', '帕利萨', 'Pallisa', 'palisa', 'PAL');
INSERT INTO `sp_place` VALUES ('2602', '217', ',3,217,2602,', '3', '森巴布莱', 'Sembabule', 'senbabulai', 'SEM');
INSERT INTO `sp_place` VALUES ('2603', '217', ',3,217,2603,', '3', '索罗提', 'Soroti', 'suoluoti', 'SOR');
INSERT INTO `sp_place` VALUES ('2604', '217', ',3,217,2604,', '3', '托罗罗', 'Tororo', 'tuoluoluo', 'TOR');
INSERT INTO `sp_place` VALUES ('2605', '217', ',3,217,2605,', '3', '瓦基索', 'Wakiso', 'wajisuo', 'WAK');
INSERT INTO `sp_place` VALUES ('2606', '217', ',3,217,2606,', '3', '锡龙科', 'Sironko', 'xilongke', 'SIR');
INSERT INTO `sp_place` VALUES ('2607', '217', ',3,217,2607,', '3', '伊甘加', 'Iganga', 'yiganjia', 'IGA');
INSERT INTO `sp_place` VALUES ('2608', '217', ',3,217,2608,', '3', '永贝', 'Yumbe', 'yongbei', 'YUM');
INSERT INTO `sp_place` VALUES ('2609', '218', ',2,218,2609,', '3', '敖德萨', 'Odessa', 'aodesa', '51');
INSERT INTO `sp_place` VALUES ('2610', '218', ',2,218,2610,', '3', '波尔塔瓦', 'Poltava', 'boertawa', '53');
INSERT INTO `sp_place` VALUES ('2611', '218', ',2,218,2611,', '3', '第聂伯罗波得罗夫斯克', 'Dnipropetrovsk', 'dinieboluobodeluofusike', '12');
INSERT INTO `sp_place` VALUES ('2612', '218', ',2,218,2612,', '3', '顿涅茨克', 'Donetsk', 'dunniecike', '14');
INSERT INTO `sp_place` VALUES ('2613', '218', ',2,218,2613,', '3', '哈尔科夫', 'Kharkiv', 'haerkefu', '63');
INSERT INTO `sp_place` VALUES ('2614', '218', ',2,218,2614,', '3', '赫尔松州', 'Khersonsrka', 'heersongzhou', '65');
INSERT INTO `sp_place` VALUES ('2615', '218', ',2,218,2615,', '3', '赫梅利尼茨基', 'Khmelnytsky', 'hemeiliniciji', '68');
INSERT INTO `sp_place` VALUES ('2616', '218', ',2,218,2616,', '3', '基辅', 'Kyiv', 'jifu', '30');
INSERT INTO `sp_place` VALUES ('2617', '218', ',2,218,2617,', '3', '基洛夫格勒', 'Kirovohrad', 'jiluofugele', '35');
INSERT INTO `sp_place` VALUES ('2618', '218', ',2,218,2618,', '3', '捷尔诺波尔', 'Ternopil', 'jieernuoboer', '61');
INSERT INTO `sp_place` VALUES ('2619', '218', ',2,218,2619,', '3', '克里米亚自治共和国', 'Respublika Krym', 'kelimiyazizhigongheguo', '43');
INSERT INTO `sp_place` VALUES ('2620', '218', ',2,218,2620,', '3', '利沃夫', 'Lviv', 'liwofu', '46');
INSERT INTO `sp_place` VALUES ('2621', '218', ',2,218,2621,', '3', '卢甘斯克', 'Luhansk', 'lugansike', '9');
INSERT INTO `sp_place` VALUES ('2622', '218', ',2,218,2622,', '3', '罗夫诺', 'Rivne', 'luofunuo', '56');
INSERT INTO `sp_place` VALUES ('2623', '218', ',2,218,2623,', '3', '尼古拉耶夫', 'Mykolayiv', 'nigulayefu', '48');
INSERT INTO `sp_place` VALUES ('2624', '218', ',2,218,2624,', '3', '切尔卡瑟', 'Cherkasy', 'qieerkase', '71');
INSERT INTO `sp_place` VALUES ('2625', '218', ',2,218,2625,', '3', '切尔尼戈夫', 'Chernihiv', 'qieernigefu', '74');
INSERT INTO `sp_place` VALUES ('2626', '218', ',2,218,2626,', '3', '切尔诺夫策', 'Chernivtsi', 'qieernuofuce', '77');
INSERT INTO `sp_place` VALUES ('2627', '218', ',2,218,2627,', '3', '日托米尔', 'Zhytomyr', 'rituomier', '18');
INSERT INTO `sp_place` VALUES ('2628', '218', ',2,218,2628,', '3', '苏梅', 'Sumy', 'sumei', '59');
INSERT INTO `sp_place` VALUES ('2629', '218', ',2,218,2629,', '3', '外喀尔巴阡', 'Zakarpatska', 'waikaerba', '21');
INSERT INTO `sp_place` VALUES ('2630', '218', ',2,218,2630,', '3', '文尼察', 'Vinnytsya', 'wennicha', '5');
INSERT INTO `sp_place` VALUES ('2631', '218', ',2,218,2631,', '3', '沃伦', 'Volyn', 'wolun', '7');
INSERT INTO `sp_place` VALUES ('2632', '218', ',2,218,2632,', '3', '伊万－弗兰科夫州', 'Ivano-Frankivsk', 'yiwanfulankefuzhou', '26');
INSERT INTO `sp_place` VALUES ('2633', '218', ',2,218,2633,', '3', '扎波罗热', 'Zaporizhzhya', 'zhaboluore', '23');
INSERT INTO `sp_place` VALUES ('2634', '219', ',5,219,2634,', '3', '阿蒂加斯', 'Artigas', 'adijiasi', 'AR');
INSERT INTO `sp_place` VALUES ('2635', '219', ',5,219,2635,', '3', '杜拉斯诺', 'Durazno', 'dulasinuo', 'DU');
INSERT INTO `sp_place` VALUES ('2636', '219', ',5,219,2636,', '3', '佛罗里达', 'Florida', 'foluolida', 'FA');
INSERT INTO `sp_place` VALUES ('2637', '219', ',5,219,2637,', '3', '弗洛雷斯', 'Flores', 'fuluoleisi', 'FS');
INSERT INTO `sp_place` VALUES ('2638', '219', ',5,219,2638,', '3', '卡内洛内斯', 'Canelones', 'kaneiluoneisi', 'CA');
INSERT INTO `sp_place` VALUES ('2639', '219', ',5,219,2639,', '3', '科洛尼亚', 'Colonia', 'keluoniya', 'CO');
INSERT INTO `sp_place` VALUES ('2640', '219', ',5,219,2640,', '3', '拉瓦耶哈', 'Lavalleja', 'lawayeha', 'LA');
INSERT INTO `sp_place` VALUES ('2641', '219', ',5,219,2641,', '3', '里韦拉', 'Rivera', 'liweila', 'RV');
INSERT INTO `sp_place` VALUES ('2642', '219', ',5,219,2642,', '3', '罗恰', 'Rocha', 'luoqia', 'RO');
INSERT INTO `sp_place` VALUES ('2643', '219', ',5,219,2643,', '3', '马尔多纳多', 'Maldonado', 'maerduonaduo', 'MA');
INSERT INTO `sp_place` VALUES ('2644', '219', ',5,219,2644,', '3', '蒙得维的亚', 'Montevideo', 'mengdeweideya', 'MO');
INSERT INTO `sp_place` VALUES ('2645', '219', ',5,219,2645,', '3', '内格罗河', 'Rio Negro', 'neigeluohe', 'RN');
INSERT INTO `sp_place` VALUES ('2646', '219', ',5,219,2646,', '3', '派桑杜', 'Paysandu', 'paisangdu', 'PA');
INSERT INTO `sp_place` VALUES ('2647', '219', ',5,219,2647,', '3', '萨尔托', 'Salto', 'saertuo', 'SL');
INSERT INTO `sp_place` VALUES ('2648', '219', ',5,219,2648,', '3', '塞罗拉尔戈', 'Cerro Largo', 'sailuolaerge', 'CL');
INSERT INTO `sp_place` VALUES ('2649', '219', ',5,219,2649,', '3', '三十三人', 'Treinta y Tres', 'sanshisanren', 'TT');
INSERT INTO `sp_place` VALUES ('2650', '219', ',5,219,2650,', '3', '圣何塞', 'San Jose', 'shenghesai', 'SJ');
INSERT INTO `sp_place` VALUES ('2651', '219', ',5,219,2651,', '3', '索里亚诺', 'Soriano', 'suoliyanuo', 'SO');
INSERT INTO `sp_place` VALUES ('2652', '219', ',5,219,2652,', '3', '塔夸伦博', 'Tacuarembo', 'takualunbo', 'TAW');
INSERT INTO `sp_place` VALUES ('2653', '220', ',1,220,2653,', '3', '安集延', 'Andijon', 'anjiyan', 'AN');
INSERT INTO `sp_place` VALUES ('2654', '220', ',1,220,2654,', '3', '布哈拉', 'Buxoro', 'buhala', 'BU');
INSERT INTO `sp_place` VALUES ('2655', '220', ',1,220,2655,', '3', '费尔干纳', 'Fargona', 'feierganna', 'FA');
INSERT INTO `sp_place` VALUES ('2656', '220', ',1,220,2656,', '3', '花拉子模', 'Xorazm', 'hualazimo', 'XO');
INSERT INTO `sp_place` VALUES ('2657', '220', ',1,220,2657,', '3', '吉扎克', 'Jizzax', 'jizhake', 'JI');
INSERT INTO `sp_place` VALUES ('2658', '220', ',1,220,2658,', '3', '卡拉卡尔帕克斯坦共和国', 'Qoraqalpogiston', 'kalakaerpakesitangongheguo', 'QR');
INSERT INTO `sp_place` VALUES ('2659', '220', ',1,220,2659,', '3', '卡什卡达里亚', 'Qasqadaryo', 'kashikadaliya', 'QA');
INSERT INTO `sp_place` VALUES ('2660', '220', ',1,220,2660,', '3', '纳曼干', 'Namangan', 'namangan', 'NG');
INSERT INTO `sp_place` VALUES ('2661', '220', ',1,220,2661,', '3', '纳沃伊', 'Navoiy', 'nawoyi', 'NW');
INSERT INTO `sp_place` VALUES ('2662', '220', ',1,220,2662,', '3', '撒马尔罕', 'Samarqand', 'samaerhan', 'SA');
INSERT INTO `sp_place` VALUES ('2663', '220', ',1,220,2663,', '3', '苏尔汉河', 'Surxondaryo', 'suerhanhe', 'SU');
INSERT INTO `sp_place` VALUES ('2664', '220', ',1,220,2664,', '3', '塔什干', 'Toshkent', 'tashigan', 'TK');
INSERT INTO `sp_place` VALUES ('2665', '220', ',1,220,2665,', '3', '塔什干市', 'Toshkent Shahri', 'tashiganshi', 'TO');
INSERT INTO `sp_place` VALUES ('2666', '220', ',1,220,2666,', '3', '锡尔河', 'Sirdaryo', 'xierhe', 'SI');
INSERT INTO `sp_place` VALUES ('2667', '221', ',2,221,2667,', '3', '阿尔梅里亚', 'Almeria', 'aermeiliya', 'LEI');
INSERT INTO `sp_place` VALUES ('2668', '221', ',2,221,2668,', '3', '阿尔瓦塞特', 'Albacete', 'aerwasaite', 'ALB');
INSERT INTO `sp_place` VALUES ('2669', '221', ',2,221,2669,', '3', '阿拉瓦', 'Alava', 'alawa', 'ALA');
INSERT INTO `sp_place` VALUES ('2670', '221', ',2,221,2670,', '3', '阿利坎特', 'Alicante', 'alikante', 'ALC');
INSERT INTO `sp_place` VALUES ('2671', '221', ',2,221,2671,', '3', '阿斯图利亚斯', 'Asturias', 'asituliyasi', 'AST');
INSERT INTO `sp_place` VALUES ('2672', '221', ',2,221,2672,', '3', '阿维拉', 'Avila', 'aweila', 'AVI');
INSERT INTO `sp_place` VALUES ('2673', '221', ',2,221,2673,', '3', '奥伦塞', 'Orense', 'aolunsai', 'ORE');
INSERT INTO `sp_place` VALUES ('2674', '221', ',2,221,2674,', '3', '巴达霍斯', 'Badajoz', 'badahuosi', 'BJZ');
INSERT INTO `sp_place` VALUES ('2675', '221', ',2,221,2675,', '3', '巴利阿里', 'Baleares', 'baliali', 'BLR');
INSERT INTO `sp_place` VALUES ('2676', '221', ',2,221,2676,', '3', '巴利亚多利德', 'Valladolid', 'baliyaduolide', 'VLL');
INSERT INTO `sp_place` VALUES ('2677', '221', ',2,221,2677,', '3', '巴伦西亚', 'Valencia', 'balunxiya', 'VLC');
INSERT INTO `sp_place` VALUES ('2678', '221', ',2,221,2678,', '3', '巴塞罗那', 'Barcelona', 'basailuona', 'BCN');
INSERT INTO `sp_place` VALUES ('2679', '221', ',2,221,2679,', '3', '比斯开', 'Vizcaya', 'bisikai', 'VSE');
INSERT INTO `sp_place` VALUES ('2680', '221', ',2,221,2680,', '3', '布尔戈斯', 'Burgos', 'buergesi', 'BUR');
INSERT INTO `sp_place` VALUES ('2681', '221', ',2,221,2681,', '3', '格拉纳达', 'Granada', 'gelanada', 'GRX');
INSERT INTO `sp_place` VALUES ('2682', '221', ',2,221,2682,', '3', '瓜达拉哈拉', 'Guadalajara', 'guadalahala', 'GUA');
INSERT INTO `sp_place` VALUES ('2683', '221', ',2,221,2683,', '3', '哈恩', 'Jaen', 'haen', 'JAE');
INSERT INTO `sp_place` VALUES ('2684', '221', ',2,221,2684,', '3', '赫罗纳', 'Gerona', 'heluona', 'GRO');
INSERT INTO `sp_place` VALUES ('2685', '221', ',2,221,2685,', '3', '吉普斯夸', 'Guipuzcoa', 'jipusikua', 'GUI');
INSERT INTO `sp_place` VALUES ('2686', '221', ',2,221,2686,', '3', '加的斯', 'Cadiz', 'jiadesi', 'CAD');
INSERT INTO `sp_place` VALUES ('2687', '221', ',2,221,2687,', '3', '卡塞雷斯', 'Caceres', 'kasaileisi', 'CCS');
INSERT INTO `sp_place` VALUES ('2688', '221', ',2,221,2688,', '3', '卡斯蒂利亚', 'Cludad Real', 'kasidiliya', 'CIR');
INSERT INTO `sp_place` VALUES ('2689', '221', ',2,221,2689,', '3', '卡斯特利翁', 'Castellon', 'kasiteliweng', 'CAS');
INSERT INTO `sp_place` VALUES ('2690', '221', ',2,221,2690,', '3', '科尔多瓦', 'Cordoba', 'keerduowa', 'ODB');
INSERT INTO `sp_place` VALUES ('2691', '221', ',2,221,2691,', '3', '昆卡', 'Cuenca', 'kunka', 'CUE');
INSERT INTO `sp_place` VALUES ('2692', '221', ',2,221,2692,', '3', '拉科鲁尼亚', 'La Coruna', 'lakeluniya', 'LCG');
INSERT INTO `sp_place` VALUES ('2693', '221', ',2,221,2693,', '3', '拉里奥哈', 'La Rioja', 'laliaoha', 'ARL');
INSERT INTO `sp_place` VALUES ('2694', '221', ',2,221,2694,', '3', '拉斯帕尔马斯', 'Las Palmas', 'lasipaermasi', 'LPA');
INSERT INTO `sp_place` VALUES ('2695', '221', ',2,221,2695,', '3', '莱昂', 'Leon', 'laiang', 'LEN');
INSERT INTO `sp_place` VALUES ('2696', '221', ',2,221,2696,', '3', '莱里达', 'Lleida', 'lailida', 'LLE');
INSERT INTO `sp_place` VALUES ('2697', '221', ',2,221,2697,', '3', '卢戈', 'Provincia de Lugo', 'luge', 'LGO');
INSERT INTO `sp_place` VALUES ('2698', '221', ',2,221,2698,', '3', '马德里', 'Madrid', 'madeli', 'MAD');
INSERT INTO `sp_place` VALUES ('2699', '221', ',2,221,2699,', '3', '马拉加', 'Malaga', 'malajia', 'AGP');
INSERT INTO `sp_place` VALUES ('2700', '221', ',2,221,2700,', '3', '穆尔西亚', 'Murcia', 'muerxiya', 'MJV');
INSERT INTO `sp_place` VALUES ('2701', '221', ',2,221,2701,', '3', '纳瓦拉', 'Navarra', 'nawala', 'NVV');
INSERT INTO `sp_place` VALUES ('2702', '221', ',2,221,2702,', '3', '帕伦西亚', 'Palencia', 'palunxiya', 'PAC');
INSERT INTO `sp_place` VALUES ('2703', '221', ',2,221,2703,', '3', '蓬特韦德拉', 'Provincia de Pontevedra', 'pengteweidela', 'PEV');
INSERT INTO `sp_place` VALUES ('2704', '221', ',2,221,2704,', '3', '萨拉戈萨', 'Zaragoza', 'salagesa', 'ZAZ');
INSERT INTO `sp_place` VALUES ('2705', '221', ',2,221,2705,', '3', '萨拉曼卡', 'Salamanca', 'salamanka', 'SLM');
INSERT INTO `sp_place` VALUES ('2706', '221', ',2,221,2706,', '3', '萨莫拉', 'Zamora', 'samola', 'ZMR');
INSERT INTO `sp_place` VALUES ('2707', '221', ',2,221,2707,', '3', '塞哥维亚', 'Segovia', 'saigeweiya', 'SEG');
INSERT INTO `sp_place` VALUES ('2708', '221', ',2,221,2708,', '3', '塞维利亚', 'Sevilla', 'saiweiliya', 'SVQ');
INSERT INTO `sp_place` VALUES ('2709', '221', ',2,221,2709,', '3', '桑坦德', 'Santander', 'sangtande', 'SDR');
INSERT INTO `sp_place` VALUES ('2710', '221', ',2,221,2710,', '3', '圣克鲁斯-德特内里费', 'Santa Cruz de Tenerife', 'shengkelusideteneilifei', 'SCT');
INSERT INTO `sp_place` VALUES ('2711', '221', ',2,221,2711,', '3', '索里亚', 'Soria', 'suoliya', 'SOR');
INSERT INTO `sp_place` VALUES ('2712', '221', ',2,221,2712,', '3', '塔拉戈纳', 'Tarragona', 'talagena', 'TAR');
INSERT INTO `sp_place` VALUES ('2713', '221', ',2,221,2713,', '3', '特鲁埃尔', 'Teruel', 'teluaier', 'TER');
INSERT INTO `sp_place` VALUES ('2714', '221', ',2,221,2714,', '3', '托莱多', 'Toledo', 'tuolaiduo', 'TOL');
INSERT INTO `sp_place` VALUES ('2715', '221', ',2,221,2715,', '3', '韦尔瓦', 'Huelva', 'weierwa', 'HUV');
INSERT INTO `sp_place` VALUES ('2716', '221', ',2,221,2716,', '3', '韦斯卡', 'Huesca', 'weisika', 'HUC');
INSERT INTO `sp_place` VALUES ('2717', '222', ',2,222,2717,', '3', '比雷埃夫斯', 'Peiraievs', 'bileiaifusi', 'PRI');
INSERT INTO `sp_place` VALUES ('2718', '222', ',2,222,2718,', '3', '多德卡尼斯', 'Dodecanese', 'duodekanisi', 'DO');
INSERT INTO `sp_place` VALUES ('2719', '222', ',2,222,2719,', '3', '干尼亚', 'Chanion', 'ganniya', 'CHQ');
INSERT INTO `sp_place` VALUES ('2720', '222', ',2,222,2720,', '3', '基克拉迪', 'Cyclades', 'jikeladi', 'CY');
INSERT INTO `sp_place` VALUES ('2721', '222', ',2,222,2721,', '3', '拉西锡', 'Lasithiou', 'laxixi', 'LST');
INSERT INTO `sp_place` VALUES ('2722', '222', ',2,222,2722,', '3', '莱斯博斯', 'Lesbos', 'laisibosi', 'LES');
INSERT INTO `sp_place` VALUES ('2723', '222', ',2,222,2723,', '3', '雷西姆农', 'Rethymnis', 'leiximunong', 'RET');
INSERT INTO `sp_place` VALUES ('2724', '222', ',2,222,2724,', '3', '萨摩斯', 'Samos', 'samosi', 'SMI');
INSERT INTO `sp_place` VALUES ('2725', '222', ',2,222,2725,', '3', '雅典', 'Athens', 'yadian', 'ATH');
INSERT INTO `sp_place` VALUES ('2726', '222', ',2,222,2726,', '3', '伊拉克里翁', 'Irakleiou', 'yilakeliweng', 'HER');
INSERT INTO `sp_place` VALUES ('2727', '225', ',6,225,2727,', '3', '奥克兰', 'Auckland', 'aokelan', 'AUK');
INSERT INTO `sp_place` VALUES ('2728', '225', ',6,225,2728,', '3', '北岸', 'North Shore', 'beian', 'NSH');
INSERT INTO `sp_place` VALUES ('2729', '225', ',6,225,2729,', '3', '北帕默斯顿', 'Palmerston North', 'beipamosidun', 'PMR');
INSERT INTO `sp_place` VALUES ('2730', '225', ',6,225,2730,', '3', '北远', 'Far North', 'beiyuan', 'FNR');
INSERT INTO `sp_place` VALUES ('2731', '225', ',6,225,2731,', '3', '布莱尼姆', 'Blenheim', 'bulainimu', 'BHE');
INSERT INTO `sp_place` VALUES ('2732', '225', ',6,225,2732,', '3', '达尼丁', 'Dunedin', 'daniding', 'DUD');
INSERT INTO `sp_place` VALUES ('2733', '225', ',6,225,2733,', '3', '格雷茅斯', 'Greymouth', 'geleimaosi', 'GMN');
INSERT INTO `sp_place` VALUES ('2734', '225', ',6,225,2734,', '3', '哈密尔顿', 'Hamilton', 'hamierdun', 'HLZ');
INSERT INTO `sp_place` VALUES ('2735', '225', ',6,225,2735,', '3', '黑斯廷斯', 'Hastings', 'heisitingsi', 'HAS');
INSERT INTO `sp_place` VALUES ('2736', '225', ',6,225,2736,', '3', '怀塔科拉', 'Waitakere', 'huaitakela', 'WAE');
INSERT INTO `sp_place` VALUES ('2737', '225', ',6,225,2737,', '3', '吉斯伯恩', 'Gisborne', 'jisiboen', 'GIS');
INSERT INTO `sp_place` VALUES ('2738', '225', ',6,225,2738,', '3', '凯帕拉', 'Kaipara', 'kaipala', 'KAI');
INSERT INTO `sp_place` VALUES ('2739', '225', ',6,225,2739,', '3', '克赖斯特彻奇', 'Christchurch', 'kelaisitecheqi', 'CHC');
INSERT INTO `sp_place` VALUES ('2740', '225', ',6,225,2740,', '3', '里士满', 'Richmond', 'lishiman', 'RMD');
INSERT INTO `sp_place` VALUES ('2741', '225', ',6,225,2741,', '3', '马努考', 'Manukau', 'manukao', 'MNK');
INSERT INTO `sp_place` VALUES ('2742', '225', ',6,225,2742,', '3', '纳尔逊', 'Nelson', 'naerxun', 'NSN');
INSERT INTO `sp_place` VALUES ('2743', '225', ',6,225,2743,', '3', '内皮尔', 'Napier', 'neipier', 'NPE');
INSERT INTO `sp_place` VALUES ('2744', '225', ',6,225,2744,', '3', '斯特拉特福德', 'Stratford', 'sitelatefude', 'STR');
INSERT INTO `sp_place` VALUES ('2745', '225', ',6,225,2745,', '3', '陶马鲁努伊', 'Taumarunui', 'taomalunuyi', 'TAU');
INSERT INTO `sp_place` VALUES ('2746', '225', ',6,225,2746,', '3', '瓦卡塔尼', 'Whakatane', 'wakatani', 'WHK');
INSERT INTO `sp_place` VALUES ('2747', '225', ',6,225,2747,', '3', '旺阿雷', 'Whangarei', 'wangalei', 'WRE');
INSERT INTO `sp_place` VALUES ('2748', '225', ',6,225,2748,', '3', '旺格努伊', 'Wanganui', 'wanggenuyi', 'WAG');
INSERT INTO `sp_place` VALUES ('2749', '225', ',6,225,2749,', '3', '新普利茅斯', 'New Plymouth', 'xinpulimaosi', 'NPL');
INSERT INTO `sp_place` VALUES ('2750', '225', ',6,225,2750,', '3', '因弗卡吉尔', 'Invercargill', 'yinfukajier', 'IVC');
INSERT INTO `sp_place` VALUES ('2751', '226', ',2,226,2751,', '3', '巴兰尼亚', 'Baranya', 'balanniya', 'BA');
INSERT INTO `sp_place` VALUES ('2752', '226', ',2,226,2752,', '3', '巴奇-基什孔', 'Bacs-Kiskun', 'baqijishikong', 'BK');
INSERT INTO `sp_place` VALUES ('2753', '226', ',2,226,2753,', '3', '包尔绍德-奥包乌伊-曾普伦', 'Borsod-Abauj-Zemplen', 'baoershaodeaobaowuyizengpulun', 'BZ');
INSERT INTO `sp_place` VALUES ('2754', '226', ',2,226,2754,', '3', '贝凯什', 'Bekes', 'beikaishi', 'BE');
INSERT INTO `sp_place` VALUES ('2755', '226', ',2,226,2755,', '3', '布达佩斯', 'Budapest', 'budapeisi', 'BU');
INSERT INTO `sp_place` VALUES ('2756', '226', ',2,226,2756,', '3', '费耶尔', 'Fejer', 'feiyeer', 'FE');
INSERT INTO `sp_place` VALUES ('2757', '226', ',2,226,2757,', '3', '豪伊杜-比豪尔', 'Hajdu-Bihar', 'haoyidubihaoer', 'HB');
INSERT INTO `sp_place` VALUES ('2758', '226', ',2,226,2758,', '3', '赫维什', 'Heves', 'heweishi', 'HE');
INSERT INTO `sp_place` VALUES ('2759', '226', ',2,226,2759,', '3', '加兹-纳杰孔-索尔诺克', 'Jasz-Nagykun-Szolnok', 'jiazinajiekongsuoernuoke', 'JN');
INSERT INTO `sp_place` VALUES ('2760', '226', ',2,226,2760,', '3', '杰尔-莫松-肖普朗', 'Gyor-Moson-Sopron', 'jieermosongxiaopulang', 'GS');
INSERT INTO `sp_place` VALUES ('2761', '226', ',2,226,2761,', '3', '科马罗姆', 'Komarom-Esztergom', 'kemaluomu', 'KE');
INSERT INTO `sp_place` VALUES ('2762', '226', ',2,226,2762,', '3', '诺格拉德', 'Nograd', 'nuogelade', 'NO');
INSERT INTO `sp_place` VALUES ('2763', '226', ',2,226,2763,', '3', '佩斯', 'Pest', 'peisi', 'PE');
INSERT INTO `sp_place` VALUES ('2764', '226', ',2,226,2764,', '3', '琼格拉德', 'Csongrad', 'qionggelade', 'CS');
INSERT INTO `sp_place` VALUES ('2765', '226', ',2,226,2765,', '3', '绍莫吉', 'Somogy', 'shaomoji', 'SO');
INSERT INTO `sp_place` VALUES ('2766', '226', ',2,226,2766,', '3', '索博尔奇-索特马尔-贝拉格', 'Szabolcs-Szatmar-Bereg', 'suoboerqisuotemaerbeilage', 'SZ');
INSERT INTO `sp_place` VALUES ('2767', '226', ',2,226,2767,', '3', '托尔瑙', 'Tolna', 'tuoer', 'TO');
INSERT INTO `sp_place` VALUES ('2768', '226', ',2,226,2768,', '3', '维斯普雷姆', 'Veszprem', 'weisipuleimu', 'VE');
INSERT INTO `sp_place` VALUES ('2769', '226', ',2,226,2769,', '3', '沃什', 'Vas', 'woshi', 'VA');
INSERT INTO `sp_place` VALUES ('2770', '226', ',2,226,2770,', '3', '佐洛', 'Zala', 'zuoluo', 'ZA');
INSERT INTO `sp_place` VALUES ('2771', '227', ',1,227,2771,', '3', '阿勒颇', 'Halab', 'alepo', 'HL');
INSERT INTO `sp_place` VALUES ('2772', '227', ',1,227,2772,', '3', '大马士革', 'Rif Dimashq', 'damashige', 'RD');
INSERT INTO `sp_place` VALUES ('2773', '227', ',1,227,2773,', '3', '大马士革市', 'Madinat Dimashq', 'damashigeshi', 'DI');
INSERT INTO `sp_place` VALUES ('2774', '227', ',1,227,2774,', '3', '代尔祖尔', 'Dayr az Zawr', 'daierzuer', 'DZ');
INSERT INTO `sp_place` VALUES ('2775', '227', ',1,227,2775,', '3', '德拉', 'Dara', 'dela', 'DA');
INSERT INTO `sp_place` VALUES ('2776', '227', ',1,227,2776,', '3', '哈马', 'Hamah', 'hama', 'HM');
INSERT INTO `sp_place` VALUES ('2777', '227', ',1,227,2777,', '3', '哈塞克', 'Al Hasakah', 'hasaike', 'HA');
INSERT INTO `sp_place` VALUES ('2778', '227', ',1,227,2778,', '3', '霍姆斯', 'Hims', 'huomusi', 'HI');
INSERT INTO `sp_place` VALUES ('2779', '227', ',1,227,2779,', '3', '加布', 'Al Ghab', 'jiabu', 'GH');
INSERT INTO `sp_place` VALUES ('2780', '227', ',1,227,2780,', '3', '卡米什利', 'Al-Qamishli', 'kamishili', 'QA');
INSERT INTO `sp_place` VALUES ('2781', '227', ',1,227,2781,', '3', '库奈特拉', 'Al Qunaytirah', 'kunaitela', 'QU');
INSERT INTO `sp_place` VALUES ('2782', '227', ',1,227,2782,', '3', '拉卡', 'Ar Raqqah', 'laka', 'RQ');
INSERT INTO `sp_place` VALUES ('2783', '227', ',1,227,2783,', '3', '拉塔基亚', 'Al Ladhiqiyah', 'latajiya', 'LA');
INSERT INTO `sp_place` VALUES ('2784', '227', ',1,227,2784,', '3', '苏韦达', 'As Suwayda', 'suweida', 'SU');
INSERT INTO `sp_place` VALUES ('2785', '227', ',1,227,2785,', '3', '塔尔图斯', 'Tartus', 'taertusi', 'TA');
INSERT INTO `sp_place` VALUES ('2786', '227', ',1,227,2786,', '3', '伊德利卜', 'Idlib', 'yidelibo', 'ID');
INSERT INTO `sp_place` VALUES ('2787', '228', ',4,228,2787,', '3', '波特兰', 'Portland', 'botelan', 'POR');
INSERT INTO `sp_place` VALUES ('2788', '228', ',4,228,2788,', '3', '汉诺威', 'Hanover', 'hannuowei', 'HAN');
INSERT INTO `sp_place` VALUES ('2789', '228', ',4,228,2789,', '3', '金斯敦', 'Kingston', 'jinsidun', 'KIN');
INSERT INTO `sp_place` VALUES ('2790', '228', ',4,228,2790,', '3', '克拉伦登', 'Clarendon', 'kelalundeng', 'CLA');
INSERT INTO `sp_place` VALUES ('2791', '228', ',4,228,2791,', '3', '曼彻斯特', 'Manchester', 'manchesite', 'MAN');
INSERT INTO `sp_place` VALUES ('2792', '228', ',4,228,2792,', '3', '圣安德鲁斯', 'St. Andrews', 'shengandelusi', 'AND');
INSERT INTO `sp_place` VALUES ('2793', '228', ',4,228,2793,', '3', '圣安娜', 'St. Ann', 'shenganna', 'ANN');
INSERT INTO `sp_place` VALUES ('2794', '228', ',4,228,2794,', '3', '圣凯瑟琳', 'St. Catherine', 'shengkaiselin', 'CAT');
INSERT INTO `sp_place` VALUES ('2795', '228', ',4,228,2795,', '3', '圣玛丽', 'St. Mary', 'shengmali', 'MAR');
INSERT INTO `sp_place` VALUES ('2796', '228', ',4,228,2796,', '3', '圣托马斯', 'St. Thomas', 'shengtuomasi', 'THO');
INSERT INTO `sp_place` VALUES ('2797', '228', ',4,228,2797,', '3', '圣伊丽莎白', 'St. Elizabeth', 'shengyilishabai', 'ELI');
INSERT INTO `sp_place` VALUES ('2798', '228', ',4,228,2798,', '3', '圣詹姆斯', 'St. James', 'shengzhanmusi', 'JAM');
INSERT INTO `sp_place` VALUES ('2799', '228', ',4,228,2799,', '3', '特里洛尼', 'Trelawny', 'teliluoni', 'TRL');
INSERT INTO `sp_place` VALUES ('2800', '228', ',4,228,2800,', '3', '西摩兰', 'Westmoreland', 'ximolan', 'WML');
INSERT INTO `sp_place` VALUES ('2801', '229', ',1,229,2801,', '3', '阿尔马维尔', 'Armavir', 'aermaweier', 'ARM');
INSERT INTO `sp_place` VALUES ('2802', '229', ',1,229,2802,', '3', '阿拉加措特恩', 'Aragacotn', 'alajiacuoteen', 'AGT');
INSERT INTO `sp_place` VALUES ('2803', '229', ',1,229,2803,', '3', '阿拉拉特', 'Ararat', 'alalate', 'ARA');
INSERT INTO `sp_place` VALUES ('2804', '229', ',1,229,2804,', '3', '埃里温市', 'Yerevan', 'ailiwenshi', 'EVN');
INSERT INTO `sp_place` VALUES ('2805', '229', ',1,229,2805,', '3', '格加尔库尼克', 'Gelarkunik', 'gejiaerkunike', 'GEG');
INSERT INTO `sp_place` VALUES ('2806', '229', ',1,229,2806,', '3', '科泰克', 'Kotayk', 'ketaike', 'KOT');
INSERT INTO `sp_place` VALUES ('2807', '229', ',1,229,2807,', '3', '洛里', 'Lorri', 'luoli', 'LOR');
INSERT INTO `sp_place` VALUES ('2808', '229', ',1,229,2808,', '3', '塔武什', 'Tavus', 'tawushi', 'TAV');
INSERT INTO `sp_place` VALUES ('2809', '229', ',1,229,2809,', '3', '瓦约茨·佐尔', 'VayocJor', 'wayueci', 'VAY');
INSERT INTO `sp_place` VALUES ('2810', '229', ',1,229,2810,', '3', '希拉克', 'Shirak', 'xilake', 'SHI');
INSERT INTO `sp_place` VALUES ('2811', '229', ',1,229,2811,', '3', '休尼克', 'Syunik', 'xiunike', 'SYU');
INSERT INTO `sp_place` VALUES ('2812', '230', ',1,230,2812,', '3', '阿比扬', 'Abyan', 'abiyang', 'AB');
INSERT INTO `sp_place` VALUES ('2813', '230', ',1,230,2813,', '3', '阿姆兰', 'Amran Sana', 'amulan', 'AM');
INSERT INTO `sp_place` VALUES ('2814', '230', ',1,230,2814,', '3', '贝达', 'Al-Bayda', 'beida', 'BA');
INSERT INTO `sp_place` VALUES ('2815', '230', ',1,230,2815,', '3', '达利', 'Ad-Dali', 'dali', 'DA');
INSERT INTO `sp_place` VALUES ('2816', '230', ',1,230,2816,', '3', '哈德拉毛', 'Hadramawt', 'hadelamao', 'HD');
INSERT INTO `sp_place` VALUES ('2817', '230', ',1,230,2817,', '3', '哈杰', 'Hajjah', 'hajie', 'HJ');
INSERT INTO `sp_place` VALUES ('2818', '230', ',1,230,2818,', '3', '荷台达', 'Al-Hudaydah', 'hetaida', 'HU');
INSERT INTO `sp_place` VALUES ('2819', '230', ',1,230,2819,', '3', '焦夫', 'Al-Jawf', 'jiaofu', 'JA');
INSERT INTO `sp_place` VALUES ('2820', '230', ',1,230,2820,', '3', '拉赫季', 'Lahij', 'laheji', 'LA');
INSERT INTO `sp_place` VALUES ('2821', '230', ',1,230,2821,', '3', '马里卜', 'Marib', 'malibo', 'MA');
INSERT INTO `sp_place` VALUES ('2822', '230', ',1,230,2822,', '3', '迈赫拉', 'Al-Mahrah', 'maihela', 'MR');
INSERT INTO `sp_place` VALUES ('2823', '230', ',1,230,2823,', '3', '迈赫维特', 'Al-Mahwit', 'maiheweite', 'MW');
INSERT INTO `sp_place` VALUES ('2824', '230', ',1,230,2824,', '3', '萨达', 'Sadah', 'sada', 'SD');
INSERT INTO `sp_place` VALUES ('2825', '230', ',1,230,2825,', '3', '萨那', 'Sana', 'sana', 'SN');
INSERT INTO `sp_place` VALUES ('2826', '230', ',1,230,2826,', '3', '赛文', 'Seiyun', 'saiwen', 'GXF');
INSERT INTO `sp_place` VALUES ('2827', '230', ',1,230,2827,', '3', '舍卜沃', 'Shabwah', 'shebowo', 'SH');
INSERT INTO `sp_place` VALUES ('2828', '230', ',1,230,2828,', '3', '塔伊兹', 'Taizz', 'tayizi', 'TA');
INSERT INTO `sp_place` VALUES ('2829', '230', ',1,230,2829,', '3', '希赫尔', 'Ash-Shihr', 'xiheer', 'ASR');
INSERT INTO `sp_place` VALUES ('2830', '230', ',1,230,2830,', '3', '亚丁', 'Adan', 'yading', 'AD');
INSERT INTO `sp_place` VALUES ('2831', '230', ',1,230,2831,', '3', '伊卜', 'Ibb', 'yibo', 'IB');
INSERT INTO `sp_place` VALUES ('2832', '230', ',1,230,2832,', '3', '扎玛尔', 'Dhamar', 'zhamaer', 'DH');
INSERT INTO `sp_place` VALUES ('2833', '233', ',1,233,2833,', '3', '阿什杜德', 'Ashdod', 'ashidude', 'ASH');
INSERT INTO `sp_place` VALUES ('2834', '233', ',1,233,2834,', '3', '贝尔谢巴', 'Beersheba', 'beierxieba', 'BEV');
INSERT INTO `sp_place` VALUES ('2835', '233', ',1,233,2835,', '3', '贝特雁', 'Bat Yam', 'beiteyan', 'BAT');
INSERT INTO `sp_place` VALUES ('2836', '233', ',1,233,2836,', '3', '海法', 'Haifa', 'haifa', 'HFA');
INSERT INTO `sp_place` VALUES ('2837', '233', ',1,233,2837,', '3', '霍隆', 'Holon', 'huolong', 'HOL');
INSERT INTO `sp_place` VALUES ('2838', '233', ',1,233,2838,', '3', '内坦亚', 'Netanya', 'neitanya', 'NAT');
INSERT INTO `sp_place` VALUES ('2839', '233', ',1,233,2839,', '3', '特拉维夫', 'Tel Aviv-Yafo', 'telaweifu', 'TLV');
INSERT INTO `sp_place` VALUES ('2840', '233', ',1,233,2840,', '3', '耶路撒冷', 'Jerusalem', 'yelusaleng', 'J');
INSERT INTO `sp_place` VALUES ('2841', '234', ',2,234,2841,', '3', '阿斯蒂', 'Asti', 'asidi', 'AST');
INSERT INTO `sp_place` VALUES ('2842', '234', ',2,234,2842,', '3', '阿斯科利皮切诺', 'Ascoli Piceno', 'asikelipiqienuo', 'ASP');
INSERT INTO `sp_place` VALUES ('2843', '234', ',2,234,2843,', '3', '安科纳', 'Ancona', 'ankena', 'AOI');
INSERT INTO `sp_place` VALUES ('2844', '234', ',2,234,2844,', '3', '奥尔比亚', 'Olbia-Tempio', 'aoerbiya', 'OLB');
INSERT INTO `sp_place` VALUES ('2845', '234', ',2,234,2845,', '3', '奥里斯塔诺', 'Oristano', 'aolisitanuo', 'QOS');
INSERT INTO `sp_place` VALUES ('2846', '234', ',2,234,2846,', '3', '奥斯塔', 'Aosta', 'aosita', 'AOT');
INSERT INTO `sp_place` VALUES ('2847', '234', ',2,234,2847,', '3', '巴勒莫', 'Palermo', 'balemo', 'PMO');
INSERT INTO `sp_place` VALUES ('2848', '234', ',2,234,2848,', '3', '巴里', 'Bari', 'bali', 'BRI');
INSERT INTO `sp_place` VALUES ('2849', '234', ',2,234,2849,', '3', '贝加莫', 'Bergamo', 'beijiamo', 'BGO');
INSERT INTO `sp_place` VALUES ('2850', '234', ',2,234,2850,', '3', '贝内文托', 'Benevento', 'beineiwentuo', 'BEN');
INSERT INTO `sp_place` VALUES ('2851', '234', ',2,234,2851,', '3', '比萨', 'Pisa', 'bisa', 'PSA');
INSERT INTO `sp_place` VALUES ('2852', '234', ',2,234,2852,', '3', '波代诺内', 'Pordenone', 'bodainuonei', 'PRD');
INSERT INTO `sp_place` VALUES ('2853', '234', ',2,234,2853,', '3', '波坦察', 'Potenza', 'botancha', 'QPO');
INSERT INTO `sp_place` VALUES ('2854', '234', ',2,234,2854,', '3', '博洛尼亚', 'Bologna', 'boluoniya', 'BLQ');
INSERT INTO `sp_place` VALUES ('2855', '234', ',2,234,2855,', '3', '布拉', 'Biella', 'bula', 'BIE');
INSERT INTO `sp_place` VALUES ('2856', '234', ',2,234,2856,', '3', '布雷西亚', 'Brescia', 'buleixiya', 'BRC');
INSERT INTO `sp_place` VALUES ('2857', '234', ',2,234,2857,', '3', '布林迪西', 'Brindisi', 'bulindixi', 'BDS');
INSERT INTO `sp_place` VALUES ('2858', '234', ',2,234,2858,', '3', '的里雅斯特', 'Trieste', 'deliyasite', 'TRS');
INSERT INTO `sp_place` VALUES ('2859', '234', ',2,234,2859,', '3', '都灵', 'Turin', 'duling', 'TRN');
INSERT INTO `sp_place` VALUES ('2860', '234', ',2,234,2860,', '3', '费拉拉', 'Ferrara', 'feilala', 'FRR');
INSERT INTO `sp_place` VALUES ('2861', '234', ',2,234,2861,', '3', '佛罗伦萨', 'Firenze', 'foluolunsa', 'FLR');
INSERT INTO `sp_place` VALUES ('2862', '234', ',2,234,2862,', '3', '福贾', 'Foggia', 'fujia', 'FOG');
INSERT INTO `sp_place` VALUES ('2863', '234', ',2,234,2863,', '3', '卡利亚里', 'Cagliari', 'kaliyali', 'CAG');
INSERT INTO `sp_place` VALUES ('2864', '234', ',2,234,2864,', '3', '卡塞塔', 'Caserta', 'kasaita', 'CST');
INSERT INTO `sp_place` VALUES ('2865', '234', ',2,234,2865,', '3', '卡塔尼亚', 'Catania', 'kataniya', 'CTA');
INSERT INTO `sp_place` VALUES ('2866', '234', ',2,234,2866,', '3', '卡坦扎罗', 'Catanzaro', 'katanzhaluo', 'QCZ');
INSERT INTO `sp_place` VALUES ('2867', '234', ',2,234,2867,', '3', '坎波巴索', 'Campobasso', 'kanbobasuo', 'COB');
INSERT INTO `sp_place` VALUES ('2868', '234', ',2,234,2868,', '3', '科摩', 'Como', 'kemo', 'CIY');
INSERT INTO `sp_place` VALUES ('2869', '234', ',2,234,2869,', '3', '科森扎', 'Cosenza', 'kesenzha', 'QCS');
INSERT INTO `sp_place` VALUES ('2870', '234', ',2,234,2870,', '3', '克罗托内', 'Crotone', 'keluotuonei', 'CRV');
INSERT INTO `sp_place` VALUES ('2871', '234', ',2,234,2871,', '3', '库内奥', 'Cuneo', 'kuneiao', 'CUN');
INSERT INTO `sp_place` VALUES ('2872', '234', ',2,234,2872,', '3', '拉奎拉', 'L\'Aquila', 'lakuila', 'LAQ');
INSERT INTO `sp_place` VALUES ('2873', '234', ',2,234,2873,', '3', '拉斯佩齐亚', 'La Spezia', 'lasipeiqiya', 'SPE');
INSERT INTO `sp_place` VALUES ('2874', '234', ',2,234,2874,', '3', '莱科', 'Lecco', 'laike', 'LCO');
INSERT INTO `sp_place` VALUES ('2875', '234', ',2,234,2875,', '3', '莱切', 'Lecce', 'laiqie', 'LCC');
INSERT INTO `sp_place` VALUES ('2876', '234', ',2,234,2876,', '3', '雷焦艾米利亚', 'Reggio Emilia', 'leijiaoaimiliya', 'RNE');
INSERT INTO `sp_place` VALUES ('2877', '234', ',2,234,2877,', '3', '雷焦卡拉布里亚', 'Reggio Calabria', 'leijiaokalabuliya', 'REG');
INSERT INTO `sp_place` VALUES ('2878', '234', ',2,234,2878,', '3', '里窝那', 'Livorno', 'liwona', 'LIV');
INSERT INTO `sp_place` VALUES ('2879', '234', ',2,234,2879,', '3', '罗马', 'Roma', 'luoma', 'ROM');
INSERT INTO `sp_place` VALUES ('2880', '234', ',2,234,2880,', '3', '马萨', 'Massa-Carrara', 'masa', 'MCR');
INSERT INTO `sp_place` VALUES ('2881', '234', ',2,234,2881,', '3', '马泰拉', 'Matera', 'mataila', 'MTR');
INSERT INTO `sp_place` VALUES ('2882', '234', ',2,234,2882,', '3', '蒙扎', 'Monza e Brianza', 'mengzha', 'MZA');
INSERT INTO `sp_place` VALUES ('2883', '234', ',2,234,2883,', '3', '米兰', 'Milano', 'milan', 'MIL');
INSERT INTO `sp_place` VALUES ('2884', '234', ',2,234,2884,', '3', '摩德纳', 'Modena', 'modena', 'MOD');
INSERT INTO `sp_place` VALUES ('2885', '234', ',2,234,2885,', '3', '墨西拿', 'Messina', 'moxina', 'MSN');
INSERT INTO `sp_place` VALUES ('2886', '234', ',2,234,2886,', '3', '那不勒斯', 'Naples', 'nabulesi', 'NAP');
INSERT INTO `sp_place` VALUES ('2887', '234', ',2,234,2887,', '3', '努奥罗', 'Nuoro', 'nuaoluo', 'QNU');
INSERT INTO `sp_place` VALUES ('2888', '234', ',2,234,2888,', '3', '诺瓦拉', 'Novara', 'nuowala', 'NVR');
INSERT INTO `sp_place` VALUES ('2889', '234', ',2,234,2889,', '3', '帕尔马', 'Parma', 'paerma', 'PMF');
INSERT INTO `sp_place` VALUES ('2890', '234', ',2,234,2890,', '3', '帕维亚', 'Pavia', 'paweiya', 'PAV');
INSERT INTO `sp_place` VALUES ('2891', '234', ',2,234,2891,', '3', '佩鲁贾', 'Perugia', 'peilujia', 'PEG');
INSERT INTO `sp_place` VALUES ('2892', '234', ',2,234,2892,', '3', '热那亚', 'Genova', 'renaya', 'CAX');
INSERT INTO `sp_place` VALUES ('2893', '234', ',2,234,2893,', '3', '萨莱诺', 'Salerno', 'salainuo', 'SAL');
INSERT INTO `sp_place` VALUES ('2894', '234', ',2,234,2894,', '3', '萨萨里', 'Sassari', 'sasali', 'QSS');
INSERT INTO `sp_place` VALUES ('2895', '234', ',2,234,2895,', '3', '萨沃纳', 'Savona', 'sawona', 'SVN');
INSERT INTO `sp_place` VALUES ('2896', '234', ',2,234,2896,', '3', '塔兰托', 'Taranto', 'talantuo', 'TAR');
INSERT INTO `sp_place` VALUES ('2897', '234', ',2,234,2897,', '3', '特拉帕尼', 'Trapani', 'telapani', 'TPS');
INSERT INTO `sp_place` VALUES ('2898', '234', ',2,234,2898,', '3', '特伦托', 'Trento', 'teluntuo', 'TRT');
INSERT INTO `sp_place` VALUES ('2899', '234', ',2,234,2899,', '3', '威尼斯', 'Venice', 'weinisi', 'VCE');
INSERT INTO `sp_place` VALUES ('2900', '234', ',2,234,2900,', '3', '韦尔切利', 'Vercelli', 'weierqieli', 'VRL');
INSERT INTO `sp_place` VALUES ('2901', '234', ',2,234,2901,', '3', '维泰博', 'Viterbo', 'weitaibo', 'VIT');
INSERT INTO `sp_place` VALUES ('2902', '234', ',2,234,2902,', '3', '乌迪内', 'Udine', 'wudinei', 'UDN');
INSERT INTO `sp_place` VALUES ('2903', '234', ',2,234,2903,', '3', '锡拉库扎', 'Syracuse', 'xilakuzha', 'SYR');
INSERT INTO `sp_place` VALUES ('2904', '234', ',2,234,2904,', '3', '锡耶纳', 'Siena', 'xiyena', 'SNA');
INSERT INTO `sp_place` VALUES ('2905', '234', ',2,234,2905,', '3', '亚历山德里亚', 'Alessandria', 'yalishandeliya', 'ALE');
INSERT INTO `sp_place` VALUES ('2906', '234', ',2,234,2906,', '3', '伊塞尔尼亚', 'Isernia', 'yisaierniya', 'ISE');
INSERT INTO `sp_place` VALUES ('2907', '235', ',1,235,2907,', '3', '艾藻尔', 'Aizawl', 'aizaoer', 'AJL');
INSERT INTO `sp_place` VALUES ('2908', '235', ',1,235,2908,', '3', '班加罗尔', 'Bangalore', 'banjialuoer', 'BLR');
INSERT INTO `sp_place` VALUES ('2909', '235', ',1,235,2909,', '3', '本地治里', 'Pondicherry', 'bendizhili', 'PNY');
INSERT INTO `sp_place` VALUES ('2910', '235', ',1,235,2910,', '3', '博帕尔', 'Bhopal', 'bopaer', 'BHO');
INSERT INTO `sp_place` VALUES ('2911', '235', ',1,235,2911,', '3', '布巴内斯瓦尔', 'Bhubaneswar', 'bubaneisiwaer', 'BBI');
INSERT INTO `sp_place` VALUES ('2912', '235', ',1,235,2912,', '3', '昌迪加尔', 'Chandigarh', 'changdijiaer', 'IXC');
INSERT INTO `sp_place` VALUES ('2913', '235', ',1,235,2913,', '3', '达曼', 'Daman', 'daman', 'DAM');
INSERT INTO `sp_place` VALUES ('2914', '235', ',1,235,2914,', '3', '第乌', 'Diu', 'diwu', 'DIU');
INSERT INTO `sp_place` VALUES ('2915', '235', ',1,235,2915,', '3', '甘托克', 'Gangtok', 'gantuoke', 'GTO');
INSERT INTO `sp_place` VALUES ('2916', '235', ',1,235,2916,', '3', '哥印拜陀', 'Coimbatore', 'geyinbaituo', 'CJB');
INSERT INTO `sp_place` VALUES ('2917', '235', ',1,235,2917,', '3', '加尔各答', 'Calcutta', 'jiaergeda', 'CCU');
INSERT INTO `sp_place` VALUES ('2918', '235', ',1,235,2918,', '3', '加里加尔', 'Karaikal', 'jialijiaer', 'KRK');
INSERT INTO `sp_place` VALUES ('2919', '235', ',1,235,2919,', '3', '贾巴尔普尔', 'Jabalpur', 'jiabaerpuer', 'JLR');
INSERT INTO `sp_place` VALUES ('2920', '235', ',1,235,2920,', '3', '贾朗达尔', 'Jalandhar', 'jialangdaer', 'JUC');
INSERT INTO `sp_place` VALUES ('2921', '235', ',1,235,2921,', '3', '焦特布尔', 'Jodhpur', 'jiaotebuer', 'JDH');
INSERT INTO `sp_place` VALUES ('2922', '235', ',1,235,2922,', '3', '金奈', 'Chennai', 'jinnai', 'MAA');
INSERT INTO `sp_place` VALUES ('2923', '235', ',1,235,2923,', '3', '卡瓦拉蒂', 'Kavaratti', 'kawaladi', 'KVA');
INSERT INTO `sp_place` VALUES ('2924', '235', ',1,235,2924,', '3', '科希马', 'Kohima', 'kexima', 'KOM');
INSERT INTO `sp_place` VALUES ('2925', '235', ',1,235,2925,', '3', '马埃', 'Mahe', 'maai', 'MAH');
INSERT INTO `sp_place` VALUES ('2926', '235', ',1,235,2926,', '3', '马杜赖', 'Madurai', 'madulai', 'IXM');
INSERT INTO `sp_place` VALUES ('2927', '235', ',1,235,2927,', '3', '森伯尔布尔', 'Sambalpur', 'senboerbuer', 'SLR');
INSERT INTO `sp_place` VALUES ('2928', '235', ',1,235,2928,', '3', '特里凡得琅', 'Trivandrum', 'telifandelang', 'TRV');
INSERT INTO `sp_place` VALUES ('2929', '235', ',1,235,2929,', '3', '乌代布尔', 'Udaipur', 'wudaibuer', 'UDR');
INSERT INTO `sp_place` VALUES ('2930', '235', ',1,235,2930,', '3', '西隆', 'Shillong', 'xilong', 'SHL');
INSERT INTO `sp_place` VALUES ('2931', '235', ',1,235,2931,', '3', '锡尔萨瓦', 'Silvassa', 'xiersawa', 'SIL');
INSERT INTO `sp_place` VALUES ('2932', '235', ',1,235,2932,', '3', '新德里', 'New Delhi', 'xindeli', 'ICD');
INSERT INTO `sp_place` VALUES ('2933', '235', ',1,235,2933,', '3', '亚南', 'Yanam', 'yanan', 'SRV');
INSERT INTO `sp_place` VALUES ('2934', '235', ',1,235,2934,', '3', '因帕尔', 'Imphal', 'yinpaer', 'IMF');
INSERT INTO `sp_place` VALUES ('2935', '235', ',1,235,2935,', '3', '印多尔', 'Indore', 'yinduoer', 'IDR');
INSERT INTO `sp_place` VALUES ('2936', '235', ',1,235,2936,', '3', '斋普尔', 'Jaipur', 'zhaipuer', 'JAI');
INSERT INTO `sp_place` VALUES ('2937', '236', ',1,236,2937,', '3', '巴厘', 'Bali', 'bali', 'BA');
INSERT INTO `sp_place` VALUES ('2938', '236', ',1,236,2938,', '3', '邦加－勿里洞群岛', 'Kepulauan Bangka Belitung', 'bangjiawulidongqundao', 'BB');
INSERT INTO `sp_place` VALUES ('2939', '236', ',1,236,2939,', '3', '北苏拉威西', 'Sulawesi Utara', 'beisulaweixi', 'SA');
INSERT INTO `sp_place` VALUES ('2940', '236', ',1,236,2940,', '3', '北苏门答腊', 'Sumatera Utara', 'beisumendala', 'SU');
INSERT INTO `sp_place` VALUES ('2941', '236', ',1,236,2941,', '3', '大雅加达首都特区', 'Daerah Tingkat I Kalimantan Barat', 'dayajiadashoudutequ', 'KB');
INSERT INTO `sp_place` VALUES ('2942', '236', ',1,236,2942,', '3', '东加里曼丹', 'Kalimantan Timur', 'dongjialimandan', 'KI');
INSERT INTO `sp_place` VALUES ('2943', '236', ',1,236,2943,', '3', '东南苏拉威西', 'Sulawesi Tenggara', 'dongnansulaweixi', 'SG');
INSERT INTO `sp_place` VALUES ('2944', '236', ',1,236,2944,', '3', '东努沙登加拉', 'Nusa Tenggara Timur', 'dongnushadengjiala', 'NT');
INSERT INTO `sp_place` VALUES ('2945', '236', ',1,236,2945,', '3', '东爪哇', 'Java Timur', 'dongzhuawa', 'JI');
INSERT INTO `sp_place` VALUES ('2946', '236', ',1,236,2946,', '3', '廖内', 'Riau', 'liaonei', 'RI');
INSERT INTO `sp_place` VALUES ('2947', '236', ',1,236,2947,', '3', '马鲁古', 'Maluku', 'malugu', 'MA');
INSERT INTO `sp_place` VALUES ('2948', '236', ',1,236,2948,', '3', '明古鲁', 'Bengkulu', 'minggulu', 'BE');
INSERT INTO `sp_place` VALUES ('2949', '236', ',1,236,2949,', '3', '楠榜', 'Lampung', 'bang', 'LA');
INSERT INTO `sp_place` VALUES ('2950', '236', ',1,236,2950,', '3', '南加里曼丹', 'Kalimantan Selatan', 'nanjialimandan', 'KS');
INSERT INTO `sp_place` VALUES ('2951', '236', ',1,236,2951,', '3', '南苏拉威西', 'Sulawesi Selatan', 'nansulaweixi', 'SN');
INSERT INTO `sp_place` VALUES ('2952', '236', ',1,236,2952,', '3', '南苏门答腊', 'Sumatera Selatan', 'nansumendala', 'SS');
INSERT INTO `sp_place` VALUES ('2953', '236', ',1,236,2953,', '3', '日惹特区', 'Daerah Istimewa Yogyakarta', 'riretequ', 'YO');
INSERT INTO `sp_place` VALUES ('2954', '236', ',1,236,2954,', '3', '万丹', 'Banten', 'wandan', 'BT');
INSERT INTO `sp_place` VALUES ('2955', '236', ',1,236,2955,', '3', '西努沙登加拉', 'Nusa Tenggara Barat', 'xinushadengjiala', 'NB');
INSERT INTO `sp_place` VALUES ('2956', '236', ',1,236,2956,', '3', '西苏门答腊', 'Sumatera Barat', 'xisumendala', 'SR');
INSERT INTO `sp_place` VALUES ('2957', '236', ',1,236,2957,', '3', '西爪哇', 'Java Barat', 'xizhuawa', 'JB');
INSERT INTO `sp_place` VALUES ('2958', '236', ',1,236,2958,', '3', '雅加达', 'Jakarta Raya', 'yajiada', 'JK');
INSERT INTO `sp_place` VALUES ('2959', '236', ',1,236,2959,', '3', '亚齐', 'Aceh', 'yaqi', 'AC');
INSERT INTO `sp_place` VALUES ('2960', '236', ',1,236,2960,', '3', '伊里安查亚', 'Irian Jaya', 'yilianchaya', 'IJ');
INSERT INTO `sp_place` VALUES ('2961', '236', ',1,236,2961,', '3', '占碑', 'Jambi', 'zhanbei', 'JA');
INSERT INTO `sp_place` VALUES ('2962', '236', ',1,236,2962,', '3', '中加里曼丹', 'Kalimantan Tengah', 'zhongjialimandan', 'KT');
INSERT INTO `sp_place` VALUES ('2963', '236', ',1,236,2963,', '3', '中苏拉威西', 'Sulawesi Tengah', 'zhongsulaweixi', 'ST');
INSERT INTO `sp_place` VALUES ('2964', '236', ',1,236,2964,', '3', '中爪哇', 'Java Tengah', 'zhongzhuawa', 'JT');
INSERT INTO `sp_place` VALUES ('2965', '239', ',1,239,2965,', '3', '阿吉隆', 'Allun', 'ajilong', 'AJ');
INSERT INTO `sp_place` VALUES ('2966', '239', ',1,239,2966,', '3', '安曼', 'Amman', 'anman', 'AM');
INSERT INTO `sp_place` VALUES ('2967', '239', ',1,239,2967,', '3', '拜勒加', 'Balqa', 'bailejia', 'BA');
INSERT INTO `sp_place` VALUES ('2968', '239', ',1,239,2968,', '3', '杰拉什', 'Jarash', 'jielashi', 'JA');
INSERT INTO `sp_place` VALUES ('2969', '239', ',1,239,2969,', '3', '卡拉克', 'Karak', 'kalake', 'KA');
INSERT INTO `sp_place` VALUES ('2970', '239', ',1,239,2970,', '3', '鲁赛法', 'Rusayfah', 'lusaifa', 'RU');
INSERT INTO `sp_place` VALUES ('2971', '239', ',1,239,2971,', '3', '马安', 'Maan', 'maan', 'MN');
INSERT INTO `sp_place` VALUES ('2972', '239', ',1,239,2972,', '3', '马德巴', 'Madaba', 'madeba', 'MD');
INSERT INTO `sp_place` VALUES ('2973', '239', ',1,239,2973,', '3', '马夫拉克', 'Mafraq', 'mafulake', 'MF');
INSERT INTO `sp_place` VALUES ('2974', '239', ',1,239,2974,', '3', '塔菲拉', 'Tafiela', 'tafeila', 'TA');
INSERT INTO `sp_place` VALUES ('2975', '239', ',1,239,2975,', '3', '亚喀巴', 'Aqaba', 'yakaba', 'AQ');
INSERT INTO `sp_place` VALUES ('2976', '239', ',1,239,2976,', '3', '伊尔比德', 'Irbid', 'yierbide', 'IR');
INSERT INTO `sp_place` VALUES ('2977', '239', ',1,239,2977,', '3', '扎尔卡', 'Zarqa', 'zhaerka', 'ZA');
INSERT INTO `sp_place` VALUES ('2978', '240', ',1,240,2978,', '3', '海防', 'Haiphong', 'haifang', 'HP');
INSERT INTO `sp_place` VALUES ('2979', '240', ',1,240,2979,', '3', '河内', 'Hanoi', 'henei', 'HI');
INSERT INTO `sp_place` VALUES ('2980', '240', ',1,240,2980,', '3', '胡志明市', 'Ho Chi Minh City', 'huzhimingshi', 'HC');
INSERT INTO `sp_place` VALUES ('2981', '241', ',3,241,2981,', '3', '北方', 'Northern', 'beifang', 'NO');
INSERT INTO `sp_place` VALUES ('2982', '241', ',3,241,2982,', '3', '东方', 'Eastern', 'dongfang', 'EA');
INSERT INTO `sp_place` VALUES ('2983', '241', ',3,241,2983,', '3', '卢阿普拉', 'Luapula', 'luapula', 'LP');
INSERT INTO `sp_place` VALUES ('2984', '241', ',3,241,2984,', '3', '卢萨卡', 'Lusaka', 'lusaka', 'LK');
INSERT INTO `sp_place` VALUES ('2985', '241', ',3,241,2985,', '3', '南方', 'Southern', 'nanfang', 'SO');
INSERT INTO `sp_place` VALUES ('2986', '241', ',3,241,2986,', '3', '铜带', 'Copperbelt', 'tongdai', 'CB');
INSERT INTO `sp_place` VALUES ('2987', '241', ',3,241,2987,', '3', '西北', 'North-Western', 'xibei', 'NW');
INSERT INTO `sp_place` VALUES ('2988', '241', ',3,241,2988,', '3', '西方', 'Western', 'xifang', 'WE');
INSERT INTO `sp_place` VALUES ('2989', '241', ',3,241,2989,', '3', '中央', 'Central', 'zhongyang', 'CE');
INSERT INTO `sp_place` VALUES ('2990', '245', ',5,245,2990,', '3', '阿劳卡尼亚大区', 'Region de la Araucania', 'alaokaniyadaqu', 'AR');
INSERT INTO `sp_place` VALUES ('2991', '245', ',5,245,2991,', '3', '阿塔卡马大区', 'Region de Atacama', 'atakamadaqu', 'AT');
INSERT INTO `sp_place` VALUES ('2992', '245', ',5,245,2992,', '3', '安托法加斯塔大区', 'Region de Antofagasta', 'antuofajiasitadaqu', 'AN');
INSERT INTO `sp_place` VALUES ('2993', '245', ',5,245,2993,', '3', '比奥比奥大区', 'Region del Biobio', 'biaobiaodaqu', 'BI');
INSERT INTO `sp_place` VALUES ('2994', '245', ',5,245,2994,', '3', '复活节岛', 'Libertador', 'fuhuojiedao', 'LI');
INSERT INTO `sp_place` VALUES ('2995', '245', ',5,245,2995,', '3', '湖大区', 'Region de los Lagos', 'hudaqu', 'LL');
INSERT INTO `sp_place` VALUES ('2996', '245', ',5,245,2996,', '3', '科金博大区', 'Region de Coquimbo', 'kejinbodaqu', 'CO');
INSERT INTO `sp_place` VALUES ('2997', '245', ',5,245,2997,', '3', '马乌莱大区', 'Region del Maule', 'mawulaidaqu', 'ML');
INSERT INTO `sp_place` VALUES ('2998', '245', ',5,245,2998,', '3', '麦哲伦-智利南极大区', 'Magallanes y Antartica Chilena', 'maizhelunzhilinanjidaqu', 'MA');
INSERT INTO `sp_place` VALUES ('2999', '245', ',5,245,2999,', '3', '圣地亚哥', 'Metropolitana de Santiago', 'shengdiyage', 'RM');
INSERT INTO `sp_place` VALUES ('3000', '245', ',5,245,3000,', '3', '塔拉帕卡大区', 'Region de Tarapaca', 'talapakadaqu', 'TA');
INSERT INTO `sp_place` VALUES ('3001', '245', ',5,245,3001,', '3', '瓦尔帕莱索大区', 'Region de Valparaiso', 'waerpalaisuodaqu', 'VS');
INSERT INTO `sp_place` VALUES ('3002', '245', ',5,245,3002,', '3', '伊瓦涅斯将军的艾森大区', 'Region de Alsen del General Carlos Ibanez del', 'yiwaniesijiangjundeaisendaqu', 'AI');
INSERT INTO `sp_place` VALUES ('3003', '246', ',3,246,3003,', '3', '巴明吉-班戈兰', 'Bamingui-Bangoran', 'bamingjibangelan', 'BB');
INSERT INTO `sp_place` VALUES ('3004', '246', ',3,246,3004,', '3', '班吉直辖市', 'Bangui', 'banjizhixiashi', 'BGF');
INSERT INTO `sp_place` VALUES ('3005', '246', ',3,246,3005,', '3', '宾博', 'Bimbo', 'binbo', 'BI');
INSERT INTO `sp_place` VALUES ('3006', '246', ',3,246,3006,', '3', '凯莫', 'Kemo', 'kaimo', 'KG');
INSERT INTO `sp_place` VALUES ('3007', '246', ',3,246,3007,', '3', '洛巴伊', 'Lobaye', 'luobayi', 'LB');
INSERT INTO `sp_place` VALUES ('3008', '246', ',3,246,3008,', '3', '曼贝雷-卡代', 'Mambere-Kadei', 'manbeileikadai', 'HS');
INSERT INTO `sp_place` VALUES ('3009', '246', ',3,246,3009,', '3', '姆博穆', 'Mbomou', 'mubomu', 'MB');
INSERT INTO `sp_place` VALUES ('3010', '246', ',3,246,3010,', '3', '纳纳-格里比齐', 'Nana-Gribizi', 'nanagelibiqi', 'KB');
INSERT INTO `sp_place` VALUES ('3011', '246', ',3,246,3011,', '3', '纳纳-曼贝雷', 'Nana-Mambere', 'nanamanbeilei', 'NM');
INSERT INTO `sp_place` VALUES ('3012', '246', ',3,246,3012,', '3', '桑加-姆巴埃雷', 'Sangha-Mbaere', 'sangjiamubaailei', 'SE');
INSERT INTO `sp_place` VALUES ('3013', '246', ',3,246,3013,', '3', '上科托', 'Haute-Kotto', 'shangketuo', 'HK');
INSERT INTO `sp_place` VALUES ('3014', '246', ',3,246,3014,', '3', '上姆博穆', 'Haut-Mbomou', 'shangmubomu', 'HM');
INSERT INTO `sp_place` VALUES ('3015', '246', ',3,246,3015,', '3', '瓦卡', 'Ouaka', 'waka', 'UK');
INSERT INTO `sp_place` VALUES ('3016', '246', ',3,246,3016,', '3', '瓦卡加', 'Vakaga', 'wakajia', 'VK');
INSERT INTO `sp_place` VALUES ('3017', '246', ',3,246,3017,', '3', '瓦姆', 'Ouham', 'wamu', 'AC');
INSERT INTO `sp_place` VALUES ('3018', '246', ',3,246,3018,', '3', '瓦姆-彭代', 'Ouham-Pende', 'wamupengdai', 'OP');
INSERT INTO `sp_place` VALUES ('3019', '246', ',3,246,3019,', '3', '翁贝拉-姆波科', 'Ombella-Mpoko', 'wengbeilamuboke', 'MP');
INSERT INTO `sp_place` VALUES ('3020', '246', ',3,246,3020,', '3', '下科托', 'Basse-Kotto', 'xiaketuo', 'BK');
INSERT INTO `sp_place` VALUES ('3021', '247', ',1,7,247,3021,', '4', '东城', 'Dongcheng', 'dongcheng', '1');
INSERT INTO `sp_place` VALUES ('3022', '247', ',1,7,247,3022,', '4', '西城', 'Xicheng', 'xicheng', '2');
INSERT INTO `sp_place` VALUES ('3023', '247', ',1,7,247,3023,', '4', '朝阳', 'Chaoyang', 'chaoyang', '5');
INSERT INTO `sp_place` VALUES ('3024', '247', ',1,7,247,3024,', '4', '丰台', 'Fengtai', 'fengtai', '6');
INSERT INTO `sp_place` VALUES ('3025', '247', ',1,7,247,3025,', '4', '石景山', 'Shijingshan', 'shijingshan', '7');
INSERT INTO `sp_place` VALUES ('3026', '247', ',1,7,247,3026,', '4', '海淀', 'Haidian', 'haidian', '8');
INSERT INTO `sp_place` VALUES ('3027', '247', ',1,7,247,3027,', '4', '门头沟', 'Mentougou', 'mentougou', '9');
INSERT INTO `sp_place` VALUES ('3028', '247', ',1,7,247,3028,', '4', '房山', 'Fangshan', 'fangshan', '11');
INSERT INTO `sp_place` VALUES ('3029', '247', ',1,7,247,3029,', '4', '通州', 'Tongzhou', 'tongzhou', '12');
INSERT INTO `sp_place` VALUES ('3030', '247', ',1,7,247,3030,', '4', '顺义', 'Shunyi', 'shunyi', '13');
INSERT INTO `sp_place` VALUES ('3031', '247', ',1,7,247,3031,', '4', '昌平', 'Changping', 'changping', '21');
INSERT INTO `sp_place` VALUES ('3032', '247', ',1,7,247,3032,', '4', '大兴', 'Daxing', 'daxing', '24');
INSERT INTO `sp_place` VALUES ('3033', '247', ',1,7,247,3033,', '4', '平谷', 'Pinggu', 'pinggu', '26');
INSERT INTO `sp_place` VALUES ('3034', '247', ',1,7,247,3034,', '4', '怀柔', 'Huairou', 'huairou', '27');
INSERT INTO `sp_place` VALUES ('3035', '247', ',1,7,247,3035,', '4', '密云', 'Miyun', 'miyun', '28');
INSERT INTO `sp_place` VALUES ('3036', '247', ',1,7,247,3036,', '4', '延庆', 'Yanqing', 'yanqing', '29');
INSERT INTO `sp_place` VALUES ('3037', '248', ',1,7,248,3037,', '4', '和平', 'Heping', 'heping', '1');
INSERT INTO `sp_place` VALUES ('3038', '248', ',1,7,248,3038,', '4', '河东', 'Hedong', 'hedong', '2');
INSERT INTO `sp_place` VALUES ('3039', '248', ',1,7,248,3039,', '4', '河西', 'Hexi', 'hexi', '3');
INSERT INTO `sp_place` VALUES ('3040', '248', ',1,7,248,3040,', '4', '南开', 'Nankai', 'nankai', '4');
INSERT INTO `sp_place` VALUES ('3041', '248', ',1,7,248,3041,', '4', '河北', 'Hebei', 'hebei', '5');
INSERT INTO `sp_place` VALUES ('3042', '248', ',1,7,248,3042,', '4', '红桥', 'Hongqiao', 'hongqiao', '6');
INSERT INTO `sp_place` VALUES ('3043', '248', ',1,7,248,3043,', '4', '滨海新区', 'Binghaixinqu', 'binhaixinqu', '26');
INSERT INTO `sp_place` VALUES ('3044', '248', ',1,7,248,3044,', '4', '东丽', 'Dongli', 'dongli', '10');
INSERT INTO `sp_place` VALUES ('3045', '248', ',1,7,248,3045,', '4', '西青', 'Xiqing', 'xiqing', '11');
INSERT INTO `sp_place` VALUES ('3046', '248', ',1,7,248,3046,', '4', '津南', 'Jinnan', 'jinnan', '12');
INSERT INTO `sp_place` VALUES ('3047', '248', ',1,7,248,3047,', '4', '北辰', 'Beichen', 'beichen', '13');
INSERT INTO `sp_place` VALUES ('3048', '248', ',1,7,248,3048,', '4', '宁河', 'Ninghe', 'ninghe', '21');
INSERT INTO `sp_place` VALUES ('3049', '248', ',1,7,248,3049,', '4', '武清', 'Wuqing', 'wuqing', '22');
INSERT INTO `sp_place` VALUES ('3050', '248', ',1,7,248,3050,', '4', '静海', 'Jinghai', 'jinghai', '23');
INSERT INTO `sp_place` VALUES ('3051', '248', ',1,7,248,3051,', '4', '宝坻', 'Baodi', 'bao', '24');
INSERT INTO `sp_place` VALUES ('3052', '248', ',1,7,248,3052,', '4', '蓟县', 'Jixian', 'jixian', '25');
INSERT INTO `sp_place` VALUES ('3053', '249', ',1,7,249,3053,', '4', '石家庄', 'Shijiazhuang', 'shijiazhuang', '1');
INSERT INTO `sp_place` VALUES ('3054', '249', ',1,7,249,3054,', '4', '唐山', 'Tangshan', 'tangshan', '2');
INSERT INTO `sp_place` VALUES ('3055', '249', ',1,7,249,3055,', '4', '秦皇岛', 'Qinhuangdao', 'qinhuangdao', '3');
INSERT INTO `sp_place` VALUES ('3056', '249', ',1,7,249,3056,', '4', '邯郸', 'Handan', 'handan', '4');
INSERT INTO `sp_place` VALUES ('3057', '249', ',1,7,249,3057,', '4', '邢台', 'Xingtai', 'xingtai', '5');
INSERT INTO `sp_place` VALUES ('3058', '249', ',1,7,249,3058,', '4', '保定', 'Baoding', 'baoding', '6');
INSERT INTO `sp_place` VALUES ('3059', '249', ',1,7,249,3059,', '4', '张家口', 'Zhangjiakou', 'zhangjiakou', '7');
INSERT INTO `sp_place` VALUES ('3060', '249', ',1,7,249,3060,', '4', '承德', 'Chengde', 'chengde', '8');
INSERT INTO `sp_place` VALUES ('3061', '249', ',1,7,249,3061,', '4', '沧州', 'Cangzhou', 'cangzhou', '9');
INSERT INTO `sp_place` VALUES ('3062', '249', ',1,7,249,3062,', '4', '廊坊', 'Langfang', 'langfang', '10');
INSERT INTO `sp_place` VALUES ('3063', '249', ',1,7,249,3063,', '4', '衡水', 'Hengshui', 'hengshui', '11');
INSERT INTO `sp_place` VALUES ('3064', '250', ',1,7,250,3064,', '4', '太原', 'Taiyuan', 'taiyuan', '1');
INSERT INTO `sp_place` VALUES ('3065', '250', ',1,7,250,3065,', '4', '大同', 'Datong', 'datong', '2');
INSERT INTO `sp_place` VALUES ('3066', '250', ',1,7,250,3066,', '4', '阳泉', 'Yangquan', 'yangquan', '3');
INSERT INTO `sp_place` VALUES ('3067', '250', ',1,7,250,3067,', '4', '长治', 'Changzhi', 'changzhi', '4');
INSERT INTO `sp_place` VALUES ('3068', '250', ',1,7,250,3068,', '4', '晋城', 'Jincheng', 'jincheng', '5');
INSERT INTO `sp_place` VALUES ('3069', '250', ',1,7,250,3069,', '4', '朔州', 'Shuozhou', 'shuozhou', '6');
INSERT INTO `sp_place` VALUES ('3070', '250', ',1,7,250,3070,', '4', '晋中', 'Jinzhong', 'jinzhong', '7');
INSERT INTO `sp_place` VALUES ('3071', '250', ',1,7,250,3071,', '4', '运城', 'Yuncheng', 'yuncheng', '8');
INSERT INTO `sp_place` VALUES ('3072', '250', ',1,7,250,3072,', '4', '忻州', 'Xinzhou', 'xinzhou', '9');
INSERT INTO `sp_place` VALUES ('3073', '250', ',1,7,250,3073,', '4', '临汾', 'Linfen', 'linfen', '10');
INSERT INTO `sp_place` VALUES ('3074', '250', ',1,7,250,3074,', '4', '吕梁', 'luliang', 'lvliang', '11');
INSERT INTO `sp_place` VALUES ('3075', '251', ',1,7,251,3075,', '4', '呼和浩特', 'Hohhot', 'huhehaote', '1');
INSERT INTO `sp_place` VALUES ('3076', '251', ',1,7,251,3076,', '4', '包头', 'Baotou', 'baotou', '2');
INSERT INTO `sp_place` VALUES ('3077', '251', ',1,7,251,3077,', '4', '乌海', 'Wuhai', 'wuhai', '3');
INSERT INTO `sp_place` VALUES ('3078', '251', ',1,7,251,3078,', '4', '赤峰', 'Chifeng', 'chifeng', '4');
INSERT INTO `sp_place` VALUES ('3079', '251', ',1,7,251,3079,', '4', '通辽', 'Tongliao', 'tongliao', '5');
INSERT INTO `sp_place` VALUES ('3080', '251', ',1,7,251,3080,', '4', '鄂尔多斯', 'Ordos', 'eerduosi', '6');
INSERT INTO `sp_place` VALUES ('3081', '251', ',1,7,251,3081,', '4', '呼伦贝尔', 'Hulun Buir', 'hulunbeier', '7');
INSERT INTO `sp_place` VALUES ('3082', '251', ',1,7,251,3082,', '4', '巴彦淖尔', 'Bayannur', 'bayannaoer', '8');
INSERT INTO `sp_place` VALUES ('3083', '251', ',1,7,251,3083,', '4', '乌兰察布', 'Ulan Qab', 'wulanchabu', '9');
INSERT INTO `sp_place` VALUES ('3084', '251', ',1,7,251,3084,', '4', '兴安', 'Xing\'an', 'xingan', '22');
INSERT INTO `sp_place` VALUES ('3085', '251', ',1,7,251,3085,', '4', '锡林郭勒', 'Xilin Gol', 'xilinguole', '25');
INSERT INTO `sp_place` VALUES ('3086', '251', ',1,7,251,3086,', '4', '阿拉善', 'Alxa', 'alashan', '29');
INSERT INTO `sp_place` VALUES ('3087', '252', ',1,7,252,3087,', '4', '沈阳', 'Shenyang', 'shenyang', '1');
INSERT INTO `sp_place` VALUES ('3088', '252', ',1,7,252,3088,', '4', '大连', 'Dalian', 'dalian', '2');
INSERT INTO `sp_place` VALUES ('3089', '252', ',1,7,252,3089,', '4', '鞍山', 'Anshan', 'anshan', '3');
INSERT INTO `sp_place` VALUES ('3090', '252', ',1,7,252,3090,', '4', '抚顺', 'Fushun', 'fushun', '4');
INSERT INTO `sp_place` VALUES ('3091', '252', ',1,7,252,3091,', '4', '本溪', 'Benxi', 'benxi', '5');
INSERT INTO `sp_place` VALUES ('3092', '252', ',1,7,252,3092,', '4', '丹东', 'Dandong', 'dandong', '6');
INSERT INTO `sp_place` VALUES ('3093', '252', ',1,7,252,3093,', '4', '锦州', 'Jinzhou', 'jinzhou', '7');
INSERT INTO `sp_place` VALUES ('3094', '252', ',1,7,252,3094,', '4', '营口', 'Yingkou', 'yingkou', '8');
INSERT INTO `sp_place` VALUES ('3095', '252', ',1,7,252,3095,', '4', '阜新', 'Fuxin', 'fuxin', '9');
INSERT INTO `sp_place` VALUES ('3096', '252', ',1,7,252,3096,', '4', '辽阳', 'Liaoyang', 'liaoyang', '10');
INSERT INTO `sp_place` VALUES ('3097', '252', ',1,7,252,3097,', '4', '盘锦', 'Panjin', 'panjin', '11');
INSERT INTO `sp_place` VALUES ('3098', '252', ',1,7,252,3098,', '4', '铁岭', 'Tieling', 'tieling', '12');
INSERT INTO `sp_place` VALUES ('3099', '252', ',1,7,252,3099,', '4', '朝阳', 'Chaoyang', 'chaoyang', '13');
INSERT INTO `sp_place` VALUES ('3100', '252', ',1,7,252,3100,', '4', '葫芦岛', 'Huludao', 'huludao', '14');
INSERT INTO `sp_place` VALUES ('3101', '253', ',1,7,253,3101,', '4', '长春', 'Changchun', 'changchun', '1');
INSERT INTO `sp_place` VALUES ('3102', '253', ',1,7,253,3102,', '4', '吉林', 'Jilin', 'jilin', '2');
INSERT INTO `sp_place` VALUES ('3103', '253', ',1,7,253,3103,', '4', '四平', 'Siping', 'siping', '3');
INSERT INTO `sp_place` VALUES ('3104', '253', ',1,7,253,3104,', '4', '辽源', 'Liaoyuan', 'liaoyuan', '4');
INSERT INTO `sp_place` VALUES ('3105', '253', ',1,7,253,3105,', '4', '通化', 'Tonghua', 'tonghua', '5');
INSERT INTO `sp_place` VALUES ('3106', '253', ',1,7,253,3106,', '4', '白山', 'Baishan', 'baishan', '6');
INSERT INTO `sp_place` VALUES ('3107', '253', ',1,7,253,3107,', '4', '松原', 'Songyuan', 'songyuan', '7');
INSERT INTO `sp_place` VALUES ('3108', '253', ',1,7,253,3108,', '4', '白城', 'Baicheng', 'baicheng', '8');
INSERT INTO `sp_place` VALUES ('3109', '253', ',1,7,253,3109,', '4', '延边', 'Yanbian Korean Autonomous Prefecture', 'yanbian', '24');
INSERT INTO `sp_place` VALUES ('3110', '254', ',1,7,254,3110,', '4', '哈尔滨', 'Harbin', 'haerbin', '1');
INSERT INTO `sp_place` VALUES ('3111', '254', ',1,7,254,3111,', '4', '齐齐哈尔', 'Qiqihar', 'qiqihaer', '2');
INSERT INTO `sp_place` VALUES ('3112', '254', ',1,7,254,3112,', '4', '鸡西', 'Jixi', 'jixi', '3');
INSERT INTO `sp_place` VALUES ('3113', '254', ',1,7,254,3113,', '4', '鹤岗', 'Hegang', 'hegang', '4');
INSERT INTO `sp_place` VALUES ('3114', '254', ',1,7,254,3114,', '4', '双鸭山', 'Shuangyashan', 'shuangyashan', '5');
INSERT INTO `sp_place` VALUES ('3115', '254', ',1,7,254,3115,', '4', '大庆', 'Daqing', 'daqing', '6');
INSERT INTO `sp_place` VALUES ('3116', '254', ',1,7,254,3116,', '4', '伊春', 'Yichun', 'yichun', '7');
INSERT INTO `sp_place` VALUES ('3117', '254', ',1,7,254,3117,', '4', '佳木斯', 'Jiamusi', 'jiamusi', '8');
INSERT INTO `sp_place` VALUES ('3118', '254', ',1,7,254,3118,', '4', '七台河', 'Qitaihe', 'qitaihe', '9');
INSERT INTO `sp_place` VALUES ('3119', '254', ',1,7,254,3119,', '4', '牡丹江', 'Mudanjiang', 'mudanjiang', '10');
INSERT INTO `sp_place` VALUES ('3120', '254', ',1,7,254,3120,', '4', '黑河', 'Heihe', 'heihe', '11');
INSERT INTO `sp_place` VALUES ('3121', '254', ',1,7,254,3121,', '4', '绥化', 'Suihua', 'suihua', '12');
INSERT INTO `sp_place` VALUES ('3122', '254', ',1,7,254,3122,', '4', '大兴安岭', 'Da Hinggan Ling', 'daxinganling', '27');
INSERT INTO `sp_place` VALUES ('3123', '255', ',1,7,255,3123,', '4', '黄浦', 'Huangpu', 'huangpu', '1');
INSERT INTO `sp_place` VALUES ('3124', '255', ',1,7,255,3124,', '4', '卢湾', 'Luwan', 'luwan', '3');
INSERT INTO `sp_place` VALUES ('3125', '255', ',1,7,255,3125,', '4', '徐汇', 'Xuhui', 'xuhui', '4');
INSERT INTO `sp_place` VALUES ('3126', '255', ',1,7,255,3126,', '4', '长宁', 'Changning', 'changning', '5');
INSERT INTO `sp_place` VALUES ('3127', '255', ',1,7,255,3127,', '4', '静安', 'Jing\'an', 'jingan', '6');
INSERT INTO `sp_place` VALUES ('3128', '255', ',1,7,255,3128,', '4', '普陀', 'Putuo', 'putuo', '7');
INSERT INTO `sp_place` VALUES ('3129', '255', ',1,7,255,3129,', '4', '闸北', 'Zhabei', 'zhabei', '8');
INSERT INTO `sp_place` VALUES ('3130', '255', ',1,7,255,3130,', '4', '虹口', 'Hongkou', 'hongkou', '9');
INSERT INTO `sp_place` VALUES ('3131', '255', ',1,7,255,3131,', '4', '杨浦', 'Yangpu', 'yangpu', '11');
INSERT INTO `sp_place` VALUES ('3132', '255', ',1,7,255,3132,', '4', '闵行', 'Minhang', 'xing', '12');
INSERT INTO `sp_place` VALUES ('3133', '255', ',1,7,255,3133,', '4', '宝山', 'Baoshan', 'baoshan', '13');
INSERT INTO `sp_place` VALUES ('3134', '255', ',1,7,255,3134,', '4', '嘉定', 'Jiading', 'jiading', '14');
INSERT INTO `sp_place` VALUES ('3135', '255', ',1,7,255,3135,', '4', '浦东新区', 'Pudong New Area', 'pudongxinqu', '15');
INSERT INTO `sp_place` VALUES ('3136', '255', ',1,7,255,3136,', '4', '金山', 'Jinshan', 'jinshan', '16');
INSERT INTO `sp_place` VALUES ('3137', '255', ',1,7,255,3137,', '4', '松江', 'Songjiang', 'songjiang', '17');
INSERT INTO `sp_place` VALUES ('3138', '255', ',1,7,255,3138,', '4', '奉贤', 'Fengxian', 'fengxian', '26');
INSERT INTO `sp_place` VALUES ('3139', '255', ',1,7,255,3139,', '4', '青浦', 'Qingpu', 'qingpu', '29');
INSERT INTO `sp_place` VALUES ('3140', '255', ',1,7,255,3140,', '4', '崇明', 'Chongming', 'chongming', '30');
INSERT INTO `sp_place` VALUES ('3141', '256', ',1,7,256,3141,', '4', '南京', 'Nanjing', 'nanjing', '1');
INSERT INTO `sp_place` VALUES ('3142', '256', ',1,7,256,3142,', '4', '无锡', 'Wuxi', 'wuxi', '2');
INSERT INTO `sp_place` VALUES ('3143', '256', ',1,7,256,3143,', '4', '徐州', 'Xuzhou', 'xuzhou', '3');
INSERT INTO `sp_place` VALUES ('3144', '256', ',1,7,256,3144,', '4', '常州', 'Changzhou', 'changzhou', '4');
INSERT INTO `sp_place` VALUES ('3145', '256', ',1,7,256,3145,', '4', '苏州', 'Suzhou', 'suzhou', '5');
INSERT INTO `sp_place` VALUES ('3146', '256', ',1,7,256,3146,', '4', '南通', 'Nantong', 'nantong', '6');
INSERT INTO `sp_place` VALUES ('3147', '256', ',1,7,256,3147,', '4', '连云港', 'Lianyungang', 'lianyungang', '7');
INSERT INTO `sp_place` VALUES ('3148', '256', ',1,7,256,3148,', '4', '淮安', 'Huai\'an', 'huaian', '8');
INSERT INTO `sp_place` VALUES ('3149', '256', ',1,7,256,3149,', '4', '盐城', 'Yancheng', 'yancheng', '9');
INSERT INTO `sp_place` VALUES ('3150', '256', ',1,7,256,3150,', '4', '扬州', 'Yangzhou', 'yangzhou', '10');
INSERT INTO `sp_place` VALUES ('3151', '256', ',1,7,256,3151,', '4', '镇江', 'Zhenjiang', 'zhenjiang', '11');
INSERT INTO `sp_place` VALUES ('3152', '256', ',1,7,256,3152,', '4', '泰州', 'Taizhou', 'taizhou', '12');
INSERT INTO `sp_place` VALUES ('3153', '256', ',1,7,256,3153,', '4', '宿迁', 'Suqian', 'suqian', '13');
INSERT INTO `sp_place` VALUES ('3154', '257', ',1,7,257,3154,', '4', '杭州', 'Hangzhou', 'hangzhou', '1');
INSERT INTO `sp_place` VALUES ('3155', '257', ',1,7,257,3155,', '4', '宁波', 'Ningbo', 'ningbo', '2');
INSERT INTO `sp_place` VALUES ('3156', '257', ',1,7,257,3156,', '4', '温州', 'Wenzhou', 'wenzhou', '3');
INSERT INTO `sp_place` VALUES ('3157', '257', ',1,7,257,3157,', '4', '嘉兴', 'Jiaxing', 'jiaxing', '4');
INSERT INTO `sp_place` VALUES ('3158', '257', ',1,7,257,3158,', '4', '湖州', 'Huzhou', 'huzhou', '5');
INSERT INTO `sp_place` VALUES ('3159', '257', ',1,7,257,3159,', '4', '绍兴', 'Shaoxing', 'shaoxing', '6');
INSERT INTO `sp_place` VALUES ('3160', '257', ',1,7,257,3160,', '4', '金华', 'Jinhua', 'jinhua', '7');
INSERT INTO `sp_place` VALUES ('3161', '257', ',1,7,257,3161,', '4', '衢州', 'Quzhou', 'zhou', '8');
INSERT INTO `sp_place` VALUES ('3162', '257', ',1,7,257,3162,', '4', '舟山', 'Zhoushan', 'zhoushan', '9');
INSERT INTO `sp_place` VALUES ('3163', '257', ',1,7,257,3163,', '4', '台州', 'Taizhou', 'taizhou', '10');
INSERT INTO `sp_place` VALUES ('3164', '257', ',1,7,257,3164,', '4', '丽水', 'Lishui', 'lishui', '11');
INSERT INTO `sp_place` VALUES ('3165', '258', ',1,7,258,3165,', '4', '合肥', 'Hefei', 'hefei', '1');
INSERT INTO `sp_place` VALUES ('3166', '258', ',1,7,258,3166,', '4', '芜湖', 'Wuhu', 'wuhu', '2');
INSERT INTO `sp_place` VALUES ('3167', '258', ',1,7,258,3167,', '4', '蚌埠', 'Bengbu', 'bangbu', '3');
INSERT INTO `sp_place` VALUES ('3168', '258', ',1,7,258,3168,', '4', '淮南', 'Huainan', 'huainan', '4');
INSERT INTO `sp_place` VALUES ('3169', '258', ',1,7,258,3169,', '4', '马鞍山', 'Ma\'anshan', 'maanshan', '5');
INSERT INTO `sp_place` VALUES ('3170', '258', ',1,7,258,3170,', '4', '淮北', 'Huaibei', 'huaibei', '6');
INSERT INTO `sp_place` VALUES ('3171', '258', ',1,7,258,3171,', '4', '铜陵', 'Tongling', 'tongling', '7');
INSERT INTO `sp_place` VALUES ('3172', '258', ',1,7,258,3172,', '4', '安庆', 'Anqing', 'anqing', '8');
INSERT INTO `sp_place` VALUES ('3173', '258', ',1,7,258,3173,', '4', '黄山', 'Huangshan', 'huangshan', '10');
INSERT INTO `sp_place` VALUES ('3174', '258', ',1,7,258,3174,', '4', '滁州', 'Chuzhou', 'chuzhou', '11');
INSERT INTO `sp_place` VALUES ('3175', '258', ',1,7,258,3175,', '4', '阜阳', 'Fuyang', 'fuyang', '12');
INSERT INTO `sp_place` VALUES ('3176', '258', ',1,7,258,3176,', '4', '宿州', 'Suzhou', 'suzhou', '13');
INSERT INTO `sp_place` VALUES ('3177', '258', ',1,7,258,3177,', '4', '六安', 'Lu\'an', 'liuan', '15');
INSERT INTO `sp_place` VALUES ('3178', '258', ',1,7,258,3178,', '4', '亳州', 'Bozhou', 'zhou', '16');
INSERT INTO `sp_place` VALUES ('3179', '258', ',1,7,258,3179,', '4', '池州', 'Chizhou', 'chizhou', '17');
INSERT INTO `sp_place` VALUES ('3180', '258', ',1,7,258,3180,', '4', '宣城', 'Xuancheng', 'xuancheng', '18');
INSERT INTO `sp_place` VALUES ('3181', '259', ',1,7,259,3181,', '4', '福州', 'Fuzhou', 'fuzhou', '1');
INSERT INTO `sp_place` VALUES ('3182', '259', ',1,7,259,3182,', '4', '厦门', 'Xiamen', 'xiamen', '2');
INSERT INTO `sp_place` VALUES ('3183', '259', ',1,7,259,3183,', '4', '莆田', 'Putian', 'putian', '3');
INSERT INTO `sp_place` VALUES ('3184', '259', ',1,7,259,3184,', '4', '三明', 'Sanming', 'sanming', '4');
INSERT INTO `sp_place` VALUES ('3185', '259', ',1,7,259,3185,', '4', '泉州', 'Quanzhou', 'quanzhou', '5');
INSERT INTO `sp_place` VALUES ('3186', '259', ',1,7,259,3186,', '4', '漳州', 'Zhangzhou', 'zhangzhou', '6');
INSERT INTO `sp_place` VALUES ('3187', '259', ',1,7,259,3187,', '4', '南平', 'Nanping', 'nanping', '7');
INSERT INTO `sp_place` VALUES ('3188', '259', ',1,7,259,3188,', '4', '龙岩', 'Longyan', 'longyan', '8');
INSERT INTO `sp_place` VALUES ('3189', '259', ',1,7,259,3189,', '4', '宁德', 'Ningde', 'ningde', '9');
INSERT INTO `sp_place` VALUES ('3190', '260', ',1,7,260,3190,', '4', '南昌', 'Nanchang', 'nanchang', '1');
INSERT INTO `sp_place` VALUES ('3191', '260', ',1,7,260,3191,', '4', '景德镇', 'Jingdezhen', 'jingdezhen', '2');
INSERT INTO `sp_place` VALUES ('3192', '260', ',1,7,260,3192,', '4', '萍乡', 'Pingxiang', 'pingxiang', '3');
INSERT INTO `sp_place` VALUES ('3193', '260', ',1,7,260,3193,', '4', '九江', 'Jiujiang', 'jiujiang', '4');
INSERT INTO `sp_place` VALUES ('3194', '260', ',1,7,260,3194,', '4', '新余', 'Xinyu', 'xinyu', '5');
INSERT INTO `sp_place` VALUES ('3195', '260', ',1,7,260,3195,', '4', '鹰潭', 'Yingtan', 'yingtan', '6');
INSERT INTO `sp_place` VALUES ('3196', '260', ',1,7,260,3196,', '4', '赣州', 'Ganzhou', 'ganzhou', '7');
INSERT INTO `sp_place` VALUES ('3197', '260', ',1,7,260,3197,', '4', '吉安', 'Ji\'an', 'jian', '8');
INSERT INTO `sp_place` VALUES ('3198', '260', ',1,7,260,3198,', '4', '宜春', 'Yichun', 'yichun', '9');
INSERT INTO `sp_place` VALUES ('3199', '260', ',1,7,260,3199,', '4', '抚州', 'Fuzhou', 'fuzhou', '10');
INSERT INTO `sp_place` VALUES ('3200', '260', ',1,7,260,3200,', '4', '上饶', 'Shangrao', 'shangrao', '11');
INSERT INTO `sp_place` VALUES ('3201', '261', ',1,7,261,3201,', '4', '济南', 'Jinan', 'jinan', '1');
INSERT INTO `sp_place` VALUES ('3202', '261', ',1,7,261,3202,', '4', '青岛', 'Qingdao', 'qingdao', '2');
INSERT INTO `sp_place` VALUES ('3203', '261', ',1,7,261,3203,', '4', '淄博', 'Zibo', 'zibo', '3');
INSERT INTO `sp_place` VALUES ('3204', '261', ',1,7,261,3204,', '4', '枣庄', 'Zaozhuang', 'zaozhuang', '4');
INSERT INTO `sp_place` VALUES ('3205', '261', ',1,7,261,3205,', '4', '东营', 'Dongying', 'dongying', '5');
INSERT INTO `sp_place` VALUES ('3206', '261', ',1,7,261,3206,', '4', '烟台', 'Yantai', 'yantai', '6');
INSERT INTO `sp_place` VALUES ('3207', '261', ',1,7,261,3207,', '4', '潍坊', 'Weifang', 'weifang', '7');
INSERT INTO `sp_place` VALUES ('3208', '261', ',1,7,261,3208,', '4', '济宁', 'Jining', 'jining', '8');
INSERT INTO `sp_place` VALUES ('3209', '261', ',1,7,261,3209,', '4', '泰安', 'Tai\'an', 'taian', '9');
INSERT INTO `sp_place` VALUES ('3210', '261', ',1,7,261,3210,', '4', '威海', 'Weihai', 'weihai', '10');
INSERT INTO `sp_place` VALUES ('3211', '261', ',1,7,261,3211,', '4', '日照', 'Rizhao', 'rizhao', '11');
INSERT INTO `sp_place` VALUES ('3212', '261', ',1,7,261,3212,', '4', '莱芜', 'Laiwu', 'laiwu', '12');
INSERT INTO `sp_place` VALUES ('3213', '261', ',1,7,261,3213,', '4', '临沂', 'Linyi', 'linyi', '13');
INSERT INTO `sp_place` VALUES ('3214', '261', ',1,7,261,3214,', '4', '德州', 'Dezhou', 'dezhou', '14');
INSERT INTO `sp_place` VALUES ('3215', '261', ',1,7,261,3215,', '4', '聊城', 'Liaocheng', 'liaocheng', '15');
INSERT INTO `sp_place` VALUES ('3216', '261', ',1,7,261,3216,', '4', '滨州', 'Binzhou', 'binzhou', '16');
INSERT INTO `sp_place` VALUES ('3217', '261', ',1,7,261,3217,', '4', '菏泽', 'Heze', 'heze', '17');
INSERT INTO `sp_place` VALUES ('3218', '262', ',1,7,262,3218,', '4', '郑州', 'Zhengzhou', 'zhengzhou', '1');
INSERT INTO `sp_place` VALUES ('3219', '262', ',1,7,262,3219,', '4', '开封', 'Kaifeng', 'kaifeng', '2');
INSERT INTO `sp_place` VALUES ('3220', '262', ',1,7,262,3220,', '4', '洛阳', 'Luoyang', 'luoyang', '3');
INSERT INTO `sp_place` VALUES ('3221', '262', ',1,7,262,3221,', '4', '平顶山', 'Pingdingshan', 'pingdingshan', '4');
INSERT INTO `sp_place` VALUES ('3222', '262', ',1,7,262,3222,', '4', '安阳', 'Anyang', 'anyang', '5');
INSERT INTO `sp_place` VALUES ('3223', '262', ',1,7,262,3223,', '4', '鹤壁', 'Hebi', 'hebi', '6');
INSERT INTO `sp_place` VALUES ('3224', '262', ',1,7,262,3224,', '4', '新乡', 'Xinxiang', 'xinxiang', '7');
INSERT INTO `sp_place` VALUES ('3225', '262', ',1,7,262,3225,', '4', '焦作', 'Jiaozuo', 'jiaozuo', '8');
INSERT INTO `sp_place` VALUES ('3226', '262', ',1,7,262,3226,', '4', '濮阳', 'Puyang', 'yang', '9');
INSERT INTO `sp_place` VALUES ('3227', '262', ',1,7,262,3227,', '4', '许昌', 'Xuchang', 'xuchang', '10');
INSERT INTO `sp_place` VALUES ('3228', '262', ',1,7,262,3228,', '4', '漯河', 'Luohe', 'he', '11');
INSERT INTO `sp_place` VALUES ('3229', '262', ',1,7,262,3229,', '4', '三门峡', 'Sanmenxia', 'sanmenxia', '12');
INSERT INTO `sp_place` VALUES ('3230', '262', ',1,7,262,3230,', '4', '南阳', 'Nanyang', 'nanyang', '13');
INSERT INTO `sp_place` VALUES ('3231', '262', ',1,7,262,3231,', '4', '商丘', 'Shangqiu', 'shangqiu', '14');
INSERT INTO `sp_place` VALUES ('3232', '262', ',1,7,262,3232,', '4', '信阳', 'Xinyang', 'xinyang', '15');
INSERT INTO `sp_place` VALUES ('3233', '262', ',1,7,262,3233,', '4', '周口', 'Zhoukou', 'zhoukou', '16');
INSERT INTO `sp_place` VALUES ('3234', '262', ',1,7,262,3234,', '4', '驻马店', 'Zhumadian', 'zhumadian', '17');
INSERT INTO `sp_place` VALUES ('3235', '262', ',1,7,262,3235,', '4', '济源', 'Jiyuan', 'jiyuan', '18');
INSERT INTO `sp_place` VALUES ('3236', '263', ',1,7,263,3236,', '4', '武汉', 'Wuhan', 'wuhan', '1');
INSERT INTO `sp_place` VALUES ('3237', '263', ',1,7,263,3237,', '4', '黄石', 'Huangshi', 'huangshi', '2');
INSERT INTO `sp_place` VALUES ('3238', '263', ',1,7,263,3238,', '4', '十堰', 'Shiyan', 'shiyan', '3');
INSERT INTO `sp_place` VALUES ('3239', '263', ',1,7,263,3239,', '4', '宜昌', 'Yichang', 'yichang', '5');
INSERT INTO `sp_place` VALUES ('3240', '263', ',1,7,263,3240,', '4', '襄阳', 'Xiangyang', 'xiangyang', '6');
INSERT INTO `sp_place` VALUES ('3241', '263', ',1,7,263,3241,', '4', '鄂州', 'Ezhou', 'ezhou', '7');
INSERT INTO `sp_place` VALUES ('3242', '263', ',1,7,263,3242,', '4', '荆门', 'Jingmen', 'jingmen', '8');
INSERT INTO `sp_place` VALUES ('3243', '263', ',1,7,263,3243,', '4', '孝感', 'Xiaogan', 'xiaogan', '9');
INSERT INTO `sp_place` VALUES ('3244', '263', ',1,7,263,3244,', '4', '荆州', 'Jingzhou', 'jingzhou', '10');
INSERT INTO `sp_place` VALUES ('3245', '263', ',1,7,263,3245,', '4', '黄冈', 'Huanggang', 'huanggang', '11');
INSERT INTO `sp_place` VALUES ('3246', '263', ',1,7,263,3246,', '4', '咸宁', 'Xianning', 'xianning', '12');
INSERT INTO `sp_place` VALUES ('3247', '263', ',1,7,263,3247,', '4', '随州', 'Suizhou', 'suizhou', '13');
INSERT INTO `sp_place` VALUES ('3248', '263', ',1,7,263,3248,', '4', '恩施', 'Enshi Tujia-Miao Autonomous Prefecture', 'enshi', '28');
INSERT INTO `sp_place` VALUES ('3249', '263', ',1,7,263,3249,', '4', '仙桃', 'Xiantao', 'xiantao', '94');
INSERT INTO `sp_place` VALUES ('3250', '263', ',1,7,263,3250,', '4', '潜江', 'Qianjiang', 'qianjiang', '95');
INSERT INTO `sp_place` VALUES ('3251', '263', ',1,7,263,3251,', '4', '天门', 'Tianmen', 'tianmen', '96');
INSERT INTO `sp_place` VALUES ('3252', '263', ',1,7,263,3252,', '4', '神农架', 'Shennongjia', 'shennongjia', 'A21');
INSERT INTO `sp_place` VALUES ('3253', '264', ',1,7,264,3253,', '4', '长沙', 'Changsha', 'changsha', '1');
INSERT INTO `sp_place` VALUES ('3254', '264', ',1,7,264,3254,', '4', '株洲', 'Zhuzhou', 'zhuzhou', '2');
INSERT INTO `sp_place` VALUES ('3255', '264', ',1,7,264,3255,', '4', '湘潭', 'Xiangtan', 'xiangtan', '3');
INSERT INTO `sp_place` VALUES ('3256', '264', ',1,7,264,3256,', '4', '衡阳', 'Hengyang', 'hengyang', '4');
INSERT INTO `sp_place` VALUES ('3257', '264', ',1,7,264,3257,', '4', '邵阳', 'Shaoyang', 'shaoyang', '5');
INSERT INTO `sp_place` VALUES ('3258', '264', ',1,7,264,3258,', '4', '岳阳', 'Yueyang', 'yueyang', '6');
INSERT INTO `sp_place` VALUES ('3259', '264', ',1,7,264,3259,', '4', '常德', 'Changde', 'changde', '7');
INSERT INTO `sp_place` VALUES ('3260', '264', ',1,7,264,3260,', '4', '张家界', 'Zhangjiajie', 'zhangjiajie', '8');
INSERT INTO `sp_place` VALUES ('3261', '264', ',1,7,264,3261,', '4', '益阳', 'Yiyang', 'yiyang', '9');
INSERT INTO `sp_place` VALUES ('3262', '264', ',1,7,264,3262,', '4', '郴州', 'Chenzhou', 'chenzhou', '10');
INSERT INTO `sp_place` VALUES ('3263', '264', ',1,7,264,3263,', '4', '永州', 'Yongzhou', 'yongzhou', '11');
INSERT INTO `sp_place` VALUES ('3264', '264', ',1,7,264,3264,', '4', '怀化', 'Huaihua', 'huaihua', '12');
INSERT INTO `sp_place` VALUES ('3265', '264', ',1,7,264,3265,', '4', '娄底', 'Loudi', 'loudi', '13');
INSERT INTO `sp_place` VALUES ('3266', '264', ',1,7,264,3266,', '4', '湘西', 'Xiangxi Tujia-Miao Autonomous Prefecture', 'xiangxi', '31');
INSERT INTO `sp_place` VALUES ('3267', '265', ',1,7,265,3267,', '4', '广州', 'Guangzhou', 'guangzhou', '1');
INSERT INTO `sp_place` VALUES ('3268', '265', ',1,7,265,3268,', '4', '韶关', 'Shaoguan', 'shaoguan', '2');
INSERT INTO `sp_place` VALUES ('3269', '265', ',1,7,265,3269,', '4', '深圳', 'Shenzhen', 'shen', '3');
INSERT INTO `sp_place` VALUES ('3270', '265', ',1,7,265,3270,', '4', '珠海', 'Zhuhai', 'zhuhai', '4');
INSERT INTO `sp_place` VALUES ('3271', '265', ',1,7,265,3271,', '4', '汕头', 'Shantou', 'shantou', '5');
INSERT INTO `sp_place` VALUES ('3272', '265', ',1,7,265,3272,', '4', '佛山', 'Foshan', 'foshan', '6');
INSERT INTO `sp_place` VALUES ('3273', '265', ',1,7,265,3273,', '4', '江门', 'Jiangmen', 'jiangmen', '7');
INSERT INTO `sp_place` VALUES ('3274', '265', ',1,7,265,3274,', '4', '湛江', 'Zhanjiang', 'zhanjiang', '8');
INSERT INTO `sp_place` VALUES ('3275', '265', ',1,7,265,3275,', '4', '茂名', 'Maoming', 'maoming', '9');
INSERT INTO `sp_place` VALUES ('3276', '265', ',1,7,265,3276,', '4', '肇庆', 'Zhaoqing', 'zhaoqing', '12');
INSERT INTO `sp_place` VALUES ('3277', '265', ',1,7,265,3277,', '4', '惠州', 'Huizhou', 'huizhou', '13');
INSERT INTO `sp_place` VALUES ('3278', '265', ',1,7,265,3278,', '4', '梅州', 'Meizhou', 'meizhou', '14');
INSERT INTO `sp_place` VALUES ('3279', '265', ',1,7,265,3279,', '4', '汕尾', 'Shanwei', 'shanwei', '15');
INSERT INTO `sp_place` VALUES ('3280', '265', ',1,7,265,3280,', '4', '河源', 'Heyuan', 'heyuan', '16');
INSERT INTO `sp_place` VALUES ('3281', '265', ',1,7,265,3281,', '4', '阳江', 'Yangjiang', 'yangjiang', '17');
INSERT INTO `sp_place` VALUES ('3282', '265', ',1,7,265,3282,', '4', '清远', 'Qingyuan', 'qingyuan', '18');
INSERT INTO `sp_place` VALUES ('3283', '265', ',1,7,265,3283,', '4', '东莞', 'Dongguan', 'dong', '19');
INSERT INTO `sp_place` VALUES ('3284', '265', ',1,7,265,3284,', '4', '中山', 'Zhongshan', 'zhongshan', '20');
INSERT INTO `sp_place` VALUES ('3285', '265', ',1,7,265,3285,', '4', '潮州', 'Chaozhou', 'chaozhou', '51');
INSERT INTO `sp_place` VALUES ('3286', '265', ',1,7,265,3286,', '4', '揭阳', 'Jieyang', 'jieyang', '52');
INSERT INTO `sp_place` VALUES ('3287', '265', ',1,7,265,3287,', '4', '云浮', 'Yunfu', 'yunfu', '53');
INSERT INTO `sp_place` VALUES ('3288', '266', ',1,7,266,3288,', '4', '南宁', 'Nanning', 'nanning', '1');
INSERT INTO `sp_place` VALUES ('3289', '266', ',1,7,266,3289,', '4', '柳州', 'Liuzhou', 'liuzhou', '2');
INSERT INTO `sp_place` VALUES ('3290', '266', ',1,7,266,3290,', '4', '桂林', 'Guilin', 'guilin', '3');
INSERT INTO `sp_place` VALUES ('3291', '266', ',1,7,266,3291,', '4', '梧州', 'Wuzhou', 'wuzhou', '4');
INSERT INTO `sp_place` VALUES ('3292', '266', ',1,7,266,3292,', '4', '北海', 'Beihai', 'beihai', '5');
INSERT INTO `sp_place` VALUES ('3293', '266', ',1,7,266,3293,', '4', '防城港', 'Fangchenggang', 'fangchenggang', '6');
INSERT INTO `sp_place` VALUES ('3294', '266', ',1,7,266,3294,', '4', '钦州', 'Qinzhou', 'qinzhou', '7');
INSERT INTO `sp_place` VALUES ('3295', '266', ',1,7,266,3295,', '4', '贵港', 'Guigang', 'guigang', '8');
INSERT INTO `sp_place` VALUES ('3296', '266', ',1,7,266,3296,', '4', '玉林', 'Yulin', 'yulin', '9');
INSERT INTO `sp_place` VALUES ('3297', '266', ',1,7,266,3297,', '4', '百色', 'Baise', 'baise', '10');
INSERT INTO `sp_place` VALUES ('3298', '266', ',1,7,266,3298,', '4', '贺州', 'Hezhou', 'hezhou', '11');
INSERT INTO `sp_place` VALUES ('3299', '266', ',1,7,266,3299,', '4', '河池', 'Hechi', 'hechi', '12');
INSERT INTO `sp_place` VALUES ('3300', '266', ',1,7,266,3300,', '4', '来宾', 'Laibin', 'laibin', '13');
INSERT INTO `sp_place` VALUES ('3301', '266', ',1,7,266,3301,', '4', '崇左', 'Chongzuo', 'chongzuo', '14');
INSERT INTO `sp_place` VALUES ('3302', '267', ',1,7,267,3302,', '4', '海口', 'Haikou', 'haikou', '1');
INSERT INTO `sp_place` VALUES ('3303', '267', ',1,7,267,3303,', '4', '三亚', 'Sanya', 'sanya', '2');
INSERT INTO `sp_place` VALUES ('3304', '267', ',1,7,267,3304,', '4', '三沙', 'Shansha', 'sansha', '3');
INSERT INTO `sp_place` VALUES ('3305', '267', ',1,7,267,3305,', '4', '五指山', 'Wuzhishan', 'wuzhishan', '91');
INSERT INTO `sp_place` VALUES ('3306', '267', ',1,7,267,3306,', '4', '琼海', 'Qionghai', 'qionghai', '92');
INSERT INTO `sp_place` VALUES ('3307', '267', ',1,7,267,3307,', '4', '儋州', 'Danzhou', 'zhou', '93');
INSERT INTO `sp_place` VALUES ('3308', '267', ',1,7,267,3308,', '4', '文昌', 'Wenchang', 'wenchang', '95');
INSERT INTO `sp_place` VALUES ('3309', '267', ',1,7,267,3309,', '4', '万宁', 'Wanning', 'wanning', '96');
INSERT INTO `sp_place` VALUES ('3310', '267', ',1,7,267,3310,', '4', '东方', 'Dongfang', 'dongfang', '97');
INSERT INTO `sp_place` VALUES ('3311', '267', ',1,7,267,3311,', '4', '定安', 'Ding\'an', 'dingan', 'A25');
INSERT INTO `sp_place` VALUES ('3312', '267', ',1,7,267,3312,', '4', '屯昌', 'Tunchang', 'tunchang', 'A26');
INSERT INTO `sp_place` VALUES ('3313', '267', ',1,7,267,3313,', '4', '澄迈', 'Cengmai', 'chengmai', 'A27');
INSERT INTO `sp_place` VALUES ('3314', '267', ',1,7,267,3314,', '4', '临高', 'Lingao', 'lingao', 'A28');
INSERT INTO `sp_place` VALUES ('3315', '267', ',1,7,267,3315,', '4', '白沙', 'Baisha Li Autonomous County', 'baisha', 'A30');
INSERT INTO `sp_place` VALUES ('3316', '267', ',1,7,267,3316,', '4', '昌江', 'Jiang Li Autonomous County', 'changjiang', 'A31');
INSERT INTO `sp_place` VALUES ('3317', '267', ',1,7,267,3317,', '4', '乐东', 'Ledong Li Autonomous County', 'ledong', 'A33');
INSERT INTO `sp_place` VALUES ('3318', '267', ',1,7,267,3318,', '4', '陵水', 'Lingshui Li Autonomous County', 'lingshui', 'A34');
INSERT INTO `sp_place` VALUES ('3319', '267', ',1,7,267,3319,', '4', '保亭', 'Baoting Li-Miao Autonomous County', 'baoting', 'A35');
INSERT INTO `sp_place` VALUES ('3320', '267', ',1,7,267,3320,', '4', '琼中', 'Qiongzhong Li-Miao Autonomous County', 'qiongzhong', 'A36');
INSERT INTO `sp_place` VALUES ('3321', '268', ',1,7,268,3321,', '4', '万州', 'Wanzhou', 'wanzhou', '1');
INSERT INTO `sp_place` VALUES ('3322', '268', ',1,7,268,3322,', '4', '涪陵', 'Fuling', 'fuling', '2');
INSERT INTO `sp_place` VALUES ('3323', '268', ',1,7,268,3323,', '4', '渝中', 'Yuzhong', 'yuzhong', '3');
INSERT INTO `sp_place` VALUES ('3324', '268', ',1,7,268,3324,', '4', '大渡口', 'Dadukou', 'dadukou', '4');
INSERT INTO `sp_place` VALUES ('3325', '268', ',1,7,268,3325,', '4', '江北', 'Jiangbei', 'jiangbei', '5');
INSERT INTO `sp_place` VALUES ('3326', '268', ',1,7,268,3326,', '4', '沙坪坝', 'Shapingba', 'shapingba', '6');
INSERT INTO `sp_place` VALUES ('3327', '268', ',1,7,268,3327,', '4', '九龙坡', 'Jiulongpo', 'jiulongpo', '7');
INSERT INTO `sp_place` VALUES ('3328', '268', ',1,7,268,3328,', '4', '南岸', 'Nan\'an', 'nanan', '8');
INSERT INTO `sp_place` VALUES ('3329', '268', ',1,7,268,3329,', '4', '北碚', 'Beibei', 'bei', '9');
INSERT INTO `sp_place` VALUES ('3330', '268', ',1,7,268,3330,', '4', '两江新区', 'Kaixian', 'liangjiangxinqu', '85');
INSERT INTO `sp_place` VALUES ('3331', '268', ',1,7,268,3331,', '4', '万盛', 'Wansheng', 'wansheng', '10');
INSERT INTO `sp_place` VALUES ('3332', '268', ',1,7,268,3332,', '4', '双桥', 'Shuangqiao', 'shuangqiao', '11');
INSERT INTO `sp_place` VALUES ('3333', '268', ',1,7,268,3333,', '4', '渝北', 'Yubei', 'yubei', '12');
INSERT INTO `sp_place` VALUES ('3334', '268', ',1,7,268,3334,', '4', '巴南', 'Ba\'nan', 'banan', '13');
INSERT INTO `sp_place` VALUES ('3335', '268', ',1,7,268,3335,', '4', '长寿', 'Changshou', 'changshou', '21');
INSERT INTO `sp_place` VALUES ('3336', '268', ',1,7,268,3336,', '4', '綦江', 'Qijiang', 'jiang', '22');
INSERT INTO `sp_place` VALUES ('3337', '268', ',1,7,268,3337,', '4', '潼南', 'Tongnan', 'nan', '23');
INSERT INTO `sp_place` VALUES ('3338', '268', ',1,7,268,3338,', '4', '铜梁', 'Tongliang', 'tongliang', '24');
INSERT INTO `sp_place` VALUES ('3339', '268', ',1,7,268,3339,', '4', '大足', 'Dazu', 'dazu', '25');
INSERT INTO `sp_place` VALUES ('3340', '268', ',1,7,268,3340,', '4', '荣昌', 'Rongchang', 'rongchang', '26');
INSERT INTO `sp_place` VALUES ('3341', '268', ',1,7,268,3341,', '4', '璧山', 'Bishan', 'shan', '27');
INSERT INTO `sp_place` VALUES ('3342', '268', ',1,7,268,3342,', '4', '梁平', 'Liangping', 'liangping', '28');
INSERT INTO `sp_place` VALUES ('3343', '268', ',1,7,268,3343,', '4', '城口', 'Chengkou', 'chengkou', '29');
INSERT INTO `sp_place` VALUES ('3344', '268', ',1,7,268,3344,', '4', '丰都', 'Fengdu', 'fengdu', '30');
INSERT INTO `sp_place` VALUES ('3345', '268', ',1,7,268,3345,', '4', '垫江', 'Dianjiang', 'dianjiang', '31');
INSERT INTO `sp_place` VALUES ('3346', '268', ',1,7,268,3346,', '4', '武隆', 'Wulong', 'wulong', '32');
INSERT INTO `sp_place` VALUES ('3347', '268', ',1,7,268,3347,', '4', '忠县', 'Zhongxian', 'zhongxian', '33');
INSERT INTO `sp_place` VALUES ('3348', '268', ',1,7,268,3348,', '4', '开县', 'Kaixian', 'kaixian', '34');
INSERT INTO `sp_place` VALUES ('3349', '268', ',1,7,268,3349,', '4', '云阳', 'Yunyang', 'yunyang', '35');
INSERT INTO `sp_place` VALUES ('3350', '268', ',1,7,268,3350,', '4', '奉节', 'Fengjie', 'fengjie', '36');
INSERT INTO `sp_place` VALUES ('3351', '268', ',1,7,268,3351,', '4', '巫山', 'Wushan', 'wushan', '37');
INSERT INTO `sp_place` VALUES ('3352', '268', ',1,7,268,3352,', '4', '巫溪', 'Wuxi', 'wuxi', '38');
INSERT INTO `sp_place` VALUES ('3353', '268', ',1,7,268,3353,', '4', '黔江', 'Qianjiang', 'qianjiang', '39');
INSERT INTO `sp_place` VALUES ('3354', '268', ',1,7,268,3354,', '4', '石柱', 'Shizhu Tujia Autonomous Country', 'shizhu', '40');
INSERT INTO `sp_place` VALUES ('3355', '268', ',1,7,268,3355,', '4', '秀山', 'Xiushan Tujia-Miao Autonomous Country', 'xiushan', '41');
INSERT INTO `sp_place` VALUES ('3356', '268', ',1,7,268,3356,', '4', '酉阳', 'Youyang Tujia-Miao Autonomous Country', 'youyang', '42');
INSERT INTO `sp_place` VALUES ('3357', '268', ',1,7,268,3357,', '4', '彭水', 'Pengshui Miao-Tujia Autonomous Country', 'pengshui', '43');
INSERT INTO `sp_place` VALUES ('3358', '268', ',1,7,268,3358,', '4', '江津', 'Jiangjin', 'jiangjin', '81');
INSERT INTO `sp_place` VALUES ('3359', '268', ',1,7,268,3359,', '4', '合川', 'Hechuan', 'hechuan', '82');
INSERT INTO `sp_place` VALUES ('3360', '268', ',1,7,268,3360,', '4', '永川', 'Yongchuan', 'yongchuan', '83');
INSERT INTO `sp_place` VALUES ('3361', '268', ',1,7,268,3361,', '4', '南川', 'Liangjiangxinqu', 'nanchuan', '84');
INSERT INTO `sp_place` VALUES ('3362', '269', ',1,7,269,3362,', '4', '成都', 'Chengdu', 'chengdu', '1');
INSERT INTO `sp_place` VALUES ('3363', '269', ',1,7,269,3363,', '4', '自贡', 'Zigong', 'zigong', '3');
INSERT INTO `sp_place` VALUES ('3364', '269', ',1,7,269,3364,', '4', '攀枝花', 'Panzhihua', 'panzhihua', '4');
INSERT INTO `sp_place` VALUES ('3365', '269', ',1,7,269,3365,', '4', '泸州', 'Luzhou', 'zhou', '5');
INSERT INTO `sp_place` VALUES ('3366', '269', ',1,7,269,3366,', '4', '德阳', 'Deyang', 'deyang', '6');
INSERT INTO `sp_place` VALUES ('3367', '269', ',1,7,269,3367,', '4', '绵阳', 'Mianyang', 'mianyang', '7');
INSERT INTO `sp_place` VALUES ('3368', '269', ',1,7,269,3368,', '4', '广元', 'Guangyuan', 'guangyuan', '8');
INSERT INTO `sp_place` VALUES ('3369', '269', ',1,7,269,3369,', '4', '遂宁', 'Suining', 'suining', '9');
INSERT INTO `sp_place` VALUES ('3370', '269', ',1,7,269,3370,', '4', '内江', 'Neijiang', 'neijiang', '10');
INSERT INTO `sp_place` VALUES ('3371', '269', ',1,7,269,3371,', '4', '乐山', 'Leshan', 'leshan', '11');
INSERT INTO `sp_place` VALUES ('3372', '269', ',1,7,269,3372,', '4', '南充', 'Nanchong', 'nanchong', '13');
INSERT INTO `sp_place` VALUES ('3373', '269', ',1,7,269,3373,', '4', '眉山', 'Meishan', 'meishan', '14');
INSERT INTO `sp_place` VALUES ('3374', '269', ',1,7,269,3374,', '4', '宜宾', 'Yibin', 'yibin', '15');
INSERT INTO `sp_place` VALUES ('3375', '269', ',1,7,269,3375,', '4', '广安', 'Guang\'an', 'guangan', '16');
INSERT INTO `sp_place` VALUES ('3376', '269', ',1,7,269,3376,', '4', '达州', 'Dazhou', 'dazhou', '17');
INSERT INTO `sp_place` VALUES ('3377', '269', ',1,7,269,3377,', '4', '雅安', 'Ya\'an', 'yaan', '18');
INSERT INTO `sp_place` VALUES ('3378', '269', ',1,7,269,3378,', '4', '巴中', 'Bazhong', 'bazhong', '19');
INSERT INTO `sp_place` VALUES ('3379', '269', ',1,7,269,3379,', '4', '资阳', 'Ziyang', 'ziyang', '20');
INSERT INTO `sp_place` VALUES ('3380', '269', ',1,7,269,3380,', '4', '阿坝', 'Aba Tibetan-Qiang Autonomous Prefecture', 'aba', '32');
INSERT INTO `sp_place` VALUES ('3381', '269', ',1,7,269,3381,', '4', '甘孜', 'Garze Tibetan Autonomous Prefecture', 'ganzi', '33');
INSERT INTO `sp_place` VALUES ('3382', '269', ',1,7,269,3382,', '4', '凉山', 'Liangshan Yi Autonomous Prefecture', 'liangshan', '34');
INSERT INTO `sp_place` VALUES ('3383', '270', ',1,7,270,3383,', '4', '贵阳', 'Guiyang', 'guiyang', '1');
INSERT INTO `sp_place` VALUES ('3384', '270', ',1,7,270,3384,', '4', '六盘水', 'Liupanshui', 'liupanshui', '2');
INSERT INTO `sp_place` VALUES ('3385', '270', ',1,7,270,3385,', '4', '遵义', 'Zunyi', 'zunyi', '3');
INSERT INTO `sp_place` VALUES ('3386', '270', ',1,7,270,3386,', '4', '安顺', 'Anshun', 'anshun', '4');
INSERT INTO `sp_place` VALUES ('3387', '270', ',1,7,270,3387,', '4', '铜仁', 'Tongren', 'tongren', '22');
INSERT INTO `sp_place` VALUES ('3388', '270', ',1,7,270,3388,', '4', '黔西南', 'Qianxinan Buyi-Miao Autonomous Prefecture', 'qianxinan', '23');
INSERT INTO `sp_place` VALUES ('3389', '270', ',1,7,270,3389,', '4', '毕节', 'Bijie', 'bijie', '24');
INSERT INTO `sp_place` VALUES ('3390', '270', ',1,7,270,3390,', '4', '黔东南', 'Qiandongnan Miao-Dong Autonomous Prefecture', 'qiandongnan', '26');
INSERT INTO `sp_place` VALUES ('3391', '270', ',1,7,270,3391,', '4', '黔南', 'Qiannan Buyi Autonomous Prefecture', 'qiannan', '27');
INSERT INTO `sp_place` VALUES ('3392', '271', ',1,7,271,3392,', '4', '昆明', 'Kunming', 'kunming', '1');
INSERT INTO `sp_place` VALUES ('3393', '271', ',1,7,271,3393,', '4', '曲靖', 'Qujing', 'qujing', '3');
INSERT INTO `sp_place` VALUES ('3394', '271', ',1,7,271,3394,', '4', '玉溪', 'Yuxi', 'yuxi', '4');
INSERT INTO `sp_place` VALUES ('3395', '271', ',1,7,271,3395,', '4', '保山', 'Baoshan', 'baoshan', '5');
INSERT INTO `sp_place` VALUES ('3396', '271', ',1,7,271,3396,', '4', '昭通', 'Zhaotong', 'zhaotong', '6');
INSERT INTO `sp_place` VALUES ('3397', '271', ',1,7,271,3397,', '4', '丽江', 'Lijiang', 'lijiang', '7');
INSERT INTO `sp_place` VALUES ('3398', '271', ',1,7,271,3398,', '4', '普洱', 'Pu\'er', 'puer', '8');
INSERT INTO `sp_place` VALUES ('3399', '271', ',1,7,271,3399,', '4', '临沧', 'Lincang', 'lincang', '9');
INSERT INTO `sp_place` VALUES ('3400', '271', ',1,7,271,3400,', '4', '楚雄', 'Chuxiong Yi Autonomous Prefecture', 'chuxiong', '23');
INSERT INTO `sp_place` VALUES ('3401', '271', ',1,7,271,3401,', '4', '红河', 'Honghe Hani-Yi Autonomous Prefecture', 'honghe', '25');
INSERT INTO `sp_place` VALUES ('3402', '271', ',1,7,271,3402,', '4', '文山', 'Wenshan Zhuang-Miao Autonomous Prefecture', 'wenshan', '26');
INSERT INTO `sp_place` VALUES ('3403', '271', ',1,7,271,3403,', '4', '西双版纳', 'Xishuangbanna Dai Autonomous Prefecture', 'xishuangbanna', '28');
INSERT INTO `sp_place` VALUES ('3404', '271', ',1,7,271,3404,', '4', '大理', 'Dali Bai Autonomous Prefecture', 'dali', '29');
INSERT INTO `sp_place` VALUES ('3405', '271', ',1,7,271,3405,', '4', '德宏', 'Dehong Dai-Jingpo Autonomous Prefecture', 'dehong', '31');
INSERT INTO `sp_place` VALUES ('3406', '271', ',1,7,271,3406,', '4', '怒江', 'Nujiang Lisu Autonomous Prefecture', 'nujiang', '33');
INSERT INTO `sp_place` VALUES ('3407', '271', ',1,7,271,3407,', '4', '迪庆', 'Diqing Tibetan Autonomous Prefecture', 'diqing', '34');
INSERT INTO `sp_place` VALUES ('3408', '272', ',1,7,272,3408,', '4', '拉萨', 'Lhasa', 'lasa', '1');
INSERT INTO `sp_place` VALUES ('3409', '272', ',1,7,272,3409,', '4', '昌都', 'Qamdo', 'changdu', '21');
INSERT INTO `sp_place` VALUES ('3410', '272', ',1,7,272,3410,', '4', '山南', 'Shannan', 'shannan', '22');
INSERT INTO `sp_place` VALUES ('3411', '272', ',1,7,272,3411,', '4', '日喀则', 'Xigaze', 'rikaze', '23');
INSERT INTO `sp_place` VALUES ('3412', '272', ',1,7,272,3412,', '4', '那曲', 'Nagqu', 'naqu', '24');
INSERT INTO `sp_place` VALUES ('3413', '272', ',1,7,272,3413,', '4', '阿里', 'Ngari', 'ali', '25');
INSERT INTO `sp_place` VALUES ('3414', '272', ',1,7,272,3414,', '4', '林芝', 'Nyingchi', 'linzhi', '26');
INSERT INTO `sp_place` VALUES ('3415', '273', ',1,7,273,3415,', '4', '西安', 'Xi\'an', 'xian', '1');
INSERT INTO `sp_place` VALUES ('3416', '273', ',1,7,273,3416,', '4', '铜川', 'Tongchuan', 'tongchuan', '2');
INSERT INTO `sp_place` VALUES ('3417', '273', ',1,7,273,3417,', '4', '宝鸡', 'Baoji', 'baoji', '3');
INSERT INTO `sp_place` VALUES ('3418', '273', ',1,7,273,3418,', '4', '咸阳', 'Xianyang', 'xianyang', '4');
INSERT INTO `sp_place` VALUES ('3419', '273', ',1,7,273,3419,', '4', '渭南', 'Weinan', 'weinan', '5');
INSERT INTO `sp_place` VALUES ('3420', '273', ',1,7,273,3420,', '4', '延安', 'Yan\'an', 'yanan', '6');
INSERT INTO `sp_place` VALUES ('3421', '273', ',1,7,273,3421,', '4', '汉中', 'Hanzhong', 'hanzhong', '7');
INSERT INTO `sp_place` VALUES ('3422', '273', ',1,7,273,3422,', '4', '榆林', 'Yulin', 'yulin', '8');
INSERT INTO `sp_place` VALUES ('3423', '273', ',1,7,273,3423,', '4', '安康', 'Ankang', 'ankang', '9');
INSERT INTO `sp_place` VALUES ('3424', '273', ',1,7,273,3424,', '4', '商洛', 'Shangluo', 'shangluo', '10');
INSERT INTO `sp_place` VALUES ('3425', '274', ',1,7,274,3425,', '4', '兰州市', 'Lanzhou', 'lanzhoushi', '1');
INSERT INTO `sp_place` VALUES ('3426', '274', ',1,7,274,3426,', '4', '嘉峪关', 'Jinchang', 'jiayuguan', '2');
INSERT INTO `sp_place` VALUES ('3427', '274', ',1,7,274,3427,', '4', '金昌', 'Baiyin', 'jinchang', '3');
INSERT INTO `sp_place` VALUES ('3428', '274', ',1,7,274,3428,', '4', '白银', 'Tianshui', 'baiyin', '4');
INSERT INTO `sp_place` VALUES ('3429', '274', ',1,7,274,3429,', '4', '天水', 'Jiayuguan', 'tianshui', '5');
INSERT INTO `sp_place` VALUES ('3430', '274', ',1,7,274,3430,', '4', '武威', 'Wuwei', 'wuwei', '6');
INSERT INTO `sp_place` VALUES ('3431', '274', ',1,7,274,3431,', '4', '张掖', 'Zhangye', 'zhangye', '7');
INSERT INTO `sp_place` VALUES ('3432', '274', ',1,7,274,3432,', '4', '平凉', 'Pingliang', 'pingliang', '8');
INSERT INTO `sp_place` VALUES ('3433', '274', ',1,7,274,3433,', '4', '酒泉', 'Jiuquan', 'jiuquan', '9');
INSERT INTO `sp_place` VALUES ('3434', '274', ',1,7,274,3434,', '4', '庆阳', 'Qingyang', 'qingyang', '10');
INSERT INTO `sp_place` VALUES ('3435', '274', ',1,7,274,3435,', '4', '定西', 'Dingxi', 'dingxi', '11');
INSERT INTO `sp_place` VALUES ('3436', '274', ',1,7,274,3436,', '4', '陇南', 'Longnan', 'longnan', '12');
INSERT INTO `sp_place` VALUES ('3437', '274', ',1,7,274,3437,', '4', '临夏', 'Linxia Hui Autonomous Prefecture', 'linxia', '29');
INSERT INTO `sp_place` VALUES ('3438', '274', ',1,7,274,3438,', '4', '甘南', 'Gannan Tibetan Autonomous Prefecture', 'gannan', '30');
INSERT INTO `sp_place` VALUES ('3439', '275', ',1,7,275,3439,', '4', '西宁', 'Xining', 'xining', '1');
INSERT INTO `sp_place` VALUES ('3440', '275', ',1,7,275,3440,', '4', '海东', 'Haidong', 'haidong', '21');
INSERT INTO `sp_place` VALUES ('3441', '275', ',1,7,275,3441,', '4', '海北', 'Haibei Tibetan Autonomous Prefecture', 'haibei', '22');
INSERT INTO `sp_place` VALUES ('3442', '275', ',1,7,275,3442,', '4', '黄南', 'Huangnan Tibetan Autonomous Prefecture', 'huangnan', '23');
INSERT INTO `sp_place` VALUES ('3443', '275', ',1,7,275,3443,', '4', '海南', 'Hainan Tibetan Autonomous Prefecture', 'hainan', '25');
INSERT INTO `sp_place` VALUES ('3444', '275', ',1,7,275,3444,', '4', '果洛', 'Guoluo Tibetan Autonomous Prefecture', 'guoluo', '26');
INSERT INTO `sp_place` VALUES ('3445', '275', ',1,7,275,3445,', '4', '玉树', 'Yushu Tibetan Autonomous Prefecture', 'yushu', '27');
INSERT INTO `sp_place` VALUES ('3446', '275', ',1,7,275,3446,', '4', '海西', 'Haixi Mongol-Tibetan Autonomous Prefecture', 'haixi', '28');
INSERT INTO `sp_place` VALUES ('3447', '276', ',1,7,276,3447,', '4', '银川', 'Yinchuan', 'yinchuan', '1');
INSERT INTO `sp_place` VALUES ('3448', '276', ',1,7,276,3448,', '4', '石嘴山', 'Shizuishan', 'shizuishan', '2');
INSERT INTO `sp_place` VALUES ('3449', '276', ',1,7,276,3449,', '4', '吴忠', 'Wuzhong', 'wuzhong', '3');
INSERT INTO `sp_place` VALUES ('3450', '276', ',1,7,276,3450,', '4', '固原', 'Guyuan', 'guyuan', '4');
INSERT INTO `sp_place` VALUES ('3451', '276', ',1,7,276,3451,', '4', '中卫', 'Zhongwei', 'zhongwei', '5');
INSERT INTO `sp_place` VALUES ('3452', '277', ',1,7,277,3452,', '4', '乌鲁木齐', 'Urumqi', 'wulumuqi', '1');
INSERT INTO `sp_place` VALUES ('3453', '277', ',1,7,277,3453,', '4', '克拉玛依', 'Karamay', 'kelamayi', '2');
INSERT INTO `sp_place` VALUES ('3454', '277', ',1,7,277,3454,', '4', '吐鲁番', 'Turpan', 'tulufan', '21');
INSERT INTO `sp_place` VALUES ('3455', '277', ',1,7,277,3455,', '4', '哈密', 'Hami', 'hami', '22');
INSERT INTO `sp_place` VALUES ('3456', '277', ',1,7,277,3456,', '4', '昌吉', 'Changji Hui Autonomous Prefecture', 'changji', '23');
INSERT INTO `sp_place` VALUES ('3457', '277', ',1,7,277,3457,', '4', '博尔塔拉', 'Bortala Mongol Autonomous Prefecture', 'boertala', '27');
INSERT INTO `sp_place` VALUES ('3458', '277', ',1,7,277,3458,', '4', '巴音郭楞', 'Bayingolin Mongol Autonomous Prefecture', 'bayinguoleng', '28');
INSERT INTO `sp_place` VALUES ('3459', '277', ',1,7,277,3459,', '4', '阿克苏', 'Aksu', 'akesu', '29');
INSERT INTO `sp_place` VALUES ('3460', '277', ',1,7,277,3460,', '4', '克孜勒苏', 'Kizilsu Kirgiz Autonomous Prefecture', 'kezilesu', '30');
INSERT INTO `sp_place` VALUES ('3461', '277', ',1,7,277,3461,', '4', '喀什', 'Kashi', 'kashi', '31');
INSERT INTO `sp_place` VALUES ('3462', '277', ',1,7,277,3462,', '4', '和田', 'Hotan', 'hetian', '32');
INSERT INTO `sp_place` VALUES ('3463', '277', ',1,7,277,3463,', '4', '伊犁', 'Ili Kazakh Autonomous Prefecture', 'yili', '40');
INSERT INTO `sp_place` VALUES ('3464', '277', ',1,7,277,3464,', '4', '塔城', 'Tacheng', 'tacheng', '42');
INSERT INTO `sp_place` VALUES ('3465', '277', ',1,7,277,3465,', '4', '阿勒泰', 'Altay', 'aletai', '43');
INSERT INTO `sp_place` VALUES ('3466', '277', ',1,7,277,3466,', '4', '石河子', 'Shihezi', 'shihezi', '91');
INSERT INTO `sp_place` VALUES ('3467', '277', ',1,7,277,3467,', '4', '阿拉尔', 'Alar', 'alaer', '92');
INSERT INTO `sp_place` VALUES ('3468', '277', ',1,7,277,3468,', '4', '图木舒克', 'Tumsuk', 'tumushuke', '93');
INSERT INTO `sp_place` VALUES ('3469', '277', ',1,7,277,3469,', '4', '五家渠', 'Wujiaqu', 'wujiaqu', '94');
INSERT INTO `sp_place` VALUES ('3470', '277', ',1,7,277,3470,', '4', '北屯', 'Beitun', 'beitun', '95');
INSERT INTO `sp_place` VALUES ('3471', '278', ',1,7,278,3471,', '4', '台北市', 'Taipei City', 'taibeishi', '1');
INSERT INTO `sp_place` VALUES ('3472', '278', ',1,7,278,3472,', '4', '高雄市', 'Kaohsiung City', 'gaoxiongshi', '2');
INSERT INTO `sp_place` VALUES ('3473', '278', ',1,7,278,3473,', '4', '基隆市', 'Keelung City', 'jilongshi', '3');
INSERT INTO `sp_place` VALUES ('3474', '278', ',1,7,278,3474,', '4', '台中市', 'Taichung City', 'taizhongshi', '4');
INSERT INTO `sp_place` VALUES ('3475', '278', ',1,7,278,3475,', '4', '台南市', 'Tainan City', 'tainanshi', '5');
INSERT INTO `sp_place` VALUES ('3476', '278', ',1,7,278,3476,', '4', '新竹市', 'Hsinchu City', 'xinzhushi', '6');
INSERT INTO `sp_place` VALUES ('3477', '278', ',1,7,278,3477,', '4', '嘉义市', 'Chiayi City', 'jiayishi', '7');
INSERT INTO `sp_place` VALUES ('3478', '278', ',1,7,278,3478,', '4', '台北县', 'Taipei County', 'taibeixian', '8');
INSERT INTO `sp_place` VALUES ('3479', '278', ',1,7,278,3479,', '4', '宜兰县', 'Ilan County', 'yilanxian', '9');
INSERT INTO `sp_place` VALUES ('3480', '278', ',1,7,278,3480,', '4', '桃园县', 'Taoyuan County', 'taoyuanxian', '10');
INSERT INTO `sp_place` VALUES ('3481', '278', ',1,7,278,3481,', '4', '新竹县', 'Hsinchu County', 'xinzhuxian', '11');
INSERT INTO `sp_place` VALUES ('3482', '278', ',1,7,278,3482,', '4', '苗栗县', 'Miaoli County', 'miaolixian', '12');
INSERT INTO `sp_place` VALUES ('3483', '278', ',1,7,278,3483,', '4', '台中县', 'Taichung County', 'taizhongxian', '13');
INSERT INTO `sp_place` VALUES ('3484', '278', ',1,7,278,3484,', '4', '彰化县', 'Changhwa County', 'zhanghuaxian', '14');
INSERT INTO `sp_place` VALUES ('3485', '278', ',1,7,278,3485,', '4', '南投县', 'Nantou County', 'nantouxian', '15');
INSERT INTO `sp_place` VALUES ('3486', '278', ',1,7,278,3486,', '4', '云林县', 'Yunnlin County', 'yunlinxian', '16');
INSERT INTO `sp_place` VALUES ('3487', '278', ',1,7,278,3487,', '4', '嘉义县', 'Chiayi County', 'jiayixian', '17');
INSERT INTO `sp_place` VALUES ('3488', '278', ',1,7,278,3488,', '4', '台南县', 'Tainan County', 'tainanxian', '18');
INSERT INTO `sp_place` VALUES ('3489', '278', ',1,7,278,3489,', '4', '高雄县', 'Kaohsiung County', 'gaoxiongxian', '19');
INSERT INTO `sp_place` VALUES ('3490', '278', ',1,7,278,3490,', '4', '屏东县', 'Pingtung County', 'pingdongxian', '20');
INSERT INTO `sp_place` VALUES ('3491', '278', ',1,7,278,3491,', '4', '台东县', 'Taitung County', 'taidongxian', '22');
INSERT INTO `sp_place` VALUES ('3492', '278', ',1,7,278,3492,', '4', '花莲县', 'Hualian County', 'hualianxian', '23');
INSERT INTO `sp_place` VALUES ('3493', '278', ',1,7,278,3493,', '4', '澎湖县', 'Penghu County', 'penghuxian', '21');
INSERT INTO `sp_place` VALUES ('3494', '279', ',1,7,279,3494,', '4', '中西区', 'NaN', 'zhongxiqu', 'HCW');
INSERT INTO `sp_place` VALUES ('3495', '279', ',1,7,279,3495,', '4', '东区', 'NaN', 'dongqu', 'HEA');
INSERT INTO `sp_place` VALUES ('3496', '279', ',1,7,279,3496,', '4', '九龙城区', 'NaN', 'jiulongchengqu', 'KKC');
INSERT INTO `sp_place` VALUES ('3497', '279', ',1,7,279,3497,', '4', '观塘区', 'NaN', 'guantangqu', 'KKT');
INSERT INTO `sp_place` VALUES ('3498', '279', ',1,7,279,3498,', '4', '南区', 'NaN', 'nanqu', 'HSO');
INSERT INTO `sp_place` VALUES ('3499', '279', ',1,7,279,3499,', '4', '深水埗区', 'NaN', 'shenshui', 'KSS');
INSERT INTO `sp_place` VALUES ('3500', '279', ',1,7,279,3500,', '4', '黄大仙区', 'NaN', 'huangdaxianqu', 'KWT');
INSERT INTO `sp_place` VALUES ('3501', '279', ',1,7,279,3501,', '4', '湾仔区', 'NaN', 'wanziqu', 'HWC');
INSERT INTO `sp_place` VALUES ('3502', '279', ',1,7,279,3502,', '4', '油尖旺区', 'NaN', 'youjianwangqu', 'KYT');
INSERT INTO `sp_place` VALUES ('3503', '279', ',1,7,279,3503,', '4', '离岛区', 'NaN', 'lidaoqu', 'NIS');
INSERT INTO `sp_place` VALUES ('3504', '279', ',1,7,279,3504,', '4', '葵青区', 'NaN', 'kuiqingqu', 'NKT');
INSERT INTO `sp_place` VALUES ('3505', '279', ',1,7,279,3505,', '4', '北区', 'NaN', 'beiqu', 'NNO');
INSERT INTO `sp_place` VALUES ('3506', '279', ',1,7,279,3506,', '4', '西贡区', 'NaN', 'xigongqu', 'NSK');
INSERT INTO `sp_place` VALUES ('3507', '279', ',1,7,279,3507,', '4', '沙田区', 'NaN', 'shatianqu', 'NST');
INSERT INTO `sp_place` VALUES ('3508', '279', ',1,7,279,3508,', '4', '屯门区', 'NaN', 'tunmenqu', 'NTM');
INSERT INTO `sp_place` VALUES ('3509', '279', ',1,7,279,3509,', '4', '大埔区', 'NaN', 'dapuqu', 'NTP');
INSERT INTO `sp_place` VALUES ('3510', '279', ',1,7,279,3510,', '4', '荃湾区', 'NaN', 'wanqu', 'NTW');
INSERT INTO `sp_place` VALUES ('3511', '279', ',1,7,279,3511,', '4', '元朗区', 'NaN', 'yuanlangqu', 'NYL');
INSERT INTO `sp_place` VALUES ('3512', '280', ',1,7,280,3512,', '4', '花地玛堂区', 'NaN', 'huadimatangqu', 'OLF');
INSERT INTO `sp_place` VALUES ('3513', '280', ',1,7,280,3513,', '4', '圣安多尼堂区', 'NaN', 'shenganduonitangqu', 'ANT');
INSERT INTO `sp_place` VALUES ('3514', '280', ',1,7,280,3514,', '4', '大堂区', 'NaN', 'datangqu', 'CAT');
INSERT INTO `sp_place` VALUES ('3515', '280', ',1,7,280,3515,', '4', '望德堂区', 'NaN', 'wangdetangqu', 'LAW');
INSERT INTO `sp_place` VALUES ('3516', '280', ',1,7,280,3516,', '4', '风顺堂区', 'NaN', 'fengshuntangqu', 'LAZ');
INSERT INTO `sp_place` VALUES ('3517', '280', ',1,7,280,3517,', '4', '氹仔', 'NaN', '', 'TPA');
INSERT INTO `sp_place` VALUES ('3518', '280', ',1,7,280,3518,', '4', '路环', 'NaN', 'luhuan', 'CLN');
INSERT INTO `sp_place` VALUES ('3519', '281', ',6,25,281,3519,', '4', '北帕默斯顿', 'Palmerston', 'beipamosidun', 'PAL');
INSERT INTO `sp_place` VALUES ('3520', '281', ',6,25,281,3520,', '4', '达尔文', 'Darwin', 'daerwen', 'DRW');
INSERT INTO `sp_place` VALUES ('3521', '282', ',6,25,282,3521,', '4', '堪培拉', 'Canberra', 'kanpeila', 'CBR');
INSERT INTO `sp_place` VALUES ('3522', '283', ',6,25,283,3522,', '4', '布里斯班', 'Brisbane', 'bulisiban', 'BNE');
INSERT INTO `sp_place` VALUES ('3523', '283', ',6,25,283,3523,', '4', '黄金海岸', 'Gold Coast', 'huangjinhaian', 'OOL');
INSERT INTO `sp_place` VALUES ('3524', '283', ',6,25,283,3524,', '4', '凯恩斯', 'Cairns', 'kaiensi', 'CNS');
INSERT INTO `sp_place` VALUES ('3525', '283', ',6,25,283,3525,', '4', '日光海岸', 'Caloundra', 'riguanghaian', 'CUD');
INSERT INTO `sp_place` VALUES ('3526', '283', ',6,25,283,3526,', '4', '汤斯维尔', 'Townsville', 'tangsiweier', 'TSV');
INSERT INTO `sp_place` VALUES ('3527', '283', ',6,25,283,3527,', '4', '图文巴', 'Toowoomba', 'tuwenba', 'TWB');
INSERT INTO `sp_place` VALUES ('3528', '284', ',6,25,284,3528,', '4', '阿德莱德', 'Adelaide', 'adelaide', 'ADL');
INSERT INTO `sp_place` VALUES ('3529', '284', ',6,25,284,3529,', '4', '奥古斯塔港', 'Port Augusta', 'aogusitagang', 'PUG');
INSERT INTO `sp_place` VALUES ('3530', '284', ',6,25,284,3530,', '4', '甘比亚山', 'Mount Gambier', 'ganbiyashan', 'MGB');
INSERT INTO `sp_place` VALUES ('3531', '284', ',6,25,284,3531,', '4', '怀阿拉', 'Whyalla', 'huaiala', 'WAY');
INSERT INTO `sp_place` VALUES ('3532', '284', ',6,25,284,3532,', '4', '林肯港', 'Port Lincoln', 'linkengang', 'PLO');
INSERT INTO `sp_place` VALUES ('3533', '284', ',6,25,284,3533,', '4', '默里布里奇', 'Murray Bridge', 'molibuliqi', 'MYB');
INSERT INTO `sp_place` VALUES ('3534', '284', ',6,25,284,3534,', '4', '皮里港', 'Port Pirie', 'piligang', 'PPI');
INSERT INTO `sp_place` VALUES ('3535', '284', ',6,25,284,3535,', '4', '维克托港', 'Victor Harbor', 'weiketuogang', 'VHA');
INSERT INTO `sp_place` VALUES ('3536', '285', ',6,25,285,3536,', '4', '伯尼港', 'Burnie', 'bonigang', 'BWT');
INSERT INTO `sp_place` VALUES ('3537', '285', ',6,25,285,3537,', '4', '德文波特', 'Devonport', 'dewenbote', 'DPO');
INSERT INTO `sp_place` VALUES ('3538', '285', ',6,25,285,3538,', '4', '霍巴特', 'Hobart', 'huobate', 'HBA');
INSERT INTO `sp_place` VALUES ('3539', '285', ',6,25,285,3539,', '4', '朗塞斯顿', 'Launceston', 'langsaisidun', 'LST');
INSERT INTO `sp_place` VALUES ('3540', '286', ',6,25,286,3540,', '4', '吉朗', 'Geelong', 'jilang', 'GEX');
INSERT INTO `sp_place` VALUES ('3541', '286', ',6,25,286,3541,', '4', '墨尔本', 'Melbourne', 'moerben', 'MEL');
INSERT INTO `sp_place` VALUES ('3542', '287', ',6,25,287,3542,', '4', '奥尔巴尼', 'Albany', 'aoerbani', 'ALH');
INSERT INTO `sp_place` VALUES ('3543', '287', ',6,25,287,3543,', '4', '班伯里', 'Bunbury', 'banboli', 'BUY');
INSERT INTO `sp_place` VALUES ('3544', '287', ',6,25,287,3544,', '4', '弗里曼特尔港', 'Fremantle', 'fulimanteergang', 'FRE');
INSERT INTO `sp_place` VALUES ('3545', '287', ',6,25,287,3545,', '4', '杰拉尔顿', 'Geraldton', 'jielaerdun', 'GET');
INSERT INTO `sp_place` VALUES ('3546', '287', ',6,25,287,3546,', '4', '卡尔古利', 'Kalgoorlie', 'kaerguli', 'KGI');
INSERT INTO `sp_place` VALUES ('3547', '287', ',6,25,287,3547,', '4', '曼哲拉', 'Mandurah', 'manzhela', 'MDU');
INSERT INTO `sp_place` VALUES ('3548', '287', ',6,25,287,3548,', '4', '珀斯', 'Perth', 'si', 'PER');
INSERT INTO `sp_place` VALUES ('3549', '288', ',6,25,288,3549,', '4', '纽卡斯尔', 'Newcastle', 'niukasier', 'NTL');
INSERT INTO `sp_place` VALUES ('3550', '288', ',6,25,288,3550,', '4', '伍伦贡', 'Wollongong', 'wulungong', 'WOL');
INSERT INTO `sp_place` VALUES ('3551', '288', ',6,25,288,3551,', '4', '悉尼', 'Sydney', 'xini', 'HBS');
INSERT INTO `sp_place` VALUES ('3552', '289', ',1,89,289,3552,', '4', '达城郡', 'Dalseong-gun', 'dachengjun', 'DSG');
INSERT INTO `sp_place` VALUES ('3553', '289', ',1,89,289,3553,', '4', '大邱', 'Daegu', 'daqiu', 'TAE');
INSERT INTO `sp_place` VALUES ('3554', '289', ',1,89,289,3554,', '4', '寿城区', 'Suseong-gu', 'shouchengqu', 'SUS');
INSERT INTO `sp_place` VALUES ('3555', '294', ',1,89,294,3555,', '4', '春川市', 'Chuncheon', 'chunchuanshi', 'CHC');
INSERT INTO `sp_place` VALUES ('3556', '294', ',1,89,294,3556,', '4', '东海市', 'Donghae', 'donghaishi', 'TGH');
INSERT INTO `sp_place` VALUES ('3557', '294', ',1,89,294,3557,', '4', '高城郡', 'Goseong County', 'gaochengjun', 'GSG');
INSERT INTO `sp_place` VALUES ('3558', '294', ',1,89,294,3558,', '4', '横城郡', 'Hoengseong County', 'hengchengjun', 'HSG');
INSERT INTO `sp_place` VALUES ('3559', '294', ',1,89,294,3559,', '4', '洪川郡', 'Hongcheon County', 'hongchuanjun', 'HCN');
INSERT INTO `sp_place` VALUES ('3560', '294', ',1,89,294,3560,', '4', '华川郡', 'Hwacheon County', 'huachuanjun', 'HCH');
INSERT INTO `sp_place` VALUES ('3561', '294', ',1,89,294,3561,', '4', '江陵市', 'Gangneung', 'jianglingshi', 'KAG');
INSERT INTO `sp_place` VALUES ('3562', '294', ',1,89,294,3562,', '4', '旌善郡', 'Jeongseon County', 'shanjun', 'JSE');
INSERT INTO `sp_place` VALUES ('3563', '294', ',1,89,294,3563,', '4', '麟蹄郡', 'Inje County', 'tijun', 'IJE');
INSERT INTO `sp_place` VALUES ('3564', '294', ',1,89,294,3564,', '4', '宁越郡', 'Yeongwol County', 'ningyuejun', 'YWL');
INSERT INTO `sp_place` VALUES ('3565', '294', ',1,89,294,3565,', '4', '平昌郡', 'Pyeongchang County', 'pingchangjun', 'POG');
INSERT INTO `sp_place` VALUES ('3566', '294', ',1,89,294,3566,', '4', '三陟市', 'Samcheok', 'sanshi', 'SUK');
INSERT INTO `sp_place` VALUES ('3567', '294', ',1,89,294,3567,', '4', '束草市', 'Sokcho', 'shucaoshi', 'SHO');
INSERT INTO `sp_place` VALUES ('3568', '294', ',1,89,294,3568,', '4', '太白市', 'Taebaek', 'taibaishi', 'TBK');
INSERT INTO `sp_place` VALUES ('3569', '294', ',1,89,294,3569,', '4', '铁原郡', 'Cheorwon County', 'tieyuanjun', 'CWN');
INSERT INTO `sp_place` VALUES ('3570', '294', ',1,89,294,3570,', '4', '襄阳郡', 'Yangyang County', 'xiangyangjun', 'YNY');
INSERT INTO `sp_place` VALUES ('3571', '294', ',1,89,294,3571,', '4', '杨口郡', 'Yanggu County', 'yangkoujun', 'YGU');
INSERT INTO `sp_place` VALUES ('3572', '294', ',1,89,294,3572,', '4', '原州市', 'Wonju', 'yuanzhoushi', 'WJU');
INSERT INTO `sp_place` VALUES ('3573', '295', ',1,89,295,3573,', '4', '安城市', 'Anseong', 'anchengshi', 'ASG');
INSERT INTO `sp_place` VALUES ('3574', '295', ',1,89,295,3574,', '4', '安山市', 'Ansan', 'anshanshi', 'ASN');
INSERT INTO `sp_place` VALUES ('3575', '295', ',1,89,295,3575,', '4', '安养市', 'Anyang', 'anyangshi', 'ANY');
INSERT INTO `sp_place` VALUES ('3576', '295', ',1,89,295,3576,', '4', '抱川市', 'Pocheon', 'baochuanshi', 'POC');
INSERT INTO `sp_place` VALUES ('3577', '295', ',1,89,295,3577,', '4', '城南市', 'Seongnam', 'chengnanshi', 'SEO');
INSERT INTO `sp_place` VALUES ('3578', '295', ',1,89,295,3578,', '4', '东豆川市', 'Dongducheon', 'dongdouchuanshi', 'DDC');
INSERT INTO `sp_place` VALUES ('3579', '295', ',1,89,295,3579,', '4', '富川市', 'Bucheon', 'fuchuanshi', 'BCN');
INSERT INTO `sp_place` VALUES ('3580', '295', ',1,89,295,3580,', '4', '高阳市', 'Goyang', 'gaoyangshi', 'GYG');
INSERT INTO `sp_place` VALUES ('3581', '295', ',1,89,295,3581,', '4', '光明市', 'Gwangmyeong', 'guangmingshi', 'GMG');
INSERT INTO `sp_place` VALUES ('3582', '295', ',1,89,295,3582,', '4', '广州市', 'Gwangju', 'guangzhoushi', 'KWU');
INSERT INTO `sp_place` VALUES ('3583', '295', ',1,89,295,3583,', '4', '果川市', 'Gwacheon', 'guochuanshi', 'GCN');
INSERT INTO `sp_place` VALUES ('3584', '295', ',1,89,295,3584,', '4', '河南市', 'Hanam', 'henanshi', 'HNM');
INSERT INTO `sp_place` VALUES ('3585', '295', ',1,89,295,3585,', '4', '华城市', 'Hwaseong', 'huachengshi', 'HCH');
INSERT INTO `sp_place` VALUES ('3586', '295', ',1,89,295,3586,', '4', '加平郡', 'Gapyeong County', 'jiapingjun', 'GPG');
INSERT INTO `sp_place` VALUES ('3587', '295', ',1,89,295,3587,', '4', '金浦市', 'Gimpo', 'jinpushi', 'GMP');
INSERT INTO `sp_place` VALUES ('3588', '295', ',1,89,295,3588,', '4', '九里市', 'Guri', 'jiulishi', 'GRI');
INSERT INTO `sp_place` VALUES ('3589', '295', ',1,89,295,3589,', '4', '军浦市', 'Gunpo', 'junpushi', 'GUN');
INSERT INTO `sp_place` VALUES ('3590', '295', ',1,89,295,3590,', '4', '骊州郡', 'Yeoju County', 'zhoujun', 'YJU');
INSERT INTO `sp_place` VALUES ('3591', '295', ',1,89,295,3591,', '4', '利川市', 'Icheon', 'lichuanshi', 'ICE');
INSERT INTO `sp_place` VALUES ('3592', '295', ',1,89,295,3592,', '4', '涟川郡', 'Yeoncheon County', 'lianchuanjun', 'YCN');
INSERT INTO `sp_place` VALUES ('3593', '295', ',1,89,295,3593,', '4', '龙仁市', 'Yongin', 'longrenshi', 'YNG');
INSERT INTO `sp_place` VALUES ('3594', '295', ',1,89,295,3594,', '4', '南杨州市', 'Namyangju', 'nanyangzhoushi', 'NYU');
INSERT INTO `sp_place` VALUES ('3595', '295', ',1,89,295,3595,', '4', '平泽市', 'Pyeongtaek', 'pingzeshi', 'PTK');
INSERT INTO `sp_place` VALUES ('3596', '295', ',1,89,295,3596,', '4', '坡州市', 'Paju', 'pozhoushi', 'PJU');
INSERT INTO `sp_place` VALUES ('3597', '295', ',1,89,295,3597,', '4', '始兴市', 'Siheung', 'shixingshi', 'SHE');
INSERT INTO `sp_place` VALUES ('3598', '295', ',1,89,295,3598,', '4', '水原市', 'Suwon', 'shuiyuanshi', 'SUO');
INSERT INTO `sp_place` VALUES ('3599', '295', ',1,89,295,3599,', '4', '乌山市', 'Osan', 'wushanshi', 'OSN');
INSERT INTO `sp_place` VALUES ('3600', '295', ',1,89,295,3600,', '4', '扬平郡', 'Yangpyeong County', 'yangpingjun', 'YPG');
INSERT INTO `sp_place` VALUES ('3601', '295', ',1,89,295,3601,', '4', '杨州市', 'Yangju', 'yangzhoushi', 'YYU');
INSERT INTO `sp_place` VALUES ('3602', '295', ',1,89,295,3602,', '4', '仪旺市', 'Uiwang', 'yiwangshi', 'UWN');
INSERT INTO `sp_place` VALUES ('3603', '295', ',1,89,295,3603,', '4', '议政府市', 'Uijeongbu', 'yizhengfushi', 'UIJ');
INSERT INTO `sp_place` VALUES ('3604', '296', ',1,89,296,3604,', '4', '安东市', 'Andong', 'andongshi', 'ADG');
INSERT INTO `sp_place` VALUES ('3605', '296', ',1,89,296,3605,', '4', '奉化郡', 'Bonghwa County', 'fenghuajun', 'BHA');
INSERT INTO `sp_place` VALUES ('3606', '296', ',1,89,296,3606,', '4', '高灵郡', 'Goryeong County', 'gaolingjun', 'GRG');
INSERT INTO `sp_place` VALUES ('3607', '296', ',1,89,296,3607,', '4', '龟尾市', 'Gumi', 'guiweishi', 'KUM');
INSERT INTO `sp_place` VALUES ('3608', '296', ',1,89,296,3608,', '4', '金泉市', 'Gimcheon', 'jinquanshi', 'KMC');
INSERT INTO `sp_place` VALUES ('3609', '296', ',1,89,296,3609,', '4', '军威郡', 'Gunwi County', 'junweijun', 'GWI');
INSERT INTO `sp_place` VALUES ('3610', '296', ',1,89,296,3610,', '4', '醴泉郡', 'Yecheon County', 'quanjun', 'YEC');
INSERT INTO `sp_place` VALUES ('3611', '296', ',1,89,296,3611,', '4', '浦项市', 'Pohang', 'puxiangshi', 'KPO');
INSERT INTO `sp_place` VALUES ('3612', '296', ',1,89,296,3612,', '4', '漆谷郡', 'Chilgok County', 'qigujun', 'CGK');
INSERT INTO `sp_place` VALUES ('3613', '296', ',1,89,296,3613,', '4', '淸道郡', 'Cheongdo County', '', 'CDO');
INSERT INTO `sp_place` VALUES ('3614', '296', ',1,89,296,3614,', '4', '靑松郡', 'Cheongsong County', '', 'CSG');
INSERT INTO `sp_place` VALUES ('3615', '296', ',1,89,296,3615,', '4', '庆山市', 'Gyeongsan', 'qingshanshi', 'GYS');
INSERT INTO `sp_place` VALUES ('3616', '296', ',1,89,296,3616,', '4', '庆州市', 'Gyeongju', 'qingzhoushi', 'GJU');
INSERT INTO `sp_place` VALUES ('3617', '296', ',1,89,296,3617,', '4', '荣州市', 'Yeongju', 'rongzhoushi', 'YEJ');
INSERT INTO `sp_place` VALUES ('3618', '296', ',1,89,296,3618,', '4', '尙州市', 'Sangju', '', 'SJU');
INSERT INTO `sp_place` VALUES ('3619', '296', ',1,89,296,3619,', '4', '蔚珍郡', 'Uljin County', 'weizhenjun', 'UJN');
INSERT INTO `sp_place` VALUES ('3620', '296', ',1,89,296,3620,', '4', '闻庆市', 'Mungyeong', 'wenqingshi', 'MGG');
INSERT INTO `sp_place` VALUES ('3621', '296', ',1,89,296,3621,', '4', '星州郡', 'Seongju County', 'xingzhoujun', 'SEJ');
INSERT INTO `sp_place` VALUES ('3622', '296', ',1,89,296,3622,', '4', '义城郡', 'Uiseong County', 'yichengjun', 'USG');
INSERT INTO `sp_place` VALUES ('3623', '296', ',1,89,296,3623,', '4', '英阳郡', 'Yeongyang County', 'yingyangjun', 'YYG');
INSERT INTO `sp_place` VALUES ('3624', '296', ',1,89,296,3624,', '4', '盈德郡', 'Yeongdeok County', 'yingdejun', 'YDK');
INSERT INTO `sp_place` VALUES ('3625', '296', ',1,89,296,3625,', '4', '永川市', 'Yeongcheon', 'yongchuanshi', 'YCH');
INSERT INTO `sp_place` VALUES ('3626', '296', ',1,89,296,3626,', '4', '郁陵郡', 'Ulleung County', 'yulingjun', 'ULG');
INSERT INTO `sp_place` VALUES ('3627', '297', ',1,89,297,3627,', '4', '昌宁郡', 'Changnyeong County', 'changningjun', 'CNG');
INSERT INTO `sp_place` VALUES ('3628', '297', ',1,89,297,3628,', '4', '昌原市', 'Changwon', 'changyuanshi', 'CHW');
INSERT INTO `sp_place` VALUES ('3629', '297', ',1,89,297,3629,', '4', '固城郡', 'Goseong County', 'guchengjun', 'GSO');
INSERT INTO `sp_place` VALUES ('3630', '297', ',1,89,297,3630,', '4', '河东郡', 'Hadong County', 'hedongjun', 'HDG');
INSERT INTO `sp_place` VALUES ('3631', '297', ',1,89,297,3631,', '4', '金海市', 'Gimhae', 'jinhaishi', 'KMH');
INSERT INTO `sp_place` VALUES ('3632', '297', ',1,89,297,3632,', '4', '晋州市', 'Jinju', 'jinzhoushi', 'HIN');
INSERT INTO `sp_place` VALUES ('3633', '297', ',1,89,297,3633,', '4', '居昌郡', 'Geochang County', 'juchangjun', 'GCH');
INSERT INTO `sp_place` VALUES ('3634', '297', ',1,89,297,3634,', '4', '巨济市', 'Geoje', 'jujishi', 'KJE');
INSERT INTO `sp_place` VALUES ('3635', '297', ',1,89,297,3635,', '4', '梁山市', 'Yangsan', 'liangshanshi', 'YSN');
INSERT INTO `sp_place` VALUES ('3636', '297', ',1,89,297,3636,', '4', '马山市', 'Masan', 'mashanshi', 'MAS');
INSERT INTO `sp_place` VALUES ('3637', '297', ',1,89,297,3637,', '4', '密阳市', 'Miryang', 'miyangshi', 'MIR');
INSERT INTO `sp_place` VALUES ('3638', '297', ',1,89,297,3638,', '4', '南海郡', 'Namhae County', 'nanhaijun', 'NHE');
INSERT INTO `sp_place` VALUES ('3639', '297', ',1,89,297,3639,', '4', '山淸郡', 'Sancheong County', 'shan', 'SCH');
INSERT INTO `sp_place` VALUES ('3640', '297', ',1,89,297,3640,', '4', '泗川市', 'Sacheon', 'chuanshi', 'SAH');
INSERT INTO `sp_place` VALUES ('3641', '297', ',1,89,297,3641,', '4', '统营市', 'Tongyeong', 'tongyingshi', 'TYG');
INSERT INTO `sp_place` VALUES ('3642', '297', ',1,89,297,3642,', '4', '陜川郡', 'Hapcheon County', '', 'HCE');
INSERT INTO `sp_place` VALUES ('3643', '297', ',1,89,297,3643,', '4', '咸安郡', 'Haman County', 'xiananjun', 'HAN');
INSERT INTO `sp_place` VALUES ('3644', '297', ',1,89,297,3644,', '4', '咸阳郡', 'Hamyang County', 'xianyangjun', 'HYG');
INSERT INTO `sp_place` VALUES ('3645', '297', ',1,89,297,3645,', '4', '宜宁郡', 'Uiryeong County', 'yiningjun', 'URG');
INSERT INTO `sp_place` VALUES ('3646', '297', ',1,89,297,3646,', '4', '鎭海市', 'Jinhae', '', 'CHF');
INSERT INTO `sp_place` VALUES ('3647', '298', ',1,89,298,3647,', '4', '淳昌郡', 'Sunchang County', 'chunchangjun', 'SCG');
INSERT INTO `sp_place` VALUES ('3648', '298', ',1,89,298,3648,', '4', '扶安郡', 'Buan County', 'fuanjun', 'PUS');
INSERT INTO `sp_place` VALUES ('3649', '298', ',1,89,298,3649,', '4', '高敞郡', 'Gochang County', 'gaochangjun', 'GCG');
INSERT INTO `sp_place` VALUES ('3650', '298', ',1,89,298,3650,', '4', '金堤市', 'Gimje', 'jindishi', 'GJE');
INSERT INTO `sp_place` VALUES ('3651', '298', ',1,89,298,3651,', '4', '井邑市', 'Jeongeup', 'jingyishi', 'JEO');
INSERT INTO `sp_place` VALUES ('3652', '298', ',1,89,298,3652,', '4', '茂朱郡', 'Muju County', 'maozhujun', 'MJU');
INSERT INTO `sp_place` VALUES ('3653', '298', ',1,89,298,3653,', '4', '南原市', 'Namwon', 'nanyuanshi', 'NWN');
INSERT INTO `sp_place` VALUES ('3654', '298', ',1,89,298,3654,', '4', '全州市', 'Jeonju', 'quanzhoushi', 'JNJ');
INSERT INTO `sp_place` VALUES ('3655', '298', ',1,89,298,3655,', '4', '群山市', 'Gunsan', 'qunshanshi', 'KUV');
INSERT INTO `sp_place` VALUES ('3656', '298', ',1,89,298,3656,', '4', '任实郡', 'Imsil County', 'renshijun', 'ISL');
INSERT INTO `sp_place` VALUES ('3657', '298', ',1,89,298,3657,', '4', '完州郡', 'Wanju County', 'wanzhoujun', 'WAJ');
INSERT INTO `sp_place` VALUES ('3658', '298', ',1,89,298,3658,', '4', '益山市', 'Iksan', 'yishanshi', 'IKS');
INSERT INTO `sp_place` VALUES ('3659', '298', ',1,89,298,3659,', '4', '长水郡', 'Jangsu County', 'changshuijun', 'JSU');
INSERT INTO `sp_place` VALUES ('3660', '298', ',1,89,298,3660,', '4', '鎭安郡', 'Jinan County', '', 'JAN');
INSERT INTO `sp_place` VALUES ('3661', '299', ',1,89,299,3661,', '4', '宝城郡', 'Boseong County', 'baochengjun', 'BSG');
INSERT INTO `sp_place` VALUES ('3662', '299', ',1,89,299,3662,', '4', '高兴郡', 'Goheung County', 'gaoxingjun', 'GHG');
INSERT INTO `sp_place` VALUES ('3663', '299', ',1,89,299,3663,', '4', '谷城郡', 'Gokseong County', 'guchengjun', 'GSE');
INSERT INTO `sp_place` VALUES ('3664', '299', ',1,89,299,3664,', '4', '莞岛郡', 'Wando County', 'daojun', 'WND');
INSERT INTO `sp_place` VALUES ('3665', '299', ',1,89,299,3665,', '4', '光阳市', 'Gwangyang', 'guangyangshi', 'KAN');
INSERT INTO `sp_place` VALUES ('3666', '299', ',1,89,299,3666,', '4', '海南郡', 'Haenam County', 'hainanjun', 'HAE');
INSERT INTO `sp_place` VALUES ('3667', '299', ',1,89,299,3667,', '4', '和顺郡', 'Hwasun County', 'heshunjun', 'HSN');
INSERT INTO `sp_place` VALUES ('3668', '299', ',1,89,299,3668,', '4', '康津郡', 'Gangjin County', 'kangjinjun', 'GJN');
INSERT INTO `sp_place` VALUES ('3669', '299', ',1,89,299,3669,', '4', '丽水市', 'Yeosu', 'lishuishi', 'YOS');
INSERT INTO `sp_place` VALUES ('3670', '299', ',1,89,299,3670,', '4', '灵光郡', 'Yeonggwang County', 'lingguangjun', 'YGG');
INSERT INTO `sp_place` VALUES ('3671', '299', ',1,89,299,3671,', '4', '灵岩郡', 'Yeongam County', 'lingyanjun', 'YAM');
INSERT INTO `sp_place` VALUES ('3672', '299', ',1,89,299,3672,', '4', '罗州市', 'Naju', 'luozhoushi', 'NJU');
INSERT INTO `sp_place` VALUES ('3673', '299', ',1,89,299,3673,', '4', '木浦市', 'Mokpo', 'mupushi', 'MOK');
INSERT INTO `sp_place` VALUES ('3674', '299', ',1,89,299,3674,', '4', '求礼郡', 'Gurye County', 'qiulijun', 'GRE');
INSERT INTO `sp_place` VALUES ('3675', '299', ',1,89,299,3675,', '4', '顺天市', 'Suncheon', 'shuntianshi', 'SYS');
INSERT INTO `sp_place` VALUES ('3676', '299', ',1,89,299,3676,', '4', '潭阳郡', 'Damyang County', 'tanyangjun', 'DYA');
INSERT INTO `sp_place` VALUES ('3677', '299', ',1,89,299,3677,', '4', '务安郡', 'Muan County', 'wuanjun', 'MAN');
INSERT INTO `sp_place` VALUES ('3678', '299', ',1,89,299,3678,', '4', '咸平郡', 'Hampyeong County', 'xianpingjun', 'HPG');
INSERT INTO `sp_place` VALUES ('3679', '299', ',1,89,299,3679,', '4', '新安郡', 'Sinan County', 'xinanjun', 'SAN');
INSERT INTO `sp_place` VALUES ('3680', '299', ',1,89,299,3680,', '4', '长城郡', 'Jangseong County', 'changchengjun', 'JSN');
INSERT INTO `sp_place` VALUES ('3681', '299', ',1,89,299,3681,', '4', '长兴郡', 'Jangheung County', 'changxingjun', 'JHG');
INSERT INTO `sp_place` VALUES ('3682', '299', ',1,89,299,3682,', '4', '珍岛郡', 'Jindo County', 'zhendaojun', 'JDO');
INSERT INTO `sp_place` VALUES ('3683', '303', ',1,89,303,3683,', '4', '报恩郡', 'Boeun County', 'baoenjun', 'BEN');
INSERT INTO `sp_place` VALUES ('3684', '303', ',1,89,303,3684,', '4', '曾坪郡', 'Jeungpyeong County', 'zengpingjun', 'JYG');
INSERT INTO `sp_place` VALUES ('3685', '303', ',1,89,303,3685,', '4', '丹阳郡', 'Danyang County', 'danyangjun', 'DYG');
INSERT INTO `sp_place` VALUES ('3686', '303', ',1,89,303,3686,', '4', '堤川市', 'Jecheon', 'dichuanshi', 'JCH');
INSERT INTO `sp_place` VALUES ('3687', '303', ',1,89,303,3687,', '4', '槐山郡', 'Goesan County', 'huaishanjun', 'GSN');
INSERT INTO `sp_place` VALUES ('3688', '303', ',1,89,303,3688,', '4', '淸原郡', 'Cheongwon County', '', 'CWO');
INSERT INTO `sp_place` VALUES ('3689', '303', ',1,89,303,3689,', '4', '淸州市', 'Cheongju', '', 'CJJ');
INSERT INTO `sp_place` VALUES ('3690', '303', ',1,89,303,3690,', '4', '沃川郡', 'Okcheon County', 'wochuanjun', 'OCN');
INSERT INTO `sp_place` VALUES ('3691', '303', ',1,89,303,3691,', '4', '阴城郡', 'Eumseong County', 'yinchengjun', 'ESG');
INSERT INTO `sp_place` VALUES ('3692', '303', ',1,89,303,3692,', '4', '永同郡', 'Yeongdong County', 'yongtongjun', 'YDG');
INSERT INTO `sp_place` VALUES ('3693', '303', ',1,89,303,3693,', '4', '鎭川郡', 'Jincheon County', '', 'JCN');
INSERT INTO `sp_place` VALUES ('3694', '303', ',1,89,303,3694,', '4', '忠州市', 'Chungju', 'zhongzhoushi', 'CHU');
INSERT INTO `sp_place` VALUES ('3695', '304', ',1,89,304,3695,', '4', '保宁市', 'Boryeong', 'baoningshi', 'BOR');
INSERT INTO `sp_place` VALUES ('3696', '304', ',1,89,304,3696,', '4', '扶余郡', 'Buyeo County', 'fuyujun', 'BYO');
INSERT INTO `sp_place` VALUES ('3697', '304', ',1,89,304,3697,', '4', '公州市', 'Gongju', 'gongzhoushi', 'GOJ');
INSERT INTO `sp_place` VALUES ('3698', '304', ',1,89,304,3698,', '4', '洪城郡', 'Hongseong County', 'hongchengjun', 'HSE');
INSERT INTO `sp_place` VALUES ('3699', '304', ',1,89,304,3699,', '4', '鸡龙市', 'Gyeryong', 'jilongshi', 'GYE');
INSERT INTO `sp_place` VALUES ('3700', '304', ',1,89,304,3700,', '4', '锦山郡', 'Geumsan County', 'jinshanjun', 'GSA');
INSERT INTO `sp_place` VALUES ('3701', '304', ',1,89,304,3701,', '4', '礼山郡', 'Yesan County', 'lishanjun', 'YOS');
INSERT INTO `sp_place` VALUES ('3702', '304', ',1,89,304,3702,', '4', '论山市', 'Nonsan', 'lunshanshi', 'NSN');
INSERT INTO `sp_place` VALUES ('3703', '304', ',1,89,304,3703,', '4', '青阳郡', 'Cheongyang County', 'qingyangjun', 'CYG');
INSERT INTO `sp_place` VALUES ('3704', '304', ',1,89,304,3704,', '4', '瑞山市', 'Seosan', 'ruishanshi', 'SSA');
INSERT INTO `sp_place` VALUES ('3705', '304', ',1,89,304,3705,', '4', '舒川郡', 'Seocheon County', 'shuchuanjun', 'SCE');
INSERT INTO `sp_place` VALUES ('3706', '304', ',1,89,304,3706,', '4', '泰安郡', 'Taean County', 'taianjun', 'TAN');
INSERT INTO `sp_place` VALUES ('3707', '304', ',1,89,304,3707,', '4', '唐津郡', 'Dangjin County', 'tangjinjun', 'TJI');
INSERT INTO `sp_place` VALUES ('3708', '304', ',1,89,304,3708,', '4', '天安市', 'Cheonan', 'tiananshi', 'CHO');
INSERT INTO `sp_place` VALUES ('3709', '304', ',1,89,304,3709,', '4', '牙山市', 'Asan', 'yashanshi', 'ASA');
INSERT INTO `sp_place` VALUES ('3710', '304', ',1,89,304,3710,', '4', '燕岐郡', 'Yeongi County', 'yanjun', 'YGI');
INSERT INTO `sp_place` VALUES ('3711', '305', ',1,131,305,3711,', '4', '北海', 'Butterworth', 'beihai', 'BWH');
INSERT INTO `sp_place` VALUES ('3712', '305', ',1,131,305,3712,', '4', '槟城', 'George Town', 'cheng', 'PEN');
INSERT INTO `sp_place` VALUES ('3713', '305', ',1,131,305,3713,', '4', '大山脚', 'Bukit Mertajam', 'dashanjiao', 'BMJ');
INSERT INTO `sp_place` VALUES ('3714', '305', ',1,131,305,3714,', '4', '高渊', 'Nibong Tebal', 'gaoyuan', 'NTE');
INSERT INTO `sp_place` VALUES ('3715', '306', ',1,131,306,3715,', '4', '加央', 'Kangar', 'jiayang', 'KGR');
INSERT INTO `sp_place` VALUES ('3716', '307', ',1,131,307,3716,', '4', '甘马挽', 'Kemaman', 'ganmawan', 'KEM');
INSERT INTO `sp_place` VALUES ('3717', '307', ',1,131,307,3717,', '4', '瓜拉丁加奴', 'Kuala Terengganu', 'gualadingjianu', 'TGG');
INSERT INTO `sp_place` VALUES ('3718', '307', ',1,131,307,3718,', '4', '龙运', 'Dungun', 'longyun', 'DGN');
INSERT INTO `sp_place` VALUES ('3719', '307', ',1,131,307,3719,', '4', '马江', 'Marang', 'majiang', 'MAR');
INSERT INTO `sp_place` VALUES ('3720', '307', ',1,131,307,3720,', '4', '实兆', 'Setiu', 'shizhao', 'SET');
INSERT INTO `sp_place` VALUES ('3721', '307', ',1,131,307,3721,', '4', '乌鲁', 'Hulu', 'wulu', 'HUL');
INSERT INTO `sp_place` VALUES ('3722', '307', ',1,131,307,3722,', '4', '勿述', 'Besut', 'wushu', 'BES');
INSERT INTO `sp_place` VALUES ('3723', '308', ',1,131,308,3723,', '4', '巴东得腊', 'Padang Terap', 'badongdela', 'PGT');
INSERT INTO `sp_place` VALUES ('3724', '308', ',1,131,308,3724,', '4', '笨筒', 'Pendang', 'bentong', 'PEN');
INSERT INTO `sp_place` VALUES ('3725', '308', ',1,131,308,3725,', '4', '浮罗交怡', 'Langkawi', 'fuluojiao', 'LGK');
INSERT INTO `sp_place` VALUES ('3726', '308', ',1,131,308,3726,', '4', '哥打士打', 'Kota Setar', 'gedashida', 'KOR');
INSERT INTO `sp_place` VALUES ('3727', '308', ',1,131,308,3727,', '4', '古邦巴素', 'Kubang Pasu', 'gubangbasu', 'KPA');
INSERT INTO `sp_place` VALUES ('3728', '308', ',1,131,308,3728,', '4', '瓜拉姆达', 'Kuala Muda', 'gualamuda', 'KMU');
INSERT INTO `sp_place` VALUES ('3729', '308', ',1,131,308,3729,', '4', '华玲', 'Baling', 'hualing', 'BLZ');
INSERT INTO `sp_place` VALUES ('3730', '308', ',1,131,308,3730,', '4', '居林', 'Kulim', 'julin', 'KLM');
INSERT INTO `sp_place` VALUES ('3731', '308', ',1,131,308,3731,', '4', '万拉峇鲁', 'Bandar Baharu', 'wanla', 'BMA');
INSERT INTO `sp_place` VALUES ('3732', '309', ',1,131,309,3732,', '4', '巴西富地', 'Pasir Putih', 'baxifudi', 'PPU');
INSERT INTO `sp_place` VALUES ('3733', '309', ',1,131,309,3733,', '4', '巴西马', 'Pasir Mas', 'baxima', 'PMA');
INSERT INTO `sp_place` VALUES ('3734', '309', ',1,131,309,3734,', '4', '丹那美拉', 'Tanah Merah', 'dannameila', 'TMR');
INSERT INTO `sp_place` VALUES ('3735', '309', ',1,131,309,3735,', '4', '道北', 'Tumpat', 'daobei', 'TUM');
INSERT INTO `sp_place` VALUES ('3736', '309', ',1,131,309,3736,', '4', '登卓', 'Bachok', 'dengzhuo', 'BAC');
INSERT INTO `sp_place` VALUES ('3737', '309', ',1,131,309,3737,', '4', '哥打巴鲁', 'Kota Bharu', 'gedabalu', 'KBR');
INSERT INTO `sp_place` VALUES ('3738', '309', ',1,131,309,3738,', '4', '瓜拉吉赖', 'Kuala Krai', 'gualajilai', 'KUG');
INSERT INTO `sp_place` VALUES ('3739', '309', ',1,131,309,3739,', '4', '话望生', 'Gua Musang', 'huawangsheng', 'GMU');
INSERT INTO `sp_place` VALUES ('3740', '309', ',1,131,309,3740,', '4', '马樟', 'Machang', 'mazhang', 'MAC');
INSERT INTO `sp_place` VALUES ('3741', '309', ',1,131,309,3741,', '4', '日里', 'Jeli', 'rili', 'JEL');
INSERT INTO `sp_place` VALUES ('3742', '310', ',1,131,310,3742,', '4', '吉隆坡', 'Kuala Lumpur', 'jilongpo', 'KUL');
INSERT INTO `sp_place` VALUES ('3743', '311', ',1,131,311,3743,', '4', '马六甲市', 'Melaka', 'maliujiashi', 'MEL');
INSERT INTO `sp_place` VALUES ('3744', '311', ',1,131,311,3744,', '4', '亚罗牙也', 'Alor Gajah', 'yaluoyaye', 'AOG');
INSERT INTO `sp_place` VALUES ('3745', '311', ',1,131,311,3745,', '4', '野新', 'Jasin', 'yexin', 'JAS');
INSERT INTO `sp_place` VALUES ('3746', '312', ',1,131,312,3746,', '4', '纳闽', 'Labuan', 'namin', 'LBU');
INSERT INTO `sp_place` VALUES ('3747', '312', ',1,131,312,3747,', '4', '维多利亚', 'Victoria', 'weiduoliya', 'VIC');
INSERT INTO `sp_place` VALUES ('3748', '313', ',1,131,313,3748,', '4', '百乐', 'Bera', 'baile', 'BER');
INSERT INTO `sp_place` VALUES ('3749', '313', ',1,131,313,3749,', '4', '北根', 'Pekan', 'beigen', 'PEK');
INSERT INTO `sp_place` VALUES ('3750', '313', ',1,131,313,3750,', '4', '淡马鲁', 'Temerloh', 'danmalu', 'TEM');
INSERT INTO `sp_place` VALUES ('3751', '313', ',1,131,313,3751,', '4', '而连突', 'Jerantut', 'erliantu', 'JER');
INSERT INTO `sp_place` VALUES ('3752', '313', ',1,131,313,3752,', '4', '关丹', 'Kuantan', 'guandan', 'KUA');
INSERT INTO `sp_place` VALUES ('3753', '313', ',1,131,313,3753,', '4', '金马仑高原', 'Cameron Highlands', 'jinmalungaoyuan', 'CAH');
INSERT INTO `sp_place` VALUES ('3754', '313', ',1,131,313,3754,', '4', '劳勿', 'Raub', 'laowu', 'RAU');
INSERT INTO `sp_place` VALUES ('3755', '313', ',1,131,313,3755,', '4', '立卑', 'Kuala Lipis', 'libei', 'KUL');
INSERT INTO `sp_place` VALUES ('3756', '313', ',1,131,313,3756,', '4', '马兰', 'Maran', 'malan', 'MAR');
INSERT INTO `sp_place` VALUES ('3757', '313', ',1,131,313,3757,', '4', '文冬', 'Bentong', 'wendong', 'BEN');
INSERT INTO `sp_place` VALUES ('3758', '313', ',1,131,313,3758,', '4', '云冰', 'Rompin', 'yunbing', 'TOM');
INSERT INTO `sp_place` VALUES ('3759', '314', ',1,131,314,3759,', '4', '安顺', 'Teluk Intan', 'anshun', 'TAS');
INSERT INTO `sp_place` VALUES ('3760', '314', ',1,131,314,3760,', '4', '丹绒马', 'Tanjung Malim', 'danrongma', 'TAM');
INSERT INTO `sp_place` VALUES ('3761', '314', ',1,131,314,3761,', '4', '和丰', 'Sungai Siput', 'hefeng', 'SSP');
INSERT INTO `sp_place` VALUES ('3762', '314', ',1,131,314,3762,', '4', '紅土坎', 'Lumut', '', 'LUM');
INSERT INTO `sp_place` VALUES ('3763', '314', ',1,131,314,3763,', '4', '华都牙也', 'Batu Gajah', 'huaduyaye', 'BGA');
INSERT INTO `sp_place` VALUES ('3764', '314', ',1,131,314,3764,', '4', '江沙', 'Kuala Kangsar', 'jiangsha', 'KAR');
INSERT INTO `sp_place` VALUES ('3765', '314', ',1,131,314,3765,', '4', '太平', 'Taiping', 'taiping', 'TPG');
INSERT INTO `sp_place` VALUES ('3766', '314', ',1,131,314,3766,', '4', '怡保', 'Ipoh', 'bao', 'IPH');
INSERT INTO `sp_place` VALUES ('3767', '315', ',1,131,315,3767,', '4', '笨珍', 'Pontian', 'benzhen', 'POW');
INSERT INTO `sp_place` VALUES ('3768', '315', ',1,131,315,3768,', '4', '丰盛港', 'Mersing', 'fengshenggang', 'MEP');
INSERT INTO `sp_place` VALUES ('3769', '315', ',1,131,315,3769,', '4', '哥打丁宜', 'Kota Tinggi', 'gedadingyi', 'KTI');
INSERT INTO `sp_place` VALUES ('3770', '315', ',1,131,315,3770,', '4', '居銮', 'Kluang', 'ju', 'KLA');
INSERT INTO `sp_place` VALUES ('3771', '315', ',1,131,315,3771,', '4', '峇株巴辖', 'Batu Pahat', '', 'BAT');
INSERT INTO `sp_place` VALUES ('3772', '315', ',1,131,315,3772,', '4', '麻坡', 'Muar', 'mapo', 'MUA');
INSERT INTO `sp_place` VALUES ('3773', '315', ',1,131,315,3773,', '4', '昔加末', 'Segamat', 'xijiamo', 'SGM');
INSERT INTO `sp_place` VALUES ('3774', '315', ',1,131,315,3774,', '4', '新山', 'Johor Bahru', 'xinshan', 'JHB');
INSERT INTO `sp_place` VALUES ('3775', '316', ',1,131,316,3775,', '4', '波德申', 'Port Dickson', 'bodeshen', 'PDI');
INSERT INTO `sp_place` VALUES ('3776', '316', ',1,131,316,3776,', '4', '淡边', 'Tampin', 'danbian', 'TAI');
INSERT INTO `sp_place` VALUES ('3777', '316', ',1,131,316,3777,', '4', '芙蓉', 'Seremban', 'rong', 'SRB');
INSERT INTO `sp_place` VALUES ('3778', '316', ',1,131,316,3778,', '4', '瓜拉庇劳', 'Kuala Pilah', 'gualabilao', 'KPI');
INSERT INTO `sp_place` VALUES ('3779', '316', ',1,131,316,3779,', '4', '林茂', 'Rembau', 'linmao', 'REM');
INSERT INTO `sp_place` VALUES ('3780', '316', ',1,131,316,3780,', '4', '仁保', 'Jempol', 'renbao', 'JEP');
INSERT INTO `sp_place` VALUES ('3781', '316', ',1,131,316,3781,', '4', '日叻务', 'Jelebu', 'riwu', 'JEL');
INSERT INTO `sp_place` VALUES ('3782', '317', ',1,131,317,3782,', '4', '吧巴', 'Papar', 'baba', 'PAP');
INSERT INTO `sp_place` VALUES ('3783', '317', ',1,131,317,3783,', '4', '保佛', 'Beaufort', 'baofo', 'BEF');
INSERT INTO `sp_place` VALUES ('3784', '317', ',1,131,317,3784,', '4', '比鲁兰', 'Beluran', 'bilulan', 'BEL');
INSERT INTO `sp_place` VALUES ('3785', '317', ',1,131,317,3785,', '4', '必达士', 'Pitas', 'bidashi', 'PIT');
INSERT INTO `sp_place` VALUES ('3786', '317', ',1,131,317,3786,', '4', '兵南邦', 'Penampang', 'bingnanbang', 'PMP');
INSERT INTO `sp_place` VALUES ('3787', '317', ',1,131,317,3787,', '4', '担布南', 'Tambunan', 'danbunan', 'TAB');
INSERT INTO `sp_place` VALUES ('3788', '317', ',1,131,317,3788,', '4', '丹南', 'Tenom', 'dannan', 'TEN');
INSERT INTO `sp_place` VALUES ('3789', '317', ',1,131,317,3789,', '4', '斗湖', 'Tawau', 'douhu', 'TAW');
INSERT INTO `sp_place` VALUES ('3790', '317', ',1,131,317,3790,', '4', '斗亚兰', 'Tuaran', 'douyalan', 'TUR');
INSERT INTO `sp_place` VALUES ('3791', '317', ',1,131,317,3791,', '4', '哥打基纳巴鲁', 'Kota Kinabalu', 'gedajinabalu', 'BKI');
INSERT INTO `sp_place` VALUES ('3792', '317', ',1,131,317,3792,', '4', '哥打马鲁都', 'Kota Marudu', 'gedamaludu', 'KMU');
INSERT INTO `sp_place` VALUES ('3793', '317', ',1,131,317,3793,', '4', '根地咬', 'Keningau', 'gendiyao', 'KEG');
INSERT INTO `sp_place` VALUES ('3794', '317', ',1,131,317,3794,', '4', '古达', 'Kudat', 'guda', 'KUD');
INSERT INTO `sp_place` VALUES ('3795', '317', ',1,131,317,3795,', '4', '古打毛律', 'Kota Belud', 'gudamaolv', 'KBD');
INSERT INTO `sp_place` VALUES ('3796', '317', ',1,131,317,3796,', '4', '古纳', 'Kunak', 'guna', 'KUN');
INSERT INTO `sp_place` VALUES ('3797', '317', ',1,131,317,3797,', '4', '瓜拉班尤', 'Kuala Penyu', 'gualabanyou', 'KPU');
INSERT INTO `sp_place` VALUES ('3798', '317', ',1,131,317,3798,', '4', '京那巴登岸', 'Kinabatangan', 'jingnabadengan', 'KBT');
INSERT INTO `sp_place` VALUES ('3799', '317', ',1,131,317,3799,', '4', '兰脑', 'Ranau', 'lannao', 'RNU');
INSERT INTO `sp_place` VALUES ('3800', '317', ',1,131,317,3800,', '4', '拿笃', 'Lahad Datu', 'na', 'LDU');
INSERT INTO `sp_place` VALUES ('3801', '317', ',1,131,317,3801,', '4', '纳巴湾', 'Nabawan', 'nabawan', 'NAB');
INSERT INTO `sp_place` VALUES ('3802', '317', ',1,131,317,3802,', '4', '山打根', 'Sandakan', 'shandagen', 'SDK');
INSERT INTO `sp_place` VALUES ('3803', '317', ',1,131,317,3803,', '4', '西比陶', 'Sipitang', 'xibitao', 'SPT');
INSERT INTO `sp_place` VALUES ('3804', '317', ',1,131,317,3804,', '4', '仙本那', 'Semporna', 'xianbenna', 'SMM');
INSERT INTO `sp_place` VALUES ('3805', '318', ',1,131,318,3805,', '4', '古晋', 'Kuching', 'gujin', 'KCH');
INSERT INTO `sp_place` VALUES ('3806', '318', ',1,131,318,3806,', '4', '加帛', 'Kapit', 'jiabo', 'KPI');
INSERT INTO `sp_place` VALUES ('3807', '318', ',1,131,318,3807,', '4', '林梦', 'Limbang', 'linmeng', 'LMN');
INSERT INTO `sp_place` VALUES ('3808', '318', ',1,131,318,3808,', '4', '美里', 'Miri', 'meili', 'MYY');
INSERT INTO `sp_place` VALUES ('3809', '318', ',1,131,318,3809,', '4', '民都鲁', 'Bintulu', 'mindulu', 'BTU');
INSERT INTO `sp_place` VALUES ('3810', '318', ',1,131,318,3810,', '4', '木胶', 'Mukah', 'mujiao', 'MKM');
INSERT INTO `sp_place` VALUES ('3811', '318', ',1,131,318,3811,', '4', '木中', 'Betong', 'muzhong', 'BTG');
INSERT INTO `sp_place` VALUES ('3812', '318', ',1,131,318,3812,', '4', '三马拉汉', 'Samarahan', 'sanmalahan', 'SMH');
INSERT INTO `sp_place` VALUES ('3813', '318', ',1,131,318,3813,', '4', '斯里阿曼', 'Sri Aman', 'siliaman', 'SAM');
INSERT INTO `sp_place` VALUES ('3814', '318', ',1,131,318,3814,', '4', '泗里街', 'Sarikei', 'lijie', 'SAR');
INSERT INTO `sp_place` VALUES ('3815', '318', ',1,131,318,3815,', '4', '泗务', 'Sibu', 'wu', 'SBW');
INSERT INTO `sp_place` VALUES ('3816', '319', ',1,131,319,3816,', '4', '八打灵', 'Petaling', 'badaling', 'PJA');
INSERT INTO `sp_place` VALUES ('3817', '319', ',1,131,319,3817,', '4', '鹅麦', 'Gombak', 'emai', 'GOM');
INSERT INTO `sp_place` VALUES ('3818', '319', ',1,131,319,3818,', '4', '瓜拉冷岳', 'Kuala Langat', 'gualalengyue', 'KLG');
INSERT INTO `sp_place` VALUES ('3819', '319', ',1,131,319,3819,', '4', '瓜拉雪兰莪', 'Kuala Selangor', 'gualaxuelan', 'KSL');
INSERT INTO `sp_place` VALUES ('3820', '319', ',1,131,319,3820,', '4', '沙白安南', 'Sabak Bernam', 'shabaiannan', 'SBM');
INSERT INTO `sp_place` VALUES ('3821', '319', ',1,131,319,3821,', '4', '乌鲁冷岳', 'Hulu Langat', 'wululengyue', 'HUL');
INSERT INTO `sp_place` VALUES ('3822', '319', ',1,131,319,3822,', '4', '乌鲁雪兰莪', 'Hulu Selangor', 'wuluxuelan', 'HUS');
INSERT INTO `sp_place` VALUES ('3823', '319', ',1,131,319,3823,', '4', '雪邦', 'Sepang', 'xuebang', 'SEP');
INSERT INTO `sp_place` VALUES ('3824', '320', ',4,140,320,3824,', '4', '费耶特维尔', 'Fayetteville', 'feiyeteweier', 'FYV');
INSERT INTO `sp_place` VALUES ('3825', '320', ',4,140,320,3825,', '4', '史密斯堡', 'Fort Smith', 'shimisibao', 'FSM');
INSERT INTO `sp_place` VALUES ('3826', '320', ',4,140,320,3826,', '4', '小石城', 'Little Rock', 'xiaoshicheng', 'LIT');
INSERT INTO `sp_place` VALUES ('3827', '321', ',4,140,321,3827,', '4', '伯明罕', 'Birmingham', 'bominghan', 'BHM');
INSERT INTO `sp_place` VALUES ('3828', '321', ',4,140,321,3828,', '4', '蒙哥马利', 'Montgomery', 'menggemali', 'MGM');
INSERT INTO `sp_place` VALUES ('3829', '321', ',4,140,321,3829,', '4', '莫比尔', 'Mobile', 'mobier', 'MOB');
INSERT INTO `sp_place` VALUES ('3830', '322', ',4,140,322,3830,', '4', '安克雷奇', 'Anchorage', 'ankeleiqi', 'ANC');
INSERT INTO `sp_place` VALUES ('3831', '322', ',4,140,322,3831,', '4', '费尔班克斯', 'Fairbanks', 'feierbankesi', 'FAI');
INSERT INTO `sp_place` VALUES ('3832', '322', ',4,140,322,3832,', '4', '朱诺', 'Juneau', 'zhunuo', 'JNU');
INSERT INTO `sp_place` VALUES ('3833', '323', ',4,140,323,3833,', '4', '爱达荷福尔斯', 'Idaho Falls', 'aidahefuersi', 'IDA');
INSERT INTO `sp_place` VALUES ('3834', '323', ',4,140,323,3834,', '4', '波卡特洛', 'Pocatello', 'bokateluo', 'PIH');
INSERT INTO `sp_place` VALUES ('3835', '323', ',4,140,323,3835,', '4', '博伊西', 'Boise', 'boyixi', 'BOI');
INSERT INTO `sp_place` VALUES ('3836', '323', ',4,140,323,3836,', '4', '布莱克富特', 'Blackfoot', 'bulaikefute', 'BLK');
INSERT INTO `sp_place` VALUES ('3837', '323', ',4,140,323,3837,', '4', '科达伦', 'Coeur d\'Alene', 'kedalun', 'COE');
INSERT INTO `sp_place` VALUES ('3838', '323', ',4,140,323,3838,', '4', '刘易斯顿', 'Lewiston', 'liuyisidun', 'LWS');
INSERT INTO `sp_place` VALUES ('3839', '323', ',4,140,323,3839,', '4', '莫斯科', 'Moscow', 'mosike', 'MJL');
INSERT INTO `sp_place` VALUES ('3840', '323', ',4,140,323,3840,', '4', '墨菲', 'Murphy', 'mofei', 'ZMU');
INSERT INTO `sp_place` VALUES ('3841', '323', ',4,140,323,3841,', '4', '楠帕', 'Nampa', 'pa', 'NPA');
INSERT INTO `sp_place` VALUES ('3842', '323', ',4,140,323,3842,', '4', '岂彻姆', 'Ketchum', 'qichemu', 'QKM');
INSERT INTO `sp_place` VALUES ('3843', '323', ',4,140,323,3843,', '4', '森瓦利', 'Sun Valley', 'senwali', 'SVY');
INSERT INTO `sp_place` VALUES ('3844', '323', ',4,140,323,3844,', '4', '亚美利加瀑布城', 'American Falls', 'yameilijiapubucheng', 'YAF');
INSERT INTO `sp_place` VALUES ('3845', '324', ',4,140,324,3845,', '4', '达文波特', 'Davenport', 'dawenbote', 'DVN');
INSERT INTO `sp_place` VALUES ('3846', '324', ',4,140,324,3846,', '4', '得梅因', 'Des Moines', 'demeiyin', 'DSM');
INSERT INTO `sp_place` VALUES ('3847', '324', ',4,140,324,3847,', '4', '锡达拉皮兹', 'Cedar Rapids', 'xidalapizi', 'CID');
INSERT INTO `sp_place` VALUES ('3848', '325', ',4,140,325,3848,', '4', '俾斯麦', 'Bismarck', 'simai', 'BIS');
INSERT INTO `sp_place` VALUES ('3849', '325', ',4,140,325,3849,', '4', '大福克斯', 'Grand Forks', 'dafukesi', 'GFK');
INSERT INTO `sp_place` VALUES ('3850', '325', ',4,140,325,3850,', '4', '法戈', 'Fargo', 'fage', 'FAR');
INSERT INTO `sp_place` VALUES ('3851', '325', ',4,140,325,3851,', '4', '迈诺特', 'Minot', 'mainuote', 'MOT');
INSERT INTO `sp_place` VALUES ('3852', '326', ',4,140,326,3852,', '4', '艾许维尔', 'Asheville', 'aixuweier', 'AEV');
INSERT INTO `sp_place` VALUES ('3853', '326', ',4,140,326,3853,', '4', '杜罕', 'Durham', 'duhan', 'DHH');
INSERT INTO `sp_place` VALUES ('3854', '326', ',4,140,326,3854,', '4', '格林斯伯勒', 'Greensboro', 'gelinsibole', 'GBO');
INSERT INTO `sp_place` VALUES ('3855', '326', ',4,140,326,3855,', '4', '教堂山', 'Chapel Hill', 'jiaotangshan', 'CHE');
INSERT INTO `sp_place` VALUES ('3856', '326', ',4,140,326,3856,', '4', '罗利', 'Raleigh', 'luoli', 'RAG');
INSERT INTO `sp_place` VALUES ('3857', '326', ',4,140,326,3857,', '4', '洛利杜罕都会区', 'Raleigh-Durham', 'luoliduhanduhuiqu', 'RDU');
INSERT INTO `sp_place` VALUES ('3858', '326', ',4,140,326,3858,', '4', '夏洛特', 'Charlotte', 'xialuote', 'CRQ');
INSERT INTO `sp_place` VALUES ('3859', '327', ',4,140,327,3859,', '4', '阿伦敦', 'Allentown', 'alundun', 'AEW');
INSERT INTO `sp_place` VALUES ('3860', '327', ',4,140,327,3860,', '4', '费城', 'Philadephia', 'feicheng', 'PHL');
INSERT INTO `sp_place` VALUES ('3861', '327', ',4,140,327,3861,', '4', '匹兹堡', 'Pittsburgh', 'pizibao', 'PIT');
INSERT INTO `sp_place` VALUES ('3862', '328', ',4,140,328,3862,', '4', '埃尔帕索', 'El Paso', 'aierpasuo', 'ELP');
INSERT INTO `sp_place` VALUES ('3863', '328', ',4,140,328,3863,', '4', '奥斯汀', 'Austin', 'aositing', 'AUS');
INSERT INTO `sp_place` VALUES ('3864', '328', ',4,140,328,3864,', '4', '达拉斯', 'Dallas', 'dalasi', 'DAL');
INSERT INTO `sp_place` VALUES ('3865', '328', ',4,140,328,3865,', '4', '哥帕斯基斯蒂', 'Corpus Christi', 'gepasijisidi', 'CRP');
INSERT INTO `sp_place` VALUES ('3866', '328', ',4,140,328,3866,', '4', '交维斯顿', 'Galveston', 'jiaoweisidun', 'GLS');
INSERT INTO `sp_place` VALUES ('3867', '328', ',4,140,328,3867,', '4', '拉雷多', 'Laredo', 'laleiduo', 'LRD');
INSERT INTO `sp_place` VALUES ('3868', '328', ',4,140,328,3868,', '4', '麦亚伦', 'McAllen', 'maiyalun', 'TXC');
INSERT INTO `sp_place` VALUES ('3869', '328', ',4,140,328,3869,', '4', '圣安东尼奥', 'San Antonio', 'shengandongniao', 'SAT');
INSERT INTO `sp_place` VALUES ('3870', '328', ',4,140,328,3870,', '4', '休斯敦', 'Houston', 'xiusidun', 'HOU');
INSERT INTO `sp_place` VALUES ('3871', '329', ',4,140,329,3871,', '4', '代顿', 'Dayton', 'daidun', 'DYT');
INSERT INTO `sp_place` VALUES ('3872', '329', ',4,140,329,3872,', '4', '哥伦布', 'Columbus', 'gelunbu', 'CZX');
INSERT INTO `sp_place` VALUES ('3873', '329', ',4,140,329,3873,', '4', '克利夫兰', 'Cleveland', 'kelifulan', 'CLE');
INSERT INTO `sp_place` VALUES ('3874', '329', ',4,140,329,3874,', '4', '托莱多', 'Toledo', 'tuolaiduo', 'TOL');
INSERT INTO `sp_place` VALUES ('3875', '329', ',4,140,329,3875,', '4', '辛辛那提', 'Cincinnati', 'xinxinnati', 'CVG');
INSERT INTO `sp_place` VALUES ('3876', '330', ',4,140,330,3876,', '4', '俄克拉荷马城', 'Oklahoma City', 'ekelahemacheng', 'OKC');
INSERT INTO `sp_place` VALUES ('3877', '330', ',4,140,330,3877,', '4', '诺曼', 'Norman', 'nuoman', 'OUN');
INSERT INTO `sp_place` VALUES ('3878', '330', ',4,140,330,3878,', '4', '塔尔萨', 'Tulsa', 'taersa', 'TUL');
INSERT INTO `sp_place` VALUES ('3879', '331', ',4,140,331,3879,', '4', '本德', 'Bend', 'bende', 'BZO');
INSERT INTO `sp_place` VALUES ('3880', '331', ',4,140,331,3880,', '4', '波特兰', 'Portland', 'botelan', 'PDX');
INSERT INTO `sp_place` VALUES ('3881', '331', ',4,140,331,3881,', '4', '达尔斯', 'The Dalles', 'daersi', 'DLS');
INSERT INTO `sp_place` VALUES ('3882', '331', ',4,140,331,3882,', '4', '达拉斯', 'Dallas', 'dalasi', 'DAC');
INSERT INTO `sp_place` VALUES ('3883', '331', ',4,140,331,3883,', '4', '蒂拉穆克', 'Tillamook', 'dilamuke', 'TLM');
INSERT INTO `sp_place` VALUES ('3884', '331', ',4,140,331,3884,', '4', '格兰茨帕斯', 'Grant\'s Pass', 'gelancipasi', 'XFX');
INSERT INTO `sp_place` VALUES ('3885', '331', ',4,140,331,3885,', '4', '胡德里弗', 'Hood River', 'hudelifu', 'HDX');
INSERT INTO `sp_place` VALUES ('3886', '331', ',4,140,331,3886,', '4', '火山口湖', 'Crater Lake', 'huoshankouhu', 'CTR');
INSERT INTO `sp_place` VALUES ('3887', '331', ',4,140,331,3887,', '4', '科瓦利斯', 'Corvallis', 'kewalisi', 'YCV');
INSERT INTO `sp_place` VALUES ('3888', '331', ',4,140,331,3888,', '4', '库斯贝', 'Coos Bay', 'kusibei', 'COB');
INSERT INTO `sp_place` VALUES ('3889', '331', ',4,140,331,3889,', '4', '梅德福', 'Medford', 'meidefu', 'MFR');
INSERT INTO `sp_place` VALUES ('3890', '331', ',4,140,331,3890,', '4', '塞勒姆', 'Salem', 'sailemu', 'SLE');
INSERT INTO `sp_place` VALUES ('3891', '331', ',4,140,331,3891,', '4', '圣海伦斯', 'St Helens', 'shenghailunsi', 'STH');
INSERT INTO `sp_place` VALUES ('3892', '331', ',4,140,331,3892,', '4', '斯普林菲尔德', 'Springfield', 'sipulinfeierde', 'SPY');
INSERT INTO `sp_place` VALUES ('3893', '331', ',4,140,331,3893,', '4', '尤金', 'Eugene', 'youjin', 'EUG');
INSERT INTO `sp_place` VALUES ('3894', '332', ',4,140,332,3894,', '4', '奥兰多', 'Orlando', 'aolanduo', 'ORL');
INSERT INTO `sp_place` VALUES ('3895', '332', ',4,140,332,3895,', '4', '基韦斯特', 'Key West', 'jiweisite', 'EYW');
INSERT INTO `sp_place` VALUES ('3896', '332', ',4,140,332,3896,', '4', '杰克逊维尔', 'Jacksonville', 'jiekexunweier', 'JAX');
INSERT INTO `sp_place` VALUES ('3897', '332', ',4,140,332,3897,', '4', '卡纳维尔角', 'Cape Canaveral', 'kanaweierjiao', 'CPV');
INSERT INTO `sp_place` VALUES ('3898', '332', ',4,140,332,3898,', '4', '罗德岱堡', 'Fort Lauderdale', 'luodebao', 'FLL');
INSERT INTO `sp_place` VALUES ('3899', '332', ',4,140,332,3899,', '4', '迈阿密', 'Miami', 'maiami', 'MIA');
INSERT INTO `sp_place` VALUES ('3900', '332', ',4,140,332,3900,', '4', '圣彼德斯堡市', 'St. Petersburg', 'shengbidesibaoshi', 'PIE');
INSERT INTO `sp_place` VALUES ('3901', '332', ',4,140,332,3901,', '4', '塔拉哈西', 'Tallahassee', 'talahaxi', 'TLH');
INSERT INTO `sp_place` VALUES ('3902', '332', ',4,140,332,3902,', '4', '坦帕', 'Tampa', 'tanpa', 'TPA');
INSERT INTO `sp_place` VALUES ('3903', '333', ',4,140,333,3903,', '4', '伯灵顿', 'Burlington', 'bolingdun', 'BTV');
INSERT INTO `sp_place` VALUES ('3904', '333', ',4,140,333,3904,', '4', '拉特兰', 'Rutland', 'latelan', 'RUT');
INSERT INTO `sp_place` VALUES ('3905', '333', ',4,140,333,3905,', '4', '南伯灵顿', 'South Burlington', 'nanbolingdun', 'ZBR');
INSERT INTO `sp_place` VALUES ('3906', '334', ',4,140,334,3906,', '4', '华盛顿哥伦比亚特区', 'Washington D.C.', 'huashengdungelunbiyatequ', 'WAS');
INSERT INTO `sp_place` VALUES ('3907', '335', ',4,140,335,3907,', '4', '斯波坎', 'Spokane', 'sibokan', 'GEG');
INSERT INTO `sp_place` VALUES ('3908', '335', ',4,140,335,3908,', '4', '塔科马', 'Tacoma', 'takema', 'TTW');
INSERT INTO `sp_place` VALUES ('3909', '335', ',4,140,335,3909,', '4', '西雅图', 'Seattle', 'xiyatu', 'SEA');
INSERT INTO `sp_place` VALUES ('3910', '336', ',4,140,336,3910,', '4', '埃文斯顿', 'Evanston', 'aiwensidun', 'EVD');
INSERT INTO `sp_place` VALUES ('3911', '336', ',4,140,336,3911,', '4', '卡斯珀', 'Casper', 'kasi', 'CPR');
INSERT INTO `sp_place` VALUES ('3912', '336', ',4,140,336,3912,', '4', '拉勒米', 'Laramie', 'lalemi', 'LAR');
INSERT INTO `sp_place` VALUES ('3913', '336', ',4,140,336,3913,', '4', '罗克斯普林斯', 'Rock Springs', 'luokesipulinsi', 'RKS');
INSERT INTO `sp_place` VALUES ('3914', '336', ',4,140,336,3914,', '4', '夏延', 'Cheyenne', 'xiayan', 'CYS');
INSERT INTO `sp_place` VALUES ('3915', '336', ',4,140,336,3915,', '4', '谢里登', 'Sheridan', 'xielideng', 'SHR');
INSERT INTO `sp_place` VALUES ('3916', '337', ',4,140,337,3916,', '4', '旧金山', 'San Francisco', 'jiujinshan', 'SFO');
INSERT INTO `sp_place` VALUES ('3917', '337', ',4,140,337,3917,', '4', '洛杉矶', 'Los Angeles', 'luoshan', 'LAX');
INSERT INTO `sp_place` VALUES ('3918', '337', ',4,140,337,3918,', '4', '圣迭戈', 'San Diego', 'shengdiege', 'SAN');
INSERT INTO `sp_place` VALUES ('3919', '337', ',4,140,337,3919,', '4', '圣何塞', 'San Jose', 'shenghesai', 'SJC');
INSERT INTO `sp_place` VALUES ('3920', '338', ',4,140,338,3920,', '4', '阿比林', 'Abilene', 'abilin', 'ABZ');
INSERT INTO `sp_place` VALUES ('3921', '338', ',4,140,338,3921,', '4', '奥弗兰公园', 'Overland Park', 'aofulangongyuan', 'OVL');
INSERT INTO `sp_place` VALUES ('3922', '338', ',4,140,338,3922,', '4', '哈钦森', 'Hutchinson', 'haqinsen', 'HCH');
INSERT INTO `sp_place` VALUES ('3923', '338', ',4,140,338,3923,', '4', '堪萨斯城', 'Kansas City', 'kansasicheng', 'KCK');
INSERT INTO `sp_place` VALUES ('3924', '338', ',4,140,338,3924,', '4', '莱文沃思', 'Leavenworth', 'laiwenwosi', 'XIA');
INSERT INTO `sp_place` VALUES ('3925', '338', ',4,140,338,3925,', '4', '劳伦斯', 'Lawrence', 'laolunsi', 'LWC');
INSERT INTO `sp_place` VALUES ('3926', '338', ',4,140,338,3926,', '4', '曼哈顿', 'Manhattan', 'manhadun', 'MHK');
INSERT INTO `sp_place` VALUES ('3927', '338', ',4,140,338,3927,', '4', '托皮卡', 'Topeka', 'tuopika', 'TOP');
INSERT INTO `sp_place` VALUES ('3928', '338', ',4,140,338,3928,', '4', '威奇托', 'Wichita', 'weiqituo', 'ICT');
INSERT INTO `sp_place` VALUES ('3929', '339', ',4,140,339,3929,', '4', '布里奇波特', 'Bridgeport', 'buliqibote', 'BDR');
INSERT INTO `sp_place` VALUES ('3930', '339', ',4,140,339,3930,', '4', '达里恩', 'Darien', 'dalien', 'DAQ');
INSERT INTO `sp_place` VALUES ('3931', '339', ',4,140,339,3931,', '4', '格林尼治', 'Greenwich', 'gelinnizhi', 'GRH');
INSERT INTO `sp_place` VALUES ('3932', '339', ',4,140,339,3932,', '4', '哈特福德', 'Hartford', 'hatefude', 'HFD');
INSERT INTO `sp_place` VALUES ('3933', '339', ',4,140,339,3933,', '4', '米德尔顿', 'Middletown', 'mideerdun', 'XIN');
INSERT INTO `sp_place` VALUES ('3934', '339', ',4,140,339,3934,', '4', '纽黑文', 'New Haven', 'niuheiwen', 'HVN');
INSERT INTO `sp_place` VALUES ('3935', '339', ',4,140,339,3935,', '4', '韦斯特波特', 'Westport', 'weisitebote', 'WPT');
INSERT INTO `sp_place` VALUES ('3936', '339', ',4,140,339,3936,', '4', '沃特伯里', 'Waterbury', 'woteboli', 'WAT');
INSERT INTO `sp_place` VALUES ('3937', '339', ',4,140,339,3937,', '4', '新不列颠', 'New Britain', 'xinbuliedian', 'NWT');
INSERT INTO `sp_place` VALUES ('3938', '340', ',4,140,340,3938,', '4', '阿斯彭', 'Aspen', 'asipeng', 'ASE');
INSERT INTO `sp_place` VALUES ('3939', '340', ',4,140,340,3939,', '4', '奥罗拉', 'Aurora', 'aoluola', 'AUX');
INSERT INTO `sp_place` VALUES ('3940', '340', ',4,140,340,3940,', '4', '博尔德', 'Boulder', 'boerde', 'WBU');
INSERT INTO `sp_place` VALUES ('3941', '340', ',4,140,340,3941,', '4', '大章克申', 'Grand Junction', 'dazhangkeshen', 'GJT');
INSERT INTO `sp_place` VALUES ('3942', '340', ',4,140,340,3942,', '4', '丹佛', 'Denver', 'danfo', 'DEN');
INSERT INTO `sp_place` VALUES ('3943', '340', ',4,140,340,3943,', '4', '柯林斯堡', 'Fort Collins', 'kelinsibao', 'FNL');
INSERT INTO `sp_place` VALUES ('3944', '340', ',4,140,340,3944,', '4', '科罗拉多斯普林斯', 'Colorado Springs', 'keluoladuosipulinsi', 'COS');
INSERT INTO `sp_place` VALUES ('3945', '340', ',4,140,340,3945,', '4', '韦尔', 'Vail', 'weier', 'VAC');
INSERT INTO `sp_place` VALUES ('3946', '341', ',4,140,341,3946,', '4', '列克星敦', 'Lexington', 'liekexingdun', 'LEX');
INSERT INTO `sp_place` VALUES ('3947', '341', ',4,140,341,3947,', '4', '路易斯维尔', 'Louisville', 'luyisiweier', 'LUI');
INSERT INTO `sp_place` VALUES ('3948', '341', ',4,140,341,3948,', '4', '欧文斯伯勒', 'Owensboro', 'ouwensibole', 'OWB');
INSERT INTO `sp_place` VALUES ('3949', '342', ',4,140,342,3949,', '4', '巴吞鲁日', 'Baton Rouge', 'batunluri', 'BTR');
INSERT INTO `sp_place` VALUES ('3950', '342', ',4,140,342,3950,', '4', '什里夫波特', 'Shreveport', 'shilifubote', 'SHV');
INSERT INTO `sp_place` VALUES ('3951', '342', ',4,140,342,3951,', '4', '新奥尔良', 'New Orleans', 'xinaoerliang', 'MSY');
INSERT INTO `sp_place` VALUES ('3952', '343', ',4,140,343,3952,', '4', '波塔基特', 'Pawtucket', 'botajite', 'PAW');
INSERT INTO `sp_place` VALUES ('3953', '343', ',4,140,343,3953,', '4', '克兰斯顿', 'Cranston', 'kelansidun', 'CQH');
INSERT INTO `sp_place` VALUES ('3954', '343', ',4,140,343,3954,', '4', '纽波特', 'Newport', 'niubote', 'NPO');
INSERT INTO `sp_place` VALUES ('3955', '343', ',4,140,343,3955,', '4', '普罗维登斯', 'Providence', 'puluoweidengsi', 'PVD');
INSERT INTO `sp_place` VALUES ('3956', '343', ',4,140,343,3956,', '4', '韦斯特利', 'Westerly', 'weisiteli', 'WST');
INSERT INTO `sp_place` VALUES ('3957', '343', ',4,140,343,3957,', '4', '文索基特', 'Woonsocket', 'wensuojite', 'SFN');
INSERT INTO `sp_place` VALUES ('3958', '343', ',4,140,343,3958,', '4', '沃威克', 'Warwick', 'woweike', 'UZO');
INSERT INTO `sp_place` VALUES ('3959', '344', ',4,140,344,3959,', '4', '巴尔的摩', 'Balitmore', 'baerdemo', 'BAL');
INSERT INTO `sp_place` VALUES ('3960', '344', ',4,140,344,3960,', '4', '盖瑟斯堡', 'Gaithersburg', 'gaisesibao', 'GAI');
INSERT INTO `sp_place` VALUES ('3961', '344', ',4,140,344,3961,', '4', '罗克维尔', 'Rockville', 'luokeweier', 'RKV');
INSERT INTO `sp_place` VALUES ('3962', '345', ',4,140,345,3962,', '4', '波士顿', 'Boston', 'boshidun', 'BZD');
INSERT INTO `sp_place` VALUES ('3963', '345', ',4,140,345,3963,', '4', '斯普林菲尔德', 'Springfield', 'sipulinfeierde', 'SFY');
INSERT INTO `sp_place` VALUES ('3964', '345', ',4,140,345,3964,', '4', '伍斯特', 'Worcester', 'wusite', 'ORH');
INSERT INTO `sp_place` VALUES ('3965', '346', ',4,140,346,3965,', '4', '比灵斯', 'Billings', 'bilingsi', 'BGS');
INSERT INTO `sp_place` VALUES ('3966', '346', ',4,140,346,3966,', '4', '大瀑布村', 'Great Falls', 'dapubucun', 'GTF');
INSERT INTO `sp_place` VALUES ('3967', '346', ',4,140,346,3967,', '4', '米苏拉', 'Missoula', 'misula', 'MSO');
INSERT INTO `sp_place` VALUES ('3968', '347', ',4,140,347,3968,', '4', '哥伦比亚', 'Columbia', 'gelunbiya', 'COV');
INSERT INTO `sp_place` VALUES ('3969', '347', ',4,140,347,3969,', '4', '杰佛逊市', 'Jefferson City', 'jiefoxunshi', 'JEF');
INSERT INTO `sp_place` VALUES ('3970', '347', ',4,140,347,3970,', '4', '堪萨斯城', 'Kansas City', 'kansasicheng', 'MKC');
INSERT INTO `sp_place` VALUES ('3971', '347', ',4,140,347,3971,', '4', '圣路易斯', 'Sanit Louis', 'shengluyisi', 'STL');
INSERT INTO `sp_place` VALUES ('3972', '347', ',4,140,347,3972,', '4', '斯普林菲尔德', 'Springfield', 'sipulinfeierde', 'SGF');
INSERT INTO `sp_place` VALUES ('3973', '348', ',4,140,348,3973,', '4', '比洛克西', 'Biloxi', 'biluokexi', 'BIX');
INSERT INTO `sp_place` VALUES ('3974', '348', ',4,140,348,3974,', '4', '格尔夫波特', 'Gulfport', 'geerfubote', 'GPT');
INSERT INTO `sp_place` VALUES ('3975', '348', ',4,140,348,3975,', '4', '格林维尔', 'Greenville', 'gelinweier', 'GLH');
INSERT INTO `sp_place` VALUES ('3976', '348', ',4,140,348,3976,', '4', '哈蒂斯堡', 'Hattiesburg', 'hadisibao', 'HBG');
INSERT INTO `sp_place` VALUES ('3977', '348', ',4,140,348,3977,', '4', '杰克逊', 'Jackson', 'jiekexun', 'JAN');
INSERT INTO `sp_place` VALUES ('3978', '348', ',4,140,348,3978,', '4', '默里迪恩', 'Meridian', 'molidien', 'MEI');
INSERT INTO `sp_place` VALUES ('3979', '348', ',4,140,348,3979,', '4', '维克斯堡', 'Vicksburg', 'weikesibao', 'VKS');
INSERT INTO `sp_place` VALUES ('3980', '349', ',4,140,349,3980,', '4', '安娜堡', 'Ann Arbor', 'annabao', 'ARB');
INSERT INTO `sp_place` VALUES ('3981', '349', ',4,140,349,3981,', '4', '巴特尔克里克', 'Battle Creek', 'bateerkelike', 'BTL');
INSERT INTO `sp_place` VALUES ('3982', '349', ',4,140,349,3982,', '4', '贝城', 'Bay City', 'beicheng', 'BCY');
INSERT INTO `sp_place` VALUES ('3983', '349', ',4,140,349,3983,', '4', '大急流城', 'Grand Rapids', 'dajiliucheng', 'GRR');
INSERT INTO `sp_place` VALUES ('3984', '349', ',4,140,349,3984,', '4', '迪尔伯恩', 'Dearborn', 'dierboen', 'DEO');
INSERT INTO `sp_place` VALUES ('3985', '349', ',4,140,349,3985,', '4', '底特律', 'Detroit', 'ditelv', 'DET');
INSERT INTO `sp_place` VALUES ('3986', '349', ',4,140,349,3986,', '4', '弗林特', 'Flint', 'fulinte', 'FNT');
INSERT INTO `sp_place` VALUES ('3987', '349', ',4,140,349,3987,', '4', '怀恩多特', 'Wyandotte', 'huaienduote', 'WYD');
INSERT INTO `sp_place` VALUES ('3988', '349', ',4,140,349,3988,', '4', '卡拉马袓', 'Kalamazoo', 'kalama', 'AZO');
INSERT INTO `sp_place` VALUES ('3989', '349', ',4,140,349,3989,', '4', '兰辛', 'Lansing', 'lanxin', 'LAN');
INSERT INTO `sp_place` VALUES ('3990', '349', ',4,140,349,3990,', '4', '马斯基根', 'Muskegon', 'masijigen', 'MKG');
INSERT INTO `sp_place` VALUES ('3991', '349', ',4,140,349,3991,', '4', '庞菷亚克', 'Pontiac', 'pang', 'PTK');
INSERT INTO `sp_place` VALUES ('3992', '349', ',4,140,349,3992,', '4', '萨吉诺', 'Saginaw', 'sajinuo', 'SGM');
INSERT INTO `sp_place` VALUES ('3993', '349', ',4,140,349,3993,', '4', '苏圣玛丽', 'Sault Ste Marie', 'sushengmali', 'SSM');
INSERT INTO `sp_place` VALUES ('3994', '349', ',4,140,349,3994,', '4', '沃伦', 'Warren', 'wolun', 'WAM');
INSERT INTO `sp_place` VALUES ('3995', '349', ',4,140,349,3995,', '4', '休伦港', 'Port Huron', 'xiulungang', 'PHN');
INSERT INTO `sp_place` VALUES ('3996', '350', ',4,140,350,3996,', '4', '班戈', 'Bangor', 'bange', 'BNQ');
INSERT INTO `sp_place` VALUES ('3997', '350', ',4,140,350,3997,', '4', '波特兰', 'Portland', 'botelan', 'POL');
INSERT INTO `sp_place` VALUES ('3998', '350', ',4,140,350,3998,', '4', '刘易斯顿', 'Lewiston', 'liuyisidun', 'QLW');
INSERT INTO `sp_place` VALUES ('3999', '351', ',4,140,351,3999,', '4', '罗切斯特', 'Rochester', 'luoqiesite', 'RST');
INSERT INTO `sp_place` VALUES ('4000', '351', ',4,140,351,4000,', '4', '明尼阿波利斯', 'Minneapolis', 'mingniabolisi', 'MES');
INSERT INTO `sp_place` VALUES ('4001', '351', ',4,140,351,4001,', '4', '圣保罗', 'Saint Paul', 'shengbaoluo', 'STP');
INSERT INTO `sp_place` VALUES ('4002', '352', ',4,140,352,4002,', '4', '阿伯丁', 'Aberdeen', 'aboding', 'ABK');
INSERT INTO `sp_place` VALUES ('4003', '352', ',4,140,352,4003,', '4', '拉皮德城', 'Rapid City', 'lapidecheng', 'RAP');
INSERT INTO `sp_place` VALUES ('4004', '352', ',4,140,352,4004,', '4', '苏福尔斯', 'Sioux Falls', 'sufuersi', 'FSD');
INSERT INTO `sp_place` VALUES ('4005', '353', ',4,140,353,4005,', '4', '北查尔斯顿', 'North Charleston', 'beichaersidun', 'NTS');
INSERT INTO `sp_place` VALUES ('4006', '353', ',4,140,353,4006,', '4', '查尔斯顿', 'Charleston', 'chaersidun', 'CHS');
INSERT INTO `sp_place` VALUES ('4007', '353', ',4,140,353,4007,', '4', '哥伦比亚', 'Columbia', 'gelunbiya', 'COV');
INSERT INTO `sp_place` VALUES ('4008', '354', ',4,140,354,4008,', '4', '奥马哈', 'Omaha', 'aomaha', 'OMA');
INSERT INTO `sp_place` VALUES ('4009', '354', ',4,140,354,4009,', '4', '贝尔维尤', 'Bellevue', 'beierweiyou', 'XDE');
INSERT INTO `sp_place` VALUES ('4010', '354', ',4,140,354,4010,', '4', '林肯', 'Lincoln', 'linken', 'LNK');
INSERT INTO `sp_place` VALUES ('4011', '355', ',4,140,355,4011,', '4', '埃尔科', 'Elko', 'aierke', 'EKO');
INSERT INTO `sp_place` VALUES ('4012', '355', ',4,140,355,4012,', '4', '北拉斯维加斯', 'North Las Vegas', 'beilasiweijiasi', 'NVS');
INSERT INTO `sp_place` VALUES ('4013', '355', ',4,140,355,4013,', '4', '弗吉尼亚城', 'Virginia City', 'fujiniyacheng', 'VGI');
INSERT INTO `sp_place` VALUES ('4014', '355', ',4,140,355,4014,', '4', '亨德森', 'Henderson', 'hengdesen', 'HNZ');
INSERT INTO `sp_place` VALUES ('4015', '355', ',4,140,355,4015,', '4', '卡森城', 'Carson City', 'kasencheng', 'CSN');
INSERT INTO `sp_place` VALUES ('4016', '355', ',4,140,355,4016,', '4', '拉斯维加斯', 'Las Vegas', 'lasiweijiasi', 'LAS');
INSERT INTO `sp_place` VALUES ('4017', '355', ',4,140,355,4017,', '4', '里诺', 'Reno', 'linuo', 'RNO');
INSERT INTO `sp_place` VALUES ('4018', '355', ',4,140,355,4018,', '4', '斯帕克斯', 'Sparks', 'sipakesi', 'SPK');
INSERT INTO `sp_place` VALUES ('4019', '356', ',4,140,356,4019,', '4', '布法罗', 'Buffalo', 'bufaluo', 'FFO');
INSERT INTO `sp_place` VALUES ('4020', '356', ',4,140,356,4020,', '4', '罗切斯特', 'Rochester', 'luoqiesite', 'ROC');
INSERT INTO `sp_place` VALUES ('4021', '356', ',4,140,356,4021,', '4', '纽约市', 'New York', 'niuyueshi', 'QEE');
INSERT INTO `sp_place` VALUES ('4022', '357', ',4,140,357,4022,', '4', '多佛', 'Dover', 'duofo', 'DOR');
INSERT INTO `sp_place` VALUES ('4023', '357', ',4,140,357,4023,', '4', '纽瓦克', 'Newark', 'niuwake', 'NWK');
INSERT INTO `sp_place` VALUES ('4024', '357', ',4,140,357,4024,', '4', '威明顿', 'Wilmington', 'weimingdun', 'ILG');
INSERT INTO `sp_place` VALUES ('4025', '358', ',4,140,358,4025,', '4', '布利斯托', 'Bristol', 'bulisituo', 'BSJ');
INSERT INTO `sp_place` VALUES ('4026', '358', ',4,140,358,4026,', '4', '查塔努加', 'Chattanooga', 'chatanujia', 'CHA');
INSERT INTO `sp_place` VALUES ('4027', '358', ',4,140,358,4027,', '4', '金斯波特', 'Kingsport', 'jinsibote', 'TRI');
INSERT INTO `sp_place` VALUES ('4028', '358', ',4,140,358,4028,', '4', '孟菲斯', 'Memphis', 'mengfeisi', 'MEM');
INSERT INTO `sp_place` VALUES ('4029', '358', ',4,140,358,4029,', '4', '纳什维尔', 'Nashville', 'nashiweier', 'BNA');
INSERT INTO `sp_place` VALUES ('4030', '358', ',4,140,358,4030,', '4', '诺克斯维尔', 'Knoxville', 'nuokesiweier', 'TYS');
INSERT INTO `sp_place` VALUES ('4031', '358', ',4,140,358,4031,', '4', '三城区', 'Tri-City Area', 'sanchengqu', 'YTC');
INSERT INTO `sp_place` VALUES ('4032', '358', ',4,140,358,4032,', '4', '士麦那', 'Smyrna', 'shimaina', 'MQY');
INSERT INTO `sp_place` VALUES ('4033', '358', ',4,140,358,4033,', '4', '斯普林希尔', 'Spring Hill', 'sipulinxier', 'RGI');
INSERT INTO `sp_place` VALUES ('4034', '358', ',4,140,358,4034,', '4', '约翰逊城', 'Johnson City', 'yuehanxuncheng', 'JCY');
INSERT INTO `sp_place` VALUES ('4035', '359', ',4,140,359,4035,', '4', '阿普尓顿', 'Appleton', 'apu', 'ATW');
INSERT INTO `sp_place` VALUES ('4036', '359', ',4,140,359,4036,', '4', '奥什科什', 'Oshkosh', 'aoshikeshi', 'OSH');
INSERT INTO `sp_place` VALUES ('4037', '359', ',4,140,359,4037,', '4', '格林贝', 'Green Bay', 'gelinbei', 'GBK');
INSERT INTO `sp_place` VALUES ('4038', '359', ',4,140,359,4038,', '4', '基诺沙', 'Kenosha', 'jinuosha', 'ENW');
INSERT INTO `sp_place` VALUES ('4039', '359', ',4,140,359,4039,', '4', '拉克罗斯', 'LaCrosse', 'lakeluosi', 'LSE');
INSERT INTO `sp_place` VALUES ('4040', '359', ',4,140,359,4040,', '4', '拉辛', 'Racine', 'laxin', 'RAC');
INSERT INTO `sp_place` VALUES ('4041', '359', ',4,140,359,4041,', '4', '马尼托沃克', 'Manitowoc', 'manituowoke', 'MTW');
INSERT INTO `sp_place` VALUES ('4042', '359', ',4,140,359,4042,', '4', '迈迪逊', 'Madison', 'maidixun', 'QMD');
INSERT INTO `sp_place` VALUES ('4043', '359', ',4,140,359,4043,', '4', '密尔沃基', 'Milwaukee', 'mierwoji', 'MKE');
INSERT INTO `sp_place` VALUES ('4044', '359', ',4,140,359,4044,', '4', '欧克莱尓', 'Eau Claire', 'oukelai', 'EAU');
INSERT INTO `sp_place` VALUES ('4045', '359', ',4,140,359,4045,', '4', '沃索', 'Wausau', 'wosuo', 'AUW');
INSERT INTO `sp_place` VALUES ('4046', '359', ',4,140,359,4046,', '4', '希博伊根', 'Sheboygan', 'xiboyigen', 'SBM');
INSERT INTO `sp_place` VALUES ('4047', '360', ',4,140,360,4047,', '4', '弗吉尼亚比奇', 'Virginia Beach', 'fujiniyabiqi', 'VAB');
INSERT INTO `sp_place` VALUES ('4048', '360', ',4,140,360,4048,', '4', '诺福克', 'Norfolk', 'nuofuke', 'ORF');
INSERT INTO `sp_place` VALUES ('4049', '360', ',4,140,360,4049,', '4', '切萨皮克', 'Chesapeake', 'qiesapike', 'HTW');
INSERT INTO `sp_place` VALUES ('4050', '361', ',4,140,361,4050,', '4', '查尔斯顿', 'Charleston', 'chaersidun', 'CRW');
INSERT INTO `sp_place` VALUES ('4051', '361', ',4,140,361,4051,', '4', '亨廷顿', 'Huntington', 'hengtingdun', 'HNU');
INSERT INTO `sp_place` VALUES ('4052', '361', ',4,140,361,4052,', '4', '帕克斯堡', 'Parkersburg', 'pakesibao', 'PKB');
INSERT INTO `sp_place` VALUES ('4053', '362', ',4,140,362,4053,', '4', '凯卢阿', 'Kailua', 'kailua', 'KHH');
INSERT INTO `sp_place` VALUES ('4054', '362', ',4,140,362,4054,', '4', '檀香山', 'Honolulu', 'tanxiangshan', 'HNL');
INSERT INTO `sp_place` VALUES ('4055', '362', ',4,140,362,4055,', '4', '希洛', 'Hilo', 'xiluo', 'ITO');
INSERT INTO `sp_place` VALUES ('4056', '363', ',4,140,363,4056,', '4', '康科德', 'Concord', 'kangkede', 'CON');
INSERT INTO `sp_place` VALUES ('4057', '363', ',4,140,363,4057,', '4', '曼彻斯特', 'Manchester', 'manchesite', 'MHT');
INSERT INTO `sp_place` VALUES ('4058', '363', ',4,140,363,4058,', '4', '纳舒厄', 'Nashua', 'nashue', 'ASH');
INSERT INTO `sp_place` VALUES ('4059', '364', ',4,140,364,4059,', '4', '阿尔伯克基', 'Albuquerque', 'aerbokeji', 'ABQ');
INSERT INTO `sp_place` VALUES ('4060', '364', ',4,140,364,4060,', '4', '拉斯克鲁塞斯', 'Las Cruces', 'lasikelusaisi', 'LRU');
INSERT INTO `sp_place` VALUES ('4061', '364', ',4,140,364,4061,', '4', '罗斯韦尔', 'Roswell', 'luosiweier', 'ROW');
INSERT INTO `sp_place` VALUES ('4062', '364', ',4,140,364,4062,', '4', '圣菲', 'Santa Fe', 'shengfei', 'SAF');
INSERT INTO `sp_place` VALUES ('4063', '365', ',4,140,365,4063,', '4', '纽瓦克', 'Newark', 'niuwake', 'NRK');
INSERT INTO `sp_place` VALUES ('4064', '365', ',4,140,365,4064,', '4', '帕特森', 'Paterson', 'patesen', 'PAT');
INSERT INTO `sp_place` VALUES ('4065', '365', ',4,140,365,4065,', '4', '泽西城', 'Jersey City', 'zexicheng', 'JEC');
INSERT INTO `sp_place` VALUES ('4066', '366', ',4,140,366,4066,', '4', '凤凰城', 'Phoenix', 'fenghuangcheng', 'PHX');
INSERT INTO `sp_place` VALUES ('4067', '366', ',4,140,366,4067,', '4', '格兰代尔', 'Glendale', 'gelandaier', 'GDA');
INSERT INTO `sp_place` VALUES ('4068', '366', ',4,140,366,4068,', '4', '梅萨', 'Mesa', 'meisa', 'MQA');
INSERT INTO `sp_place` VALUES ('4069', '366', ',4,140,366,4069,', '4', '史卡兹代尔', 'Scottsdale', 'shikazidaier', 'STZ');
INSERT INTO `sp_place` VALUES ('4070', '366', ',4,140,366,4070,', '4', '坦普', 'Tempe', 'tanpu', 'TPE');
INSERT INTO `sp_place` VALUES ('4071', '366', ',4,140,366,4071,', '4', '图森', 'Tucson', 'tusen', 'TUC');
INSERT INTO `sp_place` VALUES ('4072', '366', ',4,140,366,4072,', '4', '优玛', 'Yuma', 'youma', 'YUM');
INSERT INTO `sp_place` VALUES ('4073', '367', ',4,140,367,4073,', '4', '奥尔顿', 'Alton', 'aoerdun', 'ALN');
INSERT INTO `sp_place` VALUES ('4074', '367', ',4,140,367,4074,', '4', '奥罗拉', 'Aurora', 'aoluola', 'AUZ');
INSERT INTO `sp_place` VALUES ('4075', '367', ',4,140,367,4075,', '4', '布卢明顿', 'Bloomington', 'bulumingdun', 'BLO');
INSERT INTO `sp_place` VALUES ('4076', '367', ',4,140,367,4076,', '4', '丹维尓', 'Danville', 'danwei', 'DVI');
INSERT INTO `sp_place` VALUES ('4077', '367', ',4,140,367,4077,', '4', '迪卡尔布', 'De Kalb', 'dikaerbu', 'DEK');
INSERT INTO `sp_place` VALUES ('4078', '367', ',4,140,367,4078,', '4', '迪凯持', 'Decatur', 'dikaichi', 'DEC');
INSERT INTO `sp_place` VALUES ('4079', '367', ',4,140,367,4079,', '4', '东圣路易斯', 'East St Louis', 'dongshengluyisi', 'ESL');
INSERT INTO `sp_place` VALUES ('4080', '367', ',4,140,367,4080,', '4', '厄巴纳-香槟', 'Champaign-Urbana', 'ebanaxiang', 'CMI');
INSERT INTO `sp_place` VALUES ('4081', '367', ',4,140,367,4081,', '4', '盖尔斯堡', 'Galesburg', 'gaiersibao', 'GSU');
INSERT INTO `sp_place` VALUES ('4082', '367', ',4,140,367,4082,', '4', '卡本代尔', 'Carbondale', 'kabendaier', 'MDH');
INSERT INTO `sp_place` VALUES ('4083', '367', ',4,140,367,4083,', '4', '罗克艾兰', 'Rock Island', 'luokeailan', 'RKI');
INSERT INTO `sp_place` VALUES ('4084', '367', ',4,140,367,4084,', '4', '罗克福德', 'Rockford', 'luokefude', 'RFD');
INSERT INTO `sp_place` VALUES ('4085', '367', ',4,140,367,4085,', '4', '诺黙尔', 'Normal', 'nuo', 'NOM');
INSERT INTO `sp_place` VALUES ('4086', '367', ',4,140,367,4086,', '4', '皮奥里亚', 'Peoria', 'piaoliya', 'PLA');
INSERT INTO `sp_place` VALUES ('4087', '367', ',4,140,367,4087,', '4', '森特勒利亚', 'Centralia', 'senteleliya', 'CRA');
INSERT INTO `sp_place` VALUES ('4088', '367', ',4,140,367,4088,', '4', '斯普林菲尔德', 'Springfield', 'sipulinfeierde', 'SPI');
INSERT INTO `sp_place` VALUES ('4089', '367', ',4,140,367,4089,', '4', '沃其根', 'Waukegan', 'woqigen', 'UGN');
INSERT INTO `sp_place` VALUES ('4090', '367', ',4,140,367,4090,', '4', '芝加哥', 'Chicago', 'zhijiage', 'CHI');
INSERT INTO `sp_place` VALUES ('4091', '368', ',4,140,368,4091,', '4', '埃文斯维尔', 'Evansville', 'aiwensiweier', 'EVV');
INSERT INTO `sp_place` VALUES ('4092', '368', ',4,140,368,4092,', '4', '韦恩堡', 'Fort Wayne', 'weienbao', 'FWA');
INSERT INTO `sp_place` VALUES ('4093', '368', ',4,140,368,4093,', '4', '印第安纳波利斯', 'Indianapolis', 'yindiannabolisi', 'IND');
INSERT INTO `sp_place` VALUES ('4094', '369', ',4,140,369,4094,', '4', '奥格登', 'Ogden', 'aogedeng', 'OGD');
INSERT INTO `sp_place` VALUES ('4095', '369', ',4,140,369,4095,', '4', '雷登', 'Layton', 'leideng', 'LTJ');
INSERT INTO `sp_place` VALUES ('4096', '369', ',4,140,369,4096,', '4', '欧仁', 'Orem', 'ouren', 'OEU');
INSERT INTO `sp_place` VALUES ('4097', '369', ',4,140,369,4097,', '4', '帕克城', 'Park City', 'pakecheng', 'PAC');
INSERT INTO `sp_place` VALUES ('4098', '369', ',4,140,369,4098,', '4', '普罗沃', 'Provo', 'puluowo', 'PVU');
INSERT INTO `sp_place` VALUES ('4099', '369', ',4,140,369,4099,', '4', '圣乔治', 'St.George', 'shengqiaozhi', 'SGU');
INSERT INTO `sp_place` VALUES ('4100', '369', ',4,140,369,4100,', '4', '西瓦利城', 'West Valley City', 'xiwalicheng', 'WVC');
INSERT INTO `sp_place` VALUES ('4101', '369', ',4,140,369,4101,', '4', '盐湖城', 'Salt Lake City', 'yanhucheng', 'SLC');
INSERT INTO `sp_place` VALUES ('4102', '370', ',4,140,370,4102,', '4', '奥古斯塔', 'Augusta', 'aogusita', 'AUT');
INSERT INTO `sp_place` VALUES ('4103', '370', ',4,140,370,4103,', '4', '哥伦布', 'Columbus', 'gelunbu', 'CZX');
INSERT INTO `sp_place` VALUES ('4104', '370', ',4,140,370,4104,', '4', '梅肯', 'Macon', 'meiken', 'MCN');
INSERT INTO `sp_place` VALUES ('4105', '370', ',4,140,370,4105,', '4', '沙瓦纳', 'Savannah', 'shawana', 'SAV');
INSERT INTO `sp_place` VALUES ('4106', '370', ',4,140,370,4106,', '4', '亚特兰大', 'Atlanta', 'yatelanda', 'TAT');
INSERT INTO `sp_place` VALUES ('4107', '371', ',2,237,371,4107,', '4', '贝尔法斯特', 'Belfast', 'beierfasite', 'BFS');
INSERT INTO `sp_place` VALUES ('4108', '371', ',2,237,371,4108,', '4', '德里', 'Derry', 'deli', 'DRY');
INSERT INTO `sp_place` VALUES ('4109', '371', ',2,237,371,4109,', '4', '利斯本', 'Lisburn', 'lisiben', 'LSB');
INSERT INTO `sp_place` VALUES ('4110', '371', ',2,237,371,4110,', '4', '纽里', 'Newry', 'niuli', 'NYM');
INSERT INTO `sp_place` VALUES ('4111', '372', ',2,237,372,4111,', '4', '阿伯丁', 'Aberdeen', 'aboding', 'ABD');
INSERT INTO `sp_place` VALUES ('4112', '372', ',2,237,372,4112,', '4', '爱丁堡', 'Edinburgh', 'aidingbao', 'EDH');
INSERT INTO `sp_place` VALUES ('4113', '372', ',2,237,372,4113,', '4', '丹迪', 'Dundee', 'dandi', 'DND');
INSERT INTO `sp_place` VALUES ('4114', '372', ',2,237,372,4114,', '4', '格拉斯哥', 'Glasgow', 'gelasige', 'GLG');
INSERT INTO `sp_place` VALUES ('4115', '372', ',2,237,372,4115,', '4', '斯特灵', 'Stirling', 'siteling', 'STG');
INSERT INTO `sp_place` VALUES ('4116', '372', ',2,237,372,4116,', '4', '因弗内斯', 'Inverness', 'yinfuneisi', 'INV');
INSERT INTO `sp_place` VALUES ('4117', '373', ',2,237,373,4117,', '4', '班戈', 'Bangor', 'bange', 'BAN');
INSERT INTO `sp_place` VALUES ('4118', '373', ',2,237,373,4118,', '4', '卡迪夫', 'Cardiff', 'kadifu', 'CDF');
INSERT INTO `sp_place` VALUES ('4119', '373', ',2,237,373,4119,', '4', '纽波特', 'Newport', 'niubote', 'NWP');
INSERT INTO `sp_place` VALUES ('4120', '373', ',2,237,373,4120,', '4', '斯旺西', 'Swansea', 'siwangxi', 'SWA');
INSERT INTO `sp_place` VALUES ('4121', '374', ',2,237,374,4121,', '4', '埃克塞特', 'Exeter', 'aikesaite', 'EXE');
INSERT INTO `sp_place` VALUES ('4122', '374', ',2,237,374,4122,', '4', '巴斯', 'Bath', 'basi', 'BAS');
INSERT INTO `sp_place` VALUES ('4123', '374', ',2,237,374,4123,', '4', '彼得伯勒', 'Peterborough', 'bidebole', 'PTE');
INSERT INTO `sp_place` VALUES ('4124', '374', ',2,237,374,4124,', '4', '伯明翰', 'Birmingham', 'bominghan', 'BIR');
INSERT INTO `sp_place` VALUES ('4125', '374', ',2,237,374,4125,', '4', '布拉德福德', 'Bradford', 'buladefude', 'BRD');
INSERT INTO `sp_place` VALUES ('4126', '374', ',2,237,374,4126,', '4', '布莱顿与赫福', 'Brighton & Hove', 'bulaidunyuhefu', 'BNH');
INSERT INTO `sp_place` VALUES ('4127', '374', ',2,237,374,4127,', '4', '布里斯托尔', 'Bristol', 'bulisituoer', 'BST');
INSERT INTO `sp_place` VALUES ('4128', '374', ',2,237,374,4128,', '4', '德比', 'Derby', 'debi', 'DER');
INSERT INTO `sp_place` VALUES ('4129', '374', ',2,237,374,4129,', '4', '德罕', 'Durham', 'dehan', 'DUR');
INSERT INTO `sp_place` VALUES ('4130', '374', ',2,237,374,4130,', '4', '格洛斯特', 'Gloucester', 'geluosite', 'GLO');
INSERT INTO `sp_place` VALUES ('4131', '374', ',2,237,374,4131,', '4', '赫尔河畔京斯敦', 'Kingston upon Hull', 'heerhepanjingsidun', 'KUH');
INSERT INTO `sp_place` VALUES ('4132', '374', ',2,237,374,4132,', '4', '赫里福德', 'Hereford', 'helifude', 'HAF');
INSERT INTO `sp_place` VALUES ('4133', '374', ',2,237,374,4133,', '4', '剑桥', 'Cambridge', 'jianqiao', 'CAM');
INSERT INTO `sp_place` VALUES ('4134', '374', ',2,237,374,4134,', '4', '卡莱尔', 'Carlisle', 'kalaier', 'CAX');
INSERT INTO `sp_place` VALUES ('4135', '374', ',2,237,374,4135,', '4', '坎特伯雷', 'Canterbury', 'kantebolei', 'CNG');
INSERT INTO `sp_place` VALUES ('4136', '374', ',2,237,374,4136,', '4', '考文垂', 'Coventry', 'kaowenchui', 'COV');
INSERT INTO `sp_place` VALUES ('4137', '374', ',2,237,374,4137,', '4', '兰开斯特', 'Lancaster', 'lankaisite', 'LAN');
INSERT INTO `sp_place` VALUES ('4138', '374', ',2,237,374,4138,', '4', '里彭', 'Ripon', 'lipeng', 'RIP');
INSERT INTO `sp_place` VALUES ('4139', '374', ',2,237,374,4139,', '4', '利奇菲尔德', 'Lichfield', 'liqifeierde', 'LHF');
INSERT INTO `sp_place` VALUES ('4140', '374', ',2,237,374,4140,', '4', '利物浦', 'Liverpool', 'liwupu', 'LIV');
INSERT INTO `sp_place` VALUES ('4141', '374', ',2,237,374,4141,', '4', '利茲', 'Leeds', 'li', 'LDS');
INSERT INTO `sp_place` VALUES ('4142', '374', ',2,237,374,4142,', '4', '列斯特', 'Leicester', 'liesite', 'LCE');
INSERT INTO `sp_place` VALUES ('4143', '374', ',2,237,374,4143,', '4', '林肯', 'Lincoln', 'linken', 'LCN');
INSERT INTO `sp_place` VALUES ('4144', '374', ',2,237,374,4144,', '4', '伦敦', 'London', 'lundun', 'LND');
INSERT INTO `sp_place` VALUES ('4145', '374', ',2,237,374,4145,', '4', '曼彻斯特', 'Manchester', 'manchesite', 'MAN');
INSERT INTO `sp_place` VALUES ('4146', '374', ',2,237,374,4146,', '4', '南安普敦', 'Southampton', 'nananpudun', 'STH');
INSERT INTO `sp_place` VALUES ('4147', '374', ',2,237,374,4147,', '4', '牛津', 'Oxford', 'niujin', 'OXF');
INSERT INTO `sp_place` VALUES ('4148', '374', ',2,237,374,4148,', '4', '纽卡斯尔', 'Newcastle', 'niukasier', 'NCL');
INSERT INTO `sp_place` VALUES ('4149', '374', ',2,237,374,4149,', '4', '诺丁汉', 'Nottingham', 'nuodinghan', 'NGM');
INSERT INTO `sp_place` VALUES ('4150', '374', ',2,237,374,4150,', '4', '诺里奇', 'Norwich', 'nuoliqi', 'NRW');
INSERT INTO `sp_place` VALUES ('4151', '374', ',2,237,374,4151,', '4', '朴茨茅斯', 'Portsmouth', 'pucimaosi', 'POR');
INSERT INTO `sp_place` VALUES ('4152', '374', ',2,237,374,4152,', '4', '普雷斯顿', 'Preston', 'puleisidun', 'PRE');
INSERT INTO `sp_place` VALUES ('4153', '374', ',2,237,374,4153,', '4', '普利茅斯', 'Plymouth', 'pulimaosi', 'PLY');
INSERT INTO `sp_place` VALUES ('4154', '374', ',2,237,374,4154,', '4', '奇切斯特', 'Chichester', 'qiqiesite', 'CST');
INSERT INTO `sp_place` VALUES ('4155', '374', ',2,237,374,4155,', '4', '切斯特', 'Chester', 'qiesite', 'CEG');
INSERT INTO `sp_place` VALUES ('4156', '374', ',2,237,374,4156,', '4', '桑德兰', 'Sunderland', 'sangdelan', 'SUN');
INSERT INTO `sp_place` VALUES ('4157', '374', ',2,237,374,4157,', '4', '圣阿本斯', 'Saint Albans', 'shengabensi', 'TBL');
INSERT INTO `sp_place` VALUES ('4158', '374', ',2,237,374,4158,', '4', '索尔斯堡', 'Salisbury', 'suoersibao', 'SLS');
INSERT INTO `sp_place` VALUES ('4159', '374', ',2,237,374,4159,', '4', '索福特', 'Salford', 'suofute', 'SLF');
INSERT INTO `sp_place` VALUES ('4160', '374', ',2,237,374,4160,', '4', '特鲁罗', 'Truro', 'teluluo', 'TRU');
INSERT INTO `sp_place` VALUES ('4161', '374', ',2,237,374,4161,', '4', '特伦特河畔斯多克', 'Stoke-on-Trent', 'teluntehepansiduoke', 'SOT');
INSERT INTO `sp_place` VALUES ('4162', '374', ',2,237,374,4162,', '4', '威尔斯', 'Wells', 'weiersi', 'WLS');
INSERT INTO `sp_place` VALUES ('4163', '374', ',2,237,374,4163,', '4', '韦克菲尔德', 'Wakefield', 'weikefeierde', 'WKF');
INSERT INTO `sp_place` VALUES ('4164', '374', ',2,237,374,4164,', '4', '温彻斯特', 'Winchester', 'wenchesite', 'WNE');
INSERT INTO `sp_place` VALUES ('4165', '374', ',2,237,374,4165,', '4', '伍尔弗汉普顿', 'Wolverhampton', 'wuerfuhanpudun', 'WOV');
INSERT INTO `sp_place` VALUES ('4166', '374', ',2,237,374,4166,', '4', '伍斯特', 'Worcester', 'wusite', 'WOR');
INSERT INTO `sp_place` VALUES ('4167', '374', ',2,237,374,4167,', '4', '谢菲尔德', 'Sheffield', 'xiefeierde', 'SHE');
INSERT INTO `sp_place` VALUES ('4168', '374', ',2,237,374,4168,', '4', '伊利', 'Ely', 'yili', 'ELY');
INSERT INTO `sp_place` VALUES ('4169', '374', ',2,237,374,4169,', '4', '约克', 'York', 'yueke', 'YOR');

-- ----------------------------
-- Table structure for `sp_place_bk`
-- ----------------------------
DROP TABLE IF EXISTS `sp_place_bk`;
CREATE TABLE `sp_place_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(50) NOT NULL COMMENT '分类',
  `parentid` int(11) DEFAULT NULL COMMENT '父id',
  `status` smallint(6) DEFAULT '0' COMMENT '状态 0正常 1已禁用',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `sp_category_parentid` (`parentid`),
  CONSTRAINT `parentid` FOREIGN KEY (`parentid`) REFERENCES `sp_place_bk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_place_bk
-- ----------------------------
INSERT INTO `sp_place_bk` VALUES ('1', '美国', null, '0', '0');
INSERT INTO `sp_place_bk` VALUES ('2', '纽约州', '1', '0', '0');
INSERT INTO `sp_place_bk` VALUES ('3', '纽约市', '2', '0', '0');
INSERT INTO `sp_place_bk` VALUES ('4', '加利福尼亚州', '1', '0', '0');
INSERT INTO `sp_place_bk` VALUES ('5', '萨克拉门托', '4', '0', '0');

-- ----------------------------
-- Table structure for `sp_search_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `sp_search_keywords`;
CREATE TABLE `sp_search_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1已禁用',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_search_keywords
-- ----------------------------
INSERT INTO `sp_search_keywords` VALUES ('1', '兰蔻', '0', '0', '0', '0');
INSERT INTO `sp_search_keywords` VALUES ('2', '口红', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `sp_sms_log`
-- ----------------------------
DROP TABLE IF EXISTS `sp_sms_log`;
CREATE TABLE `sp_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `usage` varchar(20) NOT NULL DEFAULT '' COMMENT '用途',
  `code` varchar(6) DEFAULT NULL COMMENT '验证码',
  `used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用',
  `use_time` int(11) DEFAULT '0' COMMENT '使用时间',
  `create_time` int(11) DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_sms_log
-- ----------------------------
INSERT INTO `sp_sms_log` VALUES ('66', '18767192928', 'register', '020249', '0', '0', '1508310599');
INSERT INTO `sp_sms_log` VALUES ('67', '18767192928', 'register', '529836', '0', '0', '1508310689');
INSERT INTO `sp_sms_log` VALUES ('68', '18767192928', 'register', '661417', '0', '0', '1508311277');
INSERT INTO `sp_sms_log` VALUES ('69', '18767192928', 'register', '937739', '0', '0', '1508311354');
INSERT INTO `sp_sms_log` VALUES ('70', '18767192928', 'register', '106339', '0', '0', '1508311702');
INSERT INTO `sp_sms_log` VALUES ('71', '18767192928', 'register', '549430', '0', '0', '1508311745');
INSERT INTO `sp_sms_log` VALUES ('72', '18767192928', 'register', '230791', '0', '0', '1508311810');
INSERT INTO `sp_sms_log` VALUES ('73', '18767192928', 'register', '726581', '0', '0', '1508311862');
INSERT INTO `sp_sms_log` VALUES ('74', '18745613216', 'register', '670575', '0', '0', '1508312527');
INSERT INTO `sp_sms_log` VALUES ('75', '18745613216', 'register', '482703', '1', '1508312693', '1508312538');
INSERT INTO `sp_sms_log` VALUES ('76', '18745613211', 'register', '528714', '0', '0', '1508312767');
INSERT INTO `sp_sms_log` VALUES ('77', '18767192928', 'register', '250597', '0', '0', '1508313435');
INSERT INTO `sp_sms_log` VALUES ('78', '18767192928', 'register', '409821', '0', '0', '1508313902');
INSERT INTO `sp_sms_log` VALUES ('79', '13588759671', 'register', '434707', '0', '0', '1508313947');
INSERT INTO `sp_sms_log` VALUES ('80', '18745613216', 'register', '174850', '0', '0', '1508329423');
INSERT INTO `sp_sms_log` VALUES ('81', '18745613216', 'register', '975589', '0', '0', '1508396858');

-- ----------------------------
-- Table structure for `sp_user`
-- ----------------------------
DROP TABLE IF EXISTS `sp_user`;
CREATE TABLE `sp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '手机号/用户名',
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `api_token` varchar(1000) DEFAULT NULL COMMENT '用户token',
  `login_at` int(11) DEFAULT '0',
  `login_ip` varchar(32) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `sex` int(6) DEFAULT '0' COMMENT '0女 1男 2保密',
  `image_h` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `pay_pw` varchar(255) DEFAULT NULL,
  `commission_fee` smallint(6) NOT NULL COMMENT '提现手续费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_user
-- ----------------------------
INSERT INTO `sp_user` VALUES ('3', 'zhaitailang', 'k3EdRJ6QOzCCJD-nC_ODjNxtVG7-fZyg', '$2y$13$uP2CFN0f24FHYAlMXxVIT.6MUH6vfrXASw3YNTui3iVgxxr16uz7m', null, '282586392@qq.com', '10', '10', '1500793479', '1511066997', null, '0', null, '恶趣味权威', '1', 'http://oz588ykkh.bkt.gdipper.com/1511066992', '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('4', 'zhaitailang1', 'M6lrqU_EA93Ecq1ZSAIk2diL_273qLa4', '$2y$13$gv8isE4qp8OV/VAKrgJJGON1iIAoSuoj1P7JeLDjm7.2IbCBj3utu', null, 'admin@qq.com', '10', '10', '1500795728', '1500795728', null, '0', null, 'ddiiqw', '1', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('6', 'yui', 'owK8MnOIcXvKBCZg84qdDL4Qv9OzfNLg', '$2y$13$vBQwQoyE.x3/18LpkUNDE.0o5om2VZd5F1pbK/eb9m8VI4ngizb4e', null, 'admin11@qq.com', '10', '10', '1500800122', '1500800122', null, '0', null, 'ddiiqw', '1', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('7', '18767192928', 'Qb-gPgyUWqA_0HCPvrlEzbYMdDsTKBlG', '$2y$13$pZxW.rCQurDXU/Y15iSAf.vqPI/V/uUFysKNDkBdxhT.Kq56qgh8K', null, '111@111.com', '10', '10', '1508212657', '1513431150', 'avZKy4C8wtQggpZdyxfTLf8CVA8VstNe_1513430984', '1513431150', '127.0.0.1', '宅太浪2', '1', null, '25745.88', '$2y$13$/IJwCy1V7x0ySxHHqhzoJeQjjIyUCeQfxo8QNfv38N98ZYE0aySna', '5');
INSERT INTO `sp_user` VALUES ('8', '187671929281', '0kmO5_saRtGhWuN7KZhTNSMMVSs3PMSN', '$2y$13$zLgTkCCFXuLJldPJAFb/uekiAjXxgJbSs0Pn9xbhiAzQDc.vSxobK', null, '111@111.com', '10', '10', '1508215162', '1508215162', null, '0', null, null, '1', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('9', '187671929281', 'uGrfbVeL3G8BfsoPKQtunYzjlh3xjRbV', '$2y$13$gCKY3RY6CgOqoabFHRgkrerjAI9in.o1qftko/HU0VxwT6VdjKcH2', null, '111@111.com', '10', '10', '1508215386', '1508215386', null, '0', null, null, '1', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('10', '187671929283', 'e44pHi7AQByqtAtDc6PhUP7-2dxr7TWw', '$2y$13$Sh4m7hcfqxGWGH69I0Zysu0TlFrPDD5Fpauqv2TnSHjW86Xi1836u', null, '0', '10', '10', '1508242168', '1508242168', null, '0', null, null, '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('11', '187671929284', '6EjDcJ7VY0marvBOU5-J9LM7dOsc1FNN', '$2y$13$x.v0rYnrSKRciWqMOs5hCeeBuBPVXsi1oVpzvV6bxDEyA.JNjMJo.', null, '0', '10', '10', '1508242294', '1508242294', null, '0', null, null, '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('12', '187671929285', 'kUr2aOJzKntvzIWHBhufXjIECEAi3Xzj', '$2y$13$G4Ip1dMoBqWvLvN8qCAtGOZAgyrPnf76birDinEEuxSoHyjqEUDv2', null, '0', '10', '10', '1508242349', '1508242349', null, '0', null, null, '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('13', '18767192929', 'wfJ5bXVl8LTg7BMHT9zpvX2xg9y3YG6N', '$2y$13$44xae.m4JuLnD/fbZbKIKeV.oB/NuErQ8p6mj.ci7Q5ycA6lQuaeC', null, '0', '10', '10', '1508242373', '1513430890', '3P_pCPjVCWZ4nVtPuT7Hvh7C5eGz6Bwx_1511249593', '1513430890', '127.0.0.1', '洒洒水', '0', null, '5546.00', '$2y$13$7mSSH4DRrq/xRHSCx4fLR.CQZCSRj1r2nUHyco3o4aHDrfwTuzmoy', '5');
INSERT INTO `sp_user` VALUES ('14', '18767192963', 'fkcAqbJ8yi665CsblnFvYwscUpdkCVPW', '$2y$13$KWwzzdeqPuwkcvycXoJnKOa8u96AKq4Zn6EOU.gzR.KkPYWZOqJby', null, '0', '10', '10', '1508301539', '1508317085', null, '0', null, null, '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('15', '18767192967', 'lb2AwZECl6Q7Mx6d99Uyp7YHhDsrZlwU', '$2y$13$JSDlJv736nDXwCItHXaPPOOn3iuWi6c6ZoAaKsooNViG4.Hc8ET/a', null, null, '10', '10', '1508303616', '1508303616', null, '0', null, null, '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('16', '18745613216', 'W-k1bSzAiq8P4HdDRyXcO9NZRyLU2OAB', '$2y$13$lv1SV3wEdVBuubJDCYZgle6i2kcPrD4lXH9u8N3qASEMzJ1rSQB2K', null, null, '10', '10', '1508312628', '1508312628', null, '0', null, null, '1', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('17', '18745612365', 'nSp58yVmH_rAad8IhEKyD9jWVQ_LULSA', '$2y$13$JeCbDOvrTGL25PYPpZ0xNuDz8q1ntsKC/OnR8epaVG6pIn.Y8TNTS', null, null, '10', '10', '1508325472', '1508325472', null, '0', null, null, '1', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('18', '18745612365', 'h0GLQmEWhNVNWUFiWO5BDxdTOcYeL3Xr', '$2y$13$8pFPJ9SlEsTTsHlqgMwP6u.SifjYsp6.AgqnngztIMd4NCKGjYqC2', null, null, '10', '10', '1508326122', '1508326122', null, '0', null, null, '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('19', '18745612365', 'rlL-AXkcyZUf3pwWqt0bGFV3RQouS39e', '$2y$13$YM2CR2gE/cv0YXtcBYL6oe.98KTCz2zody/mu3PX9xZJHodIqxpfO', null, null, '10', '10', '1508326213', '1508326213', null, '0', null, null, '1', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('20', '18745612365', 'ELmhF4S-tkbJJ4HR17pdJDomkSRqKKAS', '$2y$13$qPLyfe5oKJ9dPR5swk2mK.J1m4Y2643jGKjkDu5mL67qBESi7MPfS', null, null, '10', '10', '1508326229', '1508326229', null, '0', null, null, '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('21', '18745612365', 'xMXY9lLN8MI2HhSBkVdSyrzm1hLSTjcY', '$2y$13$IGfqsXgpM.eyIWWEcjQYNea1.mpMZnfGefTAJ1CpobYP3Hu87Nblu', null, null, '10', '10', '1508326279', '1508326279', null, '0', null, '点多到', '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('22', '18745612365', 'AcXr7Bc7oQYG9hUkOydlbpPDjd_VGy1V', '$2y$13$hA1aGdlHbnen5wHYcfLT/eV45lgck7MpKb7.qzZvW18pHzyGXwiEa', null, null, '10', '10', '1508326302', '1508326302', null, '0', null, '', '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('23', '18745612365', 'G4TfSHu5bpZ0mHDQAHcnrDYjb7VwX-Sh', '$2y$13$pwUXqOt31uQCykQbA6Ium.9bbRtcS/97hofeLtd9J/R6TaNN0g6HO', null, null, '10', '10', '1508326308', '1508326308', null, '0', null, '', '0', null, '0.00', null, '5');
INSERT INTO `sp_user` VALUES ('24', '18745612365', '2uLPR_QSpMx03DoihagUdAutnmlfMPDf', '$2y$13$wdy60RwvNLMW4GWvwpMBUOVIKlB170UzoD.lqCAy5CtC3/toeuVGC', null, null, '10', '10', '1508326474', '1508326474', null, '0', null, '', '0', null, '0.00', null, '5');

-- ----------------------------
-- Table structure for `sp_user_account`
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_account`;
CREATE TABLE `sp_user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '关联用户id',
  `type` smallint(6) NOT NULL COMMENT '提现账户类型 1支付宝 2银联',
  `account` varchar(50) NOT NULL,
  `realname` varchar(50) NOT NULL,
  `account_bank` varchar(100) DEFAULT NULL,
  `status` smallint(6) NOT NULL COMMENT '账户状态 0正常 1用户已删除',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_user_account
-- ----------------------------
INSERT INTO `sp_user_account` VALUES ('1', '7', '1', 'abcd@163.com', '哈哈哈', '', '0', '0', '1511424431');
INSERT INTO `sp_user_account` VALUES ('2', '7', '1', 'abcd1@163.com', '哈哈哈', '', '0', '1511423588', '1511423588');
INSERT INTO `sp_user_account` VALUES ('3', '7', '1', 'abcd11@163.com', '哈哈哈', '', '0', '1511603829', '1511603829');
INSERT INTO `sp_user_account` VALUES ('4', '7', '1', 'abcd1222@163.com', '哈哈哈', '', '0', '1511605279', '1511605279');

-- ----------------------------
-- Table structure for `sp_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_address`;
CREATE TABLE `sp_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `name` varchar(100) NOT NULL COMMENT '收货人',
  `country_id` int(11) NOT NULL DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `csc_name` varchar(500) NOT NULL DEFAULT '' COMMENT '州市名称中文',
  `csc_name_en` varchar(500) NOT NULL DEFAULT '' COMMENT '州市名称英文',
  `street` varchar(500) NOT NULL COMMENT '街道',
  `phone` varchar(50) NOT NULL COMMENT '收货人电话',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 0 正常 1默认 2已删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_user_address
-- ----------------------------
INSERT INTO `sp_user_address` VALUES ('32', '0', '转运公司1', '140', '356', '4021', '纽约 纽约市', 'New York,NY', '转运地址111', '12315454', '0');
INSERT INTO `sp_user_address` VALUES ('33', '0', '转运公司1', '140', '356', '4021', '纽约 纽约市', 'New York,NY', '转运地址2222', '546546464', '0');
INSERT INTO `sp_user_address` VALUES ('34', '13', '仓库', '140', '355', '4012', '内华达 北拉斯维加斯', 'North Las Vegas,NV', '大道东', '18767192928', '1');

-- ----------------------------
-- Table structure for `sp_user_tradelog`
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_tradelog`;
CREATE TABLE `sp_user_tradelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '类型 1收入 2支出 3提现 4提现手续费',
  `money` decimal(12,2) NOT NULL COMMENT '金额',
  `order_num` varchar(128) NOT NULL COMMENT '订单号',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_user_tradelog
-- ----------------------------
INSERT INTO `sp_user_tradelog` VALUES ('1', '7', '1', '2163.00', '20171029154200732727000013', '1509291747');
INSERT INTO `sp_user_tradelog` VALUES ('2', '13', '2', '-2163.00', '20171029140729451181000013', '1509307437');
INSERT INTO `sp_user_tradelog` VALUES ('3', '13', '2', '-2163.00', '20171029140729451181000013', '1509307742');
INSERT INTO `sp_user_tradelog` VALUES ('4', '13', '2', '-128.00', '20171031213859042508000013', '1509552026');
INSERT INTO `sp_user_tradelog` VALUES ('5', '7', '1', '2163.00', '20171029154200732727000013', '1511249652');
INSERT INTO `sp_user_tradelog` VALUES ('6', '7', '1', '2163.00', '20171029154200732727000013', '1511249692');
INSERT INTO `sp_user_tradelog` VALUES ('7', '7', '1', '2163.00', '20171029154344136863000013', '1513438181');
INSERT INTO `sp_user_tradelog` VALUES ('8', '7', '1', '2163.00', '20171029154344136863000013', '1513438201');
INSERT INTO `sp_user_tradelog` VALUES ('9', '7', '1', '2163.00', '20171029154344136863000013', '1513438265');
INSERT INTO `sp_user_tradelog` VALUES ('11', '7', '1', '2163.00', '20171029154344136863000013', '1513438423');
INSERT INTO `sp_user_tradelog` VALUES ('12', '7', '1', '2163.00', '20171029154344136863000013', '1513438530');
INSERT INTO `sp_user_tradelog` VALUES ('13', '7', '1', '2163.00', '20171029154344136863000013', '1513438546');
INSERT INTO `sp_user_tradelog` VALUES ('14', '7', '1', '2163.00', '20171029154344136863000013', '1513438654');
INSERT INTO `sp_user_tradelog` VALUES ('15', '7', '1', '2163.00', '20171029154344136863000013', '1513440841');

-- ----------------------------
-- Table structure for `sp_user_withdrawalsapply`
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_withdrawalsapply`;
CREATE TABLE `sp_user_withdrawalsapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '用户账户id',
  `user_id` int(11) NOT NULL,
  `money_w` decimal(12,2) NOT NULL COMMENT '提现总额',
  `commission_fee` smallint(6) NOT NULL COMMENT '手续费比例',
  `commission_money` varchar(20) NOT NULL COMMENT '手续费',
  `user_money` varchar(20) NOT NULL COMMENT '用户应得金额',
  `status` smallint(6) NOT NULL COMMENT '状态 0待审核 1审核通过 2审核拒绝',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '审核时间',
  `complete_at` int(11) DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_user_withdrawalsapply
-- ----------------------------
INSERT INTO `sp_user_withdrawalsapply` VALUES ('6', '1', '7', '100.00', '5', '5', '95', '2', '1511506441', '1511625579', '1511626071');
INSERT INTO `sp_user_withdrawalsapply` VALUES ('7', '1', '7', '100.00', '5', '5', '95', '3', '1511506443', '1511625600', '1511624773');
INSERT INTO `sp_user_withdrawalsapply` VALUES ('8', '1', '7', '100.00', '5', '5', '95', '1', '1511510416', '1511626119', null);
INSERT INTO `sp_user_withdrawalsapply` VALUES ('9', '1', '7', '100.01', '5', '5.0005', '95.0095', '0', '1511510446', '1511625528', null);
