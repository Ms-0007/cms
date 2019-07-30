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
-- Table structure for table `billdetails`
--

DROP TABLE IF EXISTS `billdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billdetails` (
  `BillIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `OrderIdFk` int(11) DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `TransIdPk` int(11) DEFAULT NULL,
  `WalletIdFk` int(11) DEFAULT NULL,
  PRIMARY KEY (`BillIdPk`),
  KEY `OrderIdFk` (`OrderIdFk`),
  KEY `WalletIdFk` (`WalletIdFk`),
  CONSTRAINT `billdetails_ibfk_1` FOREIGN KEY (`OrderIdFk`) REFERENCES `orders` (`OrderIdPk`),
  CONSTRAINT `billdetails_ibfk_2` FOREIGN KEY (`WalletIdFk`) REFERENCES `wallet` (`WalletIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billdetails`
--

LOCK TABLES `billdetails` WRITE;
/*!40000 ALTER TABLE `billdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `billdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `CustIdFk` int(11) DEFAULT NULL,
  `ItemIdFk` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  KEY `CustIdFk` (`CustIdFk`),
  KEY `ItemIdFk` (`ItemIdFk`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`CustIdFk`) REFERENCES `customers` (`CustIdPk`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`ItemIdFk`) REFERENCES `foodmenu` (`ItemIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (NULL,NULL,1,45);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `CustIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `CustName` varchar(30) DEFAULT NULL,
  `CustContact` int(11) DEFAULT NULL,
  `CustEmail` varchar(40) DEFAULT NULL,
  `LoginIdFk` int(30) DEFAULT NULL,
  `WalletIdFk` int(30) DEFAULT NULL,
  PRIMARY KEY (`CustIdPk`),
  KEY `WalletIdFk` (`WalletIdFk`),
  KEY `LoginIdFk` (`LoginIdFk`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`WalletIdFk`) REFERENCES `wallet` (`WalletIdPk`),
  CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`LoginIdFk`) REFERENCES `loginc` (`LoginIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (501,'abi',7896,'ani@mail.com',101,301),(502,'ani',1675,'abi@mail.com',102,302),(503,'sam',1465,'sam@mail.com',103,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodmenu`
--

DROP TABLE IF EXISTS `foodmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodmenu` (
  `ItemIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(30) DEFAULT NULL,
  `Category` varchar(10) DEFAULT NULL,
  `Cuisine` varchar(20) DEFAULT NULL,
  `VendIdFk` int(11) DEFAULT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`ItemIdPk`),
  KEY `VendIdFk` (`VendIdFk`),
  CONSTRAINT `foodmenu_ibfk_1` FOREIGN KEY (`VendIdFk`) REFERENCES `vendors` (`VendorIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodmenu`
--

LOCK TABLES `foodmenu` WRITE;
/*!40000 ALTER TABLE `foodmenu` DISABLE KEYS */;
INSERT INTO `foodmenu` VALUES (401,'biriyani','NonVeg','SouthIndian',801,90),(402,'Naan','Veg','NorthIndian',802,45),(403,'Latte','Veg','FastFood',803,35);
/*!40000 ALTER TABLE `foodmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginc`
--

DROP TABLE IF EXISTS `loginc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginc` (
  `LoginIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `UserPwd` varchar(20) DEFAULT NULL,
  `UserType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`LoginIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginc`
--

LOCK TABLES `loginc` WRITE;
/*!40000 ALTER TABLE `loginc` DISABLE KEYS */;
INSERT INTO `loginc` VALUES (101,'abi101','101abi'),(102,'ani102','102ani'),(103,'sam103','103sam'),(104,'mano104','104mano'),(105,'bala105','105bala'),(106,'muni106','106muni'),(107,'raghav107','107raghav'),(108,'adam108','108adam'),(109,'nivi109','109nivi'),(110,'malar110','110malar');
/*!40000 ALTER TABLE `loginc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderhistory` (
  `OrderIdFk` int(11) DEFAULT NULL,
  `ItemIdFk` int(11) DEFAULT NULL,
  KEY `OrderIdFk` (`OrderIdFk`),
  KEY `ItemIdFk` (`ItemIdFk`),
  CONSTRAINT `orderhistory_ibfk_1` FOREIGN KEY (`OrderIdFk`) REFERENCES `orders` (`OrderIdPk`),
  CONSTRAINT `orderhistory_ibfk_2` FOREIGN KEY (`ItemIdFk`) REFERENCES `foodmenu` (`ItemIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderhistory`
--

LOCK TABLES `orderhistory` WRITE;
/*!40000 ALTER TABLE `orderhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `CustIdFk` int(11) DEFAULT NULL,
  `VendIdFk` int(11) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderTime` time DEFAULT NULL,
  `OrderStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OrderIdPk`),
  KEY `CustIdFk` (`CustIdFk`),
  KEY `VendIdFk` (`VendIdFk`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustIdFk`) REFERENCES `customers` (`CustIdPk`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`VendIdFk`) REFERENCES `vendors` (`VendorIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `VendorIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `VendName` varchar(20) DEFAULT NULL,
  `VendContact` int(10) DEFAULT NULL,
  `Cuisine` varchar(20) DEFAULT NULL,
  `UserNameFk` int(11) DEFAULT NULL,
  PRIMARY KEY (`VendorIdPk`),
  KEY `UserNameFk` (`UserNameFk`),
  CONSTRAINT `vendors_ibfk_1` FOREIGN KEY (`UserNameFk`) REFERENCES `loginc` (`LoginIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=804 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (801,'Muni',1425,'SouthIndian',106),(802,'Raghav',5654,'NorthIndian',107),(803,'Adam',1475,'FastFood',108);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet` (
  `WalletIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `CustIdFk` int(11) DEFAULT NULL,
  `CurrBalance` int(11) DEFAULT NULL,
  `DateModified` date DEFAULT NULL,
  PRIMARY KEY (`WalletIdPk`),
  KEY `CustIdFk` (`CustIdFk`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`CustIdFk`) REFERENCES `customers` (`CustIdPk`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (301,501,5000,'2019-07-30'),(302,502,4500,'2019-07-29'),(303,503,3000,'2019-07-29');
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

-- Dump completed on 2019-07-30 15:14:03
