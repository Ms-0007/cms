-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: canteen1
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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `BillIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` bigint(20) DEFAULT NULL,
  `WalletIdFk` int(11) DEFAULT NULL,
  `TransIdFk` int(11) DEFAULT NULL,
  PRIMARY KEY (`BillIdPk`),
  KEY `WalletIdFk` (`WalletIdFk`),
  KEY `TransIdFk` (`TransIdFk`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`WalletIdFk`) REFERENCES `wallet` (`WalletIDPk`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`TransIdFk`) REFERENCES `transac` (`TransIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `Quantity` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerinfo`
--

DROP TABLE IF EXISTS `customerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerinfo` (
  `CustIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(200) DEFAULT NULL,
  `Contact` varchar(200) DEFAULT NULL,
  `CustName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerinfo`
--

LOCK TABLES `customerinfo` WRITE;
/*!40000 ALTER TABLE `customerinfo` DISABLE KEYS */;
INSERT INTO `customerinfo` VALUES (1,'leena13@gmail.com','5623587463','leena'),(2,'raghu@gmail.com','56223387463','Raghu');
/*!40000 ALTER TABLE `customerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `ItemIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` char(255) DEFAULT NULL,
  `Category` char(255) DEFAULT NULL,
  `VendorIdFk` int(11) DEFAULT NULL,
  PRIMARY KEY (`ItemIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Dosa','Veg',NULL),(2,'Vada','NonVeg',NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `OrdTime` time DEFAULT NULL,
  `OrdDate` date DEFAULT NULL,
  `Stat` char(1) DEFAULT NULL,
  `CustIdFk` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderIdPk`),
  KEY `CustIdFk` (`CustIdFk`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustIdFk`) REFERENCES `customerinfo` (`CustIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'12:20:02','2019-02-20','P',NULL),(2,'10:25:00','2019-02-20','P',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transac`
--

DROP TABLE IF EXISTS `transac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transac` (
  `TransIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `PayMode` char(255) DEFAULT NULL,
  PRIMARY KEY (`TransIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transac`
--

LOCK TABLES `transac` WRITE;
/*!40000 ALTER TABLE `transac` DISABLE KEYS */;
/*!40000 ALTER TABLE `transac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `LoginIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `psw` varchar(20) DEFAULT NULL,
  `UserType` char(255) DEFAULT NULL,
  PRIMARY KEY (`LoginIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pass1#','Customer'),(2,'pass2#','Vendor');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `VendorIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `VendorName` char(255) DEFAULT NULL,
  `VContact` bigint(20) DEFAULT NULL,
  `Cuisine` char(255) DEFAULT NULL,
  `LoginIdFk` int(11) DEFAULT NULL,
  PRIMARY KEY (`VendorIdPk`),
  KEY `LoginIdFk` (`LoginIdFk`),
  CONSTRAINT `vendor_ibfk_1` FOREIGN KEY (`LoginIdFk`) REFERENCES `users` (`LoginIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Raghupati',1234567890,'NI',NULL),(2,'bhanu',1234567459,'SI',NULL);
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet` (
  `WalletIDPk` int(11) NOT NULL AUTO_INCREMENT,
  `BalanceCurr` bigint(20) DEFAULT NULL,
  `DateOfMod` date DEFAULT NULL,
  `CustIdFk` int(11) DEFAULT NULL,
  PRIMARY KEY (`WalletIDPk`),
  KEY `CustIdFk` (`CustIdFk`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`CustIdFk`) REFERENCES `customerinfo` (`CustIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,2865,'2019-08-12',NULL),(2,3400,'2019-08-13',NULL);
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

-- Dump completed on 2019-07-30 15:03:26
