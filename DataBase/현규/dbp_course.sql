-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: dbp
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
  `co_register_date` datetime DEFAULT NULL,
  `co_update_date` datetime DEFAULT NULL,
  `co_up` int DEFAULT NULL,
  `co_views` int DEFAULT NULL,
  `co_down` int DEFAULT NULL,
  `co_report` int DEFAULT NULL,
  PRIMARY KEY (`co_num`),
  KEY `co_cs_schedule_num_idx` (`co_cs_schedule_num`),
  CONSTRAINT `co_cs_schedule_num` FOREIGN KEY (`co_cs_schedule_num`) REFERENCES `course_schedule` (`cs_schedule_num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'qwe','내맘대로 서울코스','서울코스',1,1,'12',NULL,NULL,NULL,NULL,NULL,NULL),(2,'qwe','내맘대로 제주코스','제주코스',1,1,'31',NULL,NULL,NULL,NULL,NULL,NULL),(3,'qwe','내맘대로 코스1','내맘코스',1,2,'27',NULL,NULL,NULL,NULL,NULL,NULL),(4,'qwer1234','내맘대로 코스2','니맘코스',1,3,'222',NULL,NULL,NULL,NULL,NULL,NULL),(5,'qwe','123123','1231',1,3,'0',NULL,NULL,NULL,NULL,NULL,NULL),(6,'qwe','서울','123123',2,1,'0',NULL,NULL,NULL,NULL,NULL,NULL),(7,'qwe','ㅉㅌ','123123',2,3,'0',NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2023-05-08 18:04:13
