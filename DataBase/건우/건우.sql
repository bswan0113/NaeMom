-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: dbp
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accomodation_option`
--

DROP TABLE IF EXISTS `accomodation_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accomodation_option` (
  `ao_num` int NOT NULL AUTO_INCREMENT,
  `ao_name` varchar(20) NOT NULL,
  `ao_capacity` int NOT NULL,
  `ao_price` int NOT NULL,
  `ao_room_number` varchar(20) NOT NULL,
  `ao_room_detail` longtext NOT NULL,
  `ao_pd_num` int NOT NULL,
  PRIMARY KEY (`ao_num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accomodation_option`
--

LOCK TABLES `accomodation_option` WRITE;
/*!40000 ALTER TABLE `accomodation_option` DISABLE KEYS */;
INSERT INTO `accomodation_option` VALUES (7,'1',1,1,'1','1',2);
/*!40000 ALTER TABLE `accomodation_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_list`
--

DROP TABLE IF EXISTS `buy_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_list` (
  `bl_num` int NOT NULL AUTO_INCREMENT,
  `bl_state` varchar(10) NOT NULL,
  `bl_total_price` int NOT NULL,
  `bl_price` int NOT NULL,
  `bl_stack_mile` int NOT NULL,
  `bl_use_mile` int DEFAULT NULL,
  `bl_me_id` varchar(12) NOT NULL,
  `bl_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bl_num`),
  KEY `FK_member_TO_buy_list_1` (`bl_me_id`),
  CONSTRAINT `FK_member_TO_buy_list_1` FOREIGN KEY (`bl_me_id`) REFERENCES `member` (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_list`
--

LOCK TABLES `buy_list` WRITE;
/*!40000 ALTER TABLE `buy_list` DISABLE KEYS */;
INSERT INTO `buy_list` VALUES (1,'이용완료',10000,10000,0,0,'abcd','2023-04-16 23:42:44');
/*!40000 ALTER TABLE `buy_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_product`
--

DROP TABLE IF EXISTS `change_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `change_product` (
  `cp_num` int NOT NULL AUTO_INCREMENT,
  `cp_pd_num` int NOT NULL,
  `cp_rated` int NOT NULL DEFAULT '0',
  `cp_viewcount` int NOT NULL DEFAULT '0',
  `cp_search_volume_count` int NOT NULL DEFAULT '0',
  `cp_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cp_num`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_product`
--

LOCK TABLES `change_product` WRITE;
/*!40000 ALTER TABLE `change_product` DISABLE KEYS */;
INSERT INTO `change_product` VALUES (1,1,2,10,0,'2023-04-27 19:25:23'),(2,2,1,5,0,'2023-04-27 19:25:23'),(3,3,0,14,1,'2023-04-27 19:25:23'),(4,4,0,5,2,'2023-04-27 19:25:23'),(5,5,0,1,0,'2023-04-27 19:25:23'),(6,6,0,2,0,'2023-04-27 19:25:23'),(7,7,0,2,0,'2023-04-27 19:25:23'),(8,8,0,2,0,'2023-04-27 19:25:23'),(9,9,0,1,0,'2023-04-27 19:25:23'),(10,1,1,22,0,'2023-05-04 19:38:28'),(11,2,1,14,0,'2023-05-04 19:38:28'),(12,3,0,17,3,'2023-05-04 19:38:28'),(13,4,0,6,2,'2023-05-04 19:38:28'),(14,5,0,2,0,'2023-05-04 19:38:28'),(15,6,0,2,0,'2023-05-04 19:38:28'),(16,7,0,5,0,'2023-05-04 19:38:28'),(17,8,0,3,0,'2023-05-04 19:38:28'),(18,9,0,7,0,'2023-05-04 19:38:28'),(19,10,0,3,0,'2023-05-04 19:38:28'),(25,1,1,22,0,'2023-05-04 20:00:00'),(26,2,1,14,0,'2023-05-04 20:00:00'),(27,3,0,17,3,'2023-05-04 20:00:00'),(28,4,0,6,2,'2023-05-04 20:00:00'),(29,5,0,2,0,'2023-05-04 20:00:00'),(30,6,0,2,0,'2023-05-04 20:00:00'),(31,7,0,5,0,'2023-05-04 20:00:00'),(32,8,0,3,0,'2023-05-04 20:00:00'),(33,9,0,7,0,'2023-05-04 20:00:00'),(34,10,0,3,0,'2023-05-04 20:00:00'),(40,1,2,1,0,'2023-04-04 19:25:23'),(41,2,0,0,0,'2023-04-04 19:25:23'),(42,3,0,0,0,'2023-04-04 19:25:23'),(43,4,0,0,0,'2023-04-04 19:25:23'),(44,5,0,0,0,'2023-04-04 19:25:23'),(45,6,0,0,0,'2023-04-04 19:25:23'),(46,7,0,0,0,'2023-04-04 19:25:23'),(47,8,0,0,0,'2023-04-04 19:25:23'),(48,9,0,0,0,'2023-04-04 19:25:23'),(49,10,0,0,0,'2023-05-04 20:27:02'),(50,1,1,22,0,'2023-05-04 21:11:34'),(51,2,5,14,0,'2023-05-04 21:11:34'),(52,3,7,17,21,'2023-05-04 21:11:34'),(53,4,2,6,2,'2023-05-04 21:11:34'),(54,5,1,2,0,'2023-05-04 21:11:34'),(55,6,1,2,0,'2023-05-04 21:11:34'),(56,7,1,5,0,'2023-05-04 21:11:34'),(57,8,0,3,0,'2023-05-04 21:11:34'),(58,9,0,7,0,'2023-05-04 21:11:34'),(59,10,0,3,0,'2023-05-04 21:11:34'),(65,1,1,22,0,'2023-05-04 21:12:29'),(66,2,5,14,0,'2023-05-04 21:12:29'),(67,3,7,17,21,'2023-05-04 21:12:29'),(68,4,2,6,2,'2023-05-04 21:12:29'),(69,5,1,2,0,'2023-05-04 21:12:29'),(70,6,1,2,0,'2023-05-04 21:12:29'),(71,7,1,5,0,'2023-05-04 21:12:29'),(72,8,0,3,0,'2023-05-04 21:12:29'),(73,9,0,7,0,'2023-05-04 21:12:29'),(74,10,0,3,0,'2023-05-04 21:12:29');
/*!40000 ALTER TABLE `change_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `co_num` int NOT NULL AUTO_INCREMENT,
  `co_me_id` varchar(12) NOT NULL,
  `co_title` varchar(50) NOT NULL,
  `co_content` longtext NOT NULL,
  `co_cc_category_num` int NOT NULL,
  `co_cs_schedule_num` int NOT NULL,
  `co_total_distance` varchar(15) NOT NULL,
  `co_register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co_update_date` datetime DEFAULT NULL,
  `co_up` int NOT NULL DEFAULT '0',
  `co_views` int NOT NULL DEFAULT '0',
  `co_down` int NOT NULL DEFAULT '0',
  `co_report` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`co_num`),
  KEY `FK_course_schedule_TO_course_1_idx` (`co_cs_schedule_num`),
  KEY `FK_course_category_TO_course_1_idx` (`co_cc_category_num`),
  CONSTRAINT `co_cc_category_num` FOREIGN KEY (`co_cc_category_num`) REFERENCES `course_category` (`cc_category_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `co_cs_schedule_num` FOREIGN KEY (`co_cs_schedule_num`) REFERENCES `course_schedule` (`cs_schedule_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'abcd','코스1','코스1',2,3,'0','2023-04-17 17:43:14',NULL,0,4,0,0),(2,'qwe','ㅕㅓㅜㅡㅔㅐㅣㅑㅡ',';ㅏ',2,2,'0','2023-05-01 18:27:48',NULL,0,1,0,0),(3,'qwe','ㅇ혹ㅇ고','ㄴㅇㄴㅁㅇ',2,2,'0','2023-05-01 18:28:35',NULL,0,3,0,0),(4,'qwe','34534','5353',3,2,'0','2023-05-02 17:12:47',NULL,0,1,0,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_category`
--

DROP TABLE IF EXISTS `course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_category` (
  `cc_category_num` int NOT NULL AUTO_INCREMENT,
  `cc_category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cc_category_num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_category`
--

LOCK TABLES `course_category` WRITE;
/*!40000 ALTER TABLE `course_category` DISABLE KEYS */;
INSERT INTO `course_category` VALUES (1,'가족코스'),(2,'혼자여행'),(3,'도보코스'),(4,'힐링코스'),(5,'맛 코스'),(6,'캠핑코스'),(7,'반려동물과 함께');
/*!40000 ALTER TABLE `course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_item`
--

DROP TABLE IF EXISTS `course_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_item` (
  `ci_num` int NOT NULL AUTO_INCREMENT,
  `ci_index` varchar(255) NOT NULL,
  `ci_co_num` int NOT NULL,
  `ci_pd_num` int NOT NULL,
  PRIMARY KEY (`ci_num`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_item`
--

LOCK TABLES `course_item` WRITE;
/*!40000 ALTER TABLE `course_item` DISABLE KEYS */;
INSERT INTO `course_item` VALUES (1,'1',1,2),(2,'2',1,1),(3,'1',2,1),(4,'1',3,4),(5,'2',3,2),(6,'3',3,5),(7,'4',3,6),(8,'1',4,5);
/*!40000 ALTER TABLE `course_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_scedule`
--

DROP TABLE IF EXISTS `course_scedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_scedule` (
  `cs_scedule_num` int NOT NULL AUTO_INCREMENT,
  `cs_scedule_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cs_scedule_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_scedule`
--

LOCK TABLES `course_scedule` WRITE;
/*!40000 ALTER TABLE `course_scedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_scedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_schedule`
--

DROP TABLE IF EXISTS `course_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedule` (
  `cs_schedule_num` int NOT NULL AUTO_INCREMENT,
  `cs_schedule_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cs_schedule_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_schedule`
--

LOCK TABLES `course_schedule` WRITE;
/*!40000 ALTER TABLE `course_schedule` DISABLE KEYS */;
INSERT INTO `course_schedule` VALUES (1,'당일여행'),(2,'1박 2일'),(3,'2박 3일 이상');
/*!40000 ALTER TABLE `course_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_off`
--

DROP TABLE IF EXISTS `day_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day_off` (
  `do_num` int NOT NULL AUTO_INCREMENT,
  `do_pd_num` int NOT NULL,
  `do_state` char(2) NOT NULL,
  `do_date` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`do_num`),
  KEY `FK_product_TO_day_off_1` (`do_pd_num`),
  CONSTRAINT `FK_product_TO_day_off_1` FOREIGN KEY (`do_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_off`
--

LOCK TABLES `day_off` WRITE;
/*!40000 ALTER TABLE `day_off` DISABLE KEYS */;
INSERT INTO `day_off` VALUES (1,4,'정','월'),(2,4,'정','화'),(3,6,'정','월'),(4,6,'정','화'),(5,6,'정','수'),(6,6,'정','목'),(7,6,'정','금'),(8,6,'정','토'),(9,6,'정','일'),(10,8,'정','금'),(11,8,'정','토'),(12,8,'임',NULL),(13,6,'임',NULL),(14,1,'임',NULL),(15,9,'정','수'),(16,9,'정','금');
/*!40000 ALTER TABLE `day_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festival_option`
--

DROP TABLE IF EXISTS `festival_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `festival_option` (
  `fo_num` int NOT NULL AUTO_INCREMENT,
  `fo_price` int NOT NULL,
  `fo_age` varchar(6) NOT NULL,
  `fo_pd_num` int NOT NULL,
  PRIMARY KEY (`fo_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festival_option`
--

LOCK TABLES `festival_option` WRITE;
/*!40000 ALTER TABLE `festival_option` DISABLE KEYS */;
INSERT INTO `festival_option` VALUES (6,1231,'ㄴㅇㄹ',8);
/*!40000 ALTER TABLE `festival_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `fi_num` int NOT NULL AUTO_INCREMENT,
  `fi_category` varchar(20) DEFAULT NULL,
  `fi_ori_name` varchar(255) NOT NULL,
  `fi_name` varchar(255) NOT NULL,
  `fi_table` varchar(255) NOT NULL,
  `fi_table_key` int NOT NULL,
  PRIMARY KEY (`fi_num`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'게시글 썸네일','더미1.jpg','/2023/05/06/27c019e2-d833-4d02-b319-6ecf739b59d4_더미1.jpg','product',1),(2,'게시글 대표이미지','더미2.jpg','/2023/04/12/8a067d0d-1a20-4637-97b5-27c510b0dc9f_더미2.jpg','product',1),(3,'게시글 썸네일','썸네일.jpg','/2023/04/12/60c09af7-e734-4d68-9bfe-eb75cdea20d6_썸네일.jpg','product',2),(4,'게시글 대표이미지','더미2.jpg','/2023/04/12/79820789-381e-4609-8297-fff696743cf3_더미2.jpg','product',2),(6,NULL,'썸네일.jpg','/2023/04/12/cb531d88-188b-42f6-be04-b28e5dff6ac3_썸네일.jpg','accomodation_option',6),(7,NULL,'더미2.jpg','/2023/04/12/4da6df9b-2293-4685-b11a-f7f680e9d9dd_더미2.jpg','accomodation_option',7),(8,NULL,'더미2.jpg','/2023/04/16/5c52c0a8-60fe-4936-acc5-d48e336f0df8_더미2.jpg','qna',13),(9,NULL,'더미1.jpg','/2023/04/16/d9711141-f8b3-4cea-9e4d-d984d8e3c30f_더미1.jpg','qna',13),(10,NULL,'','/2023/04/16/ddd99d8e-586a-4209-9594-07a43efd66e1_','qna',13),(11,NULL,'','/2023/04/16/8334020c-062f-494c-a1bb-90e3347ba00d_','qna',13),(12,NULL,'','/2023/04/16/c699301c-0944-4e2d-9e1a-cc0d019e3cf3_','qna',13),(13,NULL,'더미1.jpg','/2023/04/16/ae3edd32-a7ea-4401-98f5-2c5b0acd9725_더미1.jpg','qna',15),(14,'게시글 썸네일','더미2.jpg','/2023/05/06/a4a5939a-1a3d-454c-8aa5-b1cffde1f539_더미2.jpg','product',3),(15,'게시글 썸네일','더미2.jpg','/2023/05/06/12d52b64-9452-4308-8c1d-50b96b103122_더미2.jpg','product',4),(16,'게시글 썸네일','더미1.jpg','/2023/05/06/1a7fcfb7-5d1a-429f-8931-075c7719504a_더미1.jpg','product',5),(17,'게시글 썸네일','더미1.jpg','/2023/05/06/df0c59ab-7778-41dc-aafd-cb6c07ceafb9_더미1.jpg','product',6),(18,'게시글 썸네일','더미2.jpg','/2023/04/19/80fbf14d-006d-4136-8d0a-9eb31d383198_더미2.jpg','product',7),(19,'게시글 썸네일','더미2.jpg','/2023/04/19/085fffc3-7225-4b39-9821-99560af533a2_더미2.jpg','product',8),(21,NULL,'더미2.jpg','/2023/04/27/f8c0a62a-9e5a-4006-993f-6c104b57d8df_더미2.jpg','review',3),(22,'이벤트 이미지','더미2.jpg','','Event',1),(23,'게시글 썸네일','썸네일.jpg','/2023/05/01/a8f0bbb6-8312-4e3e-a073-09f8342d6b53_썸네일.jpg','product',9),(24,'게시글 대표이미지','더미2.jpg','/2023/05/01/020cf246-cadf-4dfa-b024-b1020ffd5b4a_더미2.jpg','product',9),(25,'게시글 썸네일','더미1.jpg','/2023/05/01/47fbba8f-93e6-482d-9c78-aeb265b8fad7_더미1.jpg','product',10),(27,NULL,'더미1.jpg','/2023/05/06/e4d1eb89-128f-47a7-8c2c-51b88fc8c6ab_더미1.jpg','restraunt_option',17);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_checked`
--

DROP TABLE IF EXISTS `file_checked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_checked` (
  `fc_num` int NOT NULL AUTO_INCREMENT,
  `fc_fi_num` int NOT NULL,
  `fc_checked` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`fc_num`),
  KEY `fc_fi_num_idx` (`fc_fi_num`),
  CONSTRAINT `fc_fi_num` FOREIGN KEY (`fc_fi_num`) REFERENCES `file` (`fi_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_checked`
--

LOCK TABLES `file_checked` WRITE;
/*!40000 ALTER TABLE `file_checked` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_checked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hash_tag`
--

DROP TABLE IF EXISTS `hash_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hash_tag` (
  `hg_num` int NOT NULL AUTO_INCREMENT,
  `hg_name` varchar(50) NOT NULL,
  `hg_pd_num` int NOT NULL,
  PRIMARY KEY (`hg_num`),
  KEY `FK_product_TO_hash_tag_1` (`hg_pd_num`),
  CONSTRAINT `FK_product_TO_hash_tag_1` FOREIGN KEY (`hg_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hash_tag`
--

LOCK TABLES `hash_tag` WRITE;
/*!40000 ALTER TABLE `hash_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `hash_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landmark_option`
--

DROP TABLE IF EXISTS `landmark_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landmark_option` (
  `lo_num` int NOT NULL AUTO_INCREMENT,
  `lo_price` int NOT NULL,
  `lo_age` varchar(6) NOT NULL,
  `lo_pd_num` int NOT NULL,
  PRIMARY KEY (`lo_num`),
  KEY `FK_product_TO_landmark_option_1` (`lo_pd_num`),
  CONSTRAINT `FK_product_TO_landmark_option_1` FOREIGN KEY (`lo_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmark_option`
--

LOCK TABLES `landmark_option` WRITE;
/*!40000 ALTER TABLE `landmark_option` DISABLE KEYS */;
INSERT INTO `landmark_option` VALUES (1,12312,'ㄴㅇㅁ',5);
/*!40000 ALTER TABLE `landmark_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `li_num` int NOT NULL AUTO_INCREMENT,
  `li_me_id` varchar(12) NOT NULL,
  `li_table_key` int NOT NULL,
  `li_updown` int NOT NULL,
  `li_table` varchar(45) NOT NULL,
  PRIMARY KEY (`li_num`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_position`
--

DROP TABLE IF EXISTS `map_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_position` (
  `mp_index` int NOT NULL AUTO_INCREMENT,
  `mp_x` double NOT NULL,
  `mp_y` double NOT NULL,
  `mp_pd_num` int NOT NULL,
  PRIMARY KEY (`mp_index`),
  KEY `FK_product_TO_map_position_1` (`mp_pd_num`),
  CONSTRAINT `FK_product_TO_map_position_1` FOREIGN KEY (`mp_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_position`
--

LOCK TABLES `map_position` WRITE;
/*!40000 ALTER TABLE `map_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `me_id` varchar(12) NOT NULL,
  `me_pw` varchar(255) NOT NULL,
  `me_name` varchar(13) NOT NULL,
  `me_birthday` date NOT NULL,
  `me_phone` varchar(13) NOT NULL COMMENT 'unique_key',
  `me_gender` char(10) NOT NULL,
  `me_authority` int NOT NULL DEFAULT '1',
  `me_nickname` varchar(255) NOT NULL,
  `me_street_address` varchar(50) NOT NULL,
  `me_registered_address` varchar(50) NOT NULL,
  `me_detail_address` varchar(100) NOT NULL,
  `me_mileage` int NOT NULL DEFAULT '0',
  `me_session_id` varchar(45) DEFAULT NULL,
  `me_session_limit` datetime DEFAULT NULL,
  `me_ma_email` varchar(50) NOT NULL,
  `me_post` varchar(100) DEFAULT NULL,
  `me_score_ao` int NOT NULL DEFAULT '50',
  `me_score_fe` int NOT NULL DEFAULT '50',
  `me_score_la` int NOT NULL DEFAULT '50',
  `me_score_reo` int NOT NULL DEFAULT '50',
  PRIMARY KEY (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('abcd','1234','안건우','1993-01-13','010-3151-7063','남',1,'건우','서울시 은평구 가좌로 165','서울시 은평구 갈현동 662','오벨리스크 401호',100,NULL,NULL,'aa',NULL,50,50,50,50),('agh0113!','$2a$10$CjlnrE/.5GuVXKerzRa4sOJNqW6YWuCbOYCCmmJdXzISfa8/UtF7K','안건우','1993-01-13','010-3151-7063','남성',10,'sfafas','서울 은평구 가좌로 165 (응암동)','서울 은평구 응암동 678-3','오벨리스크 401',0,'8002D8FA02F1C6DC2CDACA3EAC721FAD','2023-05-13 20:31:35','zkoiu@naver.com','03479',50,60,58,50),('agh0113!!','$2a$10$jUZweyhRTJCJe9Tf0oyi8eEwnZ2AzX02IEHVdNyRbq7B.scwlUyZG','안건우','1993-01-13','010-3151-7063','남성',1,'user-5BD1XQMYW65QBL7Q','경기 김포시 김포대로926번길 15 (북변동, 풍년마을서광신안아파트)','경기 김포시 북변동 802','1701호',0,NULL,NULL,'sakulavi0113@gmail.com','10097',50,50,50,50);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_approve`
--

DROP TABLE IF EXISTS `member_approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_approve` (
  `ma_email` varchar(50) NOT NULL,
  `ma_code` varchar(6) NOT NULL,
  `ma_validate_time` datetime NOT NULL,
  PRIMARY KEY (`ma_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_approve`
--

LOCK TABLES `member_approve` WRITE;
/*!40000 ALTER TABLE `member_approve` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_approve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_profile`
--

DROP TABLE IF EXISTS `member_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_profile` (
  `mf_num` int NOT NULL AUTO_INCREMENT,
  `mf_name` varchar(255) NOT NULL,
  `mf_ori_name` varchar(255) NOT NULL,
  `mf_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`mf_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_profile`
--

LOCK TABLES `member_profile` WRITE;
/*!40000 ALTER TABLE `member_profile` DISABLE KEYS */;
INSERT INTO `member_profile` VALUES (2,'/2023/04/17/bde34016-5ce3-4e88-bc6b-f2fe247a5aaf_더미1.jpg','더미1.jpg','abcd'),(3,'/2023/05/01/9db94e8c-02c1-4652-a053-772b4dd22855_더미2.jpg','더미2.jpg','agh0113!');
/*!40000 ALTER TABLE `member_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mileage`
--

DROP TABLE IF EXISTS `mileage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mileage` (
  `mi_num` int NOT NULL AUTO_INCREMENT,
  `mi_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mi_update` int NOT NULL,
  `mi_me_id` varchar(12) NOT NULL,
  `mi_bl_num` int NOT NULL,
  PRIMARY KEY (`mi_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mileage`
--

LOCK TABLES `mileage` WRITE;
/*!40000 ALTER TABLE `mileage` DISABLE KEYS */;
INSERT INTO `mileage` VALUES (1,'2018-04-17 00:00:00',100,'abcd',0),(2,'2011-11-11 00:00:00',-100,'abcd',0);
/*!40000 ALTER TABLE `mileage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `ol_num` int NOT NULL AUTO_INCREMENT,
  `ol_amount` int NOT NULL,
  `ol_total_price` int NOT NULL,
  `ol_bl_num` int NOT NULL,
  `ol_option` varchar(10) NOT NULL,
  `ol_pc_num` int NOT NULL,
  PRIMARY KEY (`ol_num`),
  KEY `FK_buy_list_TO_order_list_1` (`ol_bl_num`),
  KEY `FK_product_category_TO_order_list_1` (`ol_pc_num`),
  CONSTRAINT `FK_buy_list_TO_order_list_1` FOREIGN KEY (`ol_bl_num`) REFERENCES `buy_list` (`bl_num`),
  CONSTRAINT `FK_product_category_TO_order_list_1` FOREIGN KEY (`ol_pc_num`) REFERENCES `product_category` (`pc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pd_num` int NOT NULL AUTO_INCREMENT,
  `pd_title` varchar(50) NOT NULL,
  `pd_content` longtext NOT NULL,
  `pd_subtitle` varchar(50) NOT NULL,
  `pd_street_address` varchar(50) NOT NULL,
  `pd_registerd_address` varchar(50) NOT NULL,
  `pd_detail_address` varchar(100) NOT NULL,
  `pd_parking` varchar(10) NOT NULL,
  `pd_capacity` int NOT NULL,
  `pd_viewcount` int NOT NULL DEFAULT '0',
  `pd_open_time` time NOT NULL,
  `pd_close_time` time NOT NULL,
  `pd_pc_num` int NOT NULL,
  `pd_fe_start` datetime DEFAULT CURRENT_TIMESTAMP,
  `pd_fe_end` datetime DEFAULT CURRENT_TIMESTAMP,
  `pd_score` int NOT NULL DEFAULT '100',
  PRIMARY KEY (`pd_num`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'여행지','<p>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br>여행지<br></p>','여행지','여행지','여행지','여행지','여행지',111,35,'01:30:00','01:00:00',1,'2023-04-19 17:34:13','2023-04-19 17:34:13',120),(2,'숙박','<p>숙박<br></p>','숙박','숙박','숙박','숙박','숙박',1,18,'00:30:00','00:00:00',3,'2023-04-19 17:34:13','2023-04-19 17:34:13',102),(3,'여행지','<p>여행지<br></p>','여행지','여행지','여행지','여행지','여행지',11,20,'00:00:00','02:00:00',1,'2023-04-19 17:34:13','2023-04-19 17:34:13',103),(4,'여행지3','<p>여행지3<span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><span style=\"font-size: 1rem;\">여행지3</span><br></p>','여행지3','여행지3','여행지3','여행지3','11',11,9,'01:00:00','00:30:00',1,'2023-04-19 17:34:13','2023-04-19 17:34:13',103),(5,'여행지4','<p>여행지4<br></p>','여행지4','여행지4','여행지4','여행지4','여행지4',11,8,'03:00:00','02:00:00',1,'2023-04-19 17:34:13','2023-04-19 17:34:13',107),(6,'축제1','<p>축제1<br></p>','축제1','축제1','축제1','축제1','축제1',123,7,'00:30:00','01:30:00',4,'2023-04-19 17:34:13','2023-04-19 17:34:13',105),(7,'1','<p>ㅇㅁㄴ</p>','1','1','1','1','1',1,14,'00:00:00','00:00:00',4,'2023-04-23 00:00:00','2023-04-24 00:00:00',109),(8,'1','<p>ㅇㅁㄴ</p>','1','1','1','1','1',1,13,'00:00:00','00:00:00',4,'2023-04-23 00:00:00','2023-04-24 00:00:00',109),(9,'4124','<p>4124</p>','412','경기 성남시 분당구 대왕판교로606번길 45 (삼평동)','경기 성남시 분당구 삼평동 653','ㅇㅁㄴㅇㄱㅂ','141',41241,12,'17:30:00','02:00:00',2,NULL,NULL,104),(10,'ㄴㅇㅁ','<p>ㄻㄴ</p>','ㅇㅁㄴ','서울 강남구 압구정로11길 37-30 (압구정동)','서울 강남구 압구정동 380-2','ㅇㅁㄴ','가능',11,5,'00:30:00','00:30:00',2,NULL,NULL,101);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `pc_num` int NOT NULL AUTO_INCREMENT,
  `pc_category` varchar(10) NOT NULL,
  PRIMARY KEY (`pc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'여행지'),(2,'음식점'),(3,'숙박'),(4,'축제');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_checked`
--

DROP TABLE IF EXISTS `product_checked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_checked` (
  `pdc_num` int NOT NULL AUTO_INCREMENT,
  `pdc_checked` char(1) NOT NULL DEFAULT '0',
  `pdc_pd_num` int NOT NULL,
  PRIMARY KEY (`pdc_num`),
  KEY `pdc_pd_num_idx` (`pdc_pd_num`),
  CONSTRAINT `pdc_pd_num` FOREIGN KEY (`pdc_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_checked`
--

LOCK TABLES `product_checked` WRITE;
/*!40000 ALTER TABLE `product_checked` DISABLE KEYS */;
INSERT INTO `product_checked` VALUES (1,'0',1),(2,'0',2);
/*!40000 ALTER TABLE `product_checked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qa_num` int NOT NULL AUTO_INCREMENT,
  `qa_title` varchar(100) NOT NULL,
  `qa_content` longtext NOT NULL,
  `qa_registerd_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qa_state` varchar(10) NOT NULL,
  `qa_me_id` varchar(12) NOT NULL,
  `qa_pd_num` int NOT NULL,
  `qa_qs_category` varchar(10) NOT NULL,
  PRIMARY KEY (`qa_num`),
  KEY `FK_member_TO_Q&A_1` (`qa_me_id`),
  KEY `FK_Q&A_Sub_Category_TO_Q&A_1` (`qa_qs_category`),
  CONSTRAINT `FK_member_TO_Q&A_1` FOREIGN KEY (`qa_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_Q&A_Sub_Category_TO_Q&A_1` FOREIGN KEY (`qa_qs_category`) REFERENCES `qna_sub_category` (`qs_category`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (4,'412','412','2023-04-16 01:42:18','0','abcd',1,'결제'),(5,'413','41','2023-04-16 01:43:43','0','abcd',1,'상품 기타'),(6,'412','412','2023-04-16 01:45:06','0','abcd',1,'건의 요청'),(7,'41241','412','2023-04-16 01:46:15','0','abcd',1,'건의 요청'),(8,'12412412','412414','2023-04-16 01:46:52','0','abcd',1,'건의 요청'),(9,'12412412','412414','2023-04-16 01:46:52','0','abcd',1,'건의 요청'),(10,'41212124','412412','2023-04-16 01:50:01','0','abcd',1,'건의 요청'),(11,'4121212121212121212','124124124124124124','2023-04-16 01:50:10','0','abcd',1,'건의 요청'),(15,'완성?','완성?','2023-04-16 02:56:40','0','abcd',2,'건의 요청'),(16,'12412412','ㅗㅇ롱ㄹ','2023-04-27 20:32:47','0','abcd',5,'사이트 기타'),(17,'ㅇㄴㅁㄻㄴ','ㄻㄴㄹㄴㅁㄹ','2023-05-01 18:34:16','1','agh0113!',5,'예약');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_answer`
--

DROP TABLE IF EXISTS `qna_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna_answer` (
  `qaa_num` int NOT NULL AUTO_INCREMENT,
  `qaa_qa_num` int NOT NULL,
  `qaa_content` longtext NOT NULL,
  `qaa_registerd_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`qaa_num`),
  KEY `FK_Q&A_TO_Q&A_Answer_1` (`qaa_qa_num`),
  CONSTRAINT `FK_Q&A_TO_Q&A_Answer_1` FOREIGN KEY (`qaa_qa_num`) REFERENCES `qna` (`qa_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_answer`
--

LOCK TABLES `qna_answer` WRITE;
/*!40000 ALTER TABLE `qna_answer` DISABLE KEYS */;
INSERT INTO `qna_answer` VALUES (1,17,'ㄻㄶㅁㄶㅁㄶㅁㄶㄹㄴㄻㄴㄻㄹ','2023-05-01 18:34:31');
/*!40000 ALTER TABLE `qna_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_category`
--

DROP TABLE IF EXISTS `qna_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna_category` (
  `qc_category` varchar(10) NOT NULL,
  PRIMARY KEY (`qc_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_category`
--

LOCK TABLES `qna_category` WRITE;
/*!40000 ALTER TABLE `qna_category` DISABLE KEYS */;
INSERT INTO `qna_category` VALUES ('사이트 이용 문의'),('상품 관련 문의');
/*!40000 ALTER TABLE `qna_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_sub_category`
--

DROP TABLE IF EXISTS `qna_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna_sub_category` (
  `qs_category` varchar(10) NOT NULL,
  `qs_qc_category` varchar(10) NOT NULL,
  PRIMARY KEY (`qs_category`),
  KEY `FK_Q&A_Category_TO_Q&A_Sub_Category_1` (`qs_qc_category`),
  CONSTRAINT `FK_Q&A_Category_TO_Q&A_Sub_Category_1` FOREIGN KEY (`qs_qc_category`) REFERENCES `qna_category` (`qc_category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_sub_category`
--

LOCK TABLES `qna_sub_category` WRITE;
/*!40000 ALTER TABLE `qna_sub_category` DISABLE KEYS */;
INSERT INTO `qna_sub_category` VALUES ('건의 요청','사이트 이용 문의'),('사이트 기타','사이트 이용 문의'),('이용오류','사이트 이용 문의'),('결제','상품 관련 문의'),('상품 기타','상품 관련 문의'),('예약','상품 관련 문의');
/*!40000 ALTER TABLE `qna_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `rep_num` int NOT NULL AUTO_INCREMENT,
  `rep_table_key` int NOT NULL,
  `rep_content` longtext NOT NULL,
  `rep_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rep_category` varchar(25) NOT NULL,
  `rep_table` varchar(45) DEFAULT NULL,
  `rep_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`rep_num`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservated_option`
--

DROP TABLE IF EXISTS `reservated_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservated_option` (
  `ro_num` int NOT NULL AUTO_INCREMENT,
  `ro_option_name` varchar(30) NOT NULL,
  `ro_date` date NOT NULL,
  `ro_rp_num` int NOT NULL,
  `ro_pd_num` int NOT NULL,
  `ro_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`ro_num`),
  KEY `FK_reservation_possible_TO_reservated_option_1` (`ro_rp_num`),
  KEY `FK_member_TO_reservated_option_1` (`ro_me_id`),
  KEY `FK_product_TO_reservated_option_1` (`ro_pd_num`),
  CONSTRAINT `FK_member_TO_reservated_option_1` FOREIGN KEY (`ro_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_product_TO_reservated_option_1` FOREIGN KEY (`ro_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reservation_possible_TO_reservated_option_1` FOREIGN KEY (`ro_rp_num`) REFERENCES `reservation_possible` (`rp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservated_option`
--

LOCK TABLES `reservated_option` WRITE;
/*!40000 ALTER TABLE `reservated_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservated_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_possible`
--

DROP TABLE IF EXISTS `reservation_possible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_possible` (
  `rp_num` int NOT NULL AUTO_INCREMENT,
  `rp_start_time` time NOT NULL,
  `rp_end_time` time NOT NULL,
  PRIMARY KEY (`rp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_possible`
--

LOCK TABLES `reservation_possible` WRITE;
/*!40000 ALTER TABLE `reservation_possible` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_possible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_room`
--

DROP TABLE IF EXISTS `reservation_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_room` (
  `rr_num` int NOT NULL AUTO_INCREMENT,
  `rr_check_in` date NOT NULL,
  `rr_check_out` date NOT NULL,
  `rr_ao_num` int NOT NULL,
  `rr_pd_num` int NOT NULL,
  `rr_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`rr_num`),
  KEY `FK_member_TO_reservation_room_1` (`rr_me_id`),
  KEY `FK_product_TO_reservation_room_1` (`rr_pd_num`),
  CONSTRAINT `FK_member_TO_reservation_room_1` FOREIGN KEY (`rr_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_product_TO_reservation_room_1` FOREIGN KEY (`rr_pd_num`) REFERENCES `product` (`pd_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_room`
--

LOCK TABLES `reservation_room` WRITE;
/*!40000 ALTER TABLE `reservation_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restraunt_option`
--

DROP TABLE IF EXISTS `restraunt_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restraunt_option` (
  `reo_num` int NOT NULL AUTO_INCREMENT,
  `reo_name` varchar(30) NOT NULL,
  `reo_price` int NOT NULL,
  `reo_content` varchar(100) NOT NULL,
  `reo_pd_num` int NOT NULL,
  PRIMARY KEY (`reo_num`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restraunt_option`
--

LOCK TABLES `restraunt_option` WRITE;
/*!40000 ALTER TABLE `restraunt_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `restraunt_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `re_num` int NOT NULL AUTO_INCREMENT,
  `re_me_id` varchar(12) NOT NULL,
  `re_content` longtext NOT NULL,
  `re_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `re_update_date` datetime DEFAULT NULL,
  `re_rating` float NOT NULL,
  `re_pd_num` int NOT NULL,
  PRIMARY KEY (`re_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'abcd','1234','2011-11-11 00:00:00','2011-11-11 00:00:00',4,1),(3,'abcd','ㅣㅓㅏ','2023-04-27 19:49:34',NULL,3,1),(4,'agh0113!','ㄴㅇㅀㅁㄴㄻ','2023-05-02 17:13:36',NULL,5,9),(5,'agh0113!','ㅇㅁㄴㅇㅁㄴ','2023-05-05 22:03:24',NULL,5,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_comment`
--

DROP TABLE IF EXISTS `review_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_comment` (
  `rc_num` int NOT NULL AUTO_INCREMENT,
  `rc_re_num` int NOT NULL,
  `rc_me_id` varchar(12) NOT NULL,
  `rc_content` longtext NOT NULL,
  `rc_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_comment`
--

LOCK TABLES `review_comment` WRITE;
/*!40000 ALTER TABLE `review_comment` DISABLE KEYS */;
INSERT INTO `review_comment` VALUES (20,1,'abcd','dsa','2023-04-27 16:11:44'),(21,3,'abcd','ㅣㅏ','2023-04-27 20:07:25');
/*!40000 ALTER TABLE `review_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_keyword`
--

DROP TABLE IF EXISTS `search_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_keyword` (
  `sk_num` int NOT NULL AUTO_INCREMENT,
  `sk_keyword` varchar(45) NOT NULL,
  `sk_pd_num` int DEFAULT NULL,
  `sk_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sk_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sk_num`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_keyword`
--

LOCK TABLES `search_keyword` WRITE;
/*!40000 ALTER TABLE `search_keyword` DISABLE KEYS */;
INSERT INTO `search_keyword` VALUES (1,'여행지3',4,'2023-04-27 19:14:26',NULL),(2,'dad',4,'2023-04-27 19:24:46',NULL),(3,'dasd',3,'2023-04-27 19:24:46',NULL),(4,'여행지',3,'2023-05-02 17:23:37',NULL),(5,'여행지',3,'2023-05-02 19:06:54',NULL),(6,'여행',0,'2023-05-02 19:15:27',NULL),(7,'ㅇㅁㄴㅇㅁㅇ',0,'2023-05-02 19:15:38',NULL),(8,'ㅋㅍ',0,'2023-05-02 19:15:39',NULL),(9,'ㅁㄻㄴ',0,'2023-05-02 19:15:42',NULL),(10,'ㅁㄻㄴ',0,'2023-05-02 19:21:15',NULL),(11,'ㅇㅁㄴㅇㅇㅁㄴ',0,'2023-05-02 19:34:00',NULL),(12,'ㅁㄻㄴㅁ',0,'2023-05-04 19:16:15',NULL),(13,'ㅋㅌㅊㅋㅌㅊㅋ',0,'2023-05-04 19:16:17',NULL),(14,'ㅁㄴㅇㅎㅁ',0,'2023-05-04 19:16:18',NULL),(15,'ㄻ',0,'2023-05-04 19:16:18',NULL),(16,'ㅇ',0,'2023-05-04 19:16:19',NULL),(17,'ㅇ',0,'2023-05-04 19:16:20',NULL),(18,'ㅇ',0,'2023-05-04 19:16:20',NULL),(19,'ㅇㅁㄴㅇ',0,'2023-05-04 19:16:21',NULL),(20,'ㅇ',0,'2023-05-04 19:16:22',NULL),(21,'ㅇ',0,'2023-05-04 19:16:22',NULL),(22,'ㅇ',0,'2023-05-04 19:16:23',NULL),(23,'ㅇㅁㄴㅇㅁㄴ',0,'2023-05-04 19:16:24',NULL),(24,'oyiy',0,'2023-05-05 15:33:23',NULL),(25,'ㅇㅀㅇㅀ',0,'2023-05-05 20:28:27',NULL),(26,'ㅁㅇㅎ',0,'2023-05-05 20:28:28',NULL),(27,'ㅎㅌㅌㅎ',0,'2023-05-05 20:28:29',NULL),(28,'ㅎㅎㄴ',0,'2023-05-05 20:28:30',NULL),(29,'ㅎㄶㄶㄴㅇ',0,'2022-05-05 20:28:31',NULL),(30,'ㄶㅁㅎ츝',0,'2023-05-05 20:28:32',NULL),(31,'ㅎㄴㅇㅎ',0,'2023-05-05 20:28:33',NULL),(32,'ㅌㅌㅌ',0,'2023-05-05 20:28:34',NULL),(33,'ㅌㅌ',0,'2023-05-05 20:28:35',NULL),(34,'ㅌㅌ',0,'2023-05-05 20:28:35',NULL),(35,'ㅌ',0,'2023-05-05 20:28:36',NULL),(36,'ㅌ',0,'2023-05-05 20:28:37',NULL),(37,'ㅌ',0,'2023-05-05 20:28:37',NULL),(38,'ㅌ',0,'2023-05-05 20:28:38',NULL),(39,'ㅌ',0,'2023-05-05 20:28:38',NULL),(40,'ㅌ',0,'2023-05-05 20:28:39',NULL),(41,'ㄹㅇㄶㄶ',0,'2023-05-05 21:35:33','agh0113!'),(42,'여행지',0,'2023-05-05 21:35:35','agh0113!'),(43,'여행지',0,'2023-05-05 21:35:36','agh0113!'),(44,'여행지',1,'2023-05-05 21:36:46',NULL),(45,'여행지',0,'2023-05-05 21:36:52','agh0113!'),(46,'여행지',1,'2023-05-05 21:36:53','agh0113!'),(47,'ㅌㅌ',0,'2023-05-05 21:37:18','agh0113!'),(48,'4',0,'2023-05-05 21:37:27','agh0113!'),(49,'4',5,'2023-05-05 21:37:28','agh0113!'),(50,'4',5,'2023-05-05 22:02:32',NULL),(51,'여행지',0,'2023-05-05 22:02:52','agh0113!'),(52,'여행지',1,'2023-05-05 22:02:53','agh0113!'),(63,'여행지',0,'2023-05-05 22:29:43','agh0113!'),(64,'여행지',0,'2023-05-05 22:29:49','agh0113!'),(71,'agh0113!',1,'2023-05-05 22:44:20','agh0113!'),(72,'여행지',1,'2023-05-05 22:44:23','agh0113!'),(73,'4',0,'2023-05-05 22:44:29','agh0113!'),(74,'4',5,'2023-05-05 22:44:30','agh0113!');
/*!40000 ALTER TABLE `search_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_basket`
--

DROP TABLE IF EXISTS `shopping_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_basket` (
  `sb_num` int NOT NULL AUTO_INCREMENT,
  `sb_me_id` varchar(12) NOT NULL,
  `sb_amount` int NOT NULL,
  `sb_option` varchar(10) NOT NULL,
  `sb_pc_num` int NOT NULL,
  PRIMARY KEY (`sb_num`),
  KEY `FK_member_TO_shopping_basket_1` (`sb_me_id`),
  KEY `FK_product_category_TO_shopping_basket_1` (`sb_pc_num`),
  CONSTRAINT `FK_member_TO_shopping_basket_1` FOREIGN KEY (`sb_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_product_category_TO_shopping_basket_1` FOREIGN KEY (`sb_pc_num`) REFERENCES `product_category` (`pc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_basket`
--

LOCK TABLES `shopping_basket` WRITE;
/*!40000 ALTER TABLE `shopping_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_off`
--

DROP TABLE IF EXISTS `temp_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_off` (
  `to_num` int NOT NULL AUTO_INCREMENT,
  `to_do_num` int NOT NULL,
  `to_start` date NOT NULL,
  `to_end` date NOT NULL,
  PRIMARY KEY (`to_num`),
  KEY `FK_day_off_TO_temp_off_1` (`to_do_num`),
  CONSTRAINT `FK_day_off_TO_temp_off_1` FOREIGN KEY (`to_do_num`) REFERENCES `day_off` (`do_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_off`
--

LOCK TABLES `temp_off` WRITE;
/*!40000 ALTER TABLE `temp_off` DISABLE KEYS */;
INSERT INTO `temp_off` VALUES (1,12,'2023-04-05','2023-04-27'),(2,13,'2023-04-01','2023-04-15'),(3,14,'2023-04-28','2023-04-29');
/*!40000 ALTER TABLE `temp_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `use_member`
--

DROP TABLE IF EXISTS `use_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `use_member` (
  `um_bl_num` int NOT NULL AUTO_INCREMENT,
  `um_name` varchar(10) NOT NULL,
  `um_email` varchar(30) NOT NULL,
  `um_phone` varchar(13) NOT NULL,
  PRIMARY KEY (`um_bl_num`),
  CONSTRAINT `FK_buy_list_TO_use_member_1` FOREIGN KEY (`um_bl_num`) REFERENCES `buy_list` (`bl_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `use_member`
--

LOCK TABLES `use_member` WRITE;
/*!40000 ALTER TABLE `use_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `use_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visited`
--

DROP TABLE IF EXISTS `visited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visited` (
  `vi_num` int NOT NULL AUTO_INCREMENT,
  `vi_session_id` varchar(255) NOT NULL,
  `vi_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vi_is_member` char(4) NOT NULL DEFAULT 'NO',
  PRIMARY KEY (`vi_num`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visited`
--

LOCK TABLES `visited` WRITE;
/*!40000 ALTER TABLE `visited` DISABLE KEYS */;
INSERT INTO `visited` VALUES (4,'44455E7EFC99D180CEB6479A6E1CEF4A','2023-05-03 16:10:38','YES'),(5,'111','2023-05-03 14:11:25','NO'),(6,'222','2023-05-03 18:11:25','NO'),(7,'333','2023-05-03 22:11:25','NO'),(8,'444','2023-05-03 22:11:25','YES'),(25,'51xvfcsa','2023-05-03 22:11:25','NO'),(26,'12rsa','2023-05-03 22:11:25','NO'),(27,'124','2023-05-03 22:11:25','NO'),(28,'faf','2023-05-03 22:11:25','NO'),(29,'14saf','2023-05-03 22:11:25','NO'),(30,'4wrs','2023-05-03 14:11:25','NO'),(31,'1asfa','2023-05-03 14:11:25','NO'),(32,'fasf','2023-05-03 16:10:38','NO'),(33,'51ax','2023-05-03 02:11:25','NO'),(34,'sa12fsaf','2023-04-03 02:11:25','NO'),(35,'1fsa','2023-04-03 02:11:25','NO'),(36,'s21','2023-04-03 02:11:25','NO'),(37,'f2f','2023-04-01 02:11:25','NO'),(38,'f1541','2023-04-06 02:11:25','YES'),(39,'12d','2022-05-06 02:11:25','NO'),(40,'asd','2022-06-06 02:11:25','NO'),(41,'fas','2022-04-06 02:11:25','NO'),(42,'124','2022-12-06 02:11:25','NO'),(43,'gds','2022-11-06 02:11:25','NO'),(44,'124','2022-10-06 02:11:25','NO'),(45,'fas','2022-01-06 02:11:25','NO'),(46,'dsa','2022-04-06 02:11:25','NO'),(47,'dsa','2022-04-06 02:11:25','NO'),(48,'3098C61F183EB81E11C3B87C3580C97E','2023-05-04 21:39:36','YES'),(50,'B871D048D606409F011218D476B463FA','2023-05-06 13:58:56','YES');
/*!40000 ALTER TABLE `visited` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishitem`
--

DROP TABLE IF EXISTS `wishitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishitem` (
  `wi_num` int NOT NULL AUTO_INCREMENT,
  `wi_pd_num` int NOT NULL,
  `wi_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`wi_num`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishitem`
--

LOCK TABLES `wishitem` WRITE;
/*!40000 ALTER TABLE `wishitem` DISABLE KEYS */;
INSERT INTO `wishitem` VALUES (40,2,'abcd'),(43,1,'abcd'),(59,2,'dasd'),(60,3,'asd'),(61,4,'rqw'),(62,5,'rqw'),(63,6,'rqw'),(64,7,'rqw'),(65,2,'saf'),(66,2,'asf'),(67,2,'14fsa'),(68,3,'fsaf'),(69,3,'r12fsa'),(70,3,'safa'),(71,3,'f23fsa'),(72,3,'f235f'),(73,3,'5fasf'),(78,1,'agh0113!');
/*!40000 ALTER TABLE `wishitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07 21:53:26
