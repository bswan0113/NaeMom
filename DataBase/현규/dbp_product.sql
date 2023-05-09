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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pd_num` int NOT NULL AUTO_INCREMENT,
  `pd_title` varchar(50) NOT NULL,
  `pd_content` longtext NOT NULL,
  `pd_subtitle` varchar(50) NOT NULL,
  `pd_street_address` varchar(50) NOT NULL,
  `pd_registerd_address` varchar(50) NOT NULL,
  `pd_detail_address` varchar(100) NOT NULL,
  `pd_parking` varchar(10) NOT NULL,
  `pd_capacity` int NOT NULL,
  `pd_viewcount` int NOT NULL DEFAULT '0',
  `pd_open_time` time NOT NULL,
  `pd_close_time` time NOT NULL,
  `pd_pc_num` int NOT NULL,
  `pd_fe_start` datetime DEFAULT CURRENT_TIMESTAMP,
  `pd_fe_end` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pd_num`),
  KEY `FK_product_category_TO_product_1` (`pd_pc_num`),
  CONSTRAINT `FK_product_category_TO_product_1` FOREIGN KEY (`pd_pc_num`) REFERENCES `product_category` (`pc_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'광화문','<p>광화문이다.</p>','광화문','서울 종로구 효자로 12','서울특별시 종로구 세종로 1-57',' 국립고궁박물관','가능',200,5,'00:00:00','23:30:00',1,'2023-04-20 19:48:09','2023-04-20 19:48:09'),(2,'숭례문','<p><span class=\"zPfVt\" style=\"font-weight: 400; color: rgb(33, 37, 41); caret-color: rgb(66, 66, 66); font-family: -apple-system, BlinkMacSystemFont, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, helvetica, &quot;Apple SD Gothic Neo&quot;, helvetica, &quot;나눔바른고딕 옛한글&quot;, &quot;NanumBarunGothic YetHangul&quot;, sans-serif; font-size: 13px; letter-spacing: -0.2px; display: block; white-space: pre-line; word-break: break-all;\">정면 5칸, 측면 2칸, 중층(重層)의 우진각지붕 다포(多包)집이다. 서울 도성의 남쪽 정문이라서 통칭 남대문(南大門)이라고 불린다. 1395년(태조 4)에 짓기 시작하여 1398년(태조 7)에 완성되었고, 1447년(세종 29)에 개축하였다. 그러나 1961∼1963년에 있었던 해체, 수리에 의한 조사에서 1479년(성종 10)에도 비교적 대규모의 보수공사가 있었던 것이 밝혀졌다.  이 문은 중앙부에 홍예문(虹?門)을 낸 거대한 석축기단 위에 섰으며, 현존하는 한국 성문 건물로서는 가장 규모가 크다. 석축 윗면에는 주위에 높이 1.17m의 벽돌로 된 여장(女墻)을 돌려 동·서 양쪽에 협문(夾門)을 열었고, 건물의 외주(外周) 바닥에는 판석(板石)을 깔았다.  건물 내부의 아래층 바닥은 홍예 윗면인 중앙간(中央間)만을 우물마루로 하고 나머지는 흙바닥이다. 지붕은 위·아래층이 모두 겹처마로 사래 끝에는 토수(吐首)를 달고 추녀마루에는 잡상(雜像)과 용머리[龍頭], 그리고 용마루 양가에는 독수리머리를 올렸다.  이 건물은 특수한 목적을 가진 성문이기 때문에 천장을 가설할 필요가 없어 연등천장으로 되어 있다. 특기할 것은 이 건물의 지붕 형태가 어느 시기에 변경된 것인지 뚜렷하지 않으나 당초에는 평양 대동문 또는 개성 남대문과 같은 팔작지붕이었다는 것이 해체, 수리 때의 조사에서 드러났다.  1962년 12월 20일 국보 제1호로 지정되었다. 현존하는 서울의 목조건물(木造建物) 중 가장 오래된 건물로, 2008년 2월 10일에 발생한 화재로 2층 문루가 소실되고 1층 문루 일부가 불에 탔다. 홍예문과 석축은 남았다</span></p>','남대문','서울특별시 중구 세종대로 40','서울특별시 중구 남대문로4가 29','','불가능',200,4,'09:00:00','18:00:00',1,'2023-04-20 19:50:30','2023-04-20 19:50:30'),(3,'덕수궁','<p><span style=\"caret-color: rgb(66, 66, 66); color: rgb(66, 66, 66); font-family: -apple-system, BlinkMacSystemFont, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, helvetica, &quot;Apple SD Gothic Neo&quot;, helvetica, &quot;나눔바른고딕 옛한글&quot;, &quot;NanumBarunGothic YetHangul&quot;, sans-serif; font-size: 13px; letter-spacing: -0.2px;\">덕수궁은 1897년에 선포된 황제국, 대한제국의 황궁으로 옛 이름은 경운궁입니다.</span><br></p>','덕수궁','서울특별시 중구 세종대로 99 ','서울특별시 중구 정동 5-1','덕수궁','불가능',400,4,'09:00:00','21:00:00',1,'2023-04-20 19:53:18','2023-04-20 19:53:18'),(4,'화성행궁','<p>화성행궁이다.</p>','화성행궁','경기 수원시 팔달구 정조로 825','경기 수원시 팔달구 남창동 6-2','화성행궁','가능',300,2,'09:00:00','18:00:00',1,'2023-04-20 19:55:19','2023-04-20 19:55:19'),(5,'대포주상절리','주상절리는 마치 예리한 조각칼로 섬세하게 깎아낸 듯한 4~6각형 형태의 기둥으로, 현무암질 용암류에 나타나는 수직절리를 말한다. 두꺼운 용암이 화구로부터 흘러나와 급격히 식으면서 발생하는 수축작용의 결과로 형성되었다. 마치 계단을 쌓은 듯 겹겹이 서 있는 육모꼴의 돌기둥이 병풍처럼 둘러쳐져 있어 자연의 신비로움을 만끽할 수 있다.그 기둥에 부딪히는 파도 또한 마음을 뺏기는 볼거리인데, 심할 때는 높이 20m 이상 치솟는 ‘쇼’가 펼쳐지기도 해서 보는이의 넋을 빼앗는다.&nbsp;중문·대포해안 주상절리대는 높이가 30~40m, 폭이 약 1㎞ 정도로 우리나라 최대 규모를 자랑하며, 제주도 천연기념물 제443호로 지정돼 있다.','대포주상절리','제주 서귀포시 이어도로 36-24','제주 서귀포시 중문동 2757-10','대포주상절리','가능',250,4,'09:00:00','17:30:00',1,'2023-04-20 20:05:41','2023-04-20 20:05:41'),(6,'라온페스타','라온페스타','라온페스타','광주광역시 동구 중앙로 187','광주광역시 동구 금남로4가 57-15','충금지하상가','가능',0,2,'09:00:00','21:00:00',4,'2023-04-24 09:00:00','2023-05-07 21:00:00'),(7,'영춘제','영춘제','영춘제','충북 청주시 상당구 문의면 청남대길 646','충북 청주시 상당구 문의면 신대리 산26-1','청남대관리사무소','가능',0,0,'09:00:00','18:00:00',4,'2023-04-22 09:00:00','2023-05-07 18:00:00'),(8,'고창 청보리밭축제','고창 청보리밭축제','고창 청보리밭축제','전북 고창군 공음면 학원농장길 154','전북 고창군 공음면 예전리 469-4','보리나라 학원농장','가능',0,0,'09:00:00','18:00:00',4,'2023-04-15 09:00:00','2023-05-07 18:00:00'),(9,'벽초지수목원 봄꽃축제','벽초지수목원 봄꽃축제','벽초지수목원 봄꽃축제','경기 파주시 광탄면 부흥로 242','경기 파주시 광탄면 창만리 166-8','벽초지수목원','가능',0,0,'09:00:00','19:00:00',4,'2023-04-14 09:00:00','2023-05-31 19:00:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 18:04:14
