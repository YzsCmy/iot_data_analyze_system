-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: data_analyze_sys
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('quartzScheduler','1829741906094006272','1829740771044040704','0 0/1 7-22 * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('quartzScheduler','1829741906094006272','1829740771044040704',NULL,'com.yzs.generation.job.CommonJob','0','0','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0minsr\0java.lang.Integer⠤\���8\0I\0valuexr\0java.lang.Number����\��\0\0xp���\�t\0datasr\0com.yzs.common.model.Device��h\�)���\0L\0createdTimet\0Ljava/util/Date;L\0idt\0Ljava/lang/String;L\0nameq\0~\0L\0pointIdq\0~\0L\0	pointNameq\0~\0L\0statust\0Ljava/lang/Integer;L\0	statusStrq\0~\0L\0typeIdq\0~\0L\0typeNameq\0~\0L\0unitIdq\0~\0L\0unitNameq\0~\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0���J�xt\01829741906094006272t\0温度传感器1t\01829740771044040704psq\0~\0\0\0\0t\0正常t\01829741645690642432pt\01pt\0maxsq\0~\0\0\0\0Px\0');
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('quartzScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('quartzScheduler','1829741906094006272','1829740771044040704','1829741906094006272','1829740771044040704',NULL,1725085260000,1725085200000,5,'WAITING','CRON',1725080019000,0,NULL,2,'');
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `type_id` varchar(255) DEFAULT NULL,
  `point_id` varchar(255) DEFAULT NULL,
  `unit_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES ('1829741906094006272','温度传感器1',1,'2024-08-31 12:44:00','1829741645690642432','1829740771044040704','1');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_data`
--

DROP TABLE IF EXISTS `device_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_data` (
  `id` varchar(255) NOT NULL,
  `value` float DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type_id` varchar(255) DEFAULT NULL,
  `point_id` varchar(255) DEFAULT NULL,
  `unit_id` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_data`
--

LOCK TABLES `device_data` WRITE;
/*!40000 ALTER TABLE `device_data` DISABLE KEYS */;
INSERT INTO `device_data` VALUES ('1829744674984763392',-11,'2024-08-31 12:55:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829745932651012096',31,'2024-08-31 13:00:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829747191026098176',56,'2024-08-31 13:05:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829748449254383616',9,'2024-08-31 13:10:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829749708376047616',21,'2024-08-31 13:15:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829749959220592640',3,'2024-08-31 13:16:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829750210891415552',17,'2024-08-31 13:17:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829750462532878336',-20,'2024-08-31 13:18:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829750714245644288',17,'2024-08-31 13:19:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829750965849358336',80,'2024-08-31 13:20:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829751217532764160',16,'2024-08-31 13:21:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829751469107118080',-20,'2024-08-31 13:22:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829751720832466944',-17,'2024-08-31 13:23:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829751972457152512',-13,'2024-08-31 13:24:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829752224090226688',20,'2024-08-31 13:25:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829752475773632512',74,'2024-08-31 13:26:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829752727465426944',46,'2024-08-31 13:27:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829752979098501120',65,'2024-08-31 13:28:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829753230781906944',76,'2024-08-31 13:29:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829753482477895680',67,'2024-08-31 13:30:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829753734274547712',5,'2024-08-31 13:31:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829753985723072512',41,'2024-08-31 13:32:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829754237402284032',44,'2024-08-31 13:33:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829754489060524032',19,'2024-08-31 13:34:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829754740727152640',3,'2024-08-31 13:35:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829754992385392640',10,'2024-08-31 13:36:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829755244031049728',-11,'2024-08-31 13:37:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829755495651540992',-15,'2024-08-31 13:38:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829755747339141120',9,'2024-08-31 13:39:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829755999064489984',27,'2024-08-31 13:40:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829756250701758464',-4,'2024-08-31 13:41:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829756502318055424',-4,'2024-08-31 13:42:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829756753988878336',-21,'2024-08-31 13:43:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829757005928161280',22,'2024-08-31 13:44:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829757257280217088',-1,'2024-08-31 13:45:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829757508946845696',58,'2024-08-31 13:46:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829757760571531264',63,'2024-08-31 13:47:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829758012238159872',50,'2024-08-31 13:48:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829758263963508736',80,'2024-08-31 13:49:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829758515584000000',38,'2024-08-31 13:50:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829758767242240000',10,'2024-08-31 13:51:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829759018862731264',51,'2024-08-31 13:52:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829759270541942784',-9,'2024-08-31 13:53:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829759522191794176',-27,'2024-08-31 13:54:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829759773841645568',48,'2024-08-31 13:55:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829760025491496960',13,'2024-08-31 13:56:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829760277166514176',74,'2024-08-31 13:57:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829760528787005440',69,'2024-08-31 13:58:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829760782609481728',63,'2024-08-31 13:59:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829761034045394944',-22,'2024-08-31 14:00:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829761283782643712',55,'2024-08-31 14:01:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829761535487021056',63,'2024-08-31 14:02:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829761787124289536',19,'2024-08-31 14:03:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829762038769946624',51,'2024-08-31 14:04:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829762290386243584',50,'2024-08-31 14:05:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829762542342283264',-28,'2024-08-31 14:06:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829762793727893504',57,'2024-08-31 14:07:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829763045457436672',-12,'2024-08-31 14:08:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829763297052762112',3,'2024-08-31 14:09:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829763548669059072',18,'2024-08-31 14:10:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829763802395082752',62,'2024-08-31 14:11:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829764052052639744',77,'2024-08-31 14:12:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829764305787068416',57,'2024-08-31 14:13:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829764555335573504',-11,'2024-08-31 14:14:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829764806998007808',-2,'2024-08-31 14:15:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829765058698190848',-14,'2024-08-31 14:16:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829765345827643392',-12,'2024-08-31 14:17:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829765561951739904',3,'2024-08-31 14:18:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829765813731614720',34,'2024-08-31 14:19:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272'),('1829766065280802816',71,'2024-08-31 14:20:00',1,'1829741645690642432','1829740771044040704','1','1829741906094006272');
/*!40000 ALTER TABLE `device_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_type`
--

DROP TABLE IF EXISTS `device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_type` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_type`
--

LOCK TABLES `device_type` WRITE;
/*!40000 ALTER TABLE `device_type` DISABLE KEYS */;
INSERT INTO `device_type` VALUES ('1829741645690642432','温度','℃'),('1829741686845153280','湿度',NULL),('1829741717513904128','光照',NULL),('1829741746911780864','气体',NULL);
/*!40000 ALTER TABLE `device_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_point`
--

DROP TABLE IF EXISTS `measure_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure_point` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `unit_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_point`
--

LOCK TABLES `measure_point` WRITE;
/*!40000 ALTER TABLE `measure_point` DISABLE KEYS */;
INSERT INTO `measure_point` VALUES ('1829740771044040704','test1',1,'1');
/*!40000 ALTER TABLE `measure_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('1','ADMIN','admin'),('2','ROOT','root');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `role_id` varchar(255) NOT NULL,
  `permission_id` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syslog`
--

DROP TABLE IF EXISTS `syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syslog` (
  `id` varchar(255) NOT NULL,
  `visit_time` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `execution_time` bigint(20) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syslog`
--

LOCK TABLES `syslog` WRITE;
/*!40000 ALTER TABLE `syslog` DISABLE KEYS */;
INSERT INTO `syslog` VALUES ('1829722400881692672','2024-08-31 11:26:29','admin','0:0:0:0:0:0:0:1','/home/main.do',145,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829722411984015360','2024-08-31 11:26:32','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',103,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829722423304441856','2024-08-31 11:26:35','admin','0:0:0:0:0:0:0:1','/user/addUser.do',0,'[类名]com.yzs.manage.web.controller.UserController[方法名]toSave'),('1829722430095020032','2024-08-31 11:26:37','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',22,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829722437288251392','2024-08-31 11:26:38','admin','0:0:0:0:0:0:0:1','/unit/show.do',26,'[类名]com.yzs.manage.web.controller.UnitController[方法名]show'),('1829722440421396480','2024-08-31 11:26:39','admin','0:0:0:0:0:0:0:1','/measurePoint/findAllInUnit.do',16,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAllInUnit'),('1829722446289227776','2024-08-31 11:26:40','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',17,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829722449212657664','2024-08-31 11:26:41','admin','0:0:0:0:0:0:0:1','/device/findAll.do',17,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829722472780451840','2024-08-31 11:26:47','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829722472897892352','2024-08-31 11:26:47','admin','0:0:0:0:0:0:0:1','/device/findByUnitId.do',0,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findByUnitId'),('1829722482167304192','2024-08-31 11:26:49','admin','0:0:0:0:0:0:0:1','/home/main.do',18,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829722488202907648','2024-08-31 11:26:50','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',19,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829722501565960192','2024-08-31 11:26:54','admin','0:0:0:0:0:0:0:1','/user/findUserByIdAndAllRole.do',26,'[类名]com.yzs.manage.web.controller.UserController[方法名]findUserByIdAndAllRole'),('1829722506884337664','2024-08-31 11:26:55','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',21,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829722519131705344','2024-08-31 11:26:58','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',15,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829722556616200192','2024-08-31 11:27:07','admin','0:0:0:0:0:0:0:1','/user/addUser.do',0,'[类名]com.yzs.manage.web.controller.UserController[方法名]toSave'),('1829722561959743488','2024-08-31 11:27:08','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',19,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829722611007934464','2024-08-31 11:27:20','admin','0:0:0:0:0:0:0:1','/user/findById.do',15,'[类名]com.yzs.manage.web.controller.UserController[方法名]findById'),('1829722670088900608','2024-08-31 11:27:34','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',21,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829722680268476416','2024-08-31 11:27:36','admin','0:0:0:0:0:0:0:1','/user/findUserByIdAndAllRole.do',7,'[类名]com.yzs.manage.web.controller.UserController[方法名]findUserByIdAndAllRole'),('1829722697590951936','2024-08-31 11:27:40','admin','0:0:0:0:0:0:0:1','/user/findUserByIdAndAllRole.do',0,'[类名]com.yzs.manage.web.controller.UserController[方法名]findUserByIdAndAllRole'),('1829722705165864960','2024-08-31 11:27:42','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',17,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829722738447667200','2024-08-31 11:27:50','admin','0:0:0:0:0:0:0:1','/user/edit.do',13,'[类名]com.yzs.manage.web.controller.UserController[方法名]edit'),('1829722772517998592','2024-08-31 11:27:58','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',23,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829722823583649792','2024-08-31 11:28:10','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',8,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829722823751421952','2024-08-31 11:28:10','admin','0:0:0:0:0:0:0:1','/device/findByUnitId.do',1,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findByUnitId'),('1829722838045609984','2024-08-31 11:28:14','admin','0:0:0:0:0:0:0:1','/home/main.do',18,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829722859453337600','2024-08-31 11:28:19','admin','0:0:0:0:0:0:0:1','/home/main.do',17,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829722866973724672','2024-08-31 11:28:21','admin','0:0:0:0:0:0:0:1','/user/findAllInUnit.do',19,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAllInUnit'),('1829723665116221440','2024-08-31 11:31:31','admin','0:0:0:0:0:0:0:1','/home/main.do',67,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829723674360467456','2024-08-31 11:31:33','admin','0:0:0:0:0:0:0:1','/home/main.do',17,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829723683831205888','2024-08-31 11:31:35','admin','0:0:0:0:0:0:0:1','/user/findAll.do',14,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829723687052431360','2024-08-31 11:31:36','admin','0:0:0:0:0:0:0:1','/role/findAll.do',13,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829723708942503936','2024-08-31 11:31:41','admin','0:0:0:0:0:0:0:1','/role/findAll.do',8,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829723713765953536','2024-08-31 11:31:43','admin','0:0:0:0:0:0:0:1','/permission/findAll.do',14,'[类名]com.yzs.manage.web.controller.PermissionController[方法名]findAll'),('1829723742081699840','2024-08-31 11:31:49','admin','0:0:0:0:0:0:0:1','/permission/findAll.do',11,'[类名]com.yzs.manage.web.controller.PermissionController[方法名]findAll'),('1829723869701787648','2024-08-31 11:32:20','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',8,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829723887284310016','2024-08-31 11:32:24','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',7,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829723904032165888','2024-08-31 11:32:28','admin','0:0:0:0:0:0:0:1','/job/list.do',19,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829723911464472576','2024-08-31 11:32:30','admin','0:0:0:0:0:0:0:1','/job/list.do',11,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829732962185302016','2024-08-31 12:08:27','admin','0:0:0:0:0:0:0:1','/home/main.do',145,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829733890808401920','2024-08-31 12:12:09','admin','0:0:0:0:0:0:0:1','/home/main.do',69,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829733892645507072','2024-08-31 12:12:09','admin','0:0:0:0:0:0:0:1','/home/pie.do',12,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829733892683255808','2024-08-31 12:12:09','admin','0:0:0:0:0:0:0:1','/home/pie.do',32,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829734888692043776','2024-08-31 12:16:07','admin','0:0:0:0:0:0:0:1','/home/main.do',30,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829734890055192576','2024-08-31 12:16:07','admin','0:0:0:0:0:0:0:1','/home/pie.do',11,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829734890097135616','2024-08-31 12:16:07','admin','0:0:0:0:0:0:0:1','/home/pie.do',25,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829735371313827840','2024-08-31 12:18:02','admin','0:0:0:0:0:0:0:1','/permission/findAll.do',14,'[类名]com.yzs.manage.web.controller.PermissionController[方法名]findAll'),('1829735374266617856','2024-08-31 12:18:03','admin','0:0:0:0:0:0:0:1','/role/findAll.do',15,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829735377710141440','2024-08-31 12:18:04','admin','0:0:0:0:0:0:0:1','/user/findAll.do',20,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829735383246622720','2024-08-31 12:18:05','admin','0:0:0:0:0:0:0:1','/role/findAll.do',12,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829735385117282304','2024-08-31 12:18:05','admin','0:0:0:0:0:0:0:1','/permission/findAll.do',11,'[类名]com.yzs.manage.web.controller.PermissionController[方法名]findAll'),('1829735400283885568','2024-08-31 12:18:09','admin','0:0:0:0:0:0:0:1','/job/list.do',19,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829735652151840768','2024-08-31 12:19:09','admin','0:0:0:0:0:0:0:1','/home/main.do',19,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829735652743237632','2024-08-31 12:19:09','admin','0:0:0:0:0:0:0:1','/home/data.do',9,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829735652760014848','2024-08-31 12:19:09','admin','0:0:0:0:0:0:0:1','/home/data.do',13,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829735678399795200','2024-08-31 12:19:15','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',11,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829735686398332928','2024-08-31 12:19:17','admin','0:0:0:0:0:0:0:1','/unit/addUnit.do',0,'[类名]com.yzs.manage.web.controller.UnitController[方法名]toSave'),('1829736378441715712','2024-08-31 12:22:02','admin','0:0:0:0:0:0:0:1','/unit/save.do',20,'[类名]com.yzs.manage.web.controller.UnitController[方法名]save'),('1829736383718150144','2024-08-31 12:22:03','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829736393675427840','2024-08-31 12:22:06','admin','0:0:0:0:0:0:0:1','/unit/show.do',19,'[类名]com.yzs.manage.web.controller.UnitController[方法名]show'),('1829736577511772160','2024-08-31 12:22:50','admin','0:0:0:0:0:0:0:1','/unit/edit.do',14,'[类名]com.yzs.manage.web.controller.UnitController[方法名]edit'),('1829736936837795840','2024-08-31 12:24:15','admin','0:0:0:0:0:0:0:1','/unit/show.do',27,'[类名]com.yzs.manage.web.controller.UnitController[方法名]show'),('1829737061425401856','2024-08-31 12:24:45','admin','0:0:0:0:0:0:0:1','/unit/edit.do',21,'[类名]com.yzs.manage.web.controller.UnitController[方法名]edit'),('1829737597671362560','2024-08-31 12:26:53','admin','0:0:0:0:0:0:0:1','/user/findAll.do',16,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829737619393662976','2024-08-31 12:26:58','admin','0:0:0:0:0:0:0:1','/user/findById.do',22,'[类名]com.yzs.manage.web.controller.UserController[方法名]findById'),('1829737672753598464','2024-08-31 12:27:11','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',12,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829737686825488384','2024-08-31 12:27:14','admin','0:0:0:0:0:0:0:1','/unit/edit.do',14,'[类名]com.yzs.manage.web.controller.UnitController[方法名]edit'),('1829737699592949760','2024-08-31 12:27:17','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',12,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829737709835440128','2024-08-31 12:27:20','admin','0:0:0:0:0:0:0:1','/unit/addUnit.do',0,'[类名]com.yzs.manage.web.controller.UnitController[方法名]toSave'),('1829738099209457664','2024-08-31 12:28:52','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',12,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829738109967847424','2024-08-31 12:28:55','admin','0:0:0:0:0:0:0:1','/home/main.do',18,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829738110592798720','2024-08-31 12:28:55','admin','0:0:0:0:0:0:0:1','/home/pie.do',9,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829738110605381632','2024-08-31 12:28:55','admin','0:0:0:0:0:0:0:1','/home/pie.do',11,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829738118553587712','2024-08-31 12:28:57','admin','0:0:0:0:0:0:0:1','/home/main.do',26,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829738119581192192','2024-08-31 12:28:57','admin','0:0:0:0:0:0:0:1','/home/pie.do',8,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829738119593775104','2024-08-31 12:28:57','admin','0:0:0:0:0:0:0:1','/home/pie.do',11,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829738511400509440','2024-08-31 12:30:31','admin','0:0:0:0:0:0:0:1','/home/main.do',105,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829738583668367360','2024-08-31 12:30:31','admin','0:0:0:0:0:0:0:1','/home/data.do',16,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829738583685144576','2024-08-31 12:30:31','admin','0:0:0:0:0:0:0:1','/home/data.do',16737,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829738674231779328','2024-08-31 12:31:09','admin','0:0:0:0:0:0:0:1','/home/main.do',45,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829738694922280960','2024-08-31 12:31:10','admin','0:0:0:0:0:0:0:1','/home/data.do',4741,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829738695056498688','2024-08-31 12:31:10','admin','0:0:0:0:0:0:0:1','/home/data.do',4791,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829738740354981888','2024-08-31 12:31:25','admin','0:0:0:0:0:0:0:1','/unit/edit.do',33,'[类名]com.yzs.manage.web.controller.UnitController[方法名]edit'),('1829738777843671040','2024-08-31 12:31:34','admin','0:0:0:0:0:0:0:1','/home/main.do',22,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829738778409902080','2024-08-31 12:31:34','admin','0:0:0:0:0:0:0:1','/home/pie.do',10,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829738778422484992','2024-08-31 12:31:34','admin','0:0:0:0:0:0:0:1','/home/pie.do',13,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829739065866526720','2024-08-31 12:32:43','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',65,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829739078814343168','2024-08-31 12:32:46','admin','0:0:0:0:0:0:0:1','/measurePoint/addMeasurePoint.do',0,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]toSave'),('1829739093850923008','2024-08-31 12:32:50','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740580350009344','2024-08-31 12:38:44','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',16,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829740583822893056','2024-08-31 12:38:45','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',13,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829740586104594432','2024-08-31 12:38:45','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',13,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829740588033974272','2024-08-31 12:38:46','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',9,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740591162925056','2024-08-31 12:38:47','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',12,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740592647708672','2024-08-31 12:38:47','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',13,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740601610936320','2024-08-31 12:38:49','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740603087331328','2024-08-31 12:38:49','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',6,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740614919462912','2024-08-31 12:38:52','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',9,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740621118644224','2024-08-31 12:38:54','admin','0:0:0:0:0:0:0:1','/device/findAll.do',18,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829740623723307008','2024-08-31 12:38:54','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',6,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740626772566016','2024-08-31 12:38:55','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',6,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740628467064832','2024-08-31 12:38:55','admin','0:0:0:0:0:0:0:1','/device/findAll.do',8,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829740630903955456','2024-08-31 12:38:56','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',6,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740633437315072','2024-08-31 12:38:57','admin','0:0:0:0:0:0:0:1','/device/findAll.do',9,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829740638998962176','2024-08-31 12:38:58','admin','0:0:0:0:0:0:0:1','/device/addDevice.do',7,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]toSave'),('1829740639955263488','2024-08-31 12:38:58','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829740668174540800','2024-08-31 12:39:05','admin','0:0:0:0:0:0:0:1','/device/findAll.do',10,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829740705893916672','2024-08-31 12:39:14','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',11,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740711078076416','2024-08-31 12:39:15','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',8,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740714039255040','2024-08-31 12:39:16','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',10,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829740719936446464','2024-08-31 12:39:17','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',9,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740724499849216','2024-08-31 12:39:18','admin','0:0:0:0:0:0:0:1','/measurePoint/addMeasurePoint.do',0,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]toSave'),('1829740771094372352','2024-08-31 12:39:29','admin','0:0:0:0:0:0:0:1','/measurePoint/save.do',17,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]save'),('1829740777071255552','2024-08-31 12:39:31','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',14,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740854871400448','2024-08-31 12:39:49','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',10,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829740856981135360','2024-08-31 12:39:50','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',12,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740865067753472','2024-08-31 12:39:52','admin','0:0:0:0:0:0:0:1','/home/main.do',22,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829740865545904128','2024-08-31 12:39:52','admin','0:0:0:0:0:0:0:1','/home/pie.do',11,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829740865545904129','2024-08-31 12:39:52','admin','0:0:0:0:0:0:0:1','/home/pie.do',11,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829740894763425792','2024-08-31 12:39:59','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',8,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829740909682565120','2024-08-31 12:40:02','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',7,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740929433542656','2024-08-31 12:40:07','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',12,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740932642185216','2024-08-31 12:40:08','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',7,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740935590780928','2024-08-31 12:40:09','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',15,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740938019282944','2024-08-31 12:40:09','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',8,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740940208709632','2024-08-31 12:40:10','admin','0:0:0:0:0:0:0:1','/device/findAll.do',12,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829740942935007232','2024-08-31 12:40:10','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',7,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740944642088960','2024-08-31 12:40:11','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',13,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740946458222592','2024-08-31 12:40:11','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',7,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740948790255616','2024-08-31 12:40:12','admin','0:0:0:0:0:0:0:1','/device/findAll.do',12,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829740953605316608','2024-08-31 12:40:13','admin','0:0:0:0:0:0:0:1','/device/addDevice.do',7,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]toSave'),('1829740954028941312','2024-08-31 12:40:13','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829740984513142784','2024-08-31 12:40:20','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',6,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740987428184064','2024-08-31 12:40:21','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',13,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829740992058695680','2024-08-31 12:40:22','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',6,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829740994239733760','2024-08-31 12:40:23','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',13,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829741003232321536','2024-08-31 12:40:25','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',13,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829741007304990720','2024-08-31 12:40:26','admin','0:0:0:0:0:0:0:1','/measurePoint/addMeasurePoint.do',0,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]toSave'),('1829741011683844096','2024-08-31 12:40:27','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',12,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829741016691843072','2024-08-31 12:40:28','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',6,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829741645736779776','2024-08-31 12:42:58','admin','0:0:0:0:0:0:0:1','/deviceType/save.do',37,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]save'),('1829741651394895872','2024-08-31 12:42:59','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',12,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829741686916456448','2024-08-31 12:43:08','admin','0:0:0:0:0:0:0:1','/deviceType/save.do',20,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]save'),('1829741706411581440','2024-08-31 12:43:12','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',11,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829741717614567424','2024-08-31 12:43:15','admin','0:0:0:0:0:0:0:1','/deviceType/save.do',28,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]save'),('1829741722920361984','2024-08-31 12:43:16','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',12,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829741746991472640','2024-08-31 12:43:22','admin','0:0:0:0:0:0:0:1','/deviceType/save.do',22,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]save'),('1829741752351793152','2024-08-31 12:43:23','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',14,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829741755715624960','2024-08-31 12:43:24','admin','0:0:0:0:0:0:0:1','/job/list.do',15,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829741763173097472','2024-08-31 12:43:26','admin','0:0:0:0:0:0:0:1','/device/findAll.do',9,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829741767354818560','2024-08-31 12:43:27','admin','0:0:0:0:0:0:0:1','/device/addDevice.do',6,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]toSave'),('1829741767811997696','2024-08-31 12:43:27','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',13,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829741907188719616','2024-08-31 12:44:00','admin','0:0:0:0:0:0:0:1','/device/save.do',263,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]save'),('1829741912188329984','2024-08-31 12:44:01','admin','0:0:0:0:0:0:0:1','/device/findAll.do',16,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829741927531094016','2024-08-31 12:44:05','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',10,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829741930521632768','2024-08-31 12:44:06','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829741934468472832','2024-08-31 12:44:07','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',8,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829741937068941312','2024-08-31 12:44:07','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',13,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829741942068551680','2024-08-31 12:44:09','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',13,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829741960234082304','2024-08-31 12:44:13','admin','0:0:0:0:0:0:0:1','/device/findByUnitIdAndTypeId.do',14,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findByUnitIdAndTypeId'),('1829741968178094080','2024-08-31 12:44:15','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',11,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829741983218868224','2024-08-31 12:44:18','admin','0:0:0:0:0:0:0:1','/device/findAll.do',14,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829741986314264576','2024-08-31 12:44:19','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',15,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829742004580458496','2024-08-31 12:44:24','admin','0:0:0:0:0:0:0:1','/unit/select.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829742004802756608','2024-08-31 12:44:24','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829742004936974336','2024-08-31 12:44:24','admin','0:0:0:0:0:0:0:1','/device/select.do',16,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829742007466139648','2024-08-31 12:44:24','admin','0:0:0:0:0:0:0:1','/job/list.do',11,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829744460009906176','2024-08-31 12:54:09','admin','0:0:0:0:0:0:0:1','/home/main.do',46,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829744461700210688','2024-08-31 12:54:09','admin','0:0:0:0:0:0:0:1','/home/data.do',8,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829744461716987904','2024-08-31 12:54:09','admin','0:0:0:0:0:0:0:1','/home/data.do',12,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829744482520735744','2024-08-31 12:54:14','admin','0:0:0:0:0:0:0:1','/user/findAll.do',30,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829744487298048000','2024-08-31 12:54:15','admin','0:0:0:0:0:0:0:1','/role/findAll.do',15,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829744495447580672','2024-08-31 12:54:17','admin','0:0:0:0:0:0:0:1','/permission/findAll.do',14,'[类名]com.yzs.manage.web.controller.PermissionController[方法名]findAll'),('1829744503345455104','2024-08-31 12:54:19','admin','0:0:0:0:0:0:0:1','/permission/findAll.do',10,'[类名]com.yzs.manage.web.controller.PermissionController[方法名]findAll'),('1829744507137105920','2024-08-31 12:54:20','admin','0:0:0:0:0:0:0:1','/role/findAll.do',9,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829744509288783872','2024-08-31 12:54:21','admin','0:0:0:0:0:0:0:1','/user/findAll.do',10,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829744517534785536','2024-08-31 12:54:23','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829744520001036288','2024-08-31 12:54:23','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',12,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829744522316292096','2024-08-31 12:54:24','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',14,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829744524895789056','2024-08-31 12:54:24','admin','0:0:0:0:0:0:0:1','/device/findAll.do',13,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829744553995870208','2024-08-31 12:54:31','admin','0:0:0:0:0:0:0:1','/unit/select.do',7,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829744554167836672','2024-08-31 12:54:31','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829744554276888576','2024-08-31 12:54:31','admin','0:0:0:0:0:0:0:1','/device/select.do',12,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829744580969439232','2024-08-31 12:54:38','admin','0:0:0:0:0:0:0:1','/unit/select.do',6,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829744581107851264','2024-08-31 12:54:38','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829744581225291776','2024-08-31 12:54:38','admin','0:0:0:0:0:0:0:1','/device/select.do',11,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829744642780897280','2024-08-31 12:54:52','admin','0:0:0:0:0:0:0:1','/job/list.do',13,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745292914794496','2024-08-31 12:57:28','admin','0:0:0:0:0:0:0:1','/job/list.do',9,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745299877339136','2024-08-31 12:57:29','admin','0:0:0:0:0:0:0:1','/job/list.do',10,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745301802524672','2024-08-31 12:57:30','admin','0:0:0:0:0:0:0:1','/job/list.do',11,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745302804963328','2024-08-31 12:57:30','admin','0:0:0:0:0:0:0:1','/job/list.do',11,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745303748681728','2024-08-31 12:57:30','admin','0:0:0:0:0:0:0:1','/job/list.do',13,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745335755415552','2024-08-31 12:57:38','admin','0:0:0:0:0:0:0:1','/job/list.do',15,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745347440746496','2024-08-31 12:57:41','admin','0:0:0:0:0:0:0:1','/unit/select.do',10,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829745347629490176','2024-08-31 12:57:41','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829745347746930688','2024-08-31 12:57:41','admin','0:0:0:0:0:0:0:1','/device/select.do',12,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829745351559553024','2024-08-31 12:57:41','admin','0:0:0:0:0:0:0:1','/job/list.do',11,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745353841254400','2024-08-31 12:57:42','admin','0:0:0:0:0:0:0:1','/unit/select.do',8,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829745353988055040','2024-08-31 12:57:42','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829745354105495552','2024-08-31 12:57:42','admin','0:0:0:0:0:0:0:1','/device/select.do',11,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829745356798238720','2024-08-31 12:57:43','admin','0:0:0:0:0:0:0:1','/job/list.do',12,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745359067357184','2024-08-31 12:57:43','admin','0:0:0:0:0:0:0:1','/unit/select.do',7,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829745359243517952','2024-08-31 12:57:43','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',9,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829745359377735680','2024-08-31 12:57:43','admin','0:0:0:0:0:0:0:1','/device/select.do',16,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829745390893735936','2024-08-31 12:57:51','admin','0:0:0:0:0:0:0:1','/unit/select.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829745391027953664','2024-08-31 12:57:51','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829745391162171392','2024-08-31 12:57:51','admin','0:0:0:0:0:0:0:1','/device/select.do',14,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829745446443098112','2024-08-31 12:58:04','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829745464218558464','2024-08-31 12:58:08','admin','0:0:0:0:0:0:0:1','/unit/select.do',6,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829745464415690752','2024-08-31 12:58:08','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829745464545714176','2024-08-31 12:58:08','admin','0:0:0:0:0:0:0:1','/device/select.do',14,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829745467251040256','2024-08-31 12:58:09','admin','0:0:0:0:0:0:0:1','/job/list.do',9,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829745470581317632','2024-08-31 12:58:10','admin','0:0:0:0:0:0:0:1','/unit/select.do',6,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829745470757478400','2024-08-31 12:58:10','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829745470862336000','2024-08-31 12:58:10','admin','0:0:0:0:0:0:0:1','/device/select.do',12,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829745735069933568','2024-08-31 12:59:13','admin','0:0:0:0:0:0:0:1','/home/main.do',20,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829745735661330432','2024-08-31 12:59:13','admin','0:0:0:0:0:0:0:1','/home/pie.do',9,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829745735661330433','2024-08-31 12:59:13','admin','0:0:0:0:0:0:0:1','/home/pie.do',9,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829745894566731776','2024-08-31 12:59:51','admin','0:0:0:0:0:0:0:1','/device/findAll.do',15,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829745902590435328','2024-08-31 12:59:53','admin','0:0:0:0:0:0:0:1','/home/main.do',16,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829745903060197376','2024-08-31 12:59:53','admin','0:0:0:0:0:0:0:1','/home/data.do',8,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829745903068585984','2024-08-31 12:59:53','admin','0:0:0:0:0:0:0:1','/home/data.do',9,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829745908403740672','2024-08-31 12:59:54','admin','0:0:0:0:0:0:0:1','/user/findAll.do',9,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829745910815465472','2024-08-31 12:59:55','admin','0:0:0:0:0:0:0:1','/role/findAll.do',9,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829745912384135168','2024-08-31 12:59:55','admin','0:0:0:0:0:0:0:1','/permission/findAll.do',6,'[类名]com.yzs.manage.web.controller.PermissionController[方法名]findAll'),('1829745925445197824','2024-08-31 12:59:58','admin','0:0:0:0:0:0:0:1','/unit/select.do',7,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829745925642330112','2024-08-31 12:59:58','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829745925772353536','2024-08-31 12:59:58','admin','0:0:0:0:0:0:0:1','/device/select.do',12,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829745983792160768','2024-08-31 13:00:12','admin','0:0:0:0:0:0:0:1','/home/main.do',15,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829745984253534208','2024-08-31 13:00:12','admin','0:0:0:0:0:0:0:1','/home/pie.do',7,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829745984261922816','2024-08-31 13:00:12','admin','0:0:0:0:0:0:0:1','/home/pie.do',9,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829746026888634368','2024-08-31 13:00:22','admin','0:0:0:0:0:0:0:1','/unit/select.do',7,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829746027136098304','2024-08-31 13:00:23','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',20,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829746027253538816','2024-08-31 13:00:23','admin','0:0:0:0:0:0:0:1','/device/select.do',11,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829746913451253760','2024-08-31 13:03:54','admin','0:0:0:0:0:0:0:1','/unit/select.do',17,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829746913639997440','2024-08-31 13:03:54','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829746913757437952','2024-08-31 13:03:54','admin','0:0:0:0:0:0:0:1','/device/select.do',11,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829746935949500416','2024-08-31 13:03:59','admin','0:0:0:0:0:0:0:1','/device/findAll.do',13,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829746941720862720','2024-08-31 13:04:01','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',20,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829747406294556672','2024-08-31 13:05:51','admin','0:0:0:0:0:0:0:1','/unit/select.do',6,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829747406458134528','2024-08-31 13:05:51','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829747406579769344','2024-08-31 13:05:51','admin','0:0:0:0:0:0:0:1','/device/select.do',11,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829747413370347520','2024-08-31 13:05:53','admin','0:0:0:0:0:0:0:1','/job/list.do',10,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829747418273488896','2024-08-31 13:05:54','admin','0:0:0:0:0:0:0:1','/unit/select.do',7,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829747418462232576','2024-08-31 13:05:54','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',9,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829747418579673088','2024-08-31 13:05:54','admin','0:0:0:0:0:0:0:1','/device/select.do',12,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829747517112262656','2024-08-31 13:06:18','admin','0:0:0:0:0:0:0:1','/home/main.do',16,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829747517670105088','2024-08-31 13:06:18','admin','0:0:0:0:0:0:0:1','/home/data.do',11,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829747517707853824','2024-08-31 13:06:18','admin','0:0:0:0:0:0:0:1','/home/pie.do',7,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829747531821686784','2024-08-31 13:06:21','admin','0:0:0:0:0:0:0:1','/job/list.do',10,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829747907140591616','2024-08-31 13:07:51','admin','0:0:0:0:0:0:0:1','/job/list.do',11,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829749486463811584','2024-08-31 13:14:07','admin','0:0:0:0:0:0:0:1','/home/main.do',87,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829749488489660416','2024-08-31 13:14:08','admin','0:0:0:0:0:0:0:1','/home/pie.do',19,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829749488523214848','2024-08-31 13:14:08','admin','0:0:0:0:0:0:0:1','/home/pie.do',29,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829749554587697152','2024-08-31 13:14:23','admin','0:0:0:0:0:0:0:1','/userchangePwd.do',280,'[类名]com.yzs.manage.web.controller.UserController[方法名]changePwd'),('1829749590688071680','2024-08-31 13:14:32','admin','0:0:0:0:0:0:0:1','/home/main.do',40,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829749591900225536','2024-08-31 13:14:32','admin','0:0:0:0:0:0:0:1','/home/pie.do',10,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829749591912808448','2024-08-31 13:14:32','admin','0:0:0:0:0:0:0:1','/home/pie.do',12,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829749679070445568','2024-08-31 13:14:53','admin','0:0:0:0:0:0:0:1','/home/main.do',46,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829749679821225984','2024-08-31 13:14:53','admin','0:0:0:0:0:0:0:1','/home/pie.do',12,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829749679838003200','2024-08-31 13:14:53','admin','0:0:0:0:0:0:0:1','/home/pie.do',15,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829749698141945856','2024-08-31 13:14:58','admin','0:0:0:0:0:0:0:1','/job/list.do',57,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829749737031532544','2024-08-31 13:15:07','admin','0:0:0:0:0:0:0:1','/job/list.do',16,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829749749958377472','2024-08-31 13:15:10','admin','0:0:0:0:0:0:0:1','/home/main.do',22,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829749750432333824','2024-08-31 13:15:10','admin','0:0:0:0:0:0:0:1','/home/pie.do',11,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829749750444916736','2024-08-31 13:15:10','admin','0:0:0:0:0:0:0:1','/home/pie.do',13,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829749769537388544','2024-08-31 13:15:15','admin','0:0:0:0:0:0:0:1','/user/findAll.do',17,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829749771676483584','2024-08-31 13:15:15','admin','0:0:0:0:0:0:0:1','/role/findAll.do',17,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829749773882687488','2024-08-31 13:15:16','admin','0:0:0:0:0:0:0:1','/role/findAll.do',9,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829749779339476992','2024-08-31 13:15:17','admin','0:0:0:0:0:0:0:1','/permission/findAll.do',13,'[类名]com.yzs.manage.web.controller.PermissionController[方法名]findAll'),('1829749782304849920','2024-08-31 13:15:18','admin','0:0:0:0:0:0:0:1','/role/findAll.do',11,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829749784674631680','2024-08-31 13:15:18','admin','0:0:0:0:0:0:0:1','/user/findAll.do',12,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829749786805338112','2024-08-31 13:15:19','admin','0:0:0:0:0:0:0:1','/role/findAll.do',9,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829749844820951040','2024-08-31 13:15:33','admin','0:0:0:0:0:0:0:1','/home/main.do',18,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829749845374599168','2024-08-31 13:15:33','admin','0:0:0:0:0:0:0:1','/home/data.do',15,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829749845387182080','2024-08-31 13:15:33','admin','0:0:0:0:0:0:0:1','/home/data.do',17,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829749899468537856','2024-08-31 13:15:46','admin','0:0:0:0:0:0:0:1','/device/findAll.do',22,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829750233897172992','2024-08-31 13:17:06','admin','0:0:0:0:0:0:0:1','/home/main.do',19,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829750234455015424','2024-08-31 13:17:06','admin','0:0:0:0:0:0:0:1','/home/pie.do',10,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829750234492764160','2024-08-31 13:17:06','admin','0:0:0:0:0:0:0:1','/home/pie.do',18,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829750240188628992','2024-08-31 13:17:07','admin','0:0:0:0:0:0:0:1','/device/findAll.do',14,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829750244307435520','2024-08-31 13:17:08','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',12,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829750247490912256','2024-08-31 13:17:09','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',17,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829750249852305408','2024-08-31 13:17:09','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',22,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829750253711065088','2024-08-31 13:17:10','admin','0:0:0:0:0:0:0:1','/device/findAll.do',14,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829750258907807744','2024-08-31 13:17:11','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',27,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829750259268517888','2024-08-31 13:17:12','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',23,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829750278100942848','2024-08-31 13:17:16','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',19,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829750284740526080','2024-08-31 13:17:18','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',27,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829750288066609152','2024-08-31 13:17:18','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',20,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829750295243063296','2024-08-31 13:17:20','admin','0:0:0:0:0:0:0:1','/job/list.do',12,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList'),('1829750310564855808','2024-08-31 13:17:24','admin','0:0:0:0:0:0:0:1','/unit/select.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829750310753599488','2024-08-31 13:17:24','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',12,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829750310904594432','2024-08-31 13:17:24','admin','0:0:0:0:0:0:0:1','/device/select.do',17,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829753974100656128','2024-08-31 13:31:57','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',14,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829754002273796096','2024-08-31 13:32:04','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',14,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829754004547108864','2024-08-31 13:32:05','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',13,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829754008301010944','2024-08-31 13:32:05','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',9,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829754009827737600','2024-08-31 13:32:06','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',13,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829754012608561152','2024-08-31 13:32:06','admin','0:0:0:0:0:0:0:1','/device/findAll.do',13,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829755500449824768','2024-08-31 13:38:01','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',10,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829756933605777408','2024-08-31 13:43:43','admin','0:0:0:0:0:0:0:1','/home/main.do',80,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829756935799398400','2024-08-31 13:43:43','admin','0:0:0:0:0:0:0:1','/home/pie.do',22,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829756935820369920','2024-08-31 13:43:43','admin','0:0:0:0:0:0:0:1','/home/pie.do',33,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829756969517408256','2024-08-31 13:43:51','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',64,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829756973917233152','2024-08-31 13:43:52','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',14,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829756978111537152','2024-08-31 13:43:53','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',23,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829756992292478976','2024-08-31 13:43:57','admin','0:0:0:0:0:0:0:1','/device/findByUnitIdAndTypeId.do',25,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findByUnitIdAndTypeId'),('1829757031068819456','2024-08-31 13:44:06','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',16,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829757061708210176','2024-08-31 13:44:13','admin','0:0:0:0:0:0:0:1','/device/findByUnitIdAndTypeId.do',7,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findByUnitIdAndTypeId'),('1829757092536344576','2024-08-31 13:44:21','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',16,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829757102011277312','2024-08-31 13:44:23','admin','0:0:0:0:0:0:0:1','/device/findAll.do',16,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829757107879108608','2024-08-31 13:44:24','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',17,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829757110966116352','2024-08-31 13:44:25','admin','0:0:0:0:0:0:0:1','/device/findAll.do',16,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829757113876963328','2024-08-31 13:44:26','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',15,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829757146256990208','2024-08-31 13:44:34','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',15,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829757215332982784','2024-08-31 13:44:50','admin','0:0:0:0:0:0:0:1','/device/findAll.do',17,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829757224489148416','2024-08-31 13:44:52','admin','0:0:0:0:0:0:0:1','/unit/select.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829757224749195264','2024-08-31 13:44:52','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829757224900190208','2024-08-31 13:44:52','admin','0:0:0:0:0:0:0:1','/device/select.do',15,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829757790023933952','2024-08-31 13:47:07','admin','0:0:0:0:0:0:0:1','/unit/select.do',10,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829757790229454848','2024-08-31 13:47:07','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',14,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829757790367866880','2024-08-31 13:47:07','admin','0:0:0:0:0:0:0:1','/device/select.do',15,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829758719536226304','2024-08-31 13:50:49','admin','0:0:0:0:0:0:0:1','/device/findAll.do',15,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829758725815099392','2024-08-31 13:50:50','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',39,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829758740428054528','2024-08-31 13:50:54','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',29,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829758747344461824','2024-08-31 13:50:55','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',20,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829758752620896256','2024-08-31 13:50:57','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',22,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829758757494677504','2024-08-31 13:50:58','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',25,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829758761907085312','2024-08-31 13:50:59','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',22,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829758777946103808','2024-08-31 13:51:03','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',21,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829758780726927360','2024-08-31 13:51:03','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',20,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829758784296280064','2024-08-31 13:51:04','admin','0:0:0:0:0:0:0:1','/deviceData/findAll.do',22,'[类名]com.yzs.manage.web.controller.DeviceDataController[方法名]findAll'),('1829759639309344768','2024-08-31 13:54:28','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',11,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829759641528131584','2024-08-31 13:54:28','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',12,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829759643499454464','2024-08-31 13:54:29','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',11,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829759645252673536','2024-08-31 13:54:29','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',14,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829759646678736896','2024-08-31 13:54:30','admin','0:0:0:0:0:0:0:1','/device/findAll.do',17,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829759649321148416','2024-08-31 13:54:30','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',13,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829759650755600384','2024-08-31 13:54:31','admin','0:0:0:0:0:0:0:1','/device/findAll.do',15,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829759652106166272','2024-08-31 13:54:31','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',14,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829759653607727104','2024-08-31 13:54:31','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',12,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829759655834902528','2024-08-31 13:54:32','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829759657319686144','2024-08-31 13:54:32','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829759658871578624','2024-08-31 13:54:33','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',11,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829759660155035648','2024-08-31 13:54:33','admin','0:0:0:0:0:0:0:1','/device/findAll.do',20,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]findAll'),('1829759664508723200','2024-08-31 13:54:34','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',13,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829759666194833408','2024-08-31 13:54:34','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',13,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829759668363288576','2024-08-31 13:54:35','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',19,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829760679203135488','2024-08-31 13:58:36','admin','0:0:0:0:0:0:0:1','/home/main.do',31,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829760680557895680','2024-08-31 13:58:36','admin','0:0:0:0:0:0:0:1','/home/pie.do',9,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829760680562089984','2024-08-31 13:58:36','admin','0:0:0:0:0:0:0:1','/home/pie.do',11,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829760689441431552','2024-08-31 13:58:38','admin','0:0:0:0:0:0:0:1','/unit/select.do',8,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829760689609203712','2024-08-31 13:58:38','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829760689726644224','2024-08-31 13:58:38','admin','0:0:0:0:0:0:0:1','/device/select.do',13,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829760874938695680','2024-08-31 13:59:22','admin','0:0:0:0:0:0:0:1','/home/main.do',334,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829760876561891328','2024-08-31 13:59:23','admin','0:0:0:0:0:0:0:1','/home/pie.do',18,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829760876582862848','2024-08-31 13:59:23','admin','0:0:0:0:0:0:0:1','/home/pie.do',29,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829760905020243968','2024-08-31 13:59:30','admin','0:0:0:0:0:0:0:1','/unit/select.do',16,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829760905318039552','2024-08-31 13:59:30','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',25,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829760905548726272','2024-08-31 13:59:30','admin','0:0:0:0:0:0:0:1','/device/select.do',31,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829760926256005120','2024-08-31 13:59:35','admin','0:0:0:0:0:0:0:1','/unit/select.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829760926402805760','2024-08-31 13:59:35','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829760926541217792','2024-08-31 13:59:35','admin','0:0:0:0:0:0:0:1','/device/select.do',16,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829760929544339456','2024-08-31 13:59:36','admin','0:0:0:0:0:0:0:1','/unit/select.do',7,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829760929678557184','2024-08-31 13:59:36','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829760929812774912','2024-08-31 13:59:36','admin','0:0:0:0:0:0:0:1','/device/select.do',15,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829761068988141568','2024-08-31 14:00:08','admin','0:0:0:0:0:0:0:1','/home/main.do',330,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829761070745554944','2024-08-31 14:00:09','admin','0:0:0:0:0:0:0:1','/home/pie.do',22,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829761070770720768','2024-08-31 14:00:09','admin','0:0:0:0:0:0:0:1','/home/pie.do',32,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829761079868166144','2024-08-31 14:00:11','admin','0:0:0:0:0:0:0:1','/unit/select.do',16,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829761080132407296','2024-08-31 14:00:11','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',25,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829761080346316800','2024-08-31 14:00:11','admin','0:0:0:0:0:0:0:1','/device/select.do',28,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829762319234666496','2024-08-31 14:05:07','admin','0:0:0:0:0:0:0:1','/home/main.do',31,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829762320681701376','2024-08-31 14:05:07','admin','0:0:0:0:0:0:0:1','/home/pie.do',18,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829762320690089984','2024-08-31 14:05:07','admin','0:0:0:0:0:0:0:1','/home/pie.do',21,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829762329644929024','2024-08-31 14:05:09','admin','0:0:0:0:0:0:0:1','/unit/select.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829762329854644224','2024-08-31 14:05:09','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',13,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829762330001444864','2024-08-31 14:05:09','admin','0:0:0:0:0:0:0:1','/device/select.do',15,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829762500646707200','2024-08-31 14:05:50','admin','0:0:0:0:0:0:0:1','/home/main.do',65,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829762502009856000','2024-08-31 14:05:50','admin','0:0:0:0:0:0:0:1','/home/data.do',18,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829762502030827520','2024-08-31 14:05:50','admin','0:0:0:0:0:0:0:1','/home/data.do',27,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829762514760540160','2024-08-31 14:05:54','admin','0:0:0:0:0:0:0:1','/unit/select.do',15,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829762515024781312','2024-08-31 14:05:54','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',20,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829762515213524992','2024-08-31 14:05:54','admin','0:0:0:0:0:0:0:1','/device/select.do',22,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829763811433807872','2024-08-31 14:11:03','admin','0:0:0:0:0:0:0:1','/home/main.do',80,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829763813673566208','2024-08-31 14:11:03','admin','0:0:0:0:0:0:0:1','/home/pie.do',19,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829763813686149120','2024-08-31 14:11:03','admin','0:0:0:0:0:0:0:1','/home/pie.do',29,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829763821999259648','2024-08-31 14:11:05','admin','0:0:0:0:0:0:0:1','/unit/select.do',13,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829763822229946368','2024-08-31 14:11:05','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',17,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829763822406107136','2024-08-31 14:11:05','admin','0:0:0:0:0:0:0:1','/device/select.do',23,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829763841221754880','2024-08-31 14:11:10','admin','0:0:0:0:0:0:0:1','/unit/select.do',7,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829763841372749824','2024-08-31 14:11:10','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829763841494384640','2024-08-31 14:11:10','admin','0:0:0:0:0:0:0:1','/device/select.do',13,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829763854433812480','2024-08-31 14:11:13','admin','0:0:0:0:0:0:0:1','/unit/select.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829763854605778944','2024-08-31 14:11:13','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',12,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829763854739996672','2024-08-31 14:11:13','admin','0:0:0:0:0:0:0:1','/device/select.do',14,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829763869076127744','2024-08-31 14:11:16','admin','0:0:0:0:0:0:0:1','/unit/select.do',7,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829763869227122688','2024-08-31 14:11:16','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',14,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829763869352951808','2024-08-31 14:11:16','admin','0:0:0:0:0:0:0:1','/device/select.do',12,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829763882367877120','2024-08-31 14:11:20','admin','0:0:0:0:0:0:0:1','/unit/select.do',8,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829763882493706240','2024-08-31 14:11:20','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',11,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829763882615341056','2024-08-31 14:11:20','admin','0:0:0:0:0:0:0:1','/device/select.do',13,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829764315220058112','2024-08-31 14:13:03','admin','0:0:0:0:0:0:0:1','/home/main.do',84,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829764318533558272','2024-08-31 14:13:04','admin','0:0:0:0:0:0:0:1','/home/pie.do',19,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829764318571307008','2024-08-31 14:13:04','admin','0:0:0:0:0:0:0:1','/home/pie.do',30,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829764338099986432','2024-08-31 14:13:08','admin','0:0:0:0:0:0:0:1','/unit/select.do',12,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829764338368421888','2024-08-31 14:13:08','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',21,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829764338582331392','2024-08-31 14:13:08','admin','0:0:0:0:0:0:0:1','/device/select.do',24,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829765419819360256','2024-08-31 14:17:26','admin','0:0:0:0:0:0:0:1','/home/main.do',275,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829765421136371712','2024-08-31 14:17:26','admin','0:0:0:0:0:0:0:1','/home/pie.do',11,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829765421153148928','2024-08-31 14:17:26','admin','0:0:0:0:0:0:0:1','/home/pie.do',27,'[类名]com.yzs.manage.web.controller.HomeController[方法名]pie'),('1829765427310387200','2024-08-31 14:17:28','admin','0:0:0:0:0:0:0:1','/unit/select.do',12,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829765427536879616','2024-08-31 14:17:28','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',16,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829765427708846080','2024-08-31 14:17:28','admin','0:0:0:0:0:0:0:1','/device/select.do',21,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829765908116037632','2024-08-31 14:19:23','admin','0:0:0:0:0:0:0:1','/unit/select.do',9,'[类名]com.yzs.manage.web.controller.UnitController[方法名]select'),('1829765908275421184','2024-08-31 14:19:23','admin','0:0:0:0:0:0:0:1','/measurePoint/findByUnitId.do',10,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findByUnitId'),('1829765908418027520','2024-08-31 14:19:23','admin','0:0:0:0:0:0:0:1','/device/select.do',14,'[类名]com.yzs.manage.web.controller.DeviceController[方法名]select'),('1829765945759916032','2024-08-31 14:19:32','admin','0:0:0:0:0:0:0:1','/deviceType/findAll.do',23,'[类名]com.yzs.manage.web.controller.DeviceTypeController[方法名]findAll'),('1829765954370822144','2024-08-31 14:19:34','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',57,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829765958166667264','2024-08-31 14:19:34','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',11,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829765960276402176','2024-08-31 14:19:35','admin','0:0:0:0:0:0:0:1','/measurePoint/findAll.do',13,'[类名]com.yzs.manage.web.controller.MeasurePointController[方法名]findAll'),('1829765964432957440','2024-08-31 14:19:36','admin','0:0:0:0:0:0:0:1','/unit/findAll.do',13,'[类名]com.yzs.manage.web.controller.UnitController[方法名]findAll'),('1829765971772989440','2024-08-31 14:19:38','admin','0:0:0:0:0:0:0:1','/user/findAll.do',18,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829765973329076224','2024-08-31 14:19:38','admin','0:0:0:0:0:0:0:1','/user/findAll.do',14,'[类名]com.yzs.manage.web.controller.UserController[方法名]findAll'),('1829765975161987072','2024-08-31 14:19:39','admin','0:0:0:0:0:0:0:1','/role/findAll.do',18,'[类名]com.yzs.manage.web.controller.RoleController[方法名]findAll'),('1829765976499970048','2024-08-31 14:19:39','admin','0:0:0:0:0:0:0:1','/permission/findAll.do',16,'[类名]com.yzs.manage.web.controller.PermissionController[方法名]findAll'),('1829765980878823424','2024-08-31 14:19:40','admin','0:0:0:0:0:0:0:1','/home/main.do',22,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829765981331808256','2024-08-31 14:19:40','admin','0:0:0:0:0:0:0:1','/home/data.do',8,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829765981340196864','2024-08-31 14:19:40','admin','0:0:0:0:0:0:0:1','/home/data.do',10,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829766002815033344','2024-08-31 14:19:45','admin','0:0:0:0:0:0:0:1','/unit/edit.do',18,'[类名]com.yzs.manage.web.controller.UnitController[方法名]edit'),('1829766021072838656','2024-08-31 14:19:49','admin','0:0:0:0:0:0:0:1','/home/main.do',20,'[类名]com.yzs.manage.web.controller.HomeController[方法名]main'),('1829766021555183616','2024-08-31 14:19:50','admin','0:0:0:0:0:0:0:1','/home/data.do',9,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829766021567766528','2024-08-31 14:19:50','admin','0:0:0:0:0:0:0:1','/home/data.do',10,'[类名]com.yzs.manage.web.controller.HomeController[方法名]device'),('1829766027959885824','2024-08-31 14:19:51','admin','0:0:0:0:0:0:0:1','/job/list.do',21,'[类名]com.yzs.manage.web.controller.JobController[方法名]jobList');
/*!40000 ALTER TABLE `syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `manager_name` varchar(255) DEFAULT NULL,
  `manager_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES ('1','admin的单元','北京朝阳','admin','1');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_num` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `unit_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','admin','$2a$10$Veuemf6LAD9POoq5L3UHDeiC20808u7MDfMIJaB8cQOiE2xk1UyUm','1',1,'1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('1','1'),('1','2');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'data_analyze_sys'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-31 14:23:27
