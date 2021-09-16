-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: supermarket
-- ------------------------------------------------------
-- Server version	10.4.19-MariaDB-1:10.4.19+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `OrderItems`
--

DROP TABLE IF EXISTS `OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderItems` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `product` (`product`),
  KEY `orderItemId` (`orderItemId`),
  CONSTRAINT `OrderItems_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItems`
--

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;
INSERT INTO `OrderItems` VALUES (1,1,1),(2,4,1),(3,3,1),(4,5,2),(5,2,1),(6,1,3);
/*!40000 ALTER TABLE `OrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(320) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `email` (`email`),
  KEY `customerId` (`customerId`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'bondarenko@gamil.com','Іван','Бондаренко'),(2,'oliynyk@gamil.com','Сергій','Олійник'),(3,'petrenko@gamil.com','Тарас','Петренко'),(4,'rudenko@gamil.com','Богдан','Руденко');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customersOrders`
--

DROP TABLE IF EXISTS `customersOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customersOrders` (
  `customerId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  KEY `customerId` (`customerId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `customersOrders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`),
  CONSTRAINT `customersOrders_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customersOrders`
--

LOCK TABLES `customersOrders` WRITE;
/*!40000 ALTER TABLE `customersOrders` DISABLE KEYS */;
INSERT INTO `customersOrders` VALUES (4,6),(2,5),(1,3),(4,4),(3,1),(2,2);
/*!40000 ALTER TABLE `customersOrders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderItem` int(11) DEFAULT NULL,
  `salesman` int(11) DEFAULT NULL,
  `salesDate` datetime DEFAULT current_timestamp(),
  `productPaid` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `orderItem` (`orderItem`),
  KEY `salesman` (`salesman`),
  KEY `salesDate` (`salesDate`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orderItem`) REFERENCES `OrderItems` (`orderItemId`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`salesman`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,3,'2021-09-16 22:39:03','yes'),(2,6,4,'2021-09-16 22:39:03','no'),(3,3,4,'2021-09-16 22:39:03','no'),(4,1,3,'2021-09-16 22:39:03','yes'),(5,2,4,'2021-09-16 22:39:03','yes'),(6,1,3,'2021-09-16 22:39:03','yes'),(7,2,3,'2021-09-16 23:35:04','yes'),(8,6,4,'2021-09-16 23:35:14','no'),(9,3,3,'2021-09-16 23:35:14','no');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `description` longtext DEFAULT NULL,
  `creationDate` datetime DEFAULT current_timestamp(),
  `modifiedDate` datetime DEFAULT current_timestamp(),
  `productAmount` int(11) NOT NULL,
  `userСreatedId` int(11) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `productName` (`productName`,`productPrice`),
  KEY `userСreatedId` (`userСreatedId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`userСreatedId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Дверь входная АМ-54 086П','Abwehr',8699,'Основные характеристики Дверь входная Abwehr АМ-54 086П (ТИК/Днср) Avers + Kale НЧ тик / дуб немо серебряный 2050х860 мм правая.','2021-09-16 22:27:54','2021-09-16 22:27:54',100,2),(2,'Дверь входная Гарант 117','Булат',12060,'Основные характеристики Дверь входная Булат Гарант 117 венге горизонт темный 2050x950 мм левая.','2021-09-16 22:27:54','2021-09-16 22:27:54',40,1),(3,'Дверь входная Стройгост 7','Tarimus',4925,'Основные характеристики Дверь входная Tarimus Стройгост 7 коричневый 2050х860мм правая.','2021-09-16 22:27:54','2021-09-16 22:27:54',65,2),(4,'Дверь входная Гарант гладкая 156','Булат',13230,'Основные характеристики Дверь входная Булат Гарант гладкая 156 Уличная дуб темный 2050x950 мм левая.','2021-09-16 22:27:54','2021-09-16 22:27:54',24,1),(5,'Дверь входная Мавіс дуб шале','Мавіс',15560,'Основные характеристики Дверь входная Мавіс дуб шале графит 2030x960мм правая.','2021-09-16 22:27:54','2021-09-16 22:27:54',45,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(320) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `userRole` enum('admin','manager','salesman') DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email` (`email`),
  KEY `userId` (`userId`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ivanov@gamil.com','Іван','Іванов','admin'),(2,'melnyk@gamil.com','Сергій','Мельник','manager'),(3,'shevchenko@gamil.com','Тарас','Шевченко','salesman'),(4,'boyko@gamil.com','Богдан','Бойко','salesman');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'supermarket'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-17  0:48:31
