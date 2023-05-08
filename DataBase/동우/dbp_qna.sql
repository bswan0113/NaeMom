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
  KEY `FK_product_TO_Q&A_1` (`qa_pd_num`),
  KEY `FK_Q&A_Sub_Category_TO_Q&A_1` (`qa_qs_category`),
  CONSTRAINT `FK_member_TO_Q&A_1` FOREIGN KEY (`qa_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_product_TO_Q&A_1` FOREIGN KEY (`qa_pd_num`) REFERENCES `product` (`pd_num`),
  CONSTRAINT `FK_Q&A_Sub_Category_TO_Q&A_1` FOREIGN KEY (`qa_qs_category`) REFERENCES `qna_sub_category` (`qs_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 16:35:10
