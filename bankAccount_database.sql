CREATE DATABASE  IF NOT EXISTS `bankaccount3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bankaccount3`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: bankaccount3
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `t_act`
--

DROP TABLE IF EXISTS `t_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_act` (
  `act_id` int NOT NULL AUTO_INCREMENT,
  `actno` varchar(255) NOT NULL,
  `balance` double NOT NULL,
  `PID` varchar(255) NOT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_act`
--

LOCK TABLES `t_act` WRITE;
/*!40000 ALTER TABLE `t_act` DISABLE KEYS */;
INSERT INTO `t_act` VALUES (31,'act1',1398,'1'),(32,'act2',200,'2'),(33,'act3',100,'3'),(34,'act4',1001,'4'),(35,'act5',200,'5'),(36,'act6',99,'6'),(37,'act7',10,'7'),(39,'act9',99,'8'),(40,'act10',100,'9'),(41,'act11',11011,'10'),(42,'act12',1000,'11');
/*!40000 ALTER TABLE `t_act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_max`
--

DROP TABLE IF EXISTS `t_max`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_max` (
  `max` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_max`
--

LOCK TABLES `t_max` WRITE;
/*!40000 ALTER TABLE `t_max` DISABLE KEYS */;
INSERT INTO `t_max` VALUES (12);
/*!40000 ALTER TABLE `t_max` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` char(5) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `PID` varchar(255) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (28,'test1','11111111','M','2023-01-08','1','1111111111','1'),(29,'test2','11111111','M','2023-01-01','2','1111111111','1'),(30,'test3','11111111','M','2023-01-09','3','1111111111','1'),(31,'test4','11111111','M','2023-01-18','4','1111111111','1'),(32,'test5','11111111','M','2023-01-01','5','1111111111','1111'),(33,'test6','11111111','M','2023-01-02','6','1111111111','11'),(34,'test7','11111111','M','2023-01-08','7','1111111111','100'),(36,'test8','11111111','M','2023-01-08','8','1111111111','1'),(37,'test9','11111111','M','2023-01-09','9','1111111111','100'),(38,'test10','11111111','M','2023-01-15','10','1000000000','11'),(39,'test11','11111111','M','2023-01-01','11','1111111111','11');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-22 19:08:40
