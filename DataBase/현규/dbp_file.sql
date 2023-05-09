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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'게시글 썸네일','home-swiper-gwanghwamun.jpg','/2023/04/20/f758043a-2f05-43fb-86a5-2c586908f8fb_home-swiper-gwanghwamun.jpg','product',1),(2,'게시글 썸네일','Sungnyemun.JPG','/2023/04/20/f5f69760-16c1-4925-8b6b-35ee935bc8f2_Sungnyemun.JPG','product',2),(3,'게시글 썸네일','덕수궁.jpeg','/2023/04/20/db4c6574-8d7a-4c59-b083-ab5ae1d7285e_덕수궁.jpeg','product',3),(4,'게시글 썸네일','신풍루.png','/2023/04/20/67eb670c-4865-4ce6-b862-21d8ac0381bd_신풍루.png','product',4),(5,'게시글 썸네일','common.jpeg','/2023/04/20/e274a424-31fb-4c16-9c0e-f8191ceaa715_common.jpeg','product',5),(6,'이벤트 이미지','banner(1).jpg','/2023/04/20/6b827b38-f881-41d1-9073-b83c047e2408_banner(1).jpg','Event',1),(7,'이벤트 이미지','banner(1).jpg','/2023/04/23/2da3d7b3-9a64-4fc3-9ee5-85d852d583c3_banner(1).jpg','Event',1),(8,'이벤트 이미지','banner(1).jpg','/2023/04/23/71160702-9306-4ae6-9bd0-4494c292b076_banner(1).jpg','Event',1),(9,'이벤트 이미지','이벤트용 배너 사진(1).png','/2023/04/23/0f19318e-e1ad-445f-ba48-bb8d60e6c949_이벤트용 배너 사진(1).png','Event',1),(10,'이벤트 이미지','이벤트용 배너 사진(2).png','/2023/04/23/9107862c-a3d1-4728-861c-93d13dbdfdaa_이벤트용 배너 사진(2).png','Event',1),(11,'이벤트 이미지','이벤트용 배너 사진(3).png','/2023/04/23/a5c2de0d-79e7-4c46-a3dd-20bbfe93d4f0_이벤트용 배너 사진(3).png','Event',1),(12,'게시글 썸네일','라온페스타.jpg','/2023/04/25/edfa8f52-ae20-4cce-b607-8dccedc937ed_라온페스타.jpg','product',6),(13,'게시글 썸네일','영춘제.png','/2023/04/25/1679988535478_영춘제.png','product',7),(14,'게시글 썸네일','청보리밭축제.gif','/2023/04/25/chungbori2023_청보리밭축제.gif','product',8),(15,'게시글 썸네일','봄꽃축제.jpg','/2023/04/25/6065134a-6bef-4853-b427-38defff13b89_봄꽃축제.jpg','product',9);
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

-- Dump completed on 2023-05-08 18:04:15
