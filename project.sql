-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommy
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additems`
--

DROP TABLE IF EXISTS `additems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additems` (
  `itemid` binary(16) NOT NULL,
  `item_name` longtext NOT NULL,
  `dis` longtext NOT NULL,
  `qyt` int DEFAULT NULL,
  `category` enum('electronics','home','fashion','grocery') DEFAULT NULL,
  `price` int DEFAULT NULL,
  `added_by` varchar(255) DEFAULT NULL,
  `img_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `additems_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `vendor` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additems`
--

LOCK TABLES `additems` WRITE;
/*!40000 ALTER TABLE `additems` DISABLE KEYS */;
INSERT INTO `additems` VALUES (_binary 'Ÿ–V#o\ïµ\Ú\ÌG@\ã:|','half saree','beautiful',1,'fashion',20000,'km6130765@gmail.com','3Hx0Qw.jpg'),(_binary '±¨S\Ëo\ïµ\Ú\ÌG@\ã:|','frock','beautiful',1,'fashion',1000,'km6130765@gmail.com','1Ss3Ra.jpg'),(_binary 'Á²ÿ¹ü\ïµ\Ú\ÌG@\ã:|','gnan','powerfull',1,'electronics',50000,'km6130765@gmail.com','6Qg2Ho.jpg'),(_binary 'Ó†\ä4€\ïµ\Ú\ÌG@\ã:|','chowki','wonderfull',1,'fashion',100000,'km6130765@gmail.com','2Wn6Wo.jpg'),(_binary '\Û_\Ø~H\ïµ\Ú\ÌG@\ã:|','car','beautiful',1,'electronics',20000000,'km6130765@gmail.com','1Kt5Vn.webp');
/*!40000 ALTER TABLE `additems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ordid` binary(16) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `total_price` decimal(20,4) DEFAULT NULL,
  `item_id` binary(16) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `imgid` varchar(255) DEFAULT NULL,
  `dis` text,
  PRIMARY KEY (`ordid`),
  KEY `item_id` (`item_id`),
  KEY `user` (`user`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `additems` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`email`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (_binary '”¹\á\òW\ïµ\Ú\ÌG@\ã:|','gnan',1,50000.0000,_binary 'Á²ÿ¹ü\ïµ\Ú\ÌG@\ã:|','km6130765@gmail.com','electronics','6Qg2Ho.jpg','powerfull'),(_binary '\Æ\ò	t\ïµ\Ú\ÌG@\ã:|','gnan',1,50000.0000,_binary 'Á²ÿ¹ü\ïµ\Ú\ÌG@\ã:|','km6130765@gmail.com','electronics','6Qg2Ho.jpg','powerfull');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_name` varchar(255) NOT NULL,
  `mobile_no` bigint NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `password` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `mobile_no` (`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('manasa',7416109196,'km6130765@gmail.com','vij',_binary '$2b$12$EhgKAOyUSfalDl.yxf34De9CgJv1dTE6WWXK.LQJbJnPX.rfcUhem');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `email` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile_no` bigint NOT NULL,
  `address` text NOT NULL,
  `password` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `mobile_no` (`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES ('km6130765@gmail.com','manasa',7416109196,'vij',_binary '$2b$12$gREDmJcNWEvk16U1axudJ.aIgjVcMCetB3kYuMeGsQF3ViCtSZV16');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31 16:41:04
