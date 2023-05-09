-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dbp
-- ------------------------------------------------------
-- Server version	8.0.32

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-09 16:56:23
