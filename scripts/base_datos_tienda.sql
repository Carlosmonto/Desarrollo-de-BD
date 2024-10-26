
CREATE DATABASE  IF NOT EXISTS `store_dani` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `store_dani`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: store_dani
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (10,'granos','granos como arroz, frijol, arveja..'),(11,'Bedidas enbotelladas','bebidas de todo tipo consumo humano'),(12,'frutas y verduras','verduras y demas naturales'),(13,'carnes','carnes de cerdo, res, pollo y demas\n'),(14,'abarrotes','productos generales de uso diario'),(15,'mascotas','alimentos para mascotas'),(16,'mecato xunidad','mecato por paquetes unitarios'),(17,'ropa','ropas de todo tipo');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documenttype`
--

DROP TABLE IF EXISTS `documenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documenttype` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documenttype`
--

LOCK TABLES `documenttype` WRITE;
/*!40000 ALTER TABLE `documenttype` DISABLE KEYS */;
INSERT INTO `documenttype` VALUES (4,'T.I'),(5,'C.C'),(6,'C.E');
/*!40000 ALTER TABLE `documenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `statusId` int(20) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `peopleId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statusId` (`statusId`),
  KEY `peopleId` (`peopleId`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `invoicestatus` (`id`),
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoiceproduct`
--

DROP TABLE IF EXISTS `invoiceproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoiceproduct` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `productId` int(20) DEFAULT NULL,
  `invoiceId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `invoiceId` (`invoiceId`),
  CONSTRAINT `invoiceproduct_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `invoiceproduct_ibfk_2` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoiceproduct`
--

LOCK TABLES `invoiceproduct` WRITE;
/*!40000 ALTER TABLE `invoiceproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoiceproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicestatus`
--

DROP TABLE IF EXISTS `invoicestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoicestatus` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicestatus`
--

LOCK TABLES `invoicestatus` WRITE;
/*!40000 ALTER TABLE `invoicestatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `invoiceId` int(20) DEFAULT NULL,
  `statusId` int(20) DEFAULT NULL,
  `details` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoiceId` (`invoiceId`),
  KEY `statusId` (`statusId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `orderstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `documentTypeId` int(20) DEFAULT NULL,
  `documentNumber` varchar(12) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `documentTypeId` (`documentTypeId`),
  CONSTRAINT `people_ibfk_1` FOREIGN KEY (`documentTypeId`) REFERENCES `documenttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Juan','Perez','Calle 45 22-33',4,'1234567890','32132145','2024-10-04 00:18:10','2024-10-03 19:18:10',0),(2,'Camilo','Rendon','Vereda Palermo norte',5,'12536842','3215324830','2024-10-04 00:18:01','2024-10-03 19:18:01',1),(3,'Camilo','Calderon','calle 5 #3 sur',5,'1256891','3227569852','2024-10-04 00:18:09','2024-10-03 19:18:09',1),(4,'Sarah','mandrogan','centro',5,'1245002','3226440156','2024-10-05 21:57:18',NULL,0);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peoplerol`
--

DROP TABLE IF EXISTS `peoplerol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peoplerol` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `peopleId` int(20) DEFAULT NULL,
  `rolId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peopleId` (`peopleId`),
  KEY `rolId` (`rolId`),
  CONSTRAINT `peoplerol_ibfk_1` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`),
  CONSTRAINT `peoplerol_ibfk_2` FOREIGN KEY (`rolId`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peoplerol`
--

LOCK TABLES `peoplerol` WRITE;
/*!40000 ALTER TABLE `peoplerol` DISABLE KEYS */;
INSERT INTO `peoplerol` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,2);
/*!40000 ALTER TABLE `peoplerol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Arroz 1000g',10,12000,'2024-10-02 15:00:00','2024-10-02 16:22:35',1),(2,'Leche',25,4000,'2024-10-02 15:01:00','2024-10-02 10:01:00',1),(3,'Pollo (kg)',15,8000,'2024-10-02 15:02:00','2024-10-02 10:02:00',1),(4,'Carne de Res (kg)',10,18000,'2024-10-02 15:03:00','2024-10-02 10:03:00',1),(5,'Manzana (unidad)',50,2000,'2024-10-02 15:04:00','2024-10-02 10:04:00',1),(6,'Jugo (botella)',20,3000,'2024-10-02 15:05:00','2024-10-02 10:05:00',1),(7,'Huevo (docena)',30,5000,'2024-10-02 15:06:00','2024-10-02 10:06:00',1),(8,'Tetra Pak',40,3000,'2024-10-02 15:07:00','2024-10-02 10:07:00',1),(9,'Hueso perro',10,2500,'2024-10-02 15:08:00','2024-10-02 10:08:00',1),(11,'Galletas xunidad',18,1200,'2024-10-02 21:33:00',NULL,1),(12,'agua xL(botella)',18,1500,'2024-10-04 02:26:59',NULL,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `categoryId` int(20) DEFAULT NULL,
  `productId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  KEY `productId` (`productId`),
  CONSTRAINT `productcategory_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `productcategory_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (28,10,1),(29,11,2),(30,16,3),(31,13,4),(32,12,5),(33,11,6),(34,15,7),(35,14,8),(36,15,9),(38,16,11),(39,11,12);
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdesc`
--

DROP TABLE IF EXISTS `productdesc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdesc` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `productId` int(20) DEFAULT NULL,
  `discount` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  CONSTRAINT `productdesc_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdesc`
--

LOCK TABLES `productdesc` WRITE;
/*!40000 ALTER TABLE `productdesc` DISABLE KEYS */;
/*!40000 ALTER TABLE `productdesc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsupplier` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `productId` int(20) DEFAULT NULL,
  `peopleId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `peopleId` (`peopleId`),
  CONSTRAINT `productsupplier_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `productsupplier_ibfk_2` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsupplier`
--

LOCK TABLES `productsupplier` WRITE;
/*!40000 ALTER TABLE `productsupplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `productsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'clientes',NULL),(2,'Vendedor',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `peopleId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peopleId` (`peopleId`),
  CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-05 17:02:02
