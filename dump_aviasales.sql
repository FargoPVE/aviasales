-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: aviasales
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_model` bigint NOT NULL,
  `id_airline` bigint NOT NULL,
  `board_number` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `airplane_id_model_board_number_idx` (`id_model`,`board_number`),
  CONSTRAINT `airplane_model_fk` FOREIGN KEY (`id`) REFERENCES `airplane_model` (`id_model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES (1,5,6,140),(2,10,2,336),(3,4,8,583),(4,3,7,813),(5,2,1,379317582),(6,6,3,4935),(7,7,9,1410),(8,9,5,353),(9,8,4,445),(10,1,10,18420);
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane_model`
--

DROP TABLE IF EXISTS `airplane_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane_model` (
  `id_model` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(100) NOT NULL,
  `id_airplane_type` bigint unsigned NOT NULL,
  `wingspan` int DEFAULT NULL,
  `airolane_length` int DEFAULT NULL,
  `airplane_height` int DEFAULT NULL,
  `speed` int DEFAULT NULL,
  `copacity` int NOT NULL,
  PRIMARY KEY (`id_model`),
  UNIQUE KEY `id_model` (`id_model`),
  KEY `id_airplane_type` (`id_airplane_type`),
  CONSTRAINT `airplane_model_ibfk_1` FOREIGN KEY (`id_model`) REFERENCES `airplane` (`id`),
  CONSTRAINT `airplane_model_ibfk_2` FOREIGN KEY (`id_airplane_type`) REFERENCES `airplane_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane_model`
--

LOCK TABLES `airplane_model` WRITE;
/*!40000 ALTER TABLE `airplane_model` DISABLE KEYS */;
INSERT INTO `airplane_model` VALUES (1,'Boeing 777',1,252,242,122,735,115),(2,'Sukhoi Superjet 100',1,552,722,352,224,235),(3,'Let L-410 Turbolet',1,453,8,711,636,253),(4,'Airbus A330',1,651,141,521,256,252),(5,'Boeing 767',2,811,952,125,525,325),(6,'Airbus A380',1,514,152,133,352,13),(7,'Embraer E-Jet',2,641,352,153,522,52),(8,'Boeing 787 Dreamliner',3,140,125,135,143,51),(9,'ATR 72',2,540,624,523,652,22),(10,'ATR 72',1,652,363,522,235,252);
/*!40000 ALTER TABLE `airplane_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane_types`
--

DROP TABLE IF EXISTS `airplane_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `airplane_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane_types`
--

LOCK TABLES `airplane_types` WRITE;
/*!40000 ALTER TABLE `airplane_types` DISABLE KEYS */;
INSERT INTO `airplane_types` VALUES (1,'passenger international'),(2,'passenger regional'),(3,'passenger local');
/*!40000 ALTER TABLE `airplane_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id_airport` bigint unsigned NOT NULL AUTO_INCREMENT,
  `russian_name` varchar(100) DEFAULT NULL,
  `english_name` varchar(100) DEFAULT NULL,
  `id_city` int unsigned NOT NULL,
  `phone` int unsigned DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_airport`),
  UNIQUE KEY `id_airport` (`id_airport`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'??????','WGO',1,568967295,'1526 Rsb Inlevt Suite 554\nAntwanbury, KY 39452-7786'),(2,'????????','CAIR',2,3749675,'295236 Tgoxcbb Isgdnlet Suite 554\nAntwanbury, KY 39452-7786'),(3,'??????','ACS',3,72729672,'6596 Gsob Inlet Suite 554\nAntwanbury, KY 39452-7786'),(4,'??????','BLR',4,547294995,'5996 Hsdb Inlegdst Suite 554\nAntwanbury, KY 39452-7786'),(5,'??????','JNA',5,2149675,'2448 Shob Gnldgt Suite 554\nAntwanbury, KY 39452-7786'),(6,'????????','DVSK',6,25796795,'7496 Roob Daggdt Suite 554\nAntwanbury, KY 39452-7786'),(7,'????????','BGDT',7,662467295,'8486 Gknob Inlebcxt Suite 554\nAntwanbury, KY 39452-7786'),(8,'????','AM',8,637947295,'8566 Tgwob Fnlet Suite 554\nAntwanbury, KY 39452-7786'),(9,'??????','GAA',9,429497295,'5336, Pgsb Inxblet Suite 554\nAntwanbury, KY 39452-7786'),(10,'????????','MEDO',10,12945295,'8496 Afsob Inlafet Suite 554\nAntwanbury, KY 39452-7786'),(11,'??????','VIE/LOWW',11,82962002,'8416 Ddsob Inlafet Suite, KY 39452-7786'),(12,'??????','BOJ/LBBG',12,19269101,'8416 Ddsob Inlafet Suite, KY 39452-7786');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citizenship`
--

DROP TABLE IF EXISTS `citizenship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citizenship` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `citizenship` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizenship`
--

LOCK TABLES `citizenship` WRITE;
/*!40000 ALTER TABLE `citizenship` DISABLE KEYS */;
INSERT INTO `citizenship` VALUES (1,'Polsha'),(2,'Ukrain'),(3,'Germany'),(4,'Russia'),(5,'UK'),(6,'USA'),(7,'China'),(8,'Japan'),(9,'Armenia'),(10,'Iraq');
/*!40000 ALTER TABLE `citizenship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_country` bigint unsigned NOT NULL,
  `russian_name` varchar(100) NOT NULL,
  `english_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`,`id_country`),
  UNIQUE KEY `id` (`id`),
  KEY `id_country` (`id_country`),
  KEY `city_rus_name_eng_name_idx` (`russian_name`,`english_name`),
  CONSTRAINT `city_airport_fk` FOREIGN KEY (`id`) REFERENCES `airport` (`id_airport`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (3,3,'????????','Aksu'),(8,8,'???????????? ????????????????','Arturo Michelena'),(7,7,'????????????','Baghdad'),(4,4,'????????????????/??????????????????','Baltimore/Washington'),(12,12,'????????????','Burgas'),(1,1,'??????????????????','Wangerooge'),(11,11,'????????','Vena'),(6,6,'????????????????????????????','Dnepropetrovsk'),(5,5,'????????????','Geneva'),(2,2,'????????','Cairo'),(10,10,'????????????','Medina'),(9,9,'?????????????????? - ??????????','Rotterdam - The Hague');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'F'),(2,'A'),(3,'P'),(4,'R'),(5,'C'),(6,'J'),(7,'W'),(8,'Y'),(9,'U'),(10,'X');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `russian_name` varchar(100) NOT NULL,
  `english_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `country_rus_name_eng_name_idx` (`russian_name`,`english_name`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (46,'Republic ??????????','Czech'),(9,'??????????????????','Australia'),(10,'??????????????','Austria'),(11,'??????????????????????','Azerbaijan'),(2,'??????????????','Albania'),(3,'??????????','Algeria'),(5,'????????????','Angola'),(4,'??????????????','Andorra'),(6,'?????????????? ?? ??????????????','Antigua and Barbuda'),(7,'??????????????????','Argentina'),(8,'??????????????','Armenia'),(1,'????????????????????','Afghanistan'),(12,'????????????','The Bahamas'),(14,'??????????????????','Bangladesh'),(15,'????????????????','Barbados'),(13,'??????????????','Bahrain'),(16,'????????????????','Belarus'),(18,'??????????','Belize'),(17,'??????????????','Belgium'),(19,'??????????','Benin'),(26,'????????????????','Bulgaria'),(21,'??????????????','Bolivia'),(22,'???????????? ?? ??????????????????????','Bosnia and Herzegovina'),(23,'????????????????','Botswana'),(24,'????????????????','Brazil'),(25,'????????????','Brunei'),(27,'?????????????? ????????','Burkina Faso'),(28,'??????????????','Burundi'),(20,'??????????','Bhutan'),(187,'??????????????','Vanuatu'),(188,'??????????????','Vatican City'),(183,'????????????????????????????','United Kingdom'),(75,'??????????????','Hungary'),(189,'??????????????????','Venezuela'),(51,'?????????????????? ??????????','East Timor'),(190,'??????????????','Vietnam'),(62,'??????????','Gabon'),(73,'??????????','Haiti'),(72,'????????????','Guyana'),(63,'????????????','The Gambia'),(66,'????????','Ghana'),(69,'??????????????????','Guatemal'),(70,'????????????','Guinea '),(71,'????????????-??????????','Guinea-Bissa'),(65,'????????????????','Germany'),(74,'????????????????','Honduras'),(68,'??????????????','Grenad'),(67,'????????????','Greece'),(64,'????????????','Georgia'),(47,'??????????','Denmark'),(40,'?????????????????????????????? ???????????????????? ??????????','The Democratic Republic of the Congo'),(48,'??????????????','Djibouti'),(49,'????????????????','Dominica'),(50,'?????????????????????????? ????????????????????','Dominican Republic'),(53,'????????????','Egypt'),(192,'????????????','Zambia'),(193,'????????????????','Zimbabwe'),(82,'??????????????','Israel'),(77,'??????????','India'),(78,'??????????????????','Indonesia'),(86,'????????????????','Jordan'),(80,'????????','Iraq'),(79,'????????','Iran'),(81,'????????????????','Ireland'),(76,'????????????????','Iceland'),(161,'??????????????','Spain'),(83,'????????????','Italy'),(191,'??????????','Yemen'),(32,'????????-??????????','Cape Verde'),(87,'??????????????????','Kazakhstan'),(29,'????????????????','Cambodia'),(30,'??????????????','Cameroon'),(31,'????????????','Canada'),(140,'??????????','Qatar'),(88,'??????????','Kenya'),(45,'????????','Cyprus'),(94,'????????????????','Kyrgyzstan'),(89,'????????????????','Kiribati'),(36,'??????????','China'),(37,'????????????????','Colombia'),(38,'????????????','Comoros'),(92,'????????????','Kosovo'),(41,'??????????-????????','Costa Rica'),(42,'??????-???????????????','Cote d???Ivoire'),(44,'????????','Cuba'),(93,'????????????','Kuwait'),(95,'????????','Laos'),(96,'????????????','Latvia'),(98,'????????????','Lesotho'),(99,'??????????????','Liberia'),(97,'??????????','Lebanon'),(100,'??????????','Libya'),(102,'??????????','Lithuania'),(101,'??????????????????????','Liechtenstein'),(103,'????????????????????','Luxembourg'),(112,'????????????????','Mauritius'),(111,'????????????????????','Mauritania'),(104,'????????????????????','Madagascar'),(84,'??????????','Jamaica '),(105,'????????????','Malawi'),(106,'????????????????','Malaysia'),(108,'????????','Mali'),(107,'????????????????','Maldives'),(109,'????????????','Malta'),(119,'??????????????','Morocco'),(110,'???????????????????? ??????????????','Marshall Islands'),(113,'??????????????','Mexico'),(120,'????????????????','Mozambique'),(115,'??????????????','Moldova'),(116,'????????????','Monaco'),(117,'????????????????','Mongolia'),(121,'????????????','Myanmar'),(122,'??????????????','Namibia'),(123,'??????????','Nauru'),(124,'??????????','Nepal'),(128,'??????????','Niger'),(129,'??????????????','Nigeria'),(125,'????????????????????','The Netherlands'),(127,'??????????????????','Nicaragua'),(134,'?????????? ????????????','Papua New Guinea ??????????'),(126,'?????????? ????????????????','New Zealand'),(130,'????????????????','Norway'),(182,'???????????????????????? ???????????????? ??????????????','United Arab Emirates'),(131,'????????','Oman'),(132,'????????????????','Pakistan'),(133,'??????????','Palau'),(135,'????????????????','Paraguay'),(136,'????????','Peru'),(138,'????????????','Poland'),(139,'????????????????????','Portugal'),(39,'???????????????????? ??????????','The Republic of the Congo'),(142,'????????????','Russia'),(143,'????????????','Rwanda'),(141,'??????????????','Romania'),(54,'??????????????????','El Salvador'),(147,'??????-????????????','San Marino'),(148,'??????-???????? ?? ????????????????','Sao Tome and Principe'),(149,'???????????????????? ????????????','Saudi Arabia'),(165,'??????????????????','Swaziland'),(90,'???????????????? ??????????','North Korea'),(152,'??????????????','Seychelles'),(150,'??????????????','Senegal'),(146,'????????-?????????????? ?? ??????????????????','Saint Vincent and the Grenadines'),(144,'????????-???????? ?? ??????????','Saint Kitts and Nevis'),(145,'????????-??????????','Saint Lucia'),(151,'????????????','Serbia'),(154,'????????????????','Singapore'),(168,'??????????','Syria'),(155,'????????????????','Slovakia'),(156,'????????????????','Slovenia'),(157,'???????????????????? ??????????????','Solomon Islands'),(158,'????????????','Somalia'),(163,'??????????','Sudan'),(164,'??????????????','Suriname'),(184,'??????','United States of America'),(153,'????????????-??????????','Sierra Leone'),(170,'??????????????????????','Tajikistan'),(172,'??????????????','Thailand'),(169,'??????????????','Taiwan'),(171,'????????????????','Tanzania'),(173,'????????','Togo'),(174,'??????????','Tonga'),(175,'???????????????? ?? ????????????','Trinidad and Tobago'),(179,'????????????','Tuvalu'),(176,'??????????','Tunisia'),(178,'????????????????????????','Turkmenistan'),(177,'????????????','Turkey'),(180,'????????????','Uganda'),(186,'????????????????????','Uzbekistan'),(181,'??????????????','Ukraine'),(185,'??????????????','Uruguay'),(114,'???????????????????????? ?????????? ????????????????????','Federated States of Micronesia'),(59,'??????????','Fiji'),(137,'??????????????????','The Philippines'),(60,'??????????????????','Finland'),(61,'??????????????','France'),(43,'????????????????','Croatia'),(33,'????????????????????-?????????????????????? ????????????????????','Central African Republic'),(34,'??????','Chad'),(118,'????????????????????','Montenegro'),(35,'????????','Chile'),(167,'??????????????????','Switzerland'),(166,'????????????','Sweden'),(162,'??????-??????????','Sri Lanka'),(52,'??????????????','Ecuador'),(55,'???????????????????????????? ????????????','Equatorial Guinea'),(56,'??????????????','Eritrea'),(57,'??????????????','Estonia'),(58,'??????????????','Ethiopia'),(159,'?????????? ????????????','South Africa'),(91,'?????????? ??????????','South Korea'),(160,'?????????? ??????????','South Sudan'),(85,'????????????','Japan');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_airplane` int unsigned NOT NULL,
  `departure_city` bigint unsigned DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `arrival_city` bigint unsigned DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `flight_time` time NOT NULL,
  `price` bigint unsigned DEFAULT NULL,
  `seating_capcity` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `flight_FK` (`departure_city`),
  KEY `flight_FK_1` (`arrival_city`),
  CONSTRAINT `flight_airplane_fk` FOREIGN KEY (`id`) REFERENCES `airplane` (`id`),
  CONSTRAINT `flight_FK` FOREIGN KEY (`departure_city`) REFERENCES `city` (`id`),
  CONSTRAINT `flight_FK_1` FOREIGN KEY (`arrival_city`) REFERENCES `city` (`id`),
  CONSTRAINT `flight_route_fk` FOREIGN KEY (`id`) REFERENCES `route` (`id`),
  CONSTRAINT `flight_schedule_fk` FOREIGN KEY (`id`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,3,2,'2021-02-04 18:24:33',9,'2021-09-15 21:28:41','23:28:43',10269,'114','2020-11-07 08:12:36','2021-02-26 02:15:52'),(2,1,2,'2021-10-11 23:12:43',10,'2021-08-18 15:26:51','03:21:33',14114,'514','2020-11-29 20:44:47','2021-04-21 23:25:52'),(3,6,1,'2021-08-18 21:44:19',5,'2021-09-07 20:56:07','09:50:36',260,'652','2021-02-04 10:35:23','2021-04-10 03:23:10'),(4,3,3,'2021-06-02 11:02:46',2,'2020-11-27 19:34:21','16:41:40',41140,'241','2021-03-05 19:23:39','2021-09-15 11:58:16'),(5,6,5,'2021-04-07 14:33:11',7,'2021-03-28 05:44:47','21:27:36',22315,'914','2021-10-04 23:36:51','2021-07-22 23:05:35'),(6,4,2,'2021-05-02 00:03:38',1,'2021-06-08 14:06:22','00:38:41',52310,'144','2020-11-16 19:42:24','2021-04-13 20:04:41'),(7,5,5,'2021-01-12 10:14:45',8,'2021-08-11 02:48:25','00:38:56',28851,'525','2021-10-28 09:38:04','2021-08-21 20:55:53'),(8,2,7,'2020-12-24 18:13:32',1,'2021-09-02 08:26:37','03:00:43',41114,'622','2020-12-12 02:43:52','2021-08-19 07:57:45'),(9,4,9,'2021-10-31 03:13:22',6,'2021-08-03 07:16:00','17:11:27',77042,'412','2021-09-10 00:37:09','2021-10-16 19:39:24'),(10,6,4,'2021-10-28 22:31:03',1,'2021-07-16 06:16:17','06:10:50',2411,'914','2021-10-02 20:52:14','2021-09-23 12:25:53');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `flights_from_cairo`
--

DROP TABLE IF EXISTS `flights_from_cairo`;
/*!50001 DROP VIEW IF EXISTS `flights_from_cairo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `flights_from_cairo` AS SELECT 
 1 AS `arrival_city`,
 1 AS `departure_time`,
 1 AS `arrival_time`,
 1 AS `airplane_board_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_passenger` bigint NOT NULL,
  `id_flight` bigint NOT NULL,
  `date_of_flight` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_order`),
  UNIQUE KEY `id_order` (`id_order`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `flight` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `passenger` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_order`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,3,'2021-10-27 09:15:02','2021-11-12 19:48:01','2021-11-12 19:48:01'),(2,1,4,'2021-03-28 14:03:28','2021-11-12 19:48:01','2021-11-12 19:48:01'),(3,3,7,'2020-11-27 12:50:44','2021-11-12 19:48:01','2021-11-12 19:48:01'),(4,5,8,'2021-12-04 01:30:34','2021-11-12 19:48:01','2021-11-12 19:48:01'),(5,6,1,'2021-01-16 09:02:21','2021-11-12 19:48:01','2021-11-12 19:48:01'),(6,8,5,'2015-11-04 20:41:21','2021-11-12 19:48:01','2021-11-12 19:48:01'),(7,7,6,'2012-11-05 16:11:05','2021-11-12 19:48:01','2021-11-12 19:48:01'),(8,4,2,'2019-09-29 20:51:04','2021-11-12 19:48:01','2021-11-12 19:48:01'),(9,10,9,'2021-10-29 01:30:28','2021-11-12 19:48:01','2021-11-12 19:48:01'),(10,8,10,'2018-08-09 23:56:46','2021-11-12 19:48:01','2021-11-12 19:48:01');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `determinate_sex` enum('male','female') NOT NULL,
  `citizenship` int NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `phone` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `passenger_firstname_lastname_idx` (`firstname`,`lastname`),
  CONSTRAINT `passenger_citizenship_fk` FOREIGN KEY (`id`) REFERENCES `citizenship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Tom','Klein','2014-05-20','female',3,'muller.robin@example.com','f3804f7fb2a818a8bbcbc498db4ff715fbc316e4',51510,'2003-11-07 18:33:45','1986-06-07 15:26:10'),(2,'Estefania','Boehm','2004-02-02','female',1,'christiana.sporer@example.net','908fe676a32d266d614d2b0e7e3fbfc705ea1a0f',36334,'2012-10-15 05:22:00','2021-11-12 19:48:01'),(3,'Willis','DuBuque','1991-10-08','female',6,'mya.mayert@example.com','3c36e87351ba76030583390ee8c6e4936fa13e56',35264,'1997-07-28 12:32:48','1971-07-11 22:46:48'),(4,'Archibald','Koelpin','1990-05-10','female',2,'bins.braeden@example.com','6c70e1923f46d836fc3aec3679b4f83b60c1d511',83111,'2015-01-13 12:41:05','1971-04-27 03:43:07'),(5,'Archibald','Koelpin','2003-01-11','male',10,'bfns.braeden@example.com','6c70e19ssg5226fc3aec3679b4f83b60c1d511',82310,'2015-01-13 12:41:05','1971-04-27 03:43:07'),(6,'Deontae','Koss','2003-09-23','female',4,'nannie.farrell@example.net','cb77d9f15119fa52d830490b4bc6e59d1bcd706f',22531,'1981-09-02 08:12:05','1973-04-25 07:50:11'),(7,'Kendra','Cole','1991-10-05','female',7,'dawn50@example.com','7e86e08c432b282551e04f6dbb312bb264b283d3',89127,'1979-02-15 04:57:42','2021-11-12 19:48:01'),(8,'Romaine','Fay','2018-01-28','female',5,'bgutkowski@example.net','e8e13ce68147ac750a62660a6593d5516656bffa',87363,'2002-02-10 07:51:09','1998-01-19 18:37:12'),(9,'Curtis','Osinski','1972-04-24','male',8,'bertram.feil@example.org','673d570d80a57cfe75b6937eacf61fb85a417a37',44572,'1981-06-02 22:05:21','1971-04-29 17:58:18'),(10,'Lou','Lynch','2013-01-14','male',9,'kuhlman.zaria@example.net','dc43d5358617a0899ae69b56b9eba50b9d184eed',36231,'2017-09-17 20:33:44','2004-02-04 18:22:57');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `passenger_info`
--

DROP TABLE IF EXISTS `passenger_info`;
/*!50001 DROP VIEW IF EXISTS `passenger_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passenger_info` AS SELECT 
 1 AS `name`,
 1 AS `citizenship`,
 1 AS `departure_time`,
 1 AS `departure_city`,
 1 AS `arrival_city`,
 1 AS `class`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `places_airplane`
--

DROP TABLE IF EXISTS `places_airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places_airplane` (
  `id_airplane` bigint unsigned NOT NULL,
  `id_class` bigint unsigned NOT NULL,
  `places` int NOT NULL,
  PRIMARY KEY (`id_airplane`,`id_class`),
  KEY `id_class` (`id_class`),
  CONSTRAINT `places_airplane_ibfk_1` FOREIGN KEY (`id_airplane`) REFERENCES `airplane_model` (`id_model`),
  CONSTRAINT `places_airplane_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_airplane`
--

LOCK TABLES `places_airplane` WRITE;
/*!40000 ALTER TABLE `places_airplane` DISABLE KEYS */;
INSERT INTO `places_airplane` VALUES (1,8,126),(2,5,163),(3,6,166),(4,2,236),(5,1,325),(6,3,141),(7,9,262),(8,4,252),(9,10,235),(10,7,522);
/*!40000 ALTER TABLE `places_airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `id_airline` bigint unsigned NOT NULL,
  `id_class` bigint unsigned NOT NULL,
  `price` bigint NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_airline`,`id_class`),
  KEY `id_class` (`id_class`),
  CONSTRAINT `price_ibfk_1` FOREIGN KEY (`id_airline`) REFERENCES `flight` (`id`),
  CONSTRAINT `price_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,3,37500,'2021-11-12 19:48:01','2021-11-12 19:48:01'),(2,2,27500,'2021-11-12 19:48:01','2021-11-12 19:48:01'),(3,6,44340,'2021-11-12 19:48:01','2021-11-12 19:48:01'),(4,4,77000,'2021-11-12 19:48:01','2021-11-12 19:48:01'),(5,8,17450,'2021-11-12 19:48:01','2021-11-12 19:48:01'),(6,1,15550,'2021-11-12 19:48:01','2021-11-12 19:48:01'),(7,9,12500,'2021-11-12 19:48:01','2021-11-12 19:48:01'),(8,10,9250,'2021-11-12 19:48:01','2021-11-12 19:48:01'),(9,5,19900,'2021-11-12 19:48:01','2021-11-12 19:48:01'),(10,7,13500,'2021-11-12 19:48:01','2021-11-12 19:48:01');
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `departure_city` bigint unsigned DEFAULT NULL,
  `arrival_city` bigint unsigned DEFAULT NULL,
  `distance` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `route_FK` (`departure_city`),
  KEY `route_FK_1` (`arrival_city`),
  CONSTRAINT `route_FK` FOREIGN KEY (`departure_city`) REFERENCES `city` (`id`),
  CONSTRAINT `route_FK_1` FOREIGN KEY (`arrival_city`) REFERENCES `city` (`id`),
  CONSTRAINT `route_schedule_fk` FOREIGN KEY (`id`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,2,6,4250,'1975-03-07 20:32:04','1980-03-06 20:26:18'),(2,3,4,3799,'1991-02-26 15:10:14','2001-03-17 09:30:11'),(3,7,3,902,'1993-07-19 10:49:11','2007-09-04 23:45:40'),(4,4,9,9226,'2011-03-18 04:51:46','2007-04-30 11:59:38'),(5,10,1,8210,'1972-02-19 01:32:45','1986-07-30 06:17:47'),(6,1,8,8769,'2008-02-14 19:36:18','2011-08-11 11:15:22'),(7,2,7,2878,'2012-10-06 06:43:28','2020-12-12 14:31:53'),(8,9,7,8978,'1999-05-25 05:23:16','2016-08-31 20:26:05'),(9,1,10,1473,'1982-08-10 04:15:04','1985-07-25 22:40:12'),(10,6,1,8778,'1998-01-02 04:23:55','2017-04-20 17:51:25');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_flight` int unsigned NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,2,'1977-05-23 15:11:23','1973-10-27 09:15:02','1990-06-18 11:08:03','1992-12-02 20:27:00'),(2,1,'1994-03-30 03:34:18','2007-03-28 14:03:28','1976-02-12 06:34:43','2021-04-15 23:46:08'),(3,3,'1998-07-01 13:16:00','2020-11-27 12:50:44','1997-06-20 21:44:23','1970-09-16 20:39:36'),(4,5,'1980-07-09 13:55:59','1975-12-04 01:30:34','1995-10-18 20:20:21','1993-11-19 10:44:35'),(5,6,'1979-06-15 22:45:37','1993-01-16 09:02:21','2016-04-04 18:49:03','1970-05-19 12:43:58'),(6,8,'2002-06-07 19:23:10','1985-11-04 20:41:21','1998-04-24 14:01:51','1984-07-06 21:31:10'),(7,7,'2015-03-13 05:34:28','2002-11-05 16:11:05','1997-12-06 04:55:25','1997-03-02 14:02:22'),(8,4,'1995-09-29 04:38:23','2012-09-29 20:51:04','2018-02-09 04:39:21','1998-05-22 12:40:08'),(9,10,'2004-11-23 10:48:15','2008-10-29 01:30:28','2008-04-16 20:55:30','1986-08-14 04:07:48'),(10,8,'2007-03-26 03:42:59','1978-08-09 23:56:46','1988-01-04 15:10:43','2010-09-03 02:16:35');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_order` bigint NOT NULL,
  `id_schedule` bigint NOT NULL,
  `id_class` bigint NOT NULL,
  `id_ticket_type` bigint NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id`) REFERENCES `classes` (`id`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`id`) REFERENCES `ticket_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,2,3,3,10,'2021-10-27 09:15:02','2021-11-12 19:48:01'),(2,1,4,7,8,'2021-03-28 14:03:28','2021-04-15 23:46:08'),(3,3,7,1,6,'2020-11-27 12:50:44','2021-11-12 19:48:01'),(4,5,8,2,1,'2021-12-04 01:30:34','2021-11-12 19:48:01'),(5,6,1,10,5,'2021-01-16 09:02:21','2021-11-12 19:48:01'),(6,8,5,9,4,'2015-11-04 20:41:21','2021-11-12 19:48:01'),(7,7,6,8,2,'2012-11-05 16:11:05','2021-11-12 19:48:01'),(8,4,2,4,3,'2019-09-29 20:51:04','2021-11-12 19:48:01'),(9,10,9,5,7,'2021-10-29 01:30:28','2021-11-12 19:48:01'),(10,8,10,6,9,'2018-08-09 23:56:46','2021-11-12 19:48:01');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_rate`
--

DROP TABLE IF EXISTS `ticket_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_rate` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_flight` bigint NOT NULL,
  `id_ticket` bigint NOT NULL,
  `id_ticket_type` bigint NOT NULL,
  `date_rate` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `ticket_rate_ibfk_1` FOREIGN KEY (`id`) REFERENCES `flight` (`id`),
  CONSTRAINT `ticket_rate_ibfk_2` FOREIGN KEY (`id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `ticket_rate_ibfk_3` FOREIGN KEY (`id`) REFERENCES `ticket_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_rate`
--

LOCK TABLES `ticket_rate` WRITE;
/*!40000 ALTER TABLE `ticket_rate` DISABLE KEYS */;
INSERT INTO `ticket_rate` VALUES (1,3,3,3,'2021-10-27 09:15:02','2021-10-27 09:15:02','2021-11-12 19:48:01'),(2,8,4,7,'2020-11-27 12:50:44','2021-03-28 14:03:28','2021-04-15 23:46:08'),(3,2,7,2,'2021-12-04 01:30:34','2020-11-27 12:50:44','2021-11-12 19:48:01'),(4,5,8,1,'2018-08-09 23:56:46','2021-12-04 01:30:34','2021-11-12 19:48:01'),(5,6,1,10,'2019-09-29 20:51:04','2021-01-16 09:02:21','2021-11-12 19:48:01'),(6,1,5,8,'2021-03-28 14:03:28','2015-11-04 20:41:21','2021-11-12 19:48:01'),(7,4,6,9,'2019-09-29 20:51:04','2012-11-05 16:11:05','2021-11-12 19:48:01'),(8,7,2,4,'2018-08-09 23:56:46','2019-09-29 20:51:04','2021-11-12 19:48:01'),(9,10,9,6,'2021-10-27 09:15:02','2021-10-29 01:30:28','2021-11-12 19:48:01'),(10,8,10,5,'2021-01-16 09:02:21','2018-08-09 23:56:46','2021-11-12 19:48:01');
/*!40000 ALTER TABLE `ticket_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_types`
--

DROP TABLE IF EXISTS `ticket_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_flight` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `ticket_types_ibfk_1` FOREIGN KEY (`id`) REFERENCES `flight` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_types`
--

LOCK TABLES `ticket_types` WRITE;
/*!40000 ALTER TABLE `ticket_types` DISABLE KEYS */;
INSERT INTO `ticket_types` VALUES (1,5),(2,8),(3,6),(4,2),(5,7),(6,3),(7,9),(8,10),(9,4),(10,1);
/*!40000 ALTER TABLE `ticket_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `flights_from_cairo`
--

/*!50001 DROP VIEW IF EXISTS `flights_from_cairo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `flights_from_cairo` (`arrival_city`,`departure_time`,`arrival_time`,`airplane_board_number`) AS select `c`.`english_name` AS `english_name`,`f`.`departure_time` AS `departure_time`,`f`.`arrival_time` AS `arrival_time`,`a`.`board_number` AS `board_number` from ((`flight` `f` join `airplane` `a` on((`a`.`id` = `f`.`id`))) join `city` `c` on((`c`.`id` = `f`.`arrival_city`))) where (`f`.`departure_city` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passenger_info`
--

/*!50001 DROP VIEW IF EXISTS `passenger_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passenger_info` (`name`,`citizenship`,`departure_time`,`departure_city`,`arrival_city`,`class`) AS select concat(`p`.`firstname`,`p`.`lastname`) AS `CONCAT(p.firstname, p.lastname)`,`c`.`citizenship` AS `citizenship`,`s`.`departure_time` AS `departure_time`,`r`.`departure_city` AS `departure_city`,`r`.`arrival_city` AS `arrival_city`,`cl`.`class` AS `class` from (((((`orders` `o` join `passenger` `p` on((`p`.`id` = `o`.`id_passenger`))) join `citizenship` `c` on((`c`.`id` = `p`.`citizenship`))) join `schedule` `s` on((`s`.`id` = `o`.`id_order`))) join `route` `r` on((`r`.`id` = `o`.`id_order`))) join `classes` `cl` on((`cl`.`id` = `o`.`id_order`))) where (`p`.`id` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-12 21:52:53
