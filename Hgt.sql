-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `food_items`
--

DROP TABLE IF EXISTS `food_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_items` (
  `FoodidPk` int(11) NOT NULL AUTO_INCREMENT,
  `FoodName` varchar(255) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Calories` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `WalletidPk` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodidPk`),
  KEY `WalletidPk` (`WalletidPk`),
  CONSTRAINT `food_items_ibfk_1` FOREIGN KEY (`WalletidPk`) REFERENCES `wallet` (`WalletidPk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_items`
--

LOCK TABLES `food_items` WRITE;
/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
INSERT INTO `food_items` VALUES (1,'Biriyani',NULL,100,3,NULL),(2,'Pulav',NULL,100,5,NULL);
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_history` (
  `OHIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerIdFk` int(11) DEFAULT NULL,
  `VendorIdFk` int(11) DEFAULT NULL,
  `TotalPrice` int(11) DEFAULT NULL,
  `OHDate` int(11) DEFAULT NULL,
  PRIMARY KEY (`OHIdPk`),
  KEY `CustomerIdFk` (`CustomerIdFk`),
  CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`CustomerIdFk`) REFERENCES `food_items` (`FoodidPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_items`
--

DROP TABLE IF EXISTS `ordered_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordered_items` (
  `OrderIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `FoodidFk` int(11) DEFAULT NULL,
  `OrderStatus` varchar(10) DEFAULT NULL,
  `TotalPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderIdPk`),
  KEY `FoodidFk` (`FoodidFk`),
  CONSTRAINT `ordered_items_ibfk_1` FOREIGN KEY (`FoodidFk`) REFERENCES `food_items` (`FoodidPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_items`
--

LOCK TABLES `ordered_items` WRITE;
/*!40000 ALTER TABLE `ordered_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validationtable`
--

DROP TABLE IF EXISTS `validationtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `validationtable` (
  `idPk` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(255) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `PhoneNo` int(11) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPk`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validationtable`
--

LOCK TABLES `validationtable` WRITE;
/*!40000 ALTER TABLE `validationtable` DISABLE KEYS */;
INSERT INTO `validationtable` VALUES (1,' Mayank Sahu ',20,324234,'MayankS2@hexaware.com',NULL,NULL),(2,' Mayank Sahu ',20,324234,'MayankS2@hexaware.com',NULL,NULL),(3,' Baderia ji',23,233556,'BS@hexaware.com',NULL,NULL),(4,' Nema ji ',20,324534,'34@hexaware.com',NULL,NULL),(5,' yry tet',20,324234,'45t@xaware.com',NULL,NULL),(6,' Mayank Sahu ',20,324234,'MayankS2@hexaware.com',NULL,NULL),(7,' Baderia ji',23,233556,'BS@hexaware.com',NULL,NULL),(8,' Nema ji ',20,324534,'34@hexaware.com',NULL,NULL),(9,' yry tet',20,324234,'45t@xaware.com',NULL,NULL);
/*!40000 ALTER TABLE `validationtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet` (
  `WalletidPk` int(11) NOT NULL AUTO_INCREMENT,
  `WalletType` varchar(255) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Balance` int(11) DEFAULT NULL,
  `AmountCredited` int(11) DEFAULT NULL,
  PRIMARY KEY (`WalletidPk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,'Customer',NULL,100,100),(2,'Vendor',NULL,2000,NULL);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-30 13:09:33
