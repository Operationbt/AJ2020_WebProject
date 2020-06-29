-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: teamcoffeedb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `review_tb`
--

DROP TABLE IF EXISTS `review_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_tb` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `review_writer` varchar(45) NOT NULL,
  `review_title` varchar(45) NOT NULL,
  `review_date` datetime NOT NULL,
  `review_content` text NOT NULL,
  `review_image` varchar(255) DEFAULT NULL,
  `review_approval` tinyint(1) DEFAULT '1',
  `review_pid` int NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_pid_idx` (`review_pid`),
  CONSTRAINT `review_pid` FOREIGN KEY (`review_pid`) REFERENCES `projectdata_tb` (`proj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_tb`
--

LOCK TABLES `review_tb` WRITE;
/*!40000 ALTER TABLE `review_tb` DISABLE KEYS */;
INSERT INTO `review_tb` VALUES (4,'admin','강아지 후기 제목','2020-06-28 17:17:55','후기 내용 끝','https://cdn.pixabay.com/photo/2020/04/09/11/42/dogs-5021084_960_720.jpg',1,1000),(5,'baek','고양이후기','2020-06-28 21:17:30','귀여웟다','',1,1004),(6,'admin','날씨 후기 테스트','2020-06-28 23:33:44','내용테스트트트트트트트123123123','https://cdn.pixabay.com/photo/2020/05/12/17/04/wind-turbine-5163993_960_720.jpg',1,1001),(7,'admin','어르신들의 마음에 따뜻한 봄이 왔습니다.','2020-06-29 07:58:37','여러분들의 \'소중한 후원금\'은 이렇게 사용됐습니다.\r\n\r\n소중한 손길을 내어주신 기부자님들과 함께 기업후원을 해주신 LG헬로비전의 따뜻한 마음이 함쳐져 생각보다 빠른 기간 안에 모금액이 모였습니다.\r\n\r\n이 모금액을 조금 더 뜻 깊고 알뜰하게 사용하고자 많은 고민을 했었습니다. 그 결과 현재 어르신들에게 가장 필요한 식료품과 생필품을 드리고자 구입을 진행하였습니다.\r\n\r\n총 모금액인 3,373,600원에 기관 자부담 26,400원을 합쳐 3,400,000원으로 50,000원 상당의 식료품 및 생필품 키트를 구입하여 코로나로 인해 생계에 어려움을 겪고 있는 68명의 어르신에게 전달해드렸습니다.\r\n\r\n\r\n따뜻한 \'봄\'이 왔어요\r\n\r\n여러분들의 도움으로 인해 어르신들에게 가장필요했던 식료품과 생필품을 담은 키트를 68명 어르신들에게 전달해드렸습니다. \r\n\r\n키트를 전달 받으신 어르신들께서는 요즘 세상에 이렇게 도와주는 곳이 어디있냐며, 이렇게 좋은 선물을 받아도 될지 모르겠다고 하시며 눈물을 글썽이셨습니다. \r\n\r\n안 그래도 장도 못보고 어려운 상황이었는데 큰 보탬이 된다며 어르신들 모두 많이 좋아하시고 기뻐하셨으며 어르신들께서 도와주신 분들에게 감사인사를 꼭 전해달라고 하셨습니다.\r\n\r\n한 분 한 분의 소중한 손길이 모여 이렇게 큰 변화를 이루어냈습니다.\r\n\r\n어르신들에게 \'봄\'을 선물 해 주신 기부자님과 기업후원자님께 소중한 마음을 담아 감사인사를 전해드립니다.','https://happybean-phinf.pstatic.net/20200601_5/15909795889757XDIL_JPEG/3.jpg',1,1021);
/*!40000 ALTER TABLE `review_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-29 16:02:19
