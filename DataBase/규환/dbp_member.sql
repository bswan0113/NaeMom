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
  `me_gender` char(100) DEFAULT NULL,
  `me_authority` int NOT NULL DEFAULT '1',
  `me_nickname` varchar(250) NOT NULL,
  `me_street_address` varchar(50) DEFAULT NULL,
  `me_registered_address` varchar(50) DEFAULT NULL,
  `me_detail_address` varchar(100) DEFAULT NULL,
  `me_mileage` int NOT NULL DEFAULT '0',
  `me_session_id` varchar(45) DEFAULT NULL,
  `me_session_limit` datetime DEFAULT NULL,
  `me_ma_email` varchar(50) NOT NULL,
  `me_post` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('steveyeom','$2a$10$gzeryK9fIwnQW06Iz2t8seYjaOb0A6G82dFeAE.g3zmktMwkHD.t2','고길동','2000-02-02','01020202020','여성',1,'user-8IQP9EKOWB15H8IW','','','',0,NULL,NULL,'yeomsteve@naver.com',''),('yeomsteve','$2a$10$ZktDSzK8Y1WFm.4vc7P8nO2dOKYSzGnejPluvIhXmLo8EhCOPLCyG','염규환','1993-03-23','01072603019','남성',1,'user-6WTQVMCL4KUOV2SV','제주특별자치도 서귀포시 가가로 14 (상예동)',NULL,'',0,NULL,'2023-05-08 19:41:56','jjojjosteve@gmail.com','63534');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 20:22:53
