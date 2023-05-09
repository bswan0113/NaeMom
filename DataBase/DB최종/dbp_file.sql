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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'게시글 썸네일','더미1.jpg','/2023/05/06/27c019e2-d833-4d02-b319-6ecf739b59d4_더미1.jpg','product',1),(2,'게시글 대표이미지','더미2.jpg','/2023/04/12/8a067d0d-1a20-4637-97b5-27c510b0dc9f_더미2.jpg','product',1),(3,'게시글 썸네일','썸네일.jpg','/2023/04/12/60c09af7-e734-4d68-9bfe-eb75cdea20d6_썸네일.jpg','product',2),(4,'게시글 대표이미지','더미2.jpg','/2023/04/12/79820789-381e-4609-8297-fff696743cf3_더미2.jpg','product',2),(6,NULL,'썸네일.jpg','/2023/04/12/cb531d88-188b-42f6-be04-b28e5dff6ac3_썸네일.jpg','accomodation_option',6),(7,NULL,'더미2.jpg','/2023/04/12/4da6df9b-2293-4685-b11a-f7f680e9d9dd_더미2.jpg','accomodation_option',7),(8,NULL,'더미2.jpg','/2023/04/16/5c52c0a8-60fe-4936-acc5-d48e336f0df8_더미2.jpg','qna',13),(9,NULL,'더미1.jpg','/2023/04/16/d9711141-f8b3-4cea-9e4d-d984d8e3c30f_더미1.jpg','qna',13),(10,NULL,'','/2023/04/16/ddd99d8e-586a-4209-9594-07a43efd66e1_','qna',13),(11,NULL,'','/2023/04/16/8334020c-062f-494c-a1bb-90e3347ba00d_','qna',13),(12,NULL,'','/2023/04/16/c699301c-0944-4e2d-9e1a-cc0d019e3cf3_','qna',13),(13,NULL,'더미1.jpg','/2023/04/16/ae3edd32-a7ea-4401-98f5-2c5b0acd9725_더미1.jpg','qna',15),(14,'게시글 썸네일','더미2.jpg','/2023/05/06/a4a5939a-1a3d-454c-8aa5-b1cffde1f539_더미2.jpg','product',3),(15,'게시글 썸네일','더미1.jpg','/2023/05/09/1ce36f9a-dd63-4ee6-9774-f67a8cbae836_더미1.jpg','product',4),(16,'게시글 썸네일','썸네일.jpg','/2023/05/09/37820c41-9c74-4021-9de2-b52f5416c705_썸네일.jpg','product',5),(17,'게시글 썸네일','더미2.jpg','/2023/05/09/40186285-be20-4dd5-9276-92dde3e80b3b_더미2.jpg','product',6),(18,'게시글 썸네일','더미2.jpg','/2023/04/19/80fbf14d-006d-4136-8d0a-9eb31d383198_더미2.jpg','product',7),(19,'게시글 썸네일','더미2.jpg','/2023/04/19/085fffc3-7225-4b39-9821-99560af533a2_더미2.jpg','product',8),(21,NULL,'더미2.jpg','/2023/04/27/f8c0a62a-9e5a-4006-993f-6c104b57d8df_더미2.jpg','review',3),(22,'이벤트 이미지','더미2.jpg','','Event',1),(23,'게시글 썸네일','썸네일.jpg','/2023/05/01/a8f0bbb6-8312-4e3e-a073-09f8342d6b53_썸네일.jpg','product',9),(24,'게시글 대표이미지','더미2.jpg','/2023/05/01/020cf246-cadf-4dfa-b024-b1020ffd5b4a_더미2.jpg','product',9),(25,'게시글 썸네일','더미1.jpg','/2023/05/01/47fbba8f-93e6-482d-9c78-aeb265b8fad7_더미1.jpg','product',10),(27,NULL,'더미1.jpg','/2023/05/06/e4d1eb89-128f-47a7-8c2c-51b88fc8c6ab_더미1.jpg','restraunt_option',17),(28,NULL,'썸네일.jpg','/2023/05/09/c1897fdc-a7c3-4a4d-a969-27fb17e5c8a5_썸네일.jpg','review',4);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
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
