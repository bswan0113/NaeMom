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
  PRIMARY KEY (`reo_num`),
  KEY `FK_product_TO_restraunt_option_1` (`reo_pd_num`),
  CONSTRAINT `FK_product_TO_restraunt_option_1` FOREIGN KEY (`reo_pd_num`) REFERENCES `product` (`pd_num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restraunt_option`
--

LOCK TABLES `restraunt_option` WRITE;
/*!40000 ALTER TABLE `restraunt_option` DISABLE KEYS */;
INSERT INTO `restraunt_option` VALUES (1,'짜장면',7000,'짜장면입니다',1),(2,'짬뽕',8000,'짬뽕입니다',1),(3,'짜장면 곱빼기',7500,'짜장면 곱빼기',1),(4,'짬뽕 곱빼기',8500,'짬뽕 곱빼기',1),(5,'볶음밥',7000,'볶음밥 곱빼기',1),(6,'탕수육',10000,'탕수육임',1),(7,'고등어 구이',6000,'고등어구이',2),(8,'육계장',7000,'육계장',2),(9,'비빔밥',7500,'비빔밥',2),(10,'돌솥비빔밥',8000,'돌솥비빔밥',2),(11,'한정식',12000,'한정식코스',2),(12,'소고기뭇국',9000,'소고기뭇국',2);
/*!40000 ALTER TABLE `restraunt_option` ENABLE KEYS */;
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
