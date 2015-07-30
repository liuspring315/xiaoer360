CREATE DATABASE  IF NOT EXISTS `xiaoer360` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `xiaoer360`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: xiaoer360
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `flow_data_order`
--

DROP TABLE IF EXISTS `flow_data_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_data_order` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `service_provider_id` int(32) DEFAULT NULL,
  `cstmr_id` int(32) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `packageid` varchar(50) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `fscg_order_id` varchar(50) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `order_type` int(32) DEFAULT NULL,
  `order_stat` int(32) DEFAULT NULL,
  `cstmr_remarks` varchar(50) DEFAULT NULL,
  `ct` datetime DEFAULT NULL,
  `ut` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_data_order`
--

LOCK TABLES `flow_data_order` WRITE;
/*!40000 ALTER TABLE `flow_data_order` DISABLE KEYS */;
INSERT INTO `flow_data_order` VALUES (1,6,0,'13412341234','YD200','1438262809138',NULL,'',1,0,'test','2015-07-30 21:26:49','2015-07-30 21:26:49');
/*!40000 ALTER TABLE `flow_data_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_request_log`
--

DROP TABLE IF EXISTS `flow_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_request_log` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `seqno` varchar(100) DEFAULT NULL,
  `msg` text,
  `ct` datetime DEFAULT NULL,
  `ut` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_request_log`
--

LOCK TABLES `flow_request_log` WRITE;
/*!40000 ALTER TABLE `flow_request_log` DISABLE KEYS */;
INSERT INTO `flow_request_log` VALUES (1,'SEQNO_1438262809138','Request:{\"HEADER\":{\"VERSION\":\"v1.0\",\"TIMESTAMP\":\"20150730212649\",\"SEQNO\":\"SEQNO_1438262809138\",\"APPID\":\"jiubai_api\",\"SECERTKEY\":\"BAA6CE30429A23F139FD93F54C4300E4\"},\"MSGBODY\":{\"CONTENT\":{\"SIGN\":\"4419910DD612B076421C63D206C14D54\",\"USER\":\"13412341234\",\"PACKAGEID\":\"YD200\",\"ORDERTYPE\":\"1\",\"EXTORDER\":\"EXTORDER_1438262809138\",\"NOTE\":\"test\"}}}',NULL,NULL);
/*!40000 ALTER TABLE `flow_request_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_response_log`
--

DROP TABLE IF EXISTS `flow_response_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_response_log` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `seqno` varchar(100) DEFAULT NULL,
  `msg` text,
  `ct` datetime DEFAULT NULL,
  `ut` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_response_log`
--

LOCK TABLES `flow_response_log` WRITE;
/*!40000 ALTER TABLE `flow_response_log` DISABLE KEYS */;
INSERT INTO `flow_response_log` VALUES (1,'SEQNO_1438262809138','Response:{\"HEADER\":{\"VERSION\":\"v1.0\",\"TIMESTAMP\":\"20150730212649\",\"SEQNO\":\"SEQNO_1438262809138\",\"APPID\":\"jiubai_api\",\"SECERTKEY\":\"BAA6CE30429A23F139FD93F54C4300E4\"},\"MSGBODY\":{\"RESP\":{\"RCODE\":\"04\",\"RMSG\":\"套餐包ID非法\"}}}',NULL,NULL);
/*!40000 ALTER TABLE `flow_response_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_permission`
--

DROP TABLE IF EXISTS `t_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_permission` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ismenu` tinyint(1) DEFAULT NULL,
  `al` varchar(50) DEFAULT NULL,
  `dt` varchar(500) DEFAULT NULL,
  `ct` datetime DEFAULT NULL,
  `ut` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

LOCK TABLES `t_permission` WRITE;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` VALUES (1,'manager:user:list',1,'用户列表','/manager/user/list',NULL,'2015-06-10 00:11:14'),(2,'manager:authority:users:list',1,'用户权限','/manager/authority/users/list',NULL,'2015-06-10 21:32:50'),(3,'manager:authority:roles:list',1,'角色列表','/manager/authority/roles/list',NULL,'2015-06-10 21:12:51'),(4,'manager:authority:permissions:list',1,'权限列表','/manager/authority/permissions/list',NULL,'2015-06-10 00:14:53'),(5,'customer:list',0,NULL,NULL,NULL,NULL),(6,'manager:flowdata:order:list',1,'流量订单列表','/manager/flowdata/orders/list',NULL,'2015-07-29 21:50:23'),(7,'manager:user:update',0,'用户修改','',NULL,'2015-06-10 22:31:18'),(8,'manager:user:delete',0,'用户删除','',NULL,'2015-06-10 22:32:06'),(9,'manager:user:query',0,'用户查询','',NULL,'2015-06-10 22:32:49'),(16,'manager:authority:users:update',0,'用户修改','',NULL,'2015-06-12 13:53:42'),(17,'manager:authority:roles:add',0,'角色新增','',NULL,'2015-06-12 13:53:53'),(18,'manager:authority:roles:delete',0,'角色删除','',NULL,'2015-06-12 13:54:02'),(19,'manager:authority:roles:update',0,'角色修改','',NULL,'2015-06-12 13:54:12'),(20,'manager:authority:permissions:add',0,'权限新增','',NULL,'2015-06-12 13:54:23'),(21,'manager:authority:permissions:update',0,'权限修改','',NULL,'2015-06-13 00:58:05'),(23,'manager:authority:permission:delete',0,'权限删除','',NULL,'2015-06-13 00:58:14'),(35,'manager:flowdata:order:add',0,'流量订单',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `al` varchar(50) DEFAULT NULL,
  `dt` varchar(500) DEFAULT NULL,
  `ct` datetime DEFAULT NULL,
  `ut` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'admin',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_permission`
--

DROP TABLE IF EXISTS `t_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_permission` (
  `role_id` bigint(64) DEFAULT NULL,
  `permission_id` bigint(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_permission`
--

LOCK TABLES `t_role_permission` WRITE;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` VALUES (1,23),(1,20),(1,4),(1,21),(1,17),(1,18),(1,3),(1,19),(1,2),(1,16),(1,35),(1,6),(1,8),(1,1),(1,9),(1,7);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_permission`
--

DROP TABLE IF EXISTS `t_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_permission` (
  `u_id` int(32) DEFAULT NULL,
  `permission_id` bigint(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_permission`
--

LOCK TABLES `t_user_permission` WRITE;
/*!40000 ALTER TABLE `t_user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_role` (
  `u_id` int(32) DEFAULT NULL,
  `role_id` bigint(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` VALUES (6,1);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_general_info`
--

DROP TABLE IF EXISTS `user_general_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_general_info` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `user_type` int(32) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `family_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `location` int(32) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `head_thumb` mediumblob,
  `begin_time` datetime DEFAULT NULL,
  `gender` int(32) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `register_check_state` int(32) DEFAULT NULL,
  `authentication_stat` int(32) DEFAULT NULL,
  `ct` datetime DEFAULT NULL,
  `ut` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_general_info`
--

LOCK TABLES `user_general_info` WRITE;
/*!40000 ALTER TABLE `user_general_info` DISABLE KEYS */;
INSERT INTO `user_general_info` VALUES (6,0,'a1','a1?.com','aa52864d7252d01f460de82cc2f6f142d7fe24cadc46f6f2d45022c54d85d5db','a1','a1','13412341234',NULL,NULL,'2015-06-10 21:54:46',NULL,'2015-06-10 21:54:46',NULL,'1bb87a2bcec343ca9dff4a9944d514a8',1,0,'2015-06-10 21:54:46','2015-06-10 21:54:46');
/*!40000 ALTER TABLE `user_general_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-30 21:30:49
