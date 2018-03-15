-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: game
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `a_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_nick` varchar(16) NOT NULL,
  `a_email` varchar(100) NOT NULL,
  `a_password` varchar(32) NOT NULL,
  `a_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `a_gold` int(10) unsigned DEFAULT '0',
  `a_country` varchar(20) DEFAULT NULL,
  `a_type_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`a_id`),
  KEY `fk_account_account_type1_idx` (`a_type_id`),
  KEY `idx_get_ingo` (`a_nick`,`a_country`,`a_type_id`),
  CONSTRAINT `fk_account_account_type1` FOREIGN KEY (`a_type_id`) REFERENCES `account_type` (`at_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'sizoud','oleg.kalter@mail.ru','hfdsf734fh2','2018-03-14 00:58:48',100,'ru',1),(2,'dommennikk','dimakutas17@gmail.com','hgsh7262ge','2018-03-14 00:58:48',1750,'by',3),(3,'WhITe','daniik34@mail.ru','sgh8334hfrh','2018-03-14 00:58:49',2287,'uk',1),(4,'petrushka','petrushka@bsuir.by','fh84h378yf','2018-03-14 00:58:49',10000,'by',2),(5,'vanilka','vanilka@mailinator.com','h83f384f34','2018-03-14 00:58:49',300,'ru',1),(6,'jove','jovegsirh@gmail.com','f92yh7843f','2018-03-14 00:58:49',50000,'uk',1),(10,'dommennikk','dimakutas17@gmail.com','hgsh7262ge','2018-03-14 00:57:38',1450,'by',3),(11,'WhITe','daniik34@mail.ru','sgh8334hfrh','2018-03-14 00:57:38',1987,'uk',1),(12,'petrushka','petrushka@bsuir.by','fh84h378yf','2018-03-14 00:57:38',10000,'by',2),(13,'vanilka','vanilka@mailinator.com','h83f384f34','2018-03-14 00:57:38',300,'ru',1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `at_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `at_name` varchar(20) NOT NULL,
  PRIMARY KEY (`at_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (1,'common'),(2,'admin'),(3,'moderator'),(4,'beta tester');
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battle`
--

DROP TABLE IF EXISTS `battle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle` (
  `b_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `b_map` int(10) unsigned NOT NULL,
  `b_result` int(11) DEFAULT '0',
  `b_type` int(10) unsigned NOT NULL,
  `b_duration` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`b_id`,`b_map`,`b_type`),
  KEY `fk_battle_battle_type_idx` (`b_type`),
  KEY `key_map_idx` (`b_map`),
  CONSTRAINT `key_map` FOREIGN KEY (`b_map`) REFERENCES `map` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `key_type` FOREIGN KEY (`b_type`) REFERENCES `battle_type` (`bt_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle`
--

LOCK TABLES `battle` WRITE;
/*!40000 ALTER TABLE `battle` DISABLE KEYS */;
INSERT INTO `battle` VALUES (1,3,1,1,324),(2,6,2,1,345),(3,4,0,1,544),(4,5,2,3,345),(5,7,1,4,453),(6,4,0,2,435),(7,2,2,2,234),(8,1,0,1,563);
/*!40000 ALTER TABLE `battle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battle_type`
--

DROP TABLE IF EXISTS `battle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_type` (
  `bt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bt_name` varchar(45) NOT NULL,
  PRIMARY KEY (`bt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle_type`
--

LOCK TABLES `battle_type` WRITE;
/*!40000 ALTER TABLE `battle_type` DISABLE KEYS */;
INSERT INTO `battle_type` VALUES (1,'Встречный'),(2,'Атака/Оборона'),(3,'Стандартный'),(4,'Генеральный'),(5,'Специальный');
/*!40000 ALTER TABLE `battle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `ch_name` varchar(50) NOT NULL,
  `ch_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ch_gamer_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ch_name`),
  KEY `fk_chat_account1_idx` (`ch_gamer_id`),
  CONSTRAINT `fk_chat_account1` FOREIGN KEY (`ch_gamer_id`) REFERENCES `account` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES ('Дежурка',NULL,NULL),('Лучшая тима','2018-03-14 00:59:53',6),('Мой Чат','2018-03-14 00:59:53',1),('Общий',NULL,NULL),('Сбор','2018-03-14 00:59:53',2),('Супер чат','2018-03-14 00:59:53',NULL);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan`
--

DROP TABLE IF EXISTS `clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clan` (
  `cl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cl_tag` varchar(45) NOT NULL,
  `cl_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cl_id`),
  KEY `idx_clan` (`cl_tag`,`cl_create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
INSERT INTO `clan` VALUES (5,'ARGST',NULL),(2,'EGIK',NULL),(12,'ERNST',NULL),(10,'ERON',NULL),(3,'GRIZLY',NULL),(7,'HOWK',NULL),(13,'KROT',NULL),(6,'LENIA',NULL),(4,'MERCV',NULL),(11,'N_ERA',NULL),(1,'P_BY',NULL),(9,'URF0',NULL),(8,'URFO',NULL);
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `submitted` int(10) unsigned NOT NULL,
  `violator` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`type`,`violator`,`submitted`),
  KEY `jisd_idx` (`submitted`),
  KEY `key_complaint_type_idx` (`type`),
  KEY ` key2_idx` (`violator`),
  CONSTRAINT ` key2` FOREIGN KEY (`violator`) REFERENCES `account` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `key` FOREIGN KEY (`submitted`) REFERENCES `account` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `key_complaint_type` FOREIGN KEY (`type`) REFERENCES `complaint_type` (`ct_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (9,1,2,1),(11,1,3,1),(12,1,4,3),(10,2,1,2),(13,2,5,2),(14,3,5,4),(16,3,1,2),(15,4,2,3);
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_type`
--

DROP TABLE IF EXISTS `complaint_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_type` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ct_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_type`
--

LOCK TABLES `complaint_type` WRITE;
/*!40000 ALTER TABLE `complaint_type` DISABLE KEYS */;
INSERT INTO `complaint_type` VALUES (1,'Неспортивное поведение'),(2,'Запрещенный ник/клан'),(3,'Бездействие/бот'),(4,'Подпирание союзников'),(5,'Тимдамаг');
/*!40000 ALTER TABLE `complaint_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit`
--

DROP TABLE IF EXISTS `kit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kit` (
  `k_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `k_name` varchar(45) NOT NULL,
  PRIMARY KEY (`k_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit`
--

LOCK TABLES `kit` WRITE;
/*!40000 ALTER TABLE `kit` DISABLE KEYS */;
INSERT INTO `kit` VALUES (1,'Sherman'),(2,'Pershing'),(3,'Congueror'),(4,'FV4005'),(5,'MS-1'),(6,'T2Light'),(7,'IS-7'),(8,'IS-6'),(9,'IS-5'),(10,'IS-4'),(11,'IS-3'),(12,'IS-2'),(13,'IS-1'),(14,'IS-8'),(15,'T-10'),(16,'Ob705'),(17,'Ob704'),(18,'T62A'),(19,'Ob140'),(20,'T54'),(21,'O-Ho'),(22,'O-Ni'),(23,'Type4Heavy'),(24,'Type5Heavy'),(25,'STB-1'),(26,'TVP T50/51'),(27,'TVP VTU'),(28,'WZ120'),(29,'WZ-131');
/*!40000 ALTER TABLE `kit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_gamer_battle`
--

DROP TABLE IF EXISTS `list_gamer_battle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_gamer_battle` (
  `lgb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lgb_battle_id` int(10) unsigned NOT NULL,
  `lgb_gamer_id` int(10) unsigned NOT NULL,
  `lgb_respawn` bit(2) NOT NULL,
  `lgb_profit` int(11) DEFAULT '0',
  `lgb_start_kit` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`lgb_id`,`lgb_battle_id`,`lgb_gamer_id`),
  KEY `key1_idx` (`lgb_battle_id`),
  KEY `key2_idx` (`lgb_gamer_id`),
  KEY `key3_idx` (`lgb_start_kit`),
  KEY `idx_profit` (`lgb_profit`),
  CONSTRAINT `key1` FOREIGN KEY (`lgb_battle_id`) REFERENCES `battle` (`b_id`) ON UPDATE CASCADE,
  CONSTRAINT `key2` FOREIGN KEY (`lgb_gamer_id`) REFERENCES `account` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `key3` FOREIGN KEY (`lgb_start_kit`) REFERENCES `kit` (`k_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_gamer_battle`
--

LOCK TABLES `list_gamer_battle` WRITE;
/*!40000 ALTER TABLE `list_gamer_battle` DISABLE KEYS */;
INSERT INTO `list_gamer_battle` VALUES (13,1,2,'',100,1),(14,1,3,'',100,1),(15,1,4,'',0,1),(16,1,5,'',0,1),(17,2,2,'',100,2),(18,2,3,'',100,2),(19,2,4,'',0,2),(20,2,5,'',0,2),(21,3,2,'',100,3),(22,3,3,'',100,3),(23,3,4,'',0,3),(24,3,5,'',0,3);
/*!40000 ALTER TABLE `list_gamer_battle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_gamer_clan_post`
--

DROP TABLE IF EXISTS `list_gamer_clan_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_gamer_clan_post` (
  `id_gamer` int(10) unsigned NOT NULL,
  `id_clan` int(10) unsigned NOT NULL,
  `id_post` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id_gamer`,`id_clan`),
  KEY `fk_list_clan` (`id_clan`),
  KEY `fk_list_post` (`id_post`),
  CONSTRAINT `fk_clan` FOREIGN KEY (`id_clan`) REFERENCES `clan` (`cl_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gamer` FOREIGN KEY (`id_gamer`) REFERENCES `account` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post` FOREIGN KEY (`id_post`) REFERENCES `post_type` (`pt_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_gamer_clan_post`
--

LOCK TABLES `list_gamer_clan_post` WRITE;
/*!40000 ALTER TABLE `list_gamer_clan_post` DISABLE KEYS */;
INSERT INTO `list_gamer_clan_post` VALUES (2,1,1),(5,2,1),(3,1,2),(6,2,2),(4,1,3);
/*!40000 ALTER TABLE `list_gamer_clan_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m_name` varchar(45) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES (1,'himelsdorf'),(2,'murovanka'),(3,'malinovka'),(4,'prohorovka'),(5,'ensk'),(6,'rudniki'),(7,'karelia'),(8,'ruinberg'),(9,'westfield'),(10,'fjord'),(11,'redshire'),(12,'fishing_bay'),(13,'tundra'),(14,'stalingrad'),(15,'pariz');
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_type`
--

DROP TABLE IF EXISTS `post_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_type` (
  `pt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pt_name` varchar(45) NOT NULL,
  PRIMARY KEY (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_type`
--

LOCK TABLES `post_type` WRITE;
/*!40000 ALTER TABLE `post_type` DISABLE KEYS */;
INSERT INTO `post_type` VALUES (1,'Командир клана'),(2,'Заместитель командира'),(3,'Офицер разведки'),(4,'Новобранец'),(5,'Боец');
/*!40000 ALTER TABLE `post_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-14  4:01:30
