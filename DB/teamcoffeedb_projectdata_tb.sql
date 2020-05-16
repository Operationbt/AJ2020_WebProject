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
-- Table structure for table `projectdata_tb`
--

DROP TABLE IF EXISTS `projectdata_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectdata_tb` (
  `proj_id` int NOT NULL AUTO_INCREMENT,
  `proj_writer` varchar(20) NOT NULL,
  `proj_title` varchar(50) NOT NULL,
  `proj_date` datetime NOT NULL,
  `proj_content` text NOT NULL,
  `proj_image` varchar(255) DEFAULT NULL,
  `proj_deadline` datetime NOT NULL,
  `proj_goal` int NOT NULL,
  `proj_current` int DEFAULT NULL,
  `proj_sponsor` int DEFAULT NULL,
  `proj_approval` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`proj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectdata_tb`
--

LOCK TABLES `projectdata_tb` WRITE;
/*!40000 ALTER TABLE `projectdata_tb` DISABLE KEYS */;
INSERT INTO `projectdata_tb` VALUES (1000,'test2','help','2020-05-16 00:00:00','Help me please',NULL,'2020-06-16 20:00:00',100000,NULL,NULL,NULL),(1001,'test3','hello','2020-05-16 00:00:00','hiiii',NULL,'2020-05-30 08:00:00',200000,NULL,NULL,NULL);
/*!40000 ALTER TABLE `projectdata_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 23:08:07
