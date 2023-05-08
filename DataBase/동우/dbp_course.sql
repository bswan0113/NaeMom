CREATE DATABASE  IF NOT EXISTS `dbp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbp`;
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
  `co_total_distance` varchar(15) DEFAULT NULL,
  `co_register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co_update_date` datetime DEFAULT NULL,
  `co_up` int NOT NULL DEFAULT '0',
  `co_views` int NOT NULL DEFAULT '0',
  `co_down` int NOT NULL DEFAULT '0',
  `co_report` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`co_num`),
  KEY `FK_member_TO_course_1` (`co_me_id`),
  KEY `FK_course_schedule_TO_course_1_idx` (`co_cs_schedule_num`),
  KEY `FK_course_category_TO_course_1_idx` (`co_cc_category_num`),
  CONSTRAINT `co_cc_category_num` FOREIGN KEY (`co_cc_category_num`) REFERENCES `course_category` (`cc_category_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `co_cs_schedule_num` FOREIGN KEY (`co_cs_schedule_num`) REFERENCES `course_schedule` (`cs_schedule_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_member_TO_course_1` FOREIGN KEY (`co_me_id`) REFERENCES `member` (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'qweqwe','afeaef','ㅁㅇㅈ',2,2,'56.7','2023-03-27 21:33:12',NULL,1,2,0,0),(2,'qweqwe','등록 테스트(중국집1)','ㅁㅇㅁㅈ',2,2,'56.7','2023-03-28 18:08:41',NULL,0,2,1,0),(5,'qweqwe','코스5','ㅁㅇㅈ',2,2,'56.7','2023-03-28 20:39:54',NULL,0,13,0,0),(6,'qweqwe','코스6','ㅁㅇㅈ',3,2,'56.7','2023-03-28 20:40:27',NULL,1,22,0,0),(7,'qweqwe','코스7','ㅁㅇㅈ',3,2,'56.7','2023-03-28 21:00:06',NULL,0,315,1,1),(8,'qweqwe','테스트0331awd','ㅁㅈㅇㅁㅈㅇ',3,2,'0','2023-03-31 16:13:47','2023-03-31 20:15:31',1,8,0,0),(9,'qweqwe','test','테스트',4,2,'0','2023-04-10 21:05:33',NULL,0,22,0,0);
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

-- Dump completed on 2023-05-08 16:35:08
