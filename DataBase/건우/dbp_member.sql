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
INSERT INTO `member` VALUES ('abcd','1234','안건우','1993-01-13','010-3151-7063','남',1,'건우','서울시 은평구 가좌로 165','서울시 은평구 갈현동 662','오벨리스크 401호',100,NULL,NULL,'aa',NULL,50,50,50,50),('agh0113!','$2a$10$CjlnrE/.5GuVXKerzRa4sOJNqW6YWuCbOYCCmmJdXzISfa8/UtF7K','안건우','1993-01-13','010-3151-7063','남성',10,'sfafas','서울 은평구 가좌로 165 (응암동)','서울 은평구 응암동 678-3','오벨리스크 401',0,'0C717D99DDA77747903AE059CD0BE78E','2023-05-16 15:51:27','zkoiu@naver.com','03479',50,60,58,50),('agh0113!!','$2a$10$jUZweyhRTJCJe9Tf0oyi8eEwnZ2AzX02IEHVdNyRbq7B.scwlUyZG','안건우','1993-01-13','010-3151-7063','남성',1,'user-5BD1XQMYW65QBL7Q','경기 김포시 김포대로926번길 15 (북변동, 풍년마을서광신안아파트)','경기 김포시 북변동 802','1701호',0,NULL,NULL,'sakulavi0113@gmail.com','10097',50,50,50,50);
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

-- Dump completed on 2023-05-09 16:56:23
