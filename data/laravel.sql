# ************************************************************
# Sequel Pro SQL dump
# Version 4540
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.1.2 (MySQL 5.7.20)
# Database: laravel
# Generation Time: 2020-04-10 09:14:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `face` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;

INSERT INTO `admins` (`id`, `username`, `nickname`, `face`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','超级管理员','uploads/face/20180226/UM6o9TFgypkvZxOsPHl2WW3vzDyLjpF9dSRWkkpf.png','$2y$10$W8/BoVEjYIaS4XMknhfAcOj69qBX62yZWFjCQx5AAJYLpnX0IbPwu','PuTGJwMR1dUv7iE8ZKcJIbHAmvkuTzzuGfRng7OM8XKmztswkgsaBeBt9SqN','2018-02-26 11:41:58','2018-02-26 15:50:07'),
	(3,'test','test',NULL,'$2y$10$W8/BoVEjYIaS4XMknhfAcOj69qBX62yZWFjCQx5AAJYLpnX0IbPwu',NULL,'2018-02-26 13:05:29','2018-02-26 13:05:29');

/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(3,'2014_10_12_000000_create_users_table',1),
	(4,'2018_01_26_140141_create_admins_table',2),
	(5,'2018_02_01_133631_alter_users_deleted_at',3),
	(10,'2018_01_30_100001_create_admin_table',4),
	(11,'2018_01_30_145345_create_auth_group_table',4),
	(12,'2018_01_30_145745_create_auth_group_access_table',4),
	(13,'2018_01_30_150253_create_auth_rule_table',4),
	(14,'2018_01_01_000000_create_permission_tables',5);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`)
VALUES
	(1,1,'App\\Model\\Admin'),
	(3,1,'App\\Model\\Admin');

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `param` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `is_menu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `guard_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `pid`, `name`, `param`, `title`, `icon`, `sort`, `is_menu`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,0,'/',NULL,'控制台','fa fa-dashboard',0,1,'admin','2018-02-24 11:01:30','2018-02-24 17:14:01'),
	(2,0,'rbac',NULL,'RBAC管理','fa fa-sitemap',1,1,'admin',NULL,'2018-02-24 18:06:22'),
	(3,2,'permission',NULL,'权限列表','fa fa-puzzle-piece',0,1,'admin','2018-02-24 14:55:32','2018-02-24 17:15:35'),
	(4,3,'add-permission',NULL,'增加权限',NULL,0,0,'admin','2018-02-24 14:55:49','2018-02-24 14:55:49'),
	(5,3,'edit-permission',NULL,'修改权限',NULL,0,0,'admin','2018-02-24 14:55:55','2018-02-24 18:16:40'),
	(6,3,'delete-permission',NULL,'删除权限',NULL,0,0,'admin','2018-02-24 14:56:01','2018-02-24 14:56:01'),
	(11,2,'roles',NULL,'角色管理','fa fa-users',0,1,'admin','2018-02-24 18:08:52','2018-02-24 18:13:46'),
	(12,11,'add-role',NULL,'添加角色',NULL,0,0,'admin','2018-02-24 18:15:41','2018-02-24 18:15:41'),
	(13,11,'edit-role','id=1','编辑角色',NULL,0,0,'admin','2018-02-24 18:15:59','2018-02-24 18:15:59'),
	(14,11,'delete-role',NULL,'删除角色',NULL,0,0,'admin','2018-02-24 18:16:14','2018-02-24 18:16:14'),
	(15,3,'sort-permission',NULL,'排序',NULL,0,0,'admin','2018-02-24 18:17:07','2018-02-24 18:17:07'),
	(16,3,'menu-permission',NULL,'设置菜单',NULL,0,0,'admin','2018-02-24 18:17:27','2018-02-24 18:17:27'),
	(17,2,'admin-users',NULL,'管理员管理','fa fa-user',0,1,'admin','2018-02-24 18:22:58','2018-02-24 18:24:08'),
	(18,17,'add-admin',NULL,'添加',NULL,0,0,'admin','2018-02-24 18:23:15','2018-02-24 18:23:15'),
	(19,17,'edit-admin',NULL,'修改',NULL,0,0,'admin','2018-02-24 18:23:32','2018-02-24 18:23:32'),
	(20,17,'delete-admin',NULL,'删除',NULL,0,0,'admin','2018-02-24 18:23:46','2018-02-24 18:23:46'),
	(21,17,'status-admin',NULL,'设置状态',NULL,0,0,'admin','2018-02-24 18:24:03','2018-02-24 18:24:03'),
	(22,0,'me',NULL,'个人中心',NULL,0,0,'admin','2018-02-26 16:06:50','2018-02-26 16:06:50'),
	(23,11,'assign-permission',NULL,'分配权限',NULL,0,0,'admin','2018-02-27 14:43:06','2018-02-27 14:43:06');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(13,3),
	(14,3),
	(16,3),
	(17,3),
	(18,3),
	(19,3);

/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `title`, `remark`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'super admin','超级管理员','','admin','2018-02-24 10:59:20','2018-02-24 10:59:20'),
	(2,'admin','管理员',NULL,'admin','2018-02-24 10:59:59','2018-02-24 10:59:59'),
	(3,'test','测试','测试','admin','2018-02-26 09:55:09','2018-02-26 10:12:36');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sms`;

CREATE TABLE `sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '接收信息的手机号',
  `type` varchar(32) NOT NULL COMMENT '短信类型： 1:注册  2:修改密码',
  `status` tinyint(1) NOT NULL COMMENT '发送状态  1:成功  2:失败',
  `content` varchar(255) NOT NULL COMMENT '发送内容',
  `send_time` int(11) DEFAULT NULL COMMENT '发送的时间',
  `sms_ret_msg` varchar(100) DEFAULT NULL COMMENT '发送短信的返回',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录短信的发送历史';


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `nickname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户状态',
  `created_at` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `updated_at` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;