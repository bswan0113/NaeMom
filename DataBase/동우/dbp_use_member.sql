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
-- Table structure for table `use_member`
--

DROP TABLE IF EXISTS `use_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `use_member` (
  `um_bl_num` varchar(20) NOT NULL,
  `um_name` varchar(10) NOT NULL,
  `um_email` varchar(30) NOT NULL,
  `um_phone` varchar(13) NOT NULL,
  PRIMARY KEY (`um_bl_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `use_member`
--

LOCK TABLES `use_member` WRITE;
/*!40000 ALTER TABLE `use_member` DISABLE KEYS */;
INSERT INTO `use_member` VALUES ('qweqwe20230426163040','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502180454','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502193408','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502193952','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502194549','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502200839','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502201320','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502202418','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502212812','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502213243','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502213634','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502213801','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230502214123','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230503160347','홍길동','kdw6052@naver.com','01012345678'),('qweqwe20230503203742','홍길동','kdw6052@naver.com','01012345678');
/*!40000 ALTER TABLE `use_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 16:35:07
