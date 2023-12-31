-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: house_project
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `address_user`
--

DROP TABLE IF EXISTS `address_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `zipcode` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_user`
--

LOCK TABLES `address_user` WRITE;
/*!40000 ALTER TABLE `address_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `room_id` int DEFAULT NULL,
  `type` enum('BUNK','COUCH','KING','QUEEN','SINGLE','SOFA') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK115cuh725wpbt8yxq2lvgg1c9` (`room_id`),
  CONSTRAINT `FK115cuh725wpbt8yxq2lvgg1c9` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1,1,1,'SINGLE'),(2,1,2,'SINGLE'),(3,1,3,'SINGLE');
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_fee`
--

DROP TABLE IF EXISTS `booking_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` decimal(38,2) DEFAULT NULL,
  `type` enum('CLEANING','EXTRA_GUESS','PET','SERVICE_FEE','SHORT_STAY_CLEANING','TAX') DEFAULT NULL,
  `other` int NOT NULL,
  `reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8r900svjnfkvp86t0ok47nd2s` (`reservation_id`),
  CONSTRAINT `FK8r900svjnfkvp86t0ok47nd2s` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_fee`
--

LOCK TABLES `booking_fee` WRITE;
/*!40000 ALTER TABLE `booking_fee` DISABLE KEYS */;
INSERT INTO `booking_fee` VALUES (1,5.00,'CLEANING',1,1),(2,5.00,'EXTRA_GUESS',2,1),(3,12.00,'TAX',1,1),(4,14.00,'SERVICE_FEE',1,1),(5,5.00,'CLEANING',1,2),(6,5.00,'EXTRA_GUESS',2,2),(7,12.00,'TAX',1,2),(8,14.00,'SERVICE_FEE',1,2),(14,4.00,'CLEANING',1,11),(15,12.00,'TAX',1,11),(16,14.00,'SERVICE_FEE',1,11),(21,5.00,'CLEANING',1,13),(22,5.00,'EXTRA_GUESS',2,13),(23,12.00,'TAX',1,13),(24,14.00,'SERVICE_FEE',1,13),(25,4.00,'CLEANING',1,14),(26,12.00,'TAX',1,14),(27,14.00,'SERVICE_FEE',1,14),(32,3.00,'CLEANING',1,16),(33,2.00,'PET',1,16),(34,2.00,'EXTRA_GUESS',2,16),(35,12.00,'TAX',1,16),(36,14.00,'SERVICE_FEE',1,16),(37,2.00,'SHORT_STAY_CLEANING',1,17),(38,2.00,'PET',1,17),(39,2.00,'EXTRA_GUESS',2,17),(40,12.00,'TAX',1,17),(41,14.00,'SERVICE_FEE',1,17),(42,3.00,'CLEANING',1,18),(43,2.00,'PET',1,18),(44,2.00,'EXTRA_GUESS',2,18),(45,12.00,'TAX',1,18),(46,14.00,'SERVICE_FEE',1,18),(47,4.00,'CLEANING',1,19),(48,12.00,'TAX',1,19),(49,14.00,'SERVICE_FEE',1,19),(50,5.00,'CLEANING',1,20),(51,5.00,'EXTRA_GUESS',2,20),(52,12.00,'TAX',1,20),(53,14.00,'SERVICE_FEE',1,20),(54,4.00,'CLEANING',1,21),(55,12.00,'TAX',1,21),(56,14.00,'SERVICE_FEE',1,21),(57,4.00,'CLEANING',1,22),(58,12.00,'TAX',1,22),(59,14.00,'SERVICE_FEE',1,22),(65,3.00,'CLEANING',1,24),(66,2.00,'PET',1,24),(67,2.00,'EXTRA_GUESS',2,24),(68,12.00,'TAX',1,24),(69,14.00,'SERVICE_FEE',1,24),(70,4.00,'CLEANING',1,25),(71,12.00,'TAX',1,25),(72,14.00,'SERVICE_FEE',1,25),(73,5.00,'CLEANING',1,26),(74,5.00,'EXTRA_GUESS',2,26),(75,12.00,'TAX',1,26),(76,14.00,'SERVICE_FEE',1,26),(77,12.00,'TAX',1,27),(78,14.00,'SERVICE_FEE',1,27),(79,4.00,'CLEANING',1,28),(80,12.00,'TAX',1,28),(81,14.00,'SERVICE_FEE',1,28),(82,3.00,'CLEANING',1,29),(83,12.00,'TAX',1,29),(84,14.00,'SERVICE_FEE',1,29),(85,2.00,'SHORT_STAY_CLEANING',1,30),(86,12.00,'TAX',1,30),(87,14.00,'SERVICE_FEE',1,30),(88,4.00,'CLEANING',1,31),(89,5.00,'CLEANING',1,31),(90,12.00,'TAX',1,31),(91,14.00,'SERVICE_FEE',1,31),(92,12.00,'TAX',1,32),(93,14.00,'SERVICE_FEE',1,32),(94,4.00,'CLEANING',1,33),(95,5.00,'CLEANING',1,33),(96,12.00,'TAX',1,33),(97,14.00,'SERVICE_FEE',1,33),(98,4.00,'CLEANING',1,34),(99,5.00,'CLEANING',1,34),(100,12.00,'TAX',1,34),(101,14.00,'SERVICE_FEE',1,34);
/*!40000 ALTER TABLE `booking_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellation_policy`
--

DROP TABLE IF EXISTS `cancellation_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancellation_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellation_policy`
--

LOCK TABLES `cancellation_policy` WRITE;
/*!40000 ALTER TABLE `cancellation_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancellation_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_hotel`
--

DROP TABLE IF EXISTS `category_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon_url` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_hotel`
--

LOCK TABLES `category_hotel` WRITE;
/*!40000 ALTER TABLE `category_hotel` DISABLE KEYS */;
INSERT INTO `category_hotel` VALUES (1,'Nhà',NULL),(2,'Căn hộ',NULL),(3,'Nhà nông trại',NULL),(4,'Chỗ nghỉ phục vụ bữa sáng',NULL),(5,'Thuyền',NULL),(6,'Cabin',NULL),(7,'Xe cắm trại/RV',NULL),(8,'Casa particular',NULL),(9,'Lâu đài',NULL),(10,'Hang',NULL),(11,'Nhà container',NULL),(12,'Nhà theo phong cách Cycladic',NULL),(13,'Dammuso',NULL),(14,'Nhà vòm',NULL),(15,'Nhà dưới lòng đất',NULL),(16,'Nông trại',NULL),(17,'Nhà khách',NULL),(18,'Khách sạn',NULL),(19,'Nhà thuyền',NULL),(20,'Kezhan',NULL),(21,'Minsu',NULL),(22,'Riad',NULL),(23,'Ryokan',NULL),(24,'Lều mục đồng',NULL),(25,'Lều vải',NULL),(26,'Nhà nhỏ',NULL),(27,'Tháp',NULL),(28,'Nhà trên cây',NULL),(29,'Nhà chỏm nón',NULL),(30,'Cối xay gió',NULL),(31,'Lều yurt',NULL);
/*!40000 ALTER TABLE `category_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning_fee`
--

DROP TABLE IF EXISTS `cleaning_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_fee`
--

LOCK TABLES `cleaning_fee` WRITE;
/*!40000 ALTER TABLE `cleaning_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `cleaning_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning_fee_house`
--

DROP TABLE IF EXISTS `cleaning_fee_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_fee_house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fee_id` int DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKobhth36qv7e0jl25g9eq0nphp` (`fee_id`),
  KEY `FK6xprv83dlpun3dk67gy2494wg` (`house_id`),
  CONSTRAINT `FK6xprv83dlpun3dk67gy2494wg` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
  CONSTRAINT `FKobhth36qv7e0jl25g9eq0nphp` FOREIGN KEY (`fee_id`) REFERENCES `cleaning_fee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_fee_house`
--

LOCK TABLES `cleaning_fee_house` WRITE;
/*!40000 ALTER TABLE `cleaning_fee_house` DISABLE KEYS */;
/*!40000 ALTER TABLE `cleaning_fee_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comfortable`
--

DROP TABLE IF EXISTS `comfortable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comfortable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon_path` longtext,
  `name` varchar(255) DEFAULT NULL,
  `comfortable_type_id` int DEFAULT NULL,
  `popular` bit(1) NOT NULL,
  `description` longtext,
  `config_default` bit(1) NOT NULL,
  `icon_path_none_active` longtext,
  `filter` enum('CHARACTERISTIC','NECESSITIES','SAFE') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4hig7w7jfelkyegt83uyom8dr` (`comfortable_type_id`),
  CONSTRAINT `FK4hig7w7jfelkyegt83uyom8dr` FOREIGN KEY (`comfortable_type_id`) REFERENCES `comfortable_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comfortable`
--

LOCK TABLES `comfortable` WRITE;
/*!40000 ALTER TABLE `comfortable` DISABLE KEYS */;
INSERT INTO `comfortable` VALUES (1,'M7.5 2a4.5 4.5 0 0 1 4.47 4H14v2H8V6h1.95A2.5 2.5 0 0 0 5 6.34V16h26v2h-2v5a5 5 0 0 1-3 4.58V30h-2v-2H8v2H6v-2.42a5 5 0 0 1-3-4.34V18H1v-2h2V6.5A4.5 4.5 0 0 1 7.5 2zM27 18H5v5a3 3 0 0 0 2.65 2.98l.17.01L8 26h16a3 3 0 0 0 3-2.82V23z','Bồn tắm',1,_binary '\0',NULL,_binary '\0',NULL,NULL),(3,'M10 2a3 3 0 0 1 3 2.82V16h14a1 1 0 0 1 1 .88V17a8 8 0 0 1-7.75 8h-4.77l1.45 3.63a1 1 0 0 1-.7 1.35l-.11.01L16 30H4a1 1 0 0 1-1-.88V5a3 3 0 0 1 2.82-3H10zm15.91 16H5v10h9.52l-1.45-3.63a1 1 0 0 1 .7-1.35l.11-.01L14 23h6a6 6 0 0 0 5.85-4.67l.05-.23.01-.1zM10 4H6a1 1 0 0 0-1 .88V16h6V5a1 1 0 0 0-.77-.97L10.12 4 10 4zm11 9a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-8 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm6-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Bồn cầu vệ sinh thông minh',1,_binary '\0',NULL,_binary '\0',NULL,NULL),(4,'M18 1v2h-7v2h1a2 2 0 0 1 2 1.85V9.1a5 5 0 0 1 4 4.67V28a3 3 0 0 1-2.82 3H5a3 3 0 0 1-3-2.82V14a5 5 0 0 1 4-4.9V7a2 2 0 0 1 1.85-2H9V3H6V1h12zm-2 15.06c-1.14.15-2.08.6-3.58 1.55l-.34.23C9.63 19.41 8.29 20 6 20a9 9 0 0 1-2-.22V28a1 1 0 0 0 .88 1H15a1 1 0 0 0 1-.88V16.06zM27 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm-14-2H7a3 3 0 0 0-3 2.82v3.89A6.85 6.85 0 0 0 6 18c1.63 0 2.64-.36 4.4-1.46l.64-.4c2.01-1.32 3.28-1.93 4.96-2.09V14a3 3 0 0 0-3-3zm14 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25 2a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM12 7H8v2h4V7zm13-3a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Xà phòng tắm',1,_binary '\0',NULL,_binary '\0',NULL,NULL),(5,'M16 1c4.26 0 7.6 4.44 7.97 10h.91a2 2 0 0 1 2 2v.22l-1.79 16A2 2 0 0 1 23.26 31l-.16.01H8.9a2 2 0 0 1-1.97-1.62l-.02-.16L6.44 25H5a2 2 0 0 1-2-1.85V14a5 5 0 0 1 4.78-5h.52c.94-4.62 4-8 7.7-8zm8.21 18H17v4a2 2 0 0 1-1.85 2h-6.7l.45 4h14.2zM15 21H5v2h10zm0-10H8a3 3 0 0 0-3 2.82V19h10zm9.88 2H17v4h7.44zM16 3c-2.52 0-4.8 2.44-5.65 6H15a2 2 0 0 1 2 1.85V11h4.96c-.34-4.55-2.95-8-5.96-8z','Sản phẩm vệ sinh',1,_binary '\0',NULL,_binary '\0',NULL,NULL),(6,'M20 1v2h-3v2h1a2 2 0 0 1 2 1.85V9a4 4 0 0 1 4 3.8V27a4 4 0 0 1-3.8 4H12a4 4 0 0 1-4-3.8V13a4 4 0 0 1 3.8-4h.2V7a2 2 0 0 1 1.85-2H15V3H8V1zm2 21H10v5a2 2 0 0 0 1.85 2H20a2 2 0 0 0 2-1.85V27zm0-6H10v4h12zm-2-5h-8a2 2 0 0 0-2 1.85V14h12v-1a2 2 0 0 0-2-2zm-2-4h-4v2h4z','Dầu xả',1,_binary '\0',NULL,_binary '\0',NULL,NULL),(7,'M14 27v.2a4 4 0 0 1-3.8 3.8H4v-2h6.15a2 2 0 0 0 1.84-1.84L12 27zM10 1c.54 0 1.07.05 1.58.14l.38.07 17.45 3.65a2 2 0 0 1 1.58 1.79l.01.16v6.38a2 2 0 0 1-1.43 1.91l-.16.04-13.55 2.83 1.76 6.5A2 2 0 0 1 15.87 27l-.18.01h-3.93a2 2 0 0 1-1.88-1.32l-.05-.15-1.88-6.76A9 9 0 0 1 10 1zm5.7 24-1.8-6.62-1.81.38a9 9 0 0 1-1.67.23h-.33L11.76 25zM10 3a7 7 0 1 0 1.32 13.88l.33-.07L29 13.18V6.8L11.54 3.17A7.03 7.03 0 0 0 10 3zm0 2a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6z','Máy sấy tóc',1,_binary '\0',NULL,_binary '','M1.88 6.12 3.4 7.65a7 7 0 0 0 7.92 9.22l1.08-.22 4.25 4.24.97 3.59a2 2 0 0 1-1.75 2.51l-.18.01H14v.2a4 4 0 0 1-3.8 3.8H4v-2h6.15a2 2 0 0 0 1.84-1.84L12 27h-.24a2 2 0 0 1-1.88-1.31l-.05-.16-1.88-6.76A9 9 0 0 1 1.88 6.12zM3.7 2.29l26 26-1.42 1.42-26-26 1.42-1.42zM15.69 25l-1.8-6.62-1.8.38a9 9 0 0 1-1.67.23h-.33L11.76 25h3.93zM10 1c.54 0 1.07.05 1.58.14l.38.07 17.45 3.65a2 2 0 0 1 1.58 1.79l.01.16v6.38a2 2 0 0 1-1.43 1.91l-.16.04-8.3 1.73-1.68-1.69 9.57-2V6.82L11.54 3.17a7.03 7.03 0 0 0-3.9.24L6.13 1.88A8.96 8.96 0 0 1 10 1zM5.05 9.3l5.66 5.65a5 5 0 0 1-5.66-5.66zM10 5a5 5 0 0 1 4.95 5.7L9.29 5.06A5 5 0 0 1 10 5z','NECESSITIES'),(8,'M16 32a12 12 0 0 0 12-12c0-6.22-3.67-12.51-10.92-18.89L16 .18l-1.08.93C7.67 7.5 4 13.78 4 20c0 6.58 5.4 12 12 12zm0-2c-5.5 0-10-4.53-10-10 0-5.33 3.12-10.88 9.42-16.65l.41-.37.17-.15.58.52c6.04 5.53 9.15 10.85 9.4 15.98l.02.34V20a10 10 0 0 1-10 10zm-3.45-5.1a8.95 8.95 0 0 1 2.12-4.92l.24-.26.44-.47a6.97 6.97 0 0 0 1.83-4.41v-.72a6.03 6.03 0 0 0-2.02-.06 4.98 4.98 0 0 1-1.44 4 10.95 10.95 0 0 0-2.87 5.02 6.03 6.03 0 0 0 1.7 1.83zM16 26h.25l.25-.02v-.14c0-1.32.51-2.58 1.46-3.53a10.98 10.98 0 0 0 3.02-5.66 6.03 6.03 0 0 0-1.8-1.74 8.97 8.97 0 0 1-2.17 5.5l-.23.25-.45.46a6.96 6.96 0 0 0-1.82 4.42v.27c.47.12.97.19 1.49.19z','Nước nóng',1,_binary '\0',NULL,_binary '\0',NULL,NULL),(9,'M7 1a3 3 0 0 0-3 2.82V31h2V4a1 1 0 0 1 .88-1H18a1 1 0 0 1 1 .88V5h-5a1 1 0 0 0-1 .88V9h-3v2h19V9h-2V6a1 1 0 0 0-.88-1H21V4a3 3 0 0 0-2.82-3H7zm13 28a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM15 7h10v2H15V7z','Vòi sen tắm ngoài trời',1,_binary '\0',NULL,_binary '\0',NULL,NULL),(10,'M20 1v2h-3v2h1a2 2 0 0 1 2 1.85V9a4 4 0 0 1 4 3.8V27a4 4 0 0 1-3.8 4H12a4 4 0 0 1-4-3.8V13a4 4 0 0 1 3.8-4h.2V7a2 2 0 0 1 1.85-2H15V3H8V1zm2 21H10v5a2 2 0 0 0 1.85 2H20a2 2 0 0 0 2-1.85V27zm0-6H10v4h12zm-2-5h-8a2 2 0 0 0-2 1.85V14h12v-1a2 2 0 0 0-2-2zm-2-4h-4v2h4z','Dầu gội đầu',1,_binary '\0',NULL,_binary '','m8.06 12.3 3.7 3.7H10v4h5.76l2 2H10v5a2 2 0 0 0 1.85 2H20a2 2 0 0 0 2-1.85v-.91l1.85 1.85A4 4 0 0 1 20.2 31L20 31h-8a4 4 0 0 1-4-3.8V13a4 4 0 0 1 .06-.7zm-4.35-10 26 26-1.42 1.4-26-26 1.42-1.4zM20 1v2h-3v2h1a2 2 0 0 1 2 1.85V9a4 4 0 0 1 4 3.8v6.96l-2-2V16h-1.76l-2-2H22v-1a2 2 0 0 0-2-2h-4.76L12 7.76V7a2 2 0 0 1 1.85-2H15V3H8V1h12zm-2 6h-4v2h4V7z',NULL),(11,'M18 1v2h-7v2h1a2 2 0 0 1 2 1.85V9.1a5 5 0 0 1 4 4.67V28a3 3 0 0 1-2.82 3H5a3 3 0 0 1-3-2.82V14a5 5 0 0 1 4-4.9V7a2 2 0 0 1 1.85-2H9V3H6V1h12zm-2 15.06c-1.14.15-2.08.6-3.58 1.55l-.34.23C9.63 19.41 8.29 20 6 20a9 9 0 0 1-2-.22V28a1 1 0 0 0 .88 1H15a1 1 0 0 0 1-.88V16.06zM27 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm-14-2H7a3 3 0 0 0-3 2.82v3.89A6.85 6.85 0 0 0 6 18c1.63 0 2.64-.36 4.4-1.46l.64-.4c2.01-1.32 3.28-1.93 4.96-2.09V14a3 3 0 0 0-3-3zm14 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25 2a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM12 7H8v2h4V7zm13-3a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Sữa tắm',1,_binary '\0',NULL,_binary '\0',NULL,NULL),(12,'M11 1v7l1.9 20.82v.17a2.01 2.01 0 0 1-1.81 2 2 2 0 0 1-.18.01H2.92a2.01 2.01 0 0 1-1.82-2v-.09l1.9-21V1zm6 0h.15a2 2 0 0 1 1.84 1.84L19 3v7.12l-2 8V31h-2V17.96l.03-.16.03-.16L16.72 11H13V1zm11 0a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H21v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7V9h7V7h-7V5h7V3h-7V1zM9.09 9H4.9L3.1 29h7.81v-.06zM17 3h-2v6h2zM9 3H5v4h4z','Tiện nghi thiết yếu',2,_binary '\0','Khăn tắm, khăn trải giường, xà phòng và giấy vệ sinh',_binary '','m4 8.24 2 2V17h6.76l2 2H6v2h10.76l2 2H6v2h14.76l1.89 1.9-.12.03-.16.03-.07.02a2.02 2.02 0 0 1-.3.02H10v2h14.76l1.89 1.9a1.99 1.99 0 0 1-.5.1H10a2 2 0 0 1-2-1.85V27H6a2 2 0 0 1-2-1.85V8.24zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zM25.5 1l-.05.03a3 3 0 0 1 2.54 2.8L28 4v1h2v2h-2v16.76l-2-2V7h-2v12.76l-2-2V3H7.24L5.6 1.35c.37-.2.8-.32 1.23-.34L7 1h18.5zM25 3a1 1 0 0 0-1 .88V5h2V4a1 1 0 0 0-.88-1H25z',NULL),(13,'M19.59 2a2 2 0 0 1 1.28.47l.13.12L29.41 11a2 2 0 0 1 .58 1.24l.01.17V25a5 5 0 0 1-4.78 5H4a2 2 0 0 1-2-1.85V7a5 5 0 0 1 4.78-5H7zM7 4a3 3 0 0 0-3 2.82V21a3 3 0 0 0 2.82 3H26v2H7a4.98 4.98 0 0 1-3-1v3h21a3 3 0 0 0 3-2.82V22H6v-2h22v-6h-5a5 5 0 0 1-5-4.78V4zm20.59 8L20 4.42V9a3 3 0 0 0 2.82 3H23z','Bộ chăn ga gối',2,_binary '\0',NULL,_binary '\0',NULL,NULL),(14,'M25 1a3 3 0 0 1 3 2.82V26a3 3 0 0 1-2.82 3H25v2h-2v-2H9v2H7v-2a3 3 0 0 1-3-2.82V4a3 3 0 0 1 2.82-3H25zm1 20H6v5a1 1 0 0 0 .88 1H25a1 1 0 0 0 1-.88V21zm-10 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm9-20h-8v16h9V4a1 1 0 0 0-.88-1H25zM15 3H7a1 1 0 0 0-1 .88V19h9V3zm-3 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm8 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Nơi để quần áo',2,_binary '\0',NULL,_binary '\0',NULL,NULL),(15,'M26.29 2a3 3 0 0 1 2.96 2.58c.5 3.56.75 7.37.75 11.42s-.25 7.86-.75 11.42a3 3 0 0 1-2.79 2.57l-.17.01H5.7a3 3 0 0 1-2.96-2.58C2.25 23.86 2 20.05 2 16s.25-7.86.75-11.42a3 3 0 0 1 2.79-2.57L5.7 2zm0 2H5.72a1 1 0 0 0-1 .86A80.6 80.6 0 0 0 4 16c0 3.96.24 7.67.73 11.14a1 1 0 0 0 .87.85l.11.01h20.57a1 1 0 0 0 1-.86c.48-3.47.72-7.18.72-11.14 0-3.96-.24-7.67-.73-11.14a1 1 0 0 0-.87-.85zM16 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm0 2a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm-4.8 5.58c1.36.2 2.64.8 3.68 1.75l.46.45a8.97 8.97 0 0 0 4.62 2.28 5.02 5.02 0 0 1-2.01 1.55 10.98 10.98 0 0 1-4.26-2.65 4.96 4.96 0 0 0-2.66-1.38 4.68 4.68 0 0 1 .17-2zm3.09-3.28c1.34.55 2.58 1.36 3.64 2.42a4.97 4.97 0 0 0 3 1.44 4.99 4.99 0 0 1-.07 2 6.97 6.97 0 0 1-4.11-1.8l-.47-.45a8.96 8.96 0 0 0-4.07-2.17 5 5 0 0 1 2.08-1.44zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy sấy quần áo',2,_binary '\0',NULL,_binary '\0',NULL,'NECESSITIES'),(16,'M16 2a5 5 0 0 1 1.66 9.72 1 1 0 0 0-.65.81l-.01.13v.81l13.23 9.05a3 3 0 0 1 1.3 2.28v.2a3 3 0 0 1-3 3H3.47a3 3 0 0 1-1.69-5.48L15 13.47v-.81a3 3 0 0 1 1.82-2.76l.17-.07a3 3 0 1 0-3.99-3V7h-2a5 5 0 0 1 5-5zm0 13.21L2.9 24.17A1 1 0 0 0 3.46 26h25.07a1 1 0 0 0 .57-1.82z','Giá phơi quần áo',2,_binary '\0',NULL,_binary '\0',NULL,NULL),(17,'M26.8 4a3 3 0 0 0-1.87.83l-.02.02-.11-.02A47.19 47.19 0 0 0 7.94 4.7l-.85.15-.02-.02A3 3 0 0 0 2 7v.21a3 3 0 0 0 .56 1.54l.03.03-.05.28a44.99 44.99 0 0 0 0 13.88l.05.28-.03.03A3 3 0 0 0 5 28h.2a3 3 0 0 0 1.87-.83l.02-.02.11.02a47.19 47.19 0 0 0 16.86.13l.85-.15.02.02A3 3 0 0 0 30 25v-.21a3 3 0 0 0-.56-1.54l-.03-.03.05-.28c.71-4.74.72-9.16 0-13.88l-.05-.28.03-.03A3 3 0 0 0 27 4h-.2zm.2 2a1 1 0 0 1 .68 1.74l-.4.36.09.54a43.3 43.3 0 0 1 0 14.72l-.1.54.4.36a1 1 0 1 1-1.52 1.27l-.37-.6-.68.15a45.29 45.29 0 0 1-18.2 0l-.68-.14-.37.59a1 1 0 1 1-1.52-1.27l.4-.36-.1-.54a43.25 43.25 0 0 1 0-14.72l.1-.54-.4-.36a1 1 0 1 1 1.52-1.27l.37.6.68-.15a45.29 45.29 0 0 1 18.2 0l.68.14.37-.59A1 1 0 0 1 27 6z','Thêm chăn gối',2,_binary '\0',NULL,_binary '\0',NULL,NULL),(18,'M16 2a5 5 0 0 1 1.66 9.72 1 1 0 0 0-.65.81l-.01.13v.81l13.23 9.05a3 3 0 0 1 1.3 2.28v.2a3 3 0 0 1-3 3H3.47a3 3 0 0 1-1.69-5.48L15 13.47v-.81a3 3 0 0 1 1.82-2.76l.17-.07a3 3 0 1 0-3.99-3V7h-2a5 5 0 0 1 5-5zm0 13.21L2.9 24.17A1 1 0 0 0 3.46 26h25.07a1 1 0 0 0 .57-1.82z','Móc treo quần áo',2,_binary '\0',NULL,_binary '\0',NULL,NULL),(19,'M12 28a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM16.03 3h.3a12.5 12.5 0 0 1 11.82 9.48l.07.3 1.73 7.79.03.14A2 2 0 0 1 28.15 23H2.1a2 2 0 0 1-1.85-1.84v-7.38a5 5 0 0 1 4.77-4.77L5.25 9h9V5h-14V3zm11.53 16H2.25v2H28zM16.24 5v6H5.07a3 3 0 0 0-2.82 2.82V17H27.1l-.84-3.78-.07-.28a10.5 10.5 0 0 0-9.6-7.92L16.32 5z','Bàn là',2,_binary '\0',NULL,_binary '\0',NULL,'NECESSITIES'),(20,'M2 30a1 1 0 0 1-1-1.03l.01-.11 3-21A1 1 0 0 1 5 7c2.21 0 4.09-.31 5.63-.93 1.5-.6 3.03-1.83 4.6-3.71a1 1 0 0 1 1.54 0c1.57 1.88 3.1 3.11 4.6 3.71C22.91 6.7 24.8 7 27 7a1 1 0 0 1 .97.75l.02.1 3 21a1 1 0 0 1-.88 1.14L30 30H2zM16 4.52l-.17.18a12.85 12.85 0 0 1-4.46 3.23c-1.42.57-3.06.9-4.9 1.03l-.5.02h-.1L3.15 28H6v-4.33a3 3 0 0 1 .48-1.63l.12-.17 2.3-3.07a2 2 0 0 1 1.43-.8H12v-3a1 1 0 0 1 .88-1H19a1 1 0 0 1 1 .88V18h1.5a2 2 0 0 1 1.5.67l.1.13 2.3 3.07a3 3 0 0 1 .6 1.58V28h2.85L26.13 8.98h-.1a17.1 17.1 0 0 1-4.63-.77l-.77-.28a12.46 12.46 0 0 1-4.15-2.9l-.31-.33L16 4.5zM24 25H8v3h16v-3zm-2.5-5h-11l-2.25 3h15.5l-2.25-3zM18 16h-4v2h4v-2z','Màn chống muỗi',2,_binary '\0',NULL,_binary '\0',NULL,NULL),(21,'M1 2V0h30v2h-2v18a2 2 0 0 1-1.85 2H17v2.17a3 3 0 1 1-2 0V22H5a2 2 0 0 1-2-1.85V2zm15 24a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM27 2H5v18h22z','Mành chắn sáng cho phòng',2,_binary '\0',NULL,_binary '\0',NULL,NULL),(22,'M25 2a5 5 0 0 1 5 4.78V25a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V7a5 5 0 0 1 4.78-5H7zm0 2H7a3 3 0 0 0-3 2.82V11h2V6h20v20H6v-5H4v4a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V7a3 3 0 0 0-2.82-3zm-1 4H8v16h16zm-8 3a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM6 13H4v6h2z','Két sắt',2,_binary '\0',NULL,_binary '\0',NULL,NULL),(23,'M26.29 2a3 3 0 0 1 2.96 2.58c.5 3.56.75 7.37.75 11.42s-.25 7.86-.75 11.42a3 3 0 0 1-2.79 2.57l-.17.01H5.7a3 3 0 0 1-2.96-2.58C2.25 23.86 2 20.05 2 16s.25-7.86.75-11.42a3 3 0 0 1 2.79-2.57L5.7 2zm0 2H5.72a1 1 0 0 0-1 .86A80.6 80.6 0 0 0 4 16c0 3.96.24 7.67.73 11.14a1 1 0 0 0 .87.85l.11.01h20.57a1 1 0 0 0 1-.86c.48-3.47.72-7.18.72-11.14 0-3.96-.24-7.67-.73-11.14A1 1 0 0 0 26.3 4zM16 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm-5.84 7.5c-.34 0-.68.02-1.02.07a7 7 0 0 0 13.1 4.58 9.09 9.09 0 0 1-6.9-2.37l-.23-.23a6.97 6.97 0 0 0-4.95-2.05zM16 9a7 7 0 0 0-6.07 3.5h.23c2.26 0 4.44.84 6.12 2.4l.24.24a6.98 6.98 0 0 0 6.4 1.9A7 7 0 0 0 16 9zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy giặt',2,_binary '\0',NULL,_binary '','m2 6.24 2 2V28h19.76l2 2H4a2 2 0 0 1-2-1.85V6.24zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zM28 2a2 2 0 0 1 2 1.85v21.91l-2-2V4H8.24l-2-2H28zM7.88 12.12l2.38 2.38h-.1c-.34 0-.68.02-1.02.07a7 7 0 0 0 9.21 8.03l1.53 1.52a9 9 0 0 1-12-12zM16 7a9 9 0 0 1 8.12 12.88l-2.7-2.7h.05a7 7 0 0 0 1.45-.14 7 7 0 0 0-9.27-7.63l-1.53-1.53A8.96 8.96 0 0 1 16 7z','NECESSITIES'),(24,'M30 2v2h-8a5 5 0 0 0-5 4.78V14h9a4 4 0 0 1 4 3.8V26a4 4 0 0 1-3.8 4H6a4 4 0 0 1-4-3.8V18a4 4 0 0 1 3.8-4H15V9a7 7 0 0 1 6.76-7H30zm-4 14H6a2 2 0 0 0-2 1.85V26a2 2 0 0 0 1.85 2H26a2 2 0 0 0 2-1.85V18a2 2 0 0 0-1.85-2H26zm-15 3v2h2v2h-2v2H9v-2H7v-2h2v-2h2zm13 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy chơi game arcade',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(25,NULL,'Khung lưới bao sân',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(26,'M1.67 2.68A2 2 0 0 1 4.1.72l.14.04L16.01 4.3 27.78.91a2 2 0 0 1 2.53 1.63l.02.14v23.25a2 2 0 0 1-1.27 1.85l-.15.06-12.62 3.78a1 1 0 0 1-.46.03l-.12-.03L3.1 27.84a2 2 0 0 1-1.42-1.75v-.17zm2 0v23.24L16 29.62l12.33-3.7V2.82L16.28 6.3a1 1 0 0 1-.46.03l-.1-.03zm21.66 17.48v2.08L16 25.04v-2.08zm0-6v2.08L16 19.04v-2.08zm0-6v2.08L16 13.04v-2.08z','Sách và ấn phẩm để đọc',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(27,NULL,'Sàn bowling',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(28,NULL,'Leo núi trong nhà',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(29,'M24 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H19v-2h5a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3H8a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H15v-8h-2a2 2 0 0 1-2-1.85V13a2 2 0 0 1 1.85-2H19a2 2 0 0 1 2 1.85V19a2 2 0 0 1-1.85 2H17v8a2 2 0 0 1-1.85 2H8a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H8zm-5 12h-6v6h2v-4h2v4h2z','Kết nối Ethernet',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(30,'M10 5a2 2 0 0 1 2 1.85V15h8V7a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V9h2a2 2 0 0 1 2 1.85V15h2v2h-2v4a2 2 0 0 1-1.85 2H26v2a2 2 0 0 1-1.85 2H22a2 2 0 0 1-2-1.85V17h-8v8a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V23H4a2 2 0 0 1-2-1.85V17H0v-2h2v-4a2 2 0 0 1 1.85-2H6V7a2 2 0 0 1 1.85-2H8zm14 2h-2v18h2zM10 7H8v18h2zm18 4h-2v10h2zM6 11H4v10h2z','Thiết bị tập thể dục',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(31,'M30 2v2h-8a5 5 0 0 0-5 4.78V14h9a4 4 0 0 1 4 3.8V26a4 4 0 0 1-3.8 4H6a4 4 0 0 1-4-3.8V18a4 4 0 0 1 3.8-4H15V9a7 7 0 0 1 6.76-7H30zm-4 14H6a2 2 0 0 0-2 1.85V26a2 2 0 0 0 1.85 2H26a2 2 0 0 0 2-1.85V18a2 2 0 0 0-1.85-2H26zm-15 3v2h2v2h-2v2H9v-2H7v-2h2v-2h2zm13 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy chơi điện tử',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(32,NULL,'Bắn súng laser',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(33,NULL,'Trò chơi kích thước lớn',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(34,NULL,'Sân golf mini',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(35,NULL,'Rạp chiếu phim',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(36,'M1 8a7 7 0 0 1 6.76-7H10a7 7 0 0 1 6.98 6.52l.02.24v.42A3 3 0 0 0 19.83 11H23a8 8 0 0 1 8 7.75V27a1 1 0 0 1-.88 1H29v3h-2v-3H5v3H3v-3H2a1 1 0 0 1-1-.88V8zm2 18h26v-6h-2v4h-2v-4h-2v4h-2v-4h-2v4h-2v-4h-2v4h-2v-4h-2v4H9v-4H7v4H5v-4H3v6zm7-23H8a5 5 0 0 0-5 4.78V18h25.91l-.01-.1a6 6 0 0 0-5.43-4.88l-.25-.02H20a5 5 0 0 1-5-4.77v-.42A5 5 0 0 0 10 3z','Đàn piano',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(37,'M27 23a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM18 1a11 11 0 0 1 0 22 9.08 9.08 0 0 1-1.51-.12l-.63-.12a7 7 0 0 0-5.94 1.75l-.2.2-4.01 4a1 1 0 0 1-1.32.08l-.1-.08-3-3a1 1 0 0 1-.08-1.32l.08-.1 3.94-3.93a7 7 0 0 0 1.98-5.9l-.09-.61A13.21 13.21 0 0 1 7 12 11 11 0 0 1 18 1zm-1.59 19.82-7.32-7.31.1.62a9 9 0 0 1-2.33 7.42l-.21.22L3.4 25 5 26.59l3.3-3.3a9 9 0 0 1 7.65-2.54l.3.04.16.04zM18 3a9 9 0 0 0-8.9 7.68L19.32 20.9A9 9 0 0 0 18 3z','Bàn bóng bàn',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(38,'M28 5a3 3 0 0 1 3 2.82V24a3 3 0 0 1-2.82 3h-4.46l1.23 3.68-1.9.64L21.61 27H4a3 3 0 0 1-3-2.82V8a3 3 0 0 1 2.82-3H28zm0 18a1 1 0 0 0-.12 2h.24a1 1 0 0 0-.12-2zM4 23a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25.17 7H19v1.18a3 3 0 0 1-6 0V7H6.83A3 3 0 0 1 3 10.83v10.34A3 3 0 0 1 6.83 25H13v-1a3 3 0 0 1 6-.18V25h1.95l-3.22-9.64 1.9-.63L23.05 25h2.12a2.99 2.99 0 0 1-.17-.82V24a3 3 0 0 1 4-2.83V10.83A3 3 0 0 1 25.17 7zM16 23a1 1 0 0 0-1 .88V25h2v-1a1 1 0 0 0-1-1zm2-11a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm10-5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM4 7a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm13 0h-2v1.12a1 1 0 0 0 2 0V7z','Bàn bi-da',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(39,'M26 3a5 5 0 0 1 5 4.78V24a5 5 0 0 1-4.78 5H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H6zm0 2H6a3 3 0 0 0-3 2.82V24a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3zm1 2v15.41l-3.3 3.3-1.4-1.42 2.7-2.7V7zM14 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm0 2a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm0 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy quay đĩa',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(40,NULL,'Đường dốc trượt ván',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(41,'M24 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H8a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H8zm0 2H8a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H24a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3zm-8 10a7 7 0 1 1 0 14 7 7 0 0 1 0-14zm0 2a5 5 0 1 0 0 10 5 5 0 0 0 0-10zm0 2a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm0-14a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z','Hệ thống âm thanh',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(42,NULL,'Phòng theo chủ đề',3,_binary '\0',NULL,_binary '\0',NULL,NULL),(43,'M9 29v-2h2v-2H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H26a5 5 0 0 1 5 4.78V20a5 5 0 0 1-4.78 5H21v2h2v2zm10-4h-6v2h6zm7-20H6a3 3 0 0 0-3 2.82V20a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3z','TV',3,_binary '\0',NULL,_binary '','m3.7 2.3 26 26-1.4 1.4-26-26 1.4-1.4zM1.53 5.76l1.56 1.55a3 3 0 0 0-.08.5V20a3 3 0 0 0 2.82 3h12.94L21 25.24V27h1.76l.24.24V29H9v-2h2v-2H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 .53-2.23zM19 25h-6v2h6v-2zM7.24 3H26a5 5 0 0 1 5 4.78V20a5 5 0 0 1-2.45 4.3l-1.5-1.49A3 3 0 0 0 29 20.18V8a3 3 0 0 0-2.82-3H9.24l-2-2z','NECESSITIES'),(44,'M17 1v4.03l4.03-2.32 1 1.73L17 7.34v6.93l6-3.47V5h2v4.65l3.49-2.02 1 1.74L26 11.38l4.03 2.33-1 1.73-5.03-2.9L18 16l6 3.46 5.03-2.9 1 1.73L26 20.62l3.49 2.01-1 1.74L25 22.35V27h-2v-5.8l-6-3.47v6.93l5.03 2.9-1 1.73L17 26.97V31h-2v-4.03l-4.03 2.32-1-1.73 5.03-2.9v-6.93L9 21.2V27H7v-4.65l-3.49 2.02-1-1.74L6 20.62l-4.03-2.33 1-1.73L8 19.46 14 16l-6-3.46-5.03 2.9-1-1.73L6 11.38 2.51 9.37l1-1.74L7 9.65V5h2v5.8l6 3.47V7.34l-5.03-2.9 1-1.73L15 5.03V1z','Điều hòa nhiệt độ',4,_binary '\0',NULL,_binary '','m15 19.24 2 2v3.42l5.03 2.9-1 1.73L17 26.97V31h-2v-4.03l-4.03 2.32-1-1.73 5.03-2.9v-5.42zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zm-.73 14.27L8 19.46l4.58-2.64 1.46 1.46L9 21.2V27H7v-4.65l-3.49 2.02-1-1.74L6 20.62l-4.03-2.33 1-1.73zm26.06 0 1 1.73L26 20.62l3.49 2.01-.96 1.66-5.23-5.23.7.4 5.03-2.9zM25 5v4.65l3.49-2.02 1 1.74L26 11.38l4.03 2.33-1 1.73-5.03-2.9-4.58 2.64-1.46-1.47 5.04-2.9V5h2zM3.47 7.7l5.22 5.24-.69-.4-5.03 2.9-1-1.73L6 11.38 2.51 9.37l.96-1.66zM17 1v4.03l4.03-2.32 1 1.73L17 7.34v5.42l-2-2V7.34l-5.03-2.9 1-1.73L15 5.03V1h2z','NECESSITIES'),(45,'M20.33 3.08c1.5 2.24.96 5.55-1.38 9.9l-.12.2.18.18c.1.13.21.26.3.4l.23.38.14.02c.7.06 1.78-.11 2.87-.48.89-.3 1.78-.78 2.68-1.45l.66-.52a3 3 0 0 1 4.77 1.33l.12.44c.59 3.35.02 5.73-1.86 6.98-2.24 1.5-5.54.96-9.9-1.39a3 3 0 0 1-.27-.16l-.07.07-.39.3-.28.19V20c-.03.7.15 1.68.48 2.68.3.88.78 1.78 1.45 2.68l.26.33.26.33a3 3 0 0 1-.36 4.22C19 31 17.95 31 17 31h-.54l-1.39-.1c-1.24-.19-2.56-.65-3.36-1.84-1.5-2.25-.96-5.55 1.39-9.91.04-.09.1-.17.15-.25a4.12 4.12 0 0 1-.37-.4.82.82 0 0 0-.18-.23.5.5 0 0 0-.21-.11c-.7-.1-1.85.06-3.04.46-.88.3-1.78.78-2.68 1.45l-.66.52a3 3 0 0 1-4.77-1.33l-.12-.44c-.59-3.35-.02-5.73 1.86-6.98 2.24-1.5 5.55-.96 9.9 1.38l.1.05c.3-.3.55-.5.72-.61l.2-.13.03-.2c.06-.7-.11-1.78-.48-2.88a9.6 9.6 0 0 0-1.45-2.68l-.52-.66a3 3 0 0 1 1.33-4.77l.44-.12c3.35-.59 5.73-.02 6.98 1.86zm-5.31 16.8-.16.22c-2.04 3.77-2.5 6.45-1.49 7.85 1.13 1.55 4.63 1.55 5.44.77.38-.36.47-.89.2-1.31l-.37-.45a11.94 11.94 0 0 1-2.05-3.64 10.93 10.93 0 0 1-.59-3.03V20h-.14a4.01 4.01 0 0 1-.63-.07l-.21-.05zM4.09 13.52c-1.56 1.13-1.56 4.63-.78 5.44.36.38.9.46 1.32.19l.44-.36c1.2-.96 2.42-1.64 3.65-2.05 1.16-.4 2.33-.6 3.28-.6V16c0-.14 0-.28.02-.42l.08-.46-.16-.12c-3.78-2.03-6.46-2.5-7.85-1.48zm23.24-.36-.45.36c-1.2.96-2.41 1.64-3.64 2.05-1.15.38-2.3.6-3.24.6-.01.25-.05.5-.1.74l-.07.26.19.14c3.77 2.03 6.45 2.5 7.85 1.48 1.55-1.13 1.55-4.63.78-5.44-.36-.38-.9-.47-1.32-.19zM16 14a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM13.2 3.39c-.37.36-.46.89-.18 1.31l.36.45c.95 1.2 1.64 2.42 2.05 3.64.37 1.14.59 2.27.59 3.2l.54.05.3.05.2.05.1-.13c2.04-3.77 2.5-6.45 1.49-7.84-1.13-1.56-4.63-1.56-5.44-.78z','Quạt trần',4,_binary '\0',NULL,_binary '\0',NULL,NULL),(46,'M16 0a5 5 0 0 1 5 4.78v12.98l.26.21a7.98 7.98 0 0 1 2.72 5.43l.02.3v.3a8 8 0 1 1-13.25-6.04l.25-.2V5A5 5 0 0 1 15.56.02l.22-.01zm0 2a3 3 0 0 0-3 2.82V18.78l-.43.3a6 6 0 1 0 7.06.15l-.2-.16-.43-.3V11h-4V9h4V7h-4V5h4a3 3 0 0 0-3-3zm1 11v7.13A4 4 0 0 1 16 28a4 4 0 0 1-1-7.87V13zm-1 9a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Hệ thống sưởi',4,_binary '\0',NULL,_binary '','m11 15.24 2 2v1.54l-.43.3a6 6 0 1 0 9.11 6.85l1.54 1.53a8 8 0 1 1-12.47-9.5l.25-.2v-2.52zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zM15 19.24l5 5a4 4 0 1 1-5-4.11v-.89zM16 22a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm0-22a5 5 0 0 1 5 4.78v11.98l-2-2V11h-3.76l-.24-.24V9h4V7h-4V5h4a3 3 0 0 0-6-.18v3.94l-2-2V5A5 5 0 0 1 15.56.02l.22-.01L16 0z','NECESSITIES'),(47,'M31 6v2h-1v23h-6V13H8v18H2V8H1V6zm-15.37 9 .96.7c3.32 2.42 5.14 5.06 5.38 7.93l.02.28v.21l.01.14c0 3.18-2.7 5.74-6 5.74a5.9 5.9 0 0 1-5.99-5.39v-.21l-.01-.15a9.3 9.3 0 0 1 1.64-4.99l.22-.34.68-.98 1.24.79zM28 8H4v21h2V13a2 2 0 0 1 1.7-1.98l.15-.01L8 11h16a2 2 0 0 1 2 1.85V29h2zM16 25.36l-.1.09c-.61.65-.9 1.23-.9 1.72 0 .42.41.83 1 .83s1-.4 1-.83c0-.45-.24-.97-.76-1.56l-.15-.16zm.35-7.32-1.77 3.56-1.46-.93-.15.27a7.28 7.28 0 0 0-.94 2.75l-.02.29-.01.26v.12c.03.92.4 1.76 1.03 2.4.14-1.14.86-2.24 2.1-3.33l.23-.2.64-.53.64.53c1.38 1.16 2.19 2.32 2.33 3.53A3.6 3.6 0 0 0 20 24.49l.01-.22V24c-.1-1.86-1.12-3.7-3.13-5.5l-.27-.24zM31 2v2H1V2z','Lò sưởi trong nhà',4,_binary '\0',NULL,_binary '\0',NULL,'CHARACTERISTIC'),(48,'M16 2a10 10 0 0 1 1 19.95V28h6v2H9v-2h6v-6.05A10 10 0 0 1 16 2zm1.44 12.63a2.98 2.98 0 0 1-1.22.36L16 15v.01a2.51 2.51 0 0 0-2.5 2.52c0 1.17.78 2.16 1.85 2.44a7.99 7.99 0 0 0 6.96-3.05 4.61 4.61 0 0 1-4.87-2.29zM10.52 10a2.52 2.52 0 0 0-2.5 2.16l-.02.1a8 8 0 0 0 3.66 6.46 4.53 4.53 0 0 1-.16-1.19c0-1.59.82-2.99 2.05-3.8a3 3 0 0 1-.46-1l-.05-.24-.01-.12-.03-.3A2.52 2.52 0 0 0 10.52 10zm10.95 5a2.52 2.52 0 0 0 2.47-1.98 8 8 0 0 0-4.24-8.11c.2.5.3 1.05.3 1.62a4.53 4.53 0 0 1-1.7 3.54 3 3 0 0 1 .6 2.68v-.07A2.56 2.56 0 0 0 21.47 15zM16 11a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-.32-7a8 8 0 0 0-6.77 4.3l.16-.07A4.54 4.54 0 0 1 10.52 8c1.43 0 2.72.67 3.55 1.7A2.98 2.98 0 0 1 16 9a2.52 2.52 0 0 0 2-2.48 2.52 2.52 0 0 0-2.16-2.5l-.16-.01z','Quạt cầm tay',4,_binary '\0',NULL,_binary '\0',NULL,NULL),(49,'M25 2a5 5 0 0 1 5 4.78V25a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V7a5 5 0 0 1 4.78-5H7zm0 2H7a3 3 0 0 0-3 2.82V25a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V7a3 3 0 0 0-2.82-3zM11.1 17a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17zm9.8 0h2.03A7 7 0 0 1 17 22.93V20.9a5 5 0 0 0 3.9-3.9zM16 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm1-5.93A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9zm-2 0v2.03a5 5 0 0 0-3.9 3.9H9.07A7 7 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy phát hiện khí CO',5,_binary '\0',NULL,_binary '','M2.05 6.3 4 8.23V25a3 3 0 0 0 2.82 3h16.94l1.95 1.95c-.16.02-.33.04-.5.04L25 30H7a5 5 0 0 1-5-4.78V7c0-.24.02-.48.05-.7zm1.66-4 26 26-1.42 1.4-26-26 1.42-1.4zM25 2a5 5 0 0 1 5 4.78V25a5 5 0 0 1-.05.7L28 23.77V7a3 3 0 0 0-2.82-3H8.24L6.3 2.05c.16-.02.33-.04.5-.04L7 2h18zM11.1 17a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17h2.03zm5.9 4.24 1.35 1.36a6.95 6.95 0 0 1-1.35.33v-1.69zM21.24 17h1.69c-.07.47-.18.92-.34 1.35L21.24 17zM17 9.07A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9V9.07zm-7.6 4.58L10.76 15H9.07c.07-.47.18-.92.33-1.35zM15 9.07v1.69L13.65 9.4A6.95 6.95 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','SAFE'),(50,'M7 28H5V15a11 11 0 0 1 8.06-10.6 3 3 0 0 1 4.63-1.88L20.35.24l1.3 1.52L19.04 4H23v2h-4.17A3 3 0 0 1 17 7.83v.24a7 7 0 0 1 5.98 6.45l.02.24V30a2 2 0 0 1-1.85 2H11a2 2 0 0 1-2-1.85V24H7zm9-18a5 5 0 0 0-4.98 4.57l-.02.22V30h10V14.82A5 5 0 0 0 16 10zm-2.65-3.6A9 9 0 0 0 7 14.73V22h2v-7.26a7 7 0 0 1 6-6.67v-.24a3.01 3.01 0 0 1-1.65-1.43zM16 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2z','Bình chữa cháy',5,_binary '\0',NULL,_binary '\0',NULL,NULL),(51,'M26 3a5 5 0 0 1 5 4.78V24a5 5 0 0 1-4.78 5H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H6zm0 2H6a3 3 0 0 0-3 2.82V24a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3zm-7 4v4h4v6h-4v4h-6v-4H9v-6h4V9zm-2 2h-2v4h-4v2h4v4h2v-4h4v-2h-4z','Bộ sơ cứu',5,_binary '\0',NULL,_binary '\0',NULL,NULL),(52,'M16 1a15 15 0 1 1 0 30 15 15 0 0 1 0-30zm0 2a13 13 0 1 0 0 26 13 13 0 0 0 0-26zm-4.9 14a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17zm9.8 0h2.03A7 7 0 0 1 17 22.93V20.9a5 5 0 0 0 3.9-3.9zM16 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm1-5.93A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9zm-2 0v2.03a5 5 0 0 0-3.9 3.9H9.07A7 7 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy báo khói',5,_binary '\0',NULL,_binary '','m3.49 7.73 1.44 1.44A12.94 12.94 0 0 0 3 16a13 13 0 0 0 19.82 11.07l1.45 1.44A14.93 14.93 0 0 1 16 31 15 15 0 0 1 3.49 7.73zm.22-5.44 26 26-1.42 1.42-26-26 1.42-1.42zM16 1a15 15 0 0 1 12.52 23.27l-1.45-1.45A12.94 12.94 0 0 0 29 16 13 13 0 0 0 16 3a12.94 12.94 0 0 0-6.83 1.93L7.74 3.5A14.93 14.93 0 0 1 16 1zm-4.9 16a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17h2.03zm5.9 4.24 1.35 1.36a6.95 6.95 0 0 1-1.35.33v-1.69zM21.24 17h1.69c-.07.47-.18.92-.34 1.35L21.24 17zM17 9.07A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9V9.07zm-7.6 4.58L10.76 15H9.07c.07-.47.18-.92.33-1.35zM15 9.07v1.69L13.65 9.4A6.95 6.95 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','SAFE'),(53,'M26 2a1 1 0 0 1 .92.61l.04.12 2 7a1 1 0 0 1-.85 1.26L28 11h-3v5h6v2h-2v13h-2v-2.54a3.98 3.98 0 0 1-1.73.53L25 29H7a3.98 3.98 0 0 1-2-.54V31H3V18H1v-2h5v-4a1 1 0 0 1 .88-1h.36L6.09 8.4l1.82-.8L9.43 11H12a1 1 0 0 1 1 .88V16h10v-5h-3a1 1 0 0 1-.99-1.16l.03-.11 2-7a1 1 0 0 1 .84-.72L22 2h4zm1 16H5v7a2 2 0 0 0 1.7 1.98l.15.01L7 27h18a2 2 0 0 0 2-1.85V18zm-16-5H8v3h3v-3zm14.24-9h-2.49l-1.43 5h5.35l-1.43-5z','Không gian riêng để làm việc',6,_binary '\0',NULL,_binary '\0',NULL,'NECESSITIES'),(54,'M21 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H11a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H11zm0 2H11a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H21a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3zM10 25a2 2 0 0 1 2 1.85V27h-2zm0-4a6 6 0 0 1 6 5.78V27h-2a4 4 0 0 0-3.8-4H10zm0-4a10 10 0 0 1 10 9.72V27h-2a8 8 0 0 0-7.75-8H10z','Bộ phát Wi-fi bỏ túi',6,_binary '\0',NULL,_binary '\0',NULL,NULL),(55,'M16 20.33a3.67 3.67 0 1 1 0 7.34 3.67 3.67 0 0 1 0-7.34zm0 2a1.67 1.67 0 1 0 0 3.34 1.67 1.67 0 0 0 0-3.34zM16 15a9 9 0 0 1 8.04 4.96l-1.51 1.51a7 7 0 0 0-13.06 0l-1.51-1.51A9 9 0 0 1 16 15zm0-5.33c4.98 0 9.37 2.54 11.94 6.4l-1.45 1.44a12.33 12.33 0 0 0-20.98 0l-1.45-1.45A14.32 14.32 0 0 1 16 9.66zm0-5.34c6.45 0 12.18 3.1 15.76 7.9l-1.43 1.44a17.64 17.64 0 0 0-28.66 0L.24 12.24c3.58-4.8 9.3-7.9 15.76-7.9z','Wi-fi',6,_binary '\0',NULL,_binary '','m4.06 2.3 26 26-1.41 1.4-26-26 1.41-1.4zM16 20h.11L20 23.9V24a4 4 0 1 1-4-4zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-3.97-6.08 1.52 1.52a7.02 7.02 0 0 0-4.08 4.03l-1.51-1.51a9.04 9.04 0 0 1 4.07-4.04zM16 10c4.89 0 9.2 2.5 11.7 6.3l-1.45 1.45a12 12 0 0 0-9.64-5.73l-1.95-1.96c.44-.04.89-.06 1.34-.06zm-7.63 2.26 1.45 1.45a12.06 12.06 0 0 0-4.07 4.04L4.3 16.3a14.08 14.08 0 0 1 4.07-4.04zM16 5c6.27 0 11.83 3.03 15.29 7.71l-1.44 1.44a16.98 16.98 0 0 0-17.8-6.69l-1.62-1.63C12.19 5.29 14.06 5 16 5zM4.78 8.67 6.2 10.1a17.1 17.1 0 0 0-4.06 4.05L.7 12.7a19.11 19.11 0 0 1 4.07-4.04z','NECESSITIES'),(56,'M4 25c.51 0 .94.5 1 1v2h22v-2c0-.51.5-1 1-1h3v2h-2v2c0 .51-.5 1-1 1H4c-.5 0-1-.5-1-1v-2H1v-2zm16-10a5.7 5.7 0 0 1 5.67 5.2l.18 2.6a3 3 0 0 1-2.79 3.2H9.14a3 3 0 0 1-3-3l.17-2.57A5.93 5.93 0 0 1 12 15zm-5 2h-2v3h-2v-2.83a3.83 3.83 0 0 0-2.67 3.19A21.5 21.5 0 0 0 8.14 23c0 .51.36.94.86 1h14c.51-.04.83-.45.86-.95a343.57 343.57 0 0 0-.17-2.48 3.83 3.83 0 0 0-2.69-3.4V20h-2v-3h-2v3h-2zm9-15h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.51-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15z','Khay nướng bánh',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(57,'M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z','Đồ dùng nướng thịt ngoài trời',7,_binary '\0','Vỉ nướng, than củi, xiên tre/xiên sắt, v.v.',_binary '\0',NULL,NULL),(58,'M4 25c.51 0 .94.5 1 1v2h22v-2c0-.51.5-1 1-1h3v2h-2v2c0 .51-.5 1-1 1H4c-.5 0-1-.5-1-1v-2H1v-2zm16-10a5.7 5.7 0 0 1 5.67 5.2l.18 2.6a3 3 0 0 1-2.79 3.2H9.14a3 3 0 0 1-3-3l.17-2.57A5.93 5.93 0 0 1 12 15zm-5 2h-2v3h-2v-2.83a3.83 3.83 0 0 0-2.67 3.19A21.5 21.5 0 0 0 8.14 23c0 .51.36.94.86 1h14c.51-.04.83-.45.86-.95a343.57 343.57 0 0 0-.17-2.48 3.83 3.83 0 0 0-2.69-3.4V20h-2v-3h-2v3h-2zm9-15h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.51-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15z','Máy làm bánh mì',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(59,'M23 1a1 1 0 0 1 1 .88V6l-.02.2-2.9 14.53a5 5 0 0 1 2.31 3.4l.04.25.56 4.5a1 1 0 0 1-.87 1.11L23 30H9a1 1 0 0 1-1-1v-.12l.57-4.5a5 5 0 0 1 2.36-3.65L8.18 7H7a1 1 0 0 0-1 .88V15H4V8a3 3 0 0 1 2.82-3H8V2a1 1 0 0 1 .88-1H23zm-9.5 21a3 3 0 0 0-2.92 2.45l-.03.18-.42 3.37h11.74l-.42-3.37a3 3 0 0 0-2.62-2.6L18.5 22h-5zm2.5 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm5.78-17H10.22l2.6 13H15v-9h2v9h2.18l2.6-13zM22 3H10v2h12V3z','Máy xay sinh tố',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(60,'M25 2a1 1 0 0 1 .94.65l.03.1 1 4A1 1 0 0 1 26.11 8L26 8h-9v2h-2V8H5v20h3a5 5 0 0 1-.72-4.66l.1-.26 2.52-6.04-1.8-3.6a1 1 0 0 1 .78-1.43L9 12h14a1 1 0 0 1 .94 1.34l-.05.1L22.62 16H24a5 5 0 0 1 5 4.78V25h-2v-4a3 3 0 0 0-2.82-3H22.5l2.12 5.08A5 5 0 0 1 24 28h3v2H4a1 1 0 0 1-1-.88V3a1 1 0 0 1 .88-1H4zM12.65 22a6.64 6.64 0 0 0-2.91.63l-.5 1.22a3 3 0 0 0-.2.68l-.03.23L9 25a3 3 0 0 0 2.82 3h8.19l.23-.01a3 3 0 0 0 2.6-2.02c-1.7-.12-2.93-.67-4.84-1.9l-.37-.23c-2.14-1.4-3.18-1.84-4.98-1.84zm7.68-4h-8.66l-.92 2.19a9.06 9.06 0 0 1 1.9-.19c2.19 0 3.51.52 5.75 1.95l.38.25c1.74 1.13 2.74 1.62 4.03 1.76l-.04-.11zm1.05-4H10.62l1 2h8.76zm2.84-10H5v2h19.72z','Cà phê',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(61,'M25 2a1 1 0 0 1 .94.65l.03.1 1 4A1 1 0 0 1 26.11 8L26 8h-9v2h-2V8H5v20h3a5 5 0 0 1-.72-4.66l.1-.26 2.52-6.04-1.8-3.6a1 1 0 0 1 .78-1.43L9 12h14a1 1 0 0 1 .94 1.34l-.05.1L22.62 16H24a5 5 0 0 1 5 4.78V25h-2v-4a3 3 0 0 0-2.82-3H22.5l2.12 5.08A5 5 0 0 1 24 28h3v2H4a1 1 0 0 1-1-.88V3a1 1 0 0 1 .88-1H4zM12.65 22a6.64 6.64 0 0 0-2.91.63l-.5 1.22a3 3 0 0 0-.2.68l-.03.23L9 25a3 3 0 0 0 2.82 3h8.19l.23-.01a3 3 0 0 0 2.6-2.02c-1.7-.12-2.93-.67-4.84-1.9l-.37-.23c-2.14-1.4-3.18-1.84-4.98-1.84zm7.68-4h-8.66l-.92 2.19a9.06 9.06 0 0 1 1.9-.19c2.19 0 3.51.52 5.75 1.95l.38.25c1.74 1.13 2.74 1.62 4.03 1.76l-.04-.11zm1.05-4H10.62l1 2h8.76zm2.84-10H5v2h19.72z','Máy pha cà phê',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(62,'M26 1a5 5 0 0 1 5 5c0 6.39-1.6 13.19-4 14.7V31h-2V20.7c-2.36-1.48-3.94-8.07-4-14.36v-.56A5 5 0 0 1 26 1zm-9 0v18.12c2.32.55 4 3 4 5.88 0 3.27-2.18 6-5 6s-5-2.73-5-6c0-2.87 1.68-5.33 4-5.88V1zM2 1h1c4.47 0 6.93 6.37 7 18.5V21H4v10H2zm14 20c-1.6 0-3 1.75-3 4s1.4 4 3 4 3-1.75 3-4-1.4-4-3-4zM4 3.24V19h4l-.02-.96-.03-.95C7.67 9.16 6.24 4.62 4.22 3.36L4.1 3.3zm19 2.58v.49c.05 4.32 1.03 9.13 2 11.39V3.17a3 3 0 0 0-2 2.65zm4-2.65V17.7c.99-2.31 2-7.3 2-11.7a3 3 0 0 0-2-2.83z','Đồ nấu ăn cơ bản',7,_binary '\0','Nồi chảo, dầu ăn, muối và tiêu',_binary '\0',NULL,NULL),(63,'M31 9v21h-2v-7h-6v7h-2v-7a2 2 0 0 1 1.85-2H29V9h2zM3 9v12h6a2 2 0 0 1 2 1.85V30H9v-7H3v7H1V9h2zm14-2v2.08a6 6 0 0 1 5 5.7V15h5v2H17v13h-2V17H5v-2h5a6 6 0 0 1 5-5.92V7h2zm-1 4a4 4 0 0 0-4 3.8v.2h8a4 4 0 0 0-4-4z','Bàn ăn',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(64,'M29 1v2a13 13 0 0 0-.3 26h.3v2a15 15 0 0 1-.31-30zM3 1h2v6h2V1h2v6h2V1h2v9a5 5 0 0 1-4 4.9V31H7V14.9a5.01 5.01 0 0 1-3.98-4.44L3 10.22V10zm26 6v2a7 7 0 0 0-.24 14H29v2a9 9 0 0 1-.27-18zM11 9H5v1.15a3 3 0 0 0 6 .03V10z','Bát đĩa và đồ bạc',7,_binary '\0','Bát, đũa, đĩa, cốc, v.v.',_binary '\0',NULL,NULL),(65,'M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zm0 10H4v16h24zm-2 2v4a3 3 0 0 1-2 2.83V24h2v2h-6v-2h2v-3.17a3 3 0 0 1-2-2.65V14zm-14 0a6 6 0 1 1 0 12 6 6 0 0 1 0-12zm0 2a4 4 0 1 0 0 8 4 4 0 0 0 0-8zm12 0h-2v2a1 1 0 0 0 .77.97l.11.02.12.01a1 1 0 0 0 1-.88V18zm4-12H4v6h24zm-6 2v2H10V6zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy rửa chén bát',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(66,'M25 1a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H7a2 2 0 0 1-2-1.85V3a2 2 0 0 1 1.85-2H7zm0 10H7v18h18zm-15 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM25 3H7v6h18zM10 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Tủ đông',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(67,'M26 28v2H6v-2h20zM16 1a8.64 8.64 0 0 1 7.83 5H28a1 1 0 0 1 1 1.08c-.3 3.87-1.58 6.45-3.9 7.56l.9 10.27a1 1 0 0 1-.88 1.08L25 26H7a1 1 0 0 1-1-.97v-.12L7.4 8.9c.02-.3.06-.6.12-.89H5a1 1 0 0 0-1 .88V19H2V9a3 3 0 0 1 2.82-3h3.35A8.64 8.64 0 0 1 16 1zm6.43 7H9.57a6.65 6.65 0 0 0-.14.7l-.04.36L8.1 24h15.82L22.6 9.06A6.67 6.67 0 0 0 22.43 8zm-5.45 3a9.82 9.82 0 0 1-2.7 5.78l-.23.24A6.96 6.96 0 0 0 12.07 21h-2.02a8.96 8.96 0 0 1 2.36-5.16l.23-.23A7.99 7.99 0 0 0 14.97 11h2.01zm4 0 .02.5a9.6 9.6 0 0 1-2.72 6.28l-.23.24A6.97 6.97 0 0 0 16.28 21h-2.06a8.96 8.96 0 0 1 2.19-4.16l.22-.23C18.09 15.16 19 13.2 19 11.5a4.94 4.94 0 0 0-.03-.5h2.01zm5.9-3h-2.4l.1.63.02.26.3 3.51c.99-.79 1.64-2.16 1.96-4.17l.03-.23zM16 3a6.63 6.63 0 0 0-5.55 3h11.1a6.63 6.63 0 0 0-5.04-2.98L16.23 3H16z','Ấm đun nước nóng',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(68,'M27 0a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V2a2 2 0 0 1 1.85-2H5zm0 2H5v26h22zm-3 22a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.33 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.34 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 24a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm13-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm-10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM21 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Bếp',7,_binary '\0','Không gian cho khách tự nấu ăn',_binary '','m24.5 28.74 2 2V31h-2v-2.26zm-10-10 6 6V25c0 3.27-2.18 6-5 6s-5-2.73-5-6c0-2.87 1.68-5.33 4-5.88v-.38zm-13-13 2 2V19h4l-.02-.96-.03-.95a53.9 53.9 0 0 0-.5-5.9l2.28 2.28c.17 1.82.26 3.83.27 6.03V21h-6v10h-2V5.74zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zM15.5 21c-1.6 0-3 1.75-3 4s1.4 4 3 4 3-1.75 3-4-1.4-4-3-4zm10-20a5 5 0 0 1 5 5v.37l-.02.74a40.63 40.63 0 0 1-.27 3.67l-.09.71-.1.7-.12.7-.13.67-.14.66c-.7 3.15-1.79 5.63-3.13 6.47v1.57l-3.69-3.69c-1.4-2.79-2.27-7.59-2.3-12.23L20.5 6v-.22a5 5 0 0 1 5-4.78zm-1 2.17a3 3 0 0 0-2 2.65v.49c.05 4.32 1.03 9.13 2 11.39V3.17zm2 0V17.7c.99-2.31 2-7.3 2-11.7a3 3 0 0 0-2-2.83zM16.5 1v11.26l-2-2V1h2z','NECESSITIES'),(69,'M27 0a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V2a2 2 0 0 1 1.85-2H5zm0 2H5v26h22zm-3 22a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.33 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.34 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 24a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm13-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm-10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM21 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Bếp nhỏ',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(70,'M29 3a2 2 0 0 1 2 1.85V27a2 2 0 0 1-1.85 2H3a2 2 0 0 1-2-1.85V5a2 2 0 0 1 1.85-2H3zm0 2H3v22h26zm-6 2v18H5V7zm-2 2H7v14h3a4.97 4.97 0 0 1-1-2.72V17h10v3a4.98 4.98 0 0 1-1 3h3zm-4 10h-6v1a3 3 0 0 0 2.65 2.98l.17.01.18.01a3 3 0 0 0 3-2.82V20zm9-8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Lò vi sóng',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(71,'M27 3a2 2 0 0 1 2 1.85V26a2 2 0 0 1-1.85 2H26v2h-2v-2H8v2H6v-2H5a2 2 0 0 1-2-1.85V5a2 2 0 0 1 1.85-2H5zm0 12H5v11h4v-3a2 2 0 0 1 1.85-2H11v-3h2v3a2 2 0 0 1 2 1.85V26h2v-3a2 2 0 0 1 1.85-2H19v-3h2v3a2 2 0 0 1 2 1.85V26h4zm-14 8h-2v3h2zm8 0h-2v3h2zm6-18H5v8h22zM8 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Tủ lạnh mini',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(72,'M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zm0 10H4v16h24zm-2 2v12H6V14zm-2 2H8v8h16zm4-12H4v6h24zm-3 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Lò nướng',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(73,'M25 1a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H7a2 2 0 0 1-2-1.85V3a2 2 0 0 1 1.85-2H7zm0 10H7v18h18zm-15 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM25 3H7v6h18zM10 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Tủ lạnh',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(74,'M21 3a9 9 0 0 1 9 8.73V16h1v2h-1v9a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V18H1v-2h1v-4a9 9 0 0 1 8.73-9H11zm7 11H4v13h24zm-8 2v2h-8v-2zM9 16a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm14 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM21 5H11a7 7 0 0 0-7 6.76V12h7V8h10v4h7a7 7 0 0 0-6.76-7zm-2 5h-6v2h6z','Nồi cơm điện',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(75,'M20.93 2a3.93 3.93 0 0 1 3.93 3.93c0 .87-.29 1.7-.83 2.4l-.03.04V10a5 5 0 0 1 5 4.78V27a2 2 0 0 1-1.85 2H26v1h-2v-1H8v1H6v-1H5a2 2 0 0 1-2-1.85V17H1v-2h2a5 5 0 0 1 4.78-5H8V8.38a3.93 3.93 0 0 1 0-4.9l.14-.17.15-.16a3.93 3.93 0 0 1 2.56-1.14l.22-.01h9.86zM24 12H8a3 3 0 0 0-3 2.82V27h22V15a3 3 0 0 0-2.82-3H24zM8 23a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM20.93 4h-9.86a1.93 1.93 0 0 0-1.36 3.3 1 1 0 0 1 .28.57L10 8v2h12V8a1 1 0 0 1 .12-.48l.07-.1.08-.1.12-.13a1.93 1.93 0 0 0-1.31-3.18L20.93 4z','Máy nướng bánh mỳ',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(76,'M19 2a1 1 0 0 1 1 .88V6h8v2h-2v20a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V8H4V6h8V3a1 1 0 0 1 .88-1H13zm5 6H8v20h16zm-12 2v16h-2V10zm5 0v16h-2V10zm5 0v16h-2V10zm-4-6h-4v2h4z','Thùng rác có chức năng nén rác',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(77,'m9.24 3-.2.4a20.37 20.37 0 0 0-1.7 5.02v.03A9 9 0 0 1 10.16 8c2.26 0 4.44.84 6.12 2.4l.24.24a6.98 6.98 0 0 0 4.95 2.05 6.99 6.99 0 0 0 3.53-.95v-.23a19.57 19.57 0 0 0-2.04-8.1l-.2-.41H9.24zm.92 7a7 7 0 0 0-3.11.73C7 11.15 7 11.57 7 12a9 9 0 0 0 9 9c4.06 0 7.7-3.14 8.72-6.92a9 9 0 0 1-3.25.6 8.98 8.98 0 0 1-6.13-2.4l-.23-.23A6.97 6.97 0 0 0 10.16 10zm13.8-9 .29.52A21.78 21.78 0 0 1 27 12c0 5.4-4.53 10.4-10 10.95V29h6v2H9v-2h6v-6.04A11 11 0 0 1 5 12c0-3.6.92-7.09 2.75-10.48L8.04 1h15.92z','Ly uống rượu vang',7,_binary '\0',NULL,_binary '\0',NULL,NULL),(78,'M16 1a5 5 0 0 1 5 5 5 5 0 0 1 0 10 5 5 0 0 1-4 4.9v4.29A9.04 9.04 0 0 1 23.95 22a8.94 8.94 0 0 1 3.74.81l.31.15v2.33A6.96 6.96 0 0 0 23.95 24a6.88 6.88 0 0 0-6.93 5.87l-.02.15v.1a1 1 0 0 1-.88.87L16 31a1 1 0 0 1-.97-.77l-.02-.12A6.95 6.95 0 0 0 7.97 24 6.96 6.96 0 0 0 4 25.23v-2.31a9.16 9.16 0 0 1 11 2.3V20.9a5 5 0 0 1-4-4.68V16h-.22a5 5 0 0 1 0-10H11v-.22A5 5 0 0 1 16 1zm2.86 14.1a4.98 4.98 0 0 1-5.72 0l-.07.23a3 3 0 1 0 5.85 0zM11 8a3 3 0 1 0 .67 5.93l.23-.07A4.98 4.98 0 0 1 11 11c0-1.06.33-2.05.9-2.86l-.23-.07A3.01 3.01 0 0 0 11 8zm10 0c-.23 0-.45.03-.67.07l-.23.07c.57.8.9 1.8.9 2.86a4.98 4.98 0 0 1-.9 2.86l.23.07A3 3 0 1 0 21 8zm-5 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0-5a3 3 0 0 0-2.93 3.67l.07.23a4.98 4.98 0 0 1 5.72 0l.07-.23A3 3 0 0 0 16 3z','Sân sau',8,_binary '\0','Không gian ngoài trời tại chỗ ở thường có cỏ bao phủ',_binary '\0',NULL,NULL),(79,'M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z','Lò nướng BBQ',8,_binary '\0',NULL,_binary '\0',NULL,'CHARACTERISTIC'),(80,'M21.54.8a13.67 13.67 0 0 1 9.74 16.43l-.08.3-.26.97-12.35-3.3-3.86 14.13h-2.07l4-14.66-12.12-3.24.26-.97A13.67 13.67 0 0 1 21.54.8zM5.67 21a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM25.33 4.92l.05.17c.74 2.34.77 5.38 0 8.5l-.1.33-.24.93 4.45 1.2.03-.2c.68-4.21-1-8.36-4.2-10.93zm-3.46-1.75-2.75 10.1 3.99 1.06.25-.93c1.23-4.6.44-8.83-1.5-10.23zm-1.95-.45c-2.28.38-4.9 3.46-6.14 7.79l-.08.3-.25.93 3.73 1zm-3.67-.26-.22.04a11.68 11.68 0 0 0-8.8 7.03l-.13.31-.07.19 4.48 1.2.25-.94c.9-3.33 2.55-6.12 4.5-7.83z','Tiện nghi khi đi tắm biển',8,_binary '\0','Khăn tắm biển, ô, chăn bãi biển, dụng cụ lặn dùng ống thở',_binary '\0',NULL,NULL),(81,'M11 6v2H9.62l2 4h10.24L20.3 8H17V6h4a1 1 0 0 1 .88.53l.05.11 3.62 9.38a5 5 0 1 1-1.92.58l-.53-1.36-7.44 6.51a1 1 0 0 1-.54.24L15 22h-4.1A5 5 0 0 1 1 21a5 5 0 0 1 6.3-4.83l1.8-3.62a1 1 0 0 1 .36-.4L7.38 8H5V6zM6 18a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm20 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm-15.5-3.76-1.41 2.83A5 5 0 0 1 10.9 20h2.48zM21.48 14h-8.86l2.7 5.4z','Xe đạp',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(82,'M2.61 1h13.34c.28-.02.58.08.8.33l.08.12 12 18a1 1 0 0 1-.72 1.54L28 21H17v2h12v1c0 1.84-.62 3.53-1.66 4.88l.13.1c.36.3.83.48 1.34.51l.19.01v2c-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1.01.15-1.4.41l-.13.1c-.77.65-1.77.99-2.8.99-.96 0-1.88-.29-2.62-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1 .15-1.39.41l-.14.1c-.76.65-1.77.99-2.8.99-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.95-.52-1.53-.52-.51 0-1 .15-1.38.41l-.14.1c-.7.6-1.6.93-2.55.98L3 31.5v-2c.52 0 1-.15 1.39-.41l.27-.21a7.99 7.99 0 0 1-1.64-4.3L3 24.26 2.98 23H15V9H2.61l1.34-4zm24.3 24H5.09l.02.09c.2 1.13.73 2.16 1.48 2.97a4.48 4.48 0 0 1 3.56.92c.4.33.95.52 1.53.52a2.4 2.4 0 0 0 1.52-.52A4.38 4.38 0 0 1 16 28c.95 0 1.87.29 2.61.83l.2.15c.4.33.94.52 1.52.52.52 0 1.01-.15 1.4-.41l.13-.1a4.38 4.38 0 0 1 3.3-.96l.25.03.08-.08a5.97 5.97 0 0 0 1.35-2.6l.06-.28zM17 5.3V19h9.13zM5.39 3l.66 2-.66 2H15V3z','Bến thuyền',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(83,'m15.59 1.91 1.02.8C22.17 7.04 25 11.46 25 15.98a8.99 8.99 0 0 1-.5 3.02H31v2h-2v9a1 1 0 0 1-.88 1H4a1 1 0 0 1-1-.88V21H1v-2h6.42c-.28-.9-.42-1.91-.42-3.01 0-2.25 1.1-4.82 3.27-7.75l.27-.35.55-.73 1.78 1.12L15.6 1.9zM27 21H5v8h22v-8zM16.4 5.1l-2.6 6.1-2.21-1.37-.17.24C9.87 12.3 9.07 14.2 9 15.77l-.01.21c0 1.1.17 2.04.48 2.85l.07.17h3a6.1 6.1 0 0 1-.05-.83c0-1.52.86-3.19 2.52-5.07l.24-.27.74-.81.74.8c1.82 2 2.76 3.76 2.76 5.35 0 .3-.02.57-.05.83h3.06l-.14-.07a6.7 6.7 0 0 0 .63-2.95c0-3.42-2.03-6.93-6.17-10.51l-.43-.36zm-.4 9.94-.08.1c-.9 1.14-1.36 2.11-1.41 2.88l-.01.15c0 .35.03.63.09.83h2.82c.06-.2.09-.48.09-.83 0-.79-.46-1.8-1.42-3.04l-.08-.1z','Bếp đốt lửa trại',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(84,'M3 30H1V2h2v12h26V2h2v28h-2v-4.2l-.52.07a16.99 16.99 0 0 1-2.13.13c-1.8 0-3.55-.28-5.17-.81A16.81 16.81 0 0 1 16 26a16.5 16.5 0 0 1-13-6.24zm8.15-14H3l.14.3a14.4 14.4 0 0 0 14.99 7.55A16.08 16.08 0 0 1 11.15 16zM29 19.76a16.26 16.26 0 0 1-4.77 4.09 14.92 14.92 0 0 0 4.77-.09zM13.35 16a14.21 14.21 0 0 0 7.83 7.07A14.22 14.22 0 0 0 29 16.01V16z','Võng',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(85,'M30.97 2.26a74.69 74.69 0 0 1-2.73 8.66c-1.63 4.26-3.45 7.41-5.85 10.06l1.46 1.46a3.48 3.48 0 0 1 3.95.46l2.16 2.14a3.48 3.48 0 0 1-4.77 5.06l-2.15-2.14a3.48 3.48 0 0 1-.6-4.1l-1.45-1.45c-4.67 4.4-11.37 7.38-18.83 8.58a1 1 0 0 1-1.13-1.21l.4-1.73C3.38 20.27 5.74 15.08 9.6 11L8.15 9.56A3.48 3.48 0 0 1 4.2 9.1L2.04 6.96A3.48 3.48 0 0 1 6.81 1.9l2.15 2.14a3.48 3.48 0 0 1 .6 4.1l1.46 1.47c4.52-4.06 11.16-7.02 18.78-8.59a1 1 0 0 1 1.17 1.24zm-6.51 22.2a1.48 1.48 0 0 0-.1 1.97l2.1 2.11a1.48 1.48 0 0 0 2.19-1.97l-2.1-2.11a1.48 1.48 0 0 0-2.1 0zM11 12.42c-3.46 3.68-5.67 8.4-7.48 15.5l-.2.83.17-.04c6.4-1.29 12.07-3.96 16.08-7.72L18 19.41l-1.3 1.3a3.83 3.83 0 0 1-5.25.15l-.16-.15a3.83 3.83 0 0 1-.15-5.26L12.58 14l-1.57-1.58zm2.99 3-1.3 1.29a1.83 1.83 0 0 0-.1 2.46l.1.12a1.83 1.83 0 0 0 2.47.12L16.6 18l-2.6-2.59zM28.6 3.3C22.8 4.7 16.9 7 12.4 11l8.5 8.5c3.71-4.08 5.7-9.3 7.24-14.57l.46-1.63zm-6.7 6.8a3.83 3.83 0 0 1 .15 5.26L20.9 16.5l-1.41-1.41.99-.99a1.83 1.83 0 0 0 .1-2.46l-.1-.12a1.83 1.83 0 0 0-2.47-.12l-1.1 1.1-1.42-1.41.99-.99a3.83 3.83 0 0 1 5.41 0zM3.46 3.46a1.48 1.48 0 0 0-.1 1.97l2.1 2.11a1.48 1.48 0 0 0 2.19-1.97l-2.1-2.11a1.48 1.48 0 0 0-2.1 0z','Thuyền Kayak',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(86,'M29 15v16h-2v-6h-6v6h-2v-6.15a2 2 0 0 1 1.84-1.84L21 23h6v-8zM5 15v8h6a2 2 0 0 1 2 1.85V31h-2v-6H5v6H3V15zM16 1a15 15 0 0 1 13.56 8.57 1 1 0 0 1-.8 1.42l-.1.01H17v8h8v2h-8v10h-2V21H7v-2h8v-8H3.35a1 1 0 0 1-.95-1.32l.04-.1A15 15 0 0 1 16 1zm0 2A13 13 0 0 0 5.4 8.47l-.2.28-.16.25h21.92l-.17-.25a13 13 0 0 0-10.1-5.73L16.34 3z','Khu vực ăn uống ngoài trời',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(87,'M29 15v16h-2v-6h-6v6h-2v-6.15a2 2 0 0 1 1.84-1.84L21 23h6v-8zM5 15v8h6a2 2 0 0 1 2 1.85V31h-2v-6H5v6H3V15zM16 1a15 15 0 0 1 13.56 8.57 1 1 0 0 1-.8 1.42l-.1.01H17v8h8v2h-8v10h-2V21H7v-2h8v-8H3.35a1 1 0 0 1-.95-1.32l.04-.1A15 15 0 0 1 16 1zm0 2A13 13 0 0 0 5.4 8.47l-.2.28-.16.25h21.92l-.17-.25a13 13 0 0 0-10.1-5.73L16.34 3z','Nội thất ngoài trời',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(88,'M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z','Bếp ngoài trời',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(89,'M23 1a2 2 0 0 1 2 1.85V19h4v2h-2v8h2v2H3v-2h2v-8H3v-2h4V3a2 2 0 0 1 1.85-2H9zM9 21H7v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm-10-8H9v6h6zm8 0h-6v6h6zM15 3H9v8h6zm8 0h-6v8h6z','Sân hoặc ban công',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(90,'M5 17a1 1 0 0 1-.93-1.36 13.28 13.28 0 0 1 15.3-8.33 4 4 0 1 1 7.03 3.8l-.13.2.21.24a13.81 13.81 0 0 1 2.45 4.09 1 1 0 0 1-.82 1.35L28 17H17v9h13v2h-4v3h-2v-3H9v3H7v-3H2v-2h3.59l-4.3-4.3 1.42-1.4L8.4 26H15v-9zm11.5-8a11.2 11.2 0 0 0-9.77 5.69l-.17.31h19.88l-.17-.32a11.2 11.2 0 0 0-9.12-5.66L16.81 9zM31 8v2h-3V8zm-8-1a2 2 0 0 0-1.67.9 13.1 13.1 0 0 1 3.45 2.01A2 2 0 0 0 23 7zm4.95-4.36 1.41 1.41-2.12 2.12-1.41-1.41zm-9.9 0 2.12 2.12-1.41 1.41-2.12-2.12zM24 1v3h-2V1z','Ghế tắm nắng',8,_binary '\0',NULL,_binary '\0',NULL,NULL),(91,'M30 1a1 1 0 0 1 1 .88V30a1 1 0 0 1-.88 1H2a1 1 0 0 1-1-.88V2a1 1 0 0 1 .88-1H2zM3 3v26h12V3zm7 9v6.58l1.8-1.79 1.4 1.42-3.5 3.5a1 1 0 0 1-1.31.08l-.1-.08-3.5-3.5 1.42-1.42L8 18.6V12zm12.39-1.5a1 1 0 0 1 1.22 0l.1.09 3.5 3.5-1.42 1.41L24 13.7V20h-2v-6.3l-1.8 1.8-1.4-1.41 3.5-3.5zM17 29h12V3H17z','Thang máy',9,_binary '\0','Nhà hoặc tòa nhà có thang máy rộng ít nhất 132 cm và cửa ra vào rộng ít nhất 81 cm.',_binary '\0',NULL,NULL),(92,'M2 4h2v2h2V4h2v5a3 3 0 0 1-2 2.83V17a1 1 0 0 0 .88 1H10V5a3 3 0 0 1 3-3h12a3 3 0 0 1 3 3v23h2v2H2v-2h8v-8H7a3 3 0 0 1-3-2.82v-5.35a3 3 0 0 1-2-2.64V4zm23 0H12.88A1 1 0 0 0 12 5v23h14V5a1 1 0 0 0-1-1zm-4.43 13-1.8 3H21a1 1 0 0 1 .91 1.41l-.05.1-2.1 3.49h-2.33l1.8-3H17a1 1 0 0 1-.91-1.41l.05-.1 2.1-3.49h2.33zM23 6a1 1 0 0 1 1 1v6a1 1 0 0 1-1 1h-8a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h8zm-1 2h-6v4h6V8zM6 8H4v1a1 1 0 0 0 .77.97l.11.02L5 10a1 1 0 0 0 1-.88V8z','Thiết bị sạc xe điện',9,_binary '\0','Khách có thể sạc xe điện tại chỗ ở.',_binary '\0',NULL,'CHARACTERISTIC'),(93,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z','Chỗ đỗ xe miễn phí tại nơi ở',9,_binary '\0',NULL,_binary '\0',NULL,'CHARACTERISTIC'),(94,NULL,'Sân khúc côn cầu',9,_binary '\0',NULL,_binary '\0',NULL,NULL),(95,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z','Miễn phí đỗ xe trên đường/phố',9,_binary '\0',NULL,_binary '\0',NULL,NULL),(96,'M10 5a2 2 0 0 1 2 1.85V15h8V7a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V9h2a2 2 0 0 1 2 1.85V15h2v2h-2v4a2 2 0 0 1-1.85 2H26v2a2 2 0 0 1-1.85 2H22a2 2 0 0 1-2-1.85V17h-8v8a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V23H4a2 2 0 0 1-2-1.85V17H0v-2h2v-4a2 2 0 0 1 1.85-2H6V7a2 2 0 0 1 1.85-2H8zm14 2h-2v18h2zM10 7H8v18h2zm18 4h-2v10h2zM6 11H4v10h2z','Phòng tập thể hình',9,_binary '\0',NULL,_binary '\0',NULL,'CHARACTERISTIC'),(97,'M9.5 2a4.5 4.5 0 0 1 3.53 7.3c.6.21 1.17.54 1.66.98l.19.19L17.4 13H31v2h-2v14a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V15H1v-2h2.1a5 5 0 0 1 2.96-3.6A4.5 4.5 0 0 1 9.5 2zm7.08 13H5v14h22V15h-7.59l3.3 3.3-1.42 1.4zM9.5 4a2.5 2.5 0 0 0-1 4.8V11H8a3 3 0 0 0-2.83 2h9.41l-1.12-1.12a3 3 0 0 0-1.92-.87l-.2-.01h-.84V8.8a2.5 2.5 0 0 0-1-4.8zm15.49-3a6.96 6.96 0 0 1-1.8 4.07l-.45.46A8.97 8.97 0 0 0 20.35 11h-2a10.97 10.97 0 0 1 3.2-7.12A4.96 4.96 0 0 0 22.97 1zm2 0h2a10.96 10.96 0 0 1-3.2 7.12A4.97 4.97 0 0 0 24.38 11h-2a6.97 6.97 0 0 1 1.8-4.06l.44-.47A8.96 8.96 0 0 0 26.99 1z','Bồn tắm nước nóng',9,_binary '\0',NULL,_binary '\0',NULL,'CHARACTERISTIC'),(98,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z','Chỗ đỗ xe ngoài khuôn viên, có thu phí',9,_binary '\0',NULL,_binary '\0',NULL,NULL),(99,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z','Chỗ đỗ xe có thu phí trong khuôn viên',9,_binary '\0',NULL,_binary '\0',NULL,NULL),(100,'M24 26c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 28c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 26zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 23c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 21zM20 3a4 4 0 0 1 4 3.8V9h4v2h-4v5a4 4 0 0 1 2.5.86l.17.15c.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 18c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 16c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5a3.96 3.96 0 0 1 2.44-1H16v-5H4V9h12V7a2 2 0 0 0-4-.15V7h-2a4 4 0 0 1 7-2.65A3.98 3.98 0 0 1 20 3zm-2 13.52.46.31.21.18c.35.31.83.49 1.33.49a2 2 0 0 0 1.2-.38l.13-.11c.2-.19.43-.35.67-.49V11h-4zM20 5a2 2 0 0 0-2 1.85V9h4V7a2 2 0 0 0-2-2z','Bể bơi',9,_binary '\0',NULL,_binary '\0',NULL,'CHARACTERISTIC'),(101,'M19 1v2H4v14h1.27a7.52 7.52 0 0 1 3.75-4.65 4.5 4.5 0 1 1 6.96 0A7.51 7.51 0 0 1 19.73 17H28v-4.97h2V29c0 1.05-1 2-2 2H4c-1.05 0-2-1-2-2V3c0-1.05 1-2 2-2h15zM4 19v10h24V19H4zm8.5-12a2.5 2.5 0 0 0-1.15 4.72l.15.07v1.8A5.5 5.5 0 0 0 7.37 17h10.25a5.51 5.51 0 0 0-3.9-3.36l-.22-.05v-1.8a2.5 2.5 0 0 0-1-4.79zM28 1h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V12h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15V1zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V12h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15V1z','Phòng xông hơi khô',9,_binary '\0',NULL,_binary '\0',NULL,NULL),(102,'M11 23H5v4h20.59L2.29 3.7l1.42-1.4L27 25.58V5h-4v6h-8V9h6V3h8v24.59l.7.7-1.4 1.42-.72-.71H3v-8h6v-6h2z','Nhà một tầng',9,_binary '\0','Trong nhà không có cầu thang',_binary '\0',NULL,NULL),(107,'M2 31a1 1 0 0 1-1-1 9 9 0 0 1 17.95-1H21c.74 0 1.43-.27 1.97-.74A2.99 2.99 0 0 0 24 26.2L24 26V14H13v6h-2v-7a1 1 0 0 1 .88-1H25a1 1 0 0 1 1 .88V15h4a1 1 0 0 1 1 .88V25a1 1 0 0 1-.88 1H26a4.99 4.99 0 0 1-1.71 3.77 4.98 4.98 0 0 1-3.03 1.22L21 31zm3.85-6.64a7 7 0 0 0-2.7 4.16l-.05.3-.03.18h4.1zM10 23c-.82 0-1.61.14-2.35.4l1.6 5.6h1.5l1.6-5.6a6.97 6.97 0 0 0-1.86-.38l-.25-.02zm4.15 1.36L12.82 29h4.1l-.02-.18a7 7 0 0 0-2.75-4.46zM29 17h-3v7h3zM20 1c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C16.6 9 16.2 9.9 16.06 11h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4zm5 0c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C21.6 9 21.2 9.9 21.06 11h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4z','Bữa sáng',10,_binary '\0','Có cung cấp bữa sáng',_binary '\0',NULL,'CHARACTERISTIC'),(108,'M24 0v6h-4.3c.13 1.4.67 2.72 1.52 3.78l.2.22-1.5 1.33a9.05 9.05 0 0 1-2.2-5.08c-.83.38-1.32 1.14-1.38 2.2v4.46l4.14 4.02a5 5 0 0 1 1.5 3.09l.01.25.01.25v8.63a3 3 0 0 1-2.64 2.98l-.18.01-.21.01-12-.13A3 3 0 0 1 4 29.2L4 29.02v-8.3a5 5 0 0 1 1.38-3.45l.19-.18L10 12.9V8.85l-4.01-3.4.02-.7A5 5 0 0 1 10.78 0H11zm-5.03 25.69a8.98 8.98 0 0 1-6.13-2.41l-.23-.23A6.97 6.97 0 0 0 6 21.2v7.82c0 .51.38.93.87 1H7l11.96.13h.13a1 1 0 0 0 .91-.88l.01-.12v-3.52c-.34.04-.69.06-1.03.06zM17.67 2H11a3 3 0 0 0-2.92 2.3l-.04.18-.01.08 3.67 3.1h2.72l.02-.1a4.29 4.29 0 0 1 3.23-3.4zM30 4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-3-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5 0h-2.33v2H22zm8-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM20 20.52a3 3 0 0 0-.77-2l-.14-.15-4.76-4.61v-4.1H12v4.1l-5.06 4.78a3 3 0 0 0-.45.53 9.03 9.03 0 0 1 7.3 2.34l.23.23A6.98 6.98 0 0 0 20 23.6z','Có dịch vụ dọn vệ sinh trong thời gian ở',10,_binary '\0',NULL,_binary '\0',NULL,NULL),(109,'M11.67 0v1.67h8.66V0h2v1.67h6a2 2 0 0 1 2 1.85v16.07a2 2 0 0 1-.46 1.28l-.12.13L21 29.75a2 2 0 0 1-1.24.58H6.67a5 5 0 0 1-5-4.78V3.67a2 2 0 0 1 1.85-2h6.15V0zm16.66 11.67H3.67v13.66a3 3 0 0 0 2.82 3h11.18v-5.66a5 5 0 0 1 4.78-5h5.88zm-.08 8h-5.58a3 3 0 0 0-3 2.82v5.76zm-18.58-16h-6v6h24.66v-6h-6v1.66h-2V3.67h-8.66v1.66h-2z','Cho phép ở dài hạn',10,_binary '\0','Cho phép ở từ 28 ngày trở lên',_binary '\0',NULL,NULL),(110,'M30 29v2H2v-2zM20 1a2 2 0 0 1 2 1.85V5h3a5 5 0 0 1 5 4.78V22a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V10a5 5 0 0 1 4.78-5H10V3a2 2 0 0 1 1.85-2H12zm5 6H7a3 3 0 0 0-3 2.82V22a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V10a3 3 0 0 0-3-3zm-8 2v9.5l3.3-3.3 1.4 1.42-4.64 4.65-.11.1a1.5 1.5 0 0 1-1.9 0l-.11-.1-4.65-4.65 1.42-1.41L15 18.5V9zm3-6h-8v2h8z','Cho phép gửi hành lý',10,_binary '\0','Để thuận tiện cho khách khi họ đến sớm hoặc rời đi muộn',_binary '\0',NULL,NULL),(118,'M24 27c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 29c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 29c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 29c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 27c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 27c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 27zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 24c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 24c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 24c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 22c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 22c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 22zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 19c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 19c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 19c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 17c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 17c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 17zM16 1a9 9 0 0 1 8.76 11.07c.71.13 1.37.45 1.91.94.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1 1.95 1.95 0 0 0-1.14-.5H23.96a2 2 0 0 0-1.15.38l-.14.11A3.98 3.98 0 0 1 20 15.5a3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 14c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1 1.95 1.95 0 0 0-1.14-.5H7.96a2 2 0 0 0-1.15.38l-.14.11a3.96 3.96 0 0 1-2.44 1L4 15.5v-2h.19a1.95 1.95 0 0 0 1.14-.5 3.92 3.92 0 0 1 1.9-.93A9 9 0 0 1 16 1zm0 2a7 7 0 0 0-6.64 9.23c.49.17.93.43 1.31.78.35.32.83.49 1.33.49.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 12c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5a2 2 0 0 0 1.2-.38l.13-.11c.38-.35.82-.6 1.3-.78A7 7 0 0 0 16 3z','Lối ra bãi biển',11,_binary '\0','Khách có thể tận hưởng bãi biển lân cận',_binary '\0',NULL,NULL),(119,'M28 2a2 2 0 0 1 2 2v24a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 2H4v15.5h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 18c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1v3h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 23c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1V28h24zm-6 3a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z','Lối ra hồ',11,_binary '\0','Khách có thể ra hồ bằng lối đi hoặc cầu tàu',_binary '\0',NULL,NULL),(120,'M24 1a2 2 0 0 1 2 1.85V5h2a2 2 0 0 1 2 1.85V28a3 3 0 0 1-3 3H5a3 3 0 0 1-3-2.82V3a2 2 0 0 1 1.85-2H4zm4 6h-2v21a1 1 0 0 0 2 .12V28zM8 3H4v25a1 1 0 0 0 .88 1H24V3h-4a6 6 0 0 1-12 .23zm6 22a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4.67a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4.66a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM14 11a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4-8h-8a4 4 0 0 0 8 .2z','Hiệu giặt ủi tự động gần đây',11,_binary '\0',NULL,_binary '\0',NULL,NULL),(121,'M25 1a2 2 0 0 1 2 1.85V29h2v2H3v-2h2V3a2 2 0 0 1 1.85-2H7zm0 2H7v26h18zm-3 12a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Lối vào riêng',11,_binary '\0','Đường hoặc lối vào tòa nhà riêng',_binary '','m5 9.24 2 2V29h17.76l2 2H3v-2h2V9.24zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zM25 1a2 2 0 0 1 2 1.85v19.91l-2-2V3H7.24L5.71 1.47A2 2 0 0 1 6.85 1H25zm-3 14a1 1 0 1 1 0 2 1 1 0 0 1 0-2z',NULL),(122,'M21.54.8a13.67 13.67 0 0 1 9.74 16.43l-.08.3-.26.97-12.35-3.3-3.86 14.13h-2.07l4-14.66-12.12-3.24.26-.97A13.67 13.67 0 0 1 21.54.8zM5.67 21a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM25.33 4.92l.05.17c.74 2.34.77 5.38 0 8.5l-.1.33-.24.93 4.45 1.2.03-.2c.68-4.21-1-8.36-4.2-10.93zm-3.46-1.75-2.75 10.1 3.99 1.06.25-.93c1.23-4.6.44-8.83-1.5-10.23zm-1.95-.45c-2.28.38-4.9 3.46-6.14 7.79l-.08.3-.25.93 3.73 1zm-3.67-.26-.22.04a11.68 11.68 0 0 0-8.8 7.03l-.13.31-.07.19 4.48 1.2.25-.94c.9-3.33 2.55-6.12 4.5-7.83z','Lối vào khu nghỉ dưỡng',11,_binary '\0','Khách có thể sử dụng các cơ sở nghỉ dưỡng gần đó',_binary '\0',NULL,NULL),(123,'m20.88 1.51.05.12 1.86 4.64a3 3 0 0 1 .2.89l.01.23V30a1 1 0 0 1-.88 1H18a1 1 0 0 1-1-.88V7.38a3 3 0 0 1 .14-.9l.08-.2 1.85-4.65a1 1 0 0 1 1.8-.12zm8 0 .05.12 1.86 4.64a3 3 0 0 1 .2.89l.01.23V30a1 1 0 0 1-.88 1H26a1 1 0 0 1-1-.88V7.38a3 3 0 0 1 .14-.9l.08-.2 1.85-4.65a1 1 0 0 1 1.8-.12zM9.66 3.21l1.93.53-2.72 10.14 4.16 10.83 1.6-.64.74 1.86-1.62.65 1.2 3.13-1.87.72-1.19-3.11-1.52.6-.74-1.85 1.54-.62L8 17.16l-2.35 8.8 1.93.51-.52 1.93-1.93-.52-.78 2.9-1.93-.52.78-2.9-1.93-.51.51-1.93 1.93.51L6.77 14l-3.72-9.7 1.87-.72 2.73 7.13 2-7.48zM21 21h-2v8h2v-8zm8 0h-2v8h2v-8zm-8-5h-2v3h2v-3zm8 0h-2v3h2v-3zM20 4.7 19.07 7a1 1 0 0 0-.06.25l-.01.13V14h2V7.26l-.03-.13-.04-.12L20 4.7zm8 0L27.07 7a1 1 0 0 0-.06.25l-.01.13V14h2V7.38a1 1 0 0 0 0-.12l-.03-.13-.04-.12L28 4.7z','Đường trượt tuyết thẳng tới cửa',11,_binary '\0','Khách có thể đến chỗ thang máy trượt tuyết mà không cần lái xe hoặc đi phương tiện có trả phí',_binary '\0',NULL,NULL),(124,'M28 2a2 2 0 0 1 2 2v24a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 2H4v15.5h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 18c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1v3h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 23c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1V28h24zm-6 3a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z','Ven sông/hồ/biển',11,_binary '\0','Ngay cạnh nguồn nước',_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `comfortable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comfortable_detail`
--

DROP TABLE IF EXISTS `comfortable_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comfortable_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comfortable_id` int DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmgb8gfvom0533iymu2g0w3twk` (`comfortable_id`),
  KEY `FK2n19vwh0b55cp5n2ve8gswkjt` (`house_id`),
  CONSTRAINT `FK2n19vwh0b55cp5n2ve8gswkjt` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
  CONSTRAINT `FKmgb8gfvom0533iymu2g0w3twk` FOREIGN KEY (`comfortable_id`) REFERENCES `comfortable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comfortable_detail`
--

LOCK TABLES `comfortable_detail` WRITE;
/*!40000 ALTER TABLE `comfortable_detail` DISABLE KEYS */;
INSERT INTO `comfortable_detail` VALUES (84,7,1,_binary ''),(85,5,1,_binary ''),(86,10,1,_binary ''),(87,4,1,_binary ''),(88,8,1,_binary ''),(89,11,1,_binary ''),(90,23,1,_binary ''),(91,12,1,_binary ''),(92,18,1,_binary ''),(93,13,1,_binary ''),(94,17,1,_binary ''),(95,21,1,_binary ''),(96,19,1,_binary ''),(97,16,1,_binary ''),(98,14,1,_binary ''),(99,43,1,_binary ''),(100,30,1,_binary ''),(101,44,1,_binary ''),(102,52,1,_binary ''),(103,50,1,_binary ''),(104,51,1,_binary ''),(105,55,1,_binary ''),(106,53,1,_binary ''),(107,68,1,_binary ''),(108,73,1,_binary ''),(109,62,1,_binary ''),(110,64,1,_binary ''),(111,67,1,_binary ''),(112,63,1,_binary ''),(113,89,1,_binary ''),(114,93,1,_binary ''),(115,95,1,_binary ''),(116,100,1,_binary ''),(117,96,1,_binary ''),(118,98,1,_binary ''),(119,99,1,_binary ''),(120,109,1,_binary ''),(121,108,1,_binary ''),(122,7,2,_binary ''),(123,5,2,_binary ''),(124,10,2,_binary ''),(125,6,2,_binary ''),(126,4,2,_binary ''),(127,3,2,_binary ''),(128,8,2,_binary ''),(129,12,2,_binary ''),(130,18,2,_binary ''),(131,13,2,_binary ''),(132,17,2,_binary ''),(133,21,2,_binary ''),(134,19,2,_binary ''),(135,14,2,_binary ''),(136,29,2,_binary ''),(137,43,2,_binary ''),(138,31,2,_binary ''),(139,30,2,_binary ''),(140,44,2,_binary ''),(141,45,2,_binary ''),(142,48,2,_binary ''),(143,55,2,_binary ''),(144,53,2,_binary ''),(145,68,2,_binary ''),(146,73,2,_binary ''),(147,62,2,_binary ''),(148,64,2,_binary ''),(149,66,2,_binary ''),(150,78,2,_binary ''),(151,86,2,_binary ''),(152,93,2,_binary ''),(153,95,2,_binary ''),(154,100,2,_binary ''),(155,7,3,_binary ''),(156,5,3,_binary ''),(157,10,3,_binary ''),(158,6,3,_binary ''),(159,4,3,_binary ''),(160,8,3,_binary ''),(161,11,3,_binary ''),(162,23,3,_binary ''),(163,15,3,_binary ''),(164,12,3,_binary ''),(165,18,3,_binary ''),(166,13,3,_binary ''),(167,17,3,_binary ''),(168,21,3,_binary ''),(169,19,3,_binary ''),(170,16,3,_binary ''),(171,14,3,_binary ''),(172,29,3,_binary ''),(173,43,3,_binary ''),(174,41,3,_binary ''),(175,44,3,_binary ''),(176,52,3,_binary ''),(177,55,3,_binary ''),(178,53,3,_binary ''),(179,68,3,_binary ''),(180,73,3,_binary ''),(181,70,3,_binary ''),(182,62,3,_binary ''),(183,64,3,_binary ''),(184,66,3,_binary ''),(185,67,3,_binary ''),(186,75,3,_binary ''),(187,59,3,_binary ''),(188,74,3,_binary ''),(189,63,3,_binary ''),(190,60,3,_binary ''),(191,89,3,_binary ''),(192,93,3,_binary ''),(193,100,3,_binary ''),(194,91,3,_binary ''),(195,96,3,_binary ''),(196,110,3,_binary '');
/*!40000 ALTER TABLE `comfortable_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comfortable_type`
--

DROP TABLE IF EXISTS `comfortable_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comfortable_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comfortable_type`
--

LOCK TABLES `comfortable_type` WRITE;
/*!40000 ALTER TABLE `comfortable_type` DISABLE KEYS */;
INSERT INTO `comfortable_type` VALUES (1,'Phòng tắm'),(2,'Phòng ngủ và giặt ủi'),(3,'Giải trí'),(4,'Hệ thống sưởi và làm mát'),(5,'An toàn nhà ở'),(6,'Internet và văn phòng'),(7,'Đồ dùng nấu bếp và ăn uống'),(8,'Ngoài trời'),(9,'Chỗ đỗ xe và cơ sở vật chất'),(10,'Dịch vụ'),(11,'Các đặc điểm về vị trí');
/*!40000 ALTER TABLE `comfortable_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenient`
--

DROP TABLE IF EXISTS `convenient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon_url` longtext,
  `name` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenient`
--

LOCK TABLES `convenient` WRITE;
/*!40000 ALTER TABLE `convenient` DISABLE KEYS */;
INSERT INTO `convenient` VALUES (1,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/jrlfatnhakiqa9mgdfd7','Thật ấn tượng!',_binary ''),(2,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ljm5fbpxgjttxcmdxkmv\n','Đảo',_binary ''),(3,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/eaj1wyrpx1vse5btsc8h','Nông thôn',_binary ''),(4,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/pvinh0ojadeuzq03jvgq','chơi golf',_binary ''),(5,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/vcyputrivgknjuco5wlo','Nhà thuyền',_binary ''),(6,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ii6kiagqj6z28yigt834','Phòng',_binary ''),(7,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/isfyyedepfi2qr616qa6','Hồ bơi tuyệt vời',_binary ''),(8,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/yjvs9fddqjyrkdowsbqx','Biệt thự',_binary ''),(9,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/bts87qite7aegjon3aau','Khung cảnh tuyệt vời',_binary ''),(10,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ylyyg6cbxtwciu1a7fyx','Nhà nhỏ',_binary ''),(11,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ebmjhfql6lv4rpbygj9e','Container',_binary ''),(12,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ho0os0vt2auhwexcusou','Vui chơi',_binary ''),(13,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/r5rnu59hj26lxiiy0h08','Nhà mái vòm',_binary ''),(14,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/h1lxk9es4tnq9jptyku4','Nhà khung chữ A',_binary ''),(15,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/vlacklca6ufubparqikv','Thuyền ',_binary ''),(16,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/g3ogseuofvxjcp9cpkld','Hướng biển',_binary ''),(17,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/qxr4a4won2fgzlhtp3f8\n','Được ưa chuộng',_binary ''),(18,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ual0tqvg8iu8vwi9d5qw\n','Nhà trên cây ',_binary ''),(19,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/hqldjbibkqjdsrxxcdkm\n','Các thành phố nổi tiếng',_binary ''),(20,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/qe1ibuyds7nxozkfmkjv','Khu cắm trại',_binary ''),(21,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/y68gtvie907anic8hwax','Thiết kế',_binary ''),(22,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/femnbkybntho2jxnlmqp','Không gian sáng tạo',_binary ''),(23,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/hevfbutnal88xjpfsbfi','Grand Piano',_binary ''),(24,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/jxo0w5sctvb5ctmb1mue','Sa mạc',_binary ''),(25,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/xzdz4uylqfuc3hhcmjhv','Nông trại',_binary ''),(26,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ncu9farpbyitcuo6lh2w','Mới',_binary ''),(27,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/fuwxpeiourhte7kjxrqy','Nhà trên núi',_binary ''),(28,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ndfjvevzrpntzwzbkntl','Bắc cực',_binary ''),(29,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/c9efjghbxhfjuumunqjf','Công viên quốc gia',_binary ''),(30,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/lv7nrrkyog5alhhevlzs','Lâu đài',_binary ''),(31,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/rjo7rdfnbecoqhdwmlqj','Hang động',_binary ''),(32,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/rc7wyblbw1zhq4vcdpod','Mang tính lịch sử',_binary ''),(33,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/eadru9ud2p3otcmsjl4n','Bãi biển',_binary ''),(34,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/pazb0xui5g8jg7hvfzn4','Cabin',_binary ''),(35,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/pqih3vdon1lzm8rlilus','Nhiệt đới',_binary ''),(36,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/urgvb7loyxwp3yy5ghaa','Hồ',_binary ''),(37,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/b2s8e2yihk3wfteydfdu','Lướt sóng',_binary ''),(38,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/baamnfty9owo72h5oyda','Ven hồ',_binary ''),(39,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/udahvqhxehcuezhbb2ab','Nhà dưới lòng đất',_binary ''),(40,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/tvvapjva0arrbiqd7a0a','Nhà không sử dụng điện lưới',_binary ''),(41,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/giyzaolybe2mq26wpprv','Vườn nho',_binary ''),(42,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/xu8qysod4t0d00dzn4gw','Phục vụ bữa sáng',_binary ''),(43,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/uqjsptk0qmv6c0r2xlbb','Trượt tuyết',_binary ''),(44,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/vnnzrsan9wjvltjai023','Xe cắm trại',_binary ''),(45,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/y9uyqwbazjjwf9kbgepn','Luxe',_binary ''),(46,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/enzefudoolnntoefamjr','Hanok',_binary ''),(47,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/tkwrrpcl5yopkw4bnm86','Nhà phong cách Cycladic',_binary ''),(48,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/rjs3ib7imv0ftja7mrgo','Bếp của bếp trưởng',_binary ''),(49,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/nreizfrvosooqt1mczde\n','Cối xay gió',_binary ''),(50,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ac1sd5jdb4srhfdc5dli\n','Ryokan',_binary ''),(51,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/lqxbgfeckvpoc54p41xh','Minsu',_binary ''),(52,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/onfwuxfyioj1kpyazog3','Lều mục đồng',_binary ''),(53,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/oyiddvs9wc0jw78thqaf','Casa Particular',_binary ''),(54,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/v8d4lrpn3tedcgd1tzbb','Tháp',_binary ''),(55,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/t4rgffalvyks3rersixr','Nhà nông trại',_binary ''),(56,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ebb16pqwiuqs0kfvysqt','Lều yurt',_binary ''),(57,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/stwetk1lvxaj0jtildr7','Hỗ trợ người dùng xe lăn',_binary ''),(58,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/x4fu6j8geypw09lyvp8k','Đường trượt tuyết thẳng tới chỗ ở',_binary ''),(59,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/pbisip5se8cxoduyr6xd','Dammuso',_binary ''),(60,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/zfkyqhchhgiasvp73wzr','Nhà chỏm nón',_binary ''),(61,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/mwcyp7hgnvncjkxol7cz','Riad',_binary '');
/*!40000 ALTER TABLE `convenient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guest_access` longtext,
  `interaction` longtext,
  `listing_description` longtext,
  `other` longtext,
  `space` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
INSERT INTO `description` VALUES (1,'Bể bơi, phòng gym, trang thiết bị đầy đủ',NULL,'Căn hộ cho thuê 3 phòng ngủ với không gian rộng rãi và hiện đại. Căn hộ này là sự lựa chọn hoàn hảo cho gia đình hoặc nhóm bạn, đầy đủ điều hoà, các thiết bị hiện đại và ánh sáng tự nhiên. Phòng khách, bếp, phòng tắm đã trang bị đầy đủ.\nVị trí của căn hộ thuận lợi, nằm trong khu vực an ninh và yên tĩnh, dễ dàng tiếp cận các tiện ích xung quanh như cửa hàng, siêu thị, nhà hàng và các điểm du lịch địa phương. Ngoài ra, căn hộ có chỗ đậu xe và bể bơi, phòng gym.\nThuê dài ngày sẽ hỗ trợ dọn phòng.',NULL,'3 phòng ngủ'),(2,'Free Parking, Wifi, Complimentary Food and Beverages, Shared Swimming pool inside the community.',NULL,'Indochina Touch By Baly Villa located inside the new greenery urban area called Eco-Garden with thousands of trees, a shared swimming pool, a gymnasium, a surrounding lake and only 2km away from the center and Perfume river making it an ideal getaway for your family.\nThe villa has 3 large bedrooms, 4 bathrooms, a spacious kitchen and the living room are all well equipped and designed with Indochine style will bring the most relaxing and elegant feeling for our guests during their stay in Hue.','There are business hours for swimming pool depends on season','The Interior of Baly Villa is well designed with Indochine Style, and equipped with natural wood furniture making the villa has a very elegant and luxurious look.'),(3,'Quý khách sẽ được sử dụng bể bơi và phòng tập gym ở ( tầng 5) miễn phí .\nLưu ý: Vì để tránh trơn trượt và ảnh hưởng chung đến mọi người ở trong Toà Căn Hộ. Quý khách vui lòng không để người ướt đi vào thang máy và hành lang.\n** Có Công Viên, cây xanh trong khu đô thị để đi dạo hoặc chạy bộ.\n**Quý khách sẽ được cung cấp thẻ đi thang máy và mật mã cửa vào nhà khi đến checkin Căn Hộ.',NULL,'Căn hộ mini-Gems Apartment 63m2\nCăn hộ với thiết kế hiện đại sang trọng phù hợp với mọi lứa tuổi.\nPhù hợp ở 4 ngừoi\nNeraGarden thuộc khu chung cư cao cấp.\nBảo vệ 24/24 đảm bảo an ninh.\nCăn hộ đầy đủ tiện nghi : bể bơi ở ( tầng 5) , điều hoà, máy sấy tóc, nóng lạnh,máy giặt,máy sấy quần áo, ban công ngắm cảnh toàn bộ view trung tâm thành phố...\nĐầy đủ các dụng cụ nấu nướng.\nChủ nhà sẽ mở cửa và tiếp đón bạn.\nĐ/C: Nera Garden 1 , KĐT Phú Mỹ An,đường Tố Hữu, P An Đông,TP Huế','Quý khách vui lòng khai báo đúng số lượng người lưu trú đã đặt ở airbnb ( chúng tôi chỉ nhận thêm duy nhất 1 trẻ em dưới 6 tuổi ở miễn phí) nếu trẻ em thứ 2 dưới 6 tuổi sẽ phụ thu 100.000vnđ/ trẻ em.','Không gian của Nhà Gems tuy nhỏ nhưng sẽ phù hợp từ 3-4 sẽ thoải mái hơn, có thể phù hợp 5 người đối với dáng người nhỏ hoặc trẻ em dưới 6 tuổi và mọi thứ tiện nghi trong căn hộ mình luôn chuẩn bị đầy đủ để quý khách luôn có cảm giác ở như là nhà của mình và tất cả các căn phòng điều có view ngắm nhìn thành phố Huế yên tỉnh về đêm.\nCó 3 phòng ngủ và 2 phòng tắm : 1 phòng master ( có toilet riêng) giường 1.4mx2m và 2 phòng nhỏ giường 1.2mx2m.\nChất liệu Nệm : Nệm cao su Kimdan\nPhòng sinh hoặt chung: bếp, phòng khách.\nĐồ dùng cá nhân bao gồm : khăn tắm, dầu gội, sữa tắm, kem đánh răng , bàn chải đánh răng.\nMáy giặt, máy sáy quần áo, có sẵn nước giặt xã quần áo.\nChỗ đỗ xe miễn phí : xe ô tô của khách khi đến lưu trú tại Nera Garden sẽ đỗ xe ở trước toà nhà ( đường số 2) những khu vực đó điều có bảo vệ 24/24 đảm bảo an ninh.\n* Đối với xe máy: có thể để xe trên vỉa hè đường số 2 trước toà nhà. Hoặc để xe dưới tầng hầm ( có thu phí)'),(4,NULL,NULL,'Welcome to Nguyên House. This is a place for everyone.\nNguyen House is located in the center of Hue City, near train station and local market . We are located in a safe, fun and friendly family neighborhood. Wonderful studio with enjoyable terrace. Green and relaxing in the heart of the bustling city.\nThe services are:\n• Bedroom with double bed\n• Bathroom with shower and hot water\n• TV with local and cable TV channels\n• Fully equipped kitchenette\n• Wifi\n• Independent access 24 hours',NULL,NULL),(5,NULL,NULL,'Welcome to Nguyên House. This is a place for everyone.\nNguyen House is located in the center of Hue City, near train station and local market . We are located in a safe, fun and friendly family neighborhood. Wonderful studio with enjoyable terrace. Green and relaxing in the heart of the bustling city.\nThe services are:\n• Bedroom with double bed\n• Bathroom with shower and hot water\n• TV with local and cable TV channels\n• Fully equipped kitchenette\n• Wifi\n• Independent access 24 hours',NULL,'Nguyên House được tọa lạc tại ngay trung tâm thành phố, Cách nhà ga và chợ không qua 5 phút đi bộ, xung quanh có những quán ăn đặc sản như Bún Bò, Phở, Bún Hến, Bánh Bèo ......\n\nChúng tôi có thể tiếp tất cả quý khách vào mọi thời gian mà quý khách cảm thấy thuận tiện nhất, có nước uống và trái cây miễn phí khi đến checkin nhận phòng tại Nguyên House\n\nXung quanh khu vực tuyệt đối an toàn , có đầy đủ camera an ninh , môi trường xung quanh khu vực gần bơ sông vì vậy không khí rát trong lành mà mát mẻ , xung quanh không có kinh doanh dịch vụ khác vì vậy rất yên tĩnh , phù hợp với các chuyến nghĩ dưỡng hoặc công tác'),(6,NULL,NULL,'Welcome to Nguyên House. This is a place for everyone.\nNguyen House is located in the center of Hue City, near train station and local market . We are located in a safe, fun and friendly family neighborhood. Wonderful studio with enjoyable terrace. Green and relaxing in the heart of the bustling city.\nThe services are:\n• Bedroom with double bed\n• Bathroom with shower and hot water\n• TV with local and cable TV channels\n• Fully equipped kitchenette\n• Wifi\n• Independent access 24 hours',NULL,NULL);
/*!40000 ALTER TABLE `description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK950qhf1cy351ogjhxa6e4xhgu` (`user_id`),
  CONSTRAINT `FK950qhf1cy351ogjhxa6e4xhgu` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_request`
--

DROP TABLE IF EXISTS `extra_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `max_babies` int NOT NULL,
  `max_guests` int NOT NULL,
  `max_pets` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_request`
--

LOCK TABLES `extra_request` WRITE;
/*!40000 ALTER TABLE `extra_request` DISABLE KEYS */;
INSERT INTO `extra_request` VALUES (2,5,7,0),(3,5,7,0),(4,5,4,0),(5,5,2,0),(8,5,3,0),(9,5,3,0);
/*!40000 ALTER TABLE `extra_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `house_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `list_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8f1jcgkfcpgi1phq9amkgf7qh` (`house_id`),
  KEY `FKh3f2dg11ibnht4fvnmx60jcif` (`user_id`),
  KEY `FKblqorn5tu4mxt0y6pfpwlotmd` (`list_id`),
  CONSTRAINT `FK8f1jcgkfcpgi1phq9amkgf7qh` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
  CONSTRAINT `FKblqorn5tu4mxt0y6pfpwlotmd` FOREIGN KEY (`list_id`) REFERENCES `favorites_list` (`id`),
  CONSTRAINT `FKh3f2dg11ibnht4fvnmx60jcif` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites_list`
--

DROP TABLE IF EXISTS `favorites_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites_list`
--

LOCK TABLES `favorites_list` WRITE;
/*!40000 ALTER TABLE `favorites_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee`
--

DROP TABLE IF EXISTS `fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('CLEANING','EXTRA_GUEST','PET') DEFAULT NULL,
  `fee_type` enum('CLEANING','EXTRA_GUESS','PET','SERVICE_FEE','SHORT_STAY_CLEANING','TAX') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee`
--

LOCK TABLES `fee` WRITE;
/*!40000 ALTER TABLE `fee` DISABLE KEYS */;
INSERT INTO `fee` VALUES (1,'Phí vệ sinh','CLEANING','CLEANING'),(2,'Phí vệ sinh cho kỳ ở ngắn','CLEANING','SHORT_STAY_CLEANING'),(3,'Phí thú cưng','PET','PET'),(4,'Phí khách bổ sung','EXTRA_GUEST','EXTRA_GUESS');
/*!40000 ALTER TABLE `fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_house`
--

DROP TABLE IF EXISTS `fee_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fee_id` int DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  `other` int NOT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo8sq0tju7l8dtervtt2ds7hsg` (`fee_id`),
  KEY `FKtm463t83ponxruieny0cd69vr` (`house_id`),
  CONSTRAINT `FKo8sq0tju7l8dtervtt2ds7hsg` FOREIGN KEY (`fee_id`) REFERENCES `fee` (`id`),
  CONSTRAINT `FKtm463t83ponxruieny0cd69vr` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_house`
--

LOCK TABLES `fee_house` WRITE;
/*!40000 ALTER TABLE `fee_house` DISABLE KEYS */;
INSERT INTO `fee_house` VALUES (2,1,3,1,3.00),(3,2,3,1,2.00),(4,3,3,1,2.00),(5,4,3,2,2.00),(6,1,1,1,3.00),(7,1,4,1,4.00),(8,2,4,1,2.00),(9,1,4,3,5.00),(10,1,5,1,4.00),(11,2,5,1,2.00),(12,1,6,1,5.00),(13,2,6,1,3.00),(14,4,6,2,5.00);
/*!40000 ALTER TABLE `fee_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_detail`
--

DROP TABLE IF EXISTS `guest_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_adults` int NOT NULL,
  `num_children_above2` int NOT NULL,
  `num_babies` int NOT NULL,
  `num_pets` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_detail`
--

LOCK TABLES `guest_detail` WRITE;
/*!40000 ALTER TABLE `guest_detail` DISABLE KEYS */;
INSERT INTO `guest_detail` VALUES (1,2,1,0,0),(2,2,0,0,0),(11,2,0,1,0),(13,2,1,1,0),(14,2,2,0,0),(16,1,0,0,0),(17,2,0,0,0),(18,1,1,0,0),(19,1,1,0,0),(20,2,0,0,0),(21,2,0,0,0),(22,1,1,1,0),(24,1,1,0,0),(25,1,0,0,0),(26,2,0,0,0),(27,2,0,0,0),(28,2,1,0,0),(29,2,1,0,0),(30,1,1,1,0),(31,1,1,1,0),(32,1,1,1,0),(33,1,1,1,0),(34,1,1,1,0);
/*!40000 ALTER TABLE `guest_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(255) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `weekend_price` decimal(38,2) DEFAULT NULL,
  `quantity_of_bathrooms` int NOT NULL,
  `quantity_of_beds` int NOT NULL,
  `quantity_of_rooms` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `quantity_of_guests` int NOT NULL,
  `type_room` enum('ENTIRE_PLACE','ROOM','SHARED_ROOM') DEFAULT NULL,
  `avg_review_point` double DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `ex_request_id` int DEFAULT NULL,
  `status` enum('ACCEPTED','CANCEL','WAITING') DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `description_id` int DEFAULT NULL,
  `review_point_id` int DEFAULT NULL,
  `book_now` bit(1) NOT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ekplct0ot20l4u51m38thwgyb` (`location_id`),
  UNIQUE KEY `UK_duw9eitlg390c4hm2w8huylen` (`ex_request_id`),
  UNIQUE KEY `UK_bw6n53ug7g06eq2uu4u29nfdt` (`description_id`),
  UNIQUE KEY `UK_pk635bprbrgy8a9g89kam695g` (`review_point_id`),
  KEY `FK5pth02tinuneavlhgv8g4b1wa` (`user_id`),
  KEY `FK5s6lprpsjg4ht1747siqp9iv2` (`category_id`),
  CONSTRAINT `FK5pth02tinuneavlhgv8g4b1wa` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK5s6lprpsjg4ht1747siqp9iv2` FOREIGN KEY (`category_id`) REFERENCES `category_hotel` (`id`),
  CONSTRAINT `FK81cq7caylofgu7y2g1wm6kpx8` FOREIGN KEY (`description_id`) REFERENCES `description` (`id`),
  CONSTRAINT `FKa4sr1bhjmwe5c7tyn6i5ulp8d` FOREIGN KEY (`review_point_id`) REFERENCES `review_point_house` (`id`),
  CONSTRAINT `FKlrspnfw3fofb9estv0sy2qiv2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKqsrwk3yot8a2xvgvkig4hqtmj` FOREIGN KEY (`ex_request_id`) REFERENCES `extra_request` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,'Luxury 3 bedrooms - Nera Garden',36.00,43.00,2,3,3,2,7,'ENTIRE_PLACE',NULL,1,2,NULL,2,1,NULL,_binary '\0',NULL),(2,'Indochina Touch by Baly Villa',148.00,151.00,4,4,3,3,7,'ENTIRE_PLACE',4.92,2,3,NULL,1,2,1,_binary '',NULL),(3,'Apartment-3 bedrooms view Thành Phố +swimming pool',42.00,43.00,2,3,3,8,4,'ENTIRE_PLACE',4.8,3,4,NULL,2,3,2,_binary '\0',NULL),(4,'Standard Room# NguyenHouse#',13.00,NULL,1,1,1,13,2,'ROOM',5,4,5,NULL,1,4,3,_binary '',NULL),(5,'NguyenHouse#StudioRoom in Hue City Center',21.00,NULL,1,1,1,13,3,'ROOM',4.91,5,8,NULL,2,5,4,_binary '\0',NULL),(6,'Nguyen House -Studio Room in Hue City',21.00,NULL,1,2,1,13,3,'ROOM',4.97,6,9,NULL,2,6,6,_binary '',NULL);
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_paper`
--

DROP TABLE IF EXISTS `identity_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `src_img_back_side` varchar(255) DEFAULT NULL,
  `src_img_front_side` varchar(255) DEFAULT NULL,
  `type` enum('DRIVING_LICENSE','ID_CARD','PASSPORT') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_paper`
--

LOCK TABLES `identity_paper` WRITE;
/*!40000 ALTER TABLE `identity_paper` DISABLE KEYS */;
INSERT INTO `identity_paper` VALUES (1,'back side','front side','DRIVING_LICENSE'),(2,'back side','front side','ID_CARD'),(3,'back side','front side','PASSPORT'),(4,'back side','front side','ID_CARD');
/*!40000 ALTER TABLE `identity_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `src_img` varchar(255) DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `FKgfwbx7t4780faid7r1a8nf72l` (`house_id`),
  KEY `FKgfoef2g9bwlndgk8ttmf902dg` (`room_id`),
  CONSTRAINT `FKgfoef2g9bwlndgk8ttmf902dg` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKgfwbx7t4780faid7r1a8nf72l` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (7,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/dac2vyzlbdofy7yiwdxj',1,NULL,NULL),(8,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/e3vwpnm8h5ffkjx1ajnh',1,NULL,NULL),(9,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/grzlwmogg4ktqpej9rp7',1,NULL,NULL),(10,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/urzregtdph9i4xjbbvog',1,NULL,NULL),(11,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/mz1vo0mubpwschi4z8ls',1,NULL,NULL),(12,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/mwyxsd1hw3cy5fxcyigq',1,NULL,NULL),(13,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/tcployrpid06dyclvi5e',1,NULL,NULL),(14,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/rbig9mrzdtpqgrkbl9rm',2,NULL,NULL),(15,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/jwatlusvkzhtcqrfmey7',2,NULL,NULL),(16,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/wxrvqe3lpids19ljnm9r',2,NULL,NULL),(17,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/muyiweh34n6xfseilmfj',2,NULL,NULL),(18,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/hdhmzd8khzv8bhzzhu7d',2,NULL,NULL),(19,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/saapav3r9coxd9eqwjba',2,NULL,NULL),(20,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/vqondwra2hzpcm0rbtbf',2,NULL,NULL),(21,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/mklhwyqr8p7dothi6sqc\n',2,NULL,NULL),(22,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ydjuyr9elpdjibnoldfi',2,NULL,NULL),(23,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/myjorsashn5zkwacfzuf',2,NULL,NULL),(24,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ztpomssby3nsji29bo30',2,NULL,NULL),(25,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/xyy4jpbggebg0bxiefjb',2,NULL,NULL),(26,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/qz6rrtikjprtorj4rfzp',2,NULL,NULL),(27,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ts8swayp4xs6r4enguzi\n',3,NULL,NULL),(28,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/zctiprkpgei42a2snabi\n',3,NULL,NULL),(29,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/wdpffm0jmhdthjivggho',3,NULL,NULL),(30,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ffpzejjqq9kgtcnxuhyv\n',3,NULL,'Khu vực sinh hoặt chung: bếp, phòng khách'),(31,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/cghnzyjlswbm8ltdukum\n',3,NULL,NULL),(32,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ulcdplsegepcsnmuexz7',3,NULL,NULL),(33,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/mrmgq76zqaxnngkyukxk',3,NULL,NULL),(34,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/rm0gtxjmoncp3lnh9fhi',3,3,NULL),(35,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/sv0yi0t5q2frd8ezwf4f\n',3,2,NULL),(36,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ytuhqebudpc6vvbi3fxc\n',3,1,NULL),(37,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ymexu5zbzudxfrjwxa6z\n',3,NULL,NULL),(38,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/yhs1xyhcgrhyu6ulxvey\n',3,NULL,NULL),(39,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/xt0te2jk4zsj5jegykku',4,NULL,NULL),(40,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/oktl8okjovtag3f31zwn',4,NULL,NULL),(41,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/hekgja9cvhr7ukanesyq',4,NULL,NULL),(42,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/g7huexm1gldttafm3z55',4,NULL,NULL),(43,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/tveonxafi4jcdzkgjiku',4,NULL,NULL),(44,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/fkc3jwzd2ulm5ksf1zzg',5,NULL,NULL),(45,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/aln4nvxj5hnomo1kzivn',5,NULL,NULL),(46,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/cfch75dulkcfikydcz2t',5,NULL,NULL),(47,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/topu55sr0mrnbb0xtfxx',5,NULL,NULL),(48,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/myfa5q88s0yupsjhdd8j',5,NULL,NULL),(49,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/t30ic2std4vrabaajegw',5,NULL,NULL),(50,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/etup6futzf3gq0ajxuov',5,NULL,NULL),(51,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/u1ds4fetyl0fztal0acc',5,NULL,NULL),(52,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/r8fkyioadbeulpka2yd8',6,NULL,NULL),(53,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/xefps5gzx0mcu0fbwq2b',6,NULL,NULL),(54,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/dczc2vsgpwhar8qvrrn6',6,NULL,NULL),(55,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/fqidpyapp0miwlxakfxj',6,NULL,NULL),(56,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ecfewntozh7anbupgucv',6,NULL,NULL),(57,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/szsmxa5lcrnds2jthz6x',6,NULL,NULL),(58,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/hitommushlu6jot8qbz4',6,NULL,NULL),(59,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/hmwrgawh3hh41asrshun',6,NULL,NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('INTEREST','SPORT') DEFAULT NULL,
  `icon_path` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` VALUES (1,'Động vật','INTEREST',NULL),(2,'Nấu ăn','INTEREST',NULL),(3,'Đồ ăn','INTEREST',NULL),(4,'Phim ảnh','INTEREST',NULL),(5,'Du lịch','INTEREST',NULL),(6,'Hoạt động ngoài trời','INTEREST',NULL),(7,'Trò chơi điện tử','INTEREST',NULL),(8,'Trò chơi với bảng/bàn cờ','INTEREST',NULL),(9,'Đọc','INTEREST',NULL),(10,'Bảo tàng','INTEREST',NULL),(11,'Anime','INTEREST',NULL),(12,'Bảo vệ môi trường','INTEREST',NULL),(13,'Ca hát ','INTEREST',NULL),(14,'Công nghệ','INTEREST',NULL),(15,'Cải tạo nhà cửa','INTEREST',NULL),(16,'Cắm trại','INTEREST',NULL),(17,'Di sản văn hóa','INTEREST',NULL),(18,'Giải đố','INTEREST',NULL),(19,'Hoạt động xã hội','INTEREST',NULL),(20,'Hài kịch','INTEREST',NULL),(21,'Hàng không','INTEREST',NULL),(22,'Kiến trúc','INTEREST',NULL),(23,'Làm vườn','INTEREST',NULL),(24,'Làm đồ thủ công','INTEREST',NULL),(25,'Mua sắm','INTEREST',NULL),(26,'Nghệ thuật','INTEREST',NULL),(27,'Nhiếp ảnh','INTEREST',NULL),(28,'Nhạc sống','INTEREST',NULL),(29,'Phát nhạc','INTEREST',NULL),(30,'Podcast','INTEREST',NULL),(31,'Rượu vang','INTEREST',NULL),(32,'Sân khấu','INTEREST',NULL),(33,'TV','INTEREST',NULL),(34,'Thiết kế','INTEREST',NULL),(35,'Thể thao trực tiếp','INTEREST',NULL),(36,'Thời trang','INTEREST',NULL),(37,'Trang điểm','INTEREST',NULL),(38,'Trò chơi bài','INTEREST',NULL),(39,'Tóc','INTEREST',NULL),(40,'Tự chăm sóc bản thân','INTEREST',NULL),(41,'Viết','INTEREST',NULL),(42,'Xây dựng, lắp ghép','INTEREST',NULL),(43,'Yoga','INTEREST',NULL),(44,'Ô tô','INTEREST',NULL),(45,'Đi bộ','INTEREST',NULL),(46,'Đi bộ đường dài','INTEREST',NULL),(47,'Bóng chày','SPORT',NULL),(48,'Đạp xe','SPORT',NULL),(49,'Thái cực quyền','SPORT',NULL),(50,'Cử tạ','SPORT',NULL),(51,'Ném đĩa','SPORT',NULL),(52,'Trượt băng nghệ thuật','SPORT',NULL),(53,'Các môn thể thao bắn súng','SPORT',NULL),(54,'Bóng rổ','SPORT',NULL),(55,'Đấu vật sumo','SPORT',NULL),(56,'Bóng ném','SPORT',NULL),(57,'Bi đá trên băng','SPORT',NULL),(58,'Bi-da','SPORT',NULL),(59,'Bowling','SPORT',NULL),(60,'Bóng bàn','SPORT',NULL),(61,'Bóng bầu dục','SPORT',NULL),(62,'Bóng bầu dục Mỹ','SPORT',NULL),(63,'Bóng chuyền','SPORT',NULL),(64,'Bóng gậy','SPORT',NULL),(65,'Bóng gỗ','SPORT',NULL),(66,'Bóng lưới','SPORT',NULL),(67,'Bóng né','SPORT',NULL),(68,'Bóng nước','SPORT',NULL),(69,'Bóng quần','SPORT',NULL),(70,'Bóng quần squash','SPORT',NULL),(71,'Bóng vợt','SPORT',NULL),(72,'Bóng đá','SPORT',NULL),(73,'Bơi lội','SPORT',NULL),(74,'Bắn cung','SPORT',NULL),(75,'Charreria','SPORT',NULL),(76,'Chèo thuyền','SPORT',NULL),(77,'Chèo thuyền kayak','SPORT',NULL),(78,'Chạy bộ','SPORT',NULL),(79,'Các môn thể thao cưỡi ngựa','SPORT',NULL),(80,'Các môn thể thao mạo hiểm','SPORT',NULL),(81,'Câu cá','SPORT',NULL),(82,'Cầu','SPORT',NULL),(83,'Cầu lông','SPORT',NULL),(84,'Cờ vua','SPORT',NULL),(85,'Golf','SPORT',NULL),(86,'Judo','SPORT',NULL),(87,'Karate','SPORT',NULL),(88,'Khiêu vũ','SPORT',NULL),(89,'Khúc côn cầu','SPORT',NULL),(90,'Khúc côn cầu trên cỏ','SPORT',NULL),(91,'Kung Fu','SPORT',NULL),(92,'Leo núi','SPORT',NULL),(93,'Lái thuyền buồm','SPORT',NULL),(94,'Lướt sóng','SPORT',NULL),(95,'Lặn','SPORT',NULL),(96,'Mã cầu','SPORT',NULL),(97,'Nhảy cổ vụ/hoạt náo','SPORT',NULL),(98,'Năm môn phối hợp','SPORT',NULL),(99,'Phi tiêu','SPORT',NULL),(100,'Pickleball','SPORT',NULL),(101,'Quyền anh','SPORT',NULL),(102,'Quần vợt','SPORT',NULL),(103,'Quần vợt pơ-lốt của người Basque','SPORT',NULL),(104,'Rodeo','SPORT',NULL),(105,'Teakwondo','SPORT',NULL),(106,'Tennis lồng','SPORT',NULL),(107,'Thể dục dụng cụ','SPORT',NULL),(108,'Thể thao động cơ','SPORT',NULL),(109,'Thể thao ảo','SPORT',NULL),(110,'Trượt băng nằm ngửa','SPORT',NULL),(111,'Trượt patin','SPORT',NULL),(112,'Trượt patin đối kháng','SPORT',NULL),(113,'Trượt tuyết','SPORT',NULL),(114,'Trượt ván','SPORT',NULL),(115,'Trượt ván tuyết','SPORT',NULL),(116,'Xì tố','SPORT',NULL),(117,'Đi ca-nô','SPORT',NULL),(118,'Điền kinh trong sân vận động','SPORT',NULL),(119,'Đua ngựa','SPORT',NULL),(120,'Đua xe trượt móng ván','SPORT',NULL),(121,'Đấm bốc','SPORT',NULL),(122,'Đấu kiếm','SPORT',NULL),(123,'Đấu vật','SPORT',NULL);
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_detail`
--

DROP TABLE IF EXISTS `interest_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interest_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `interest_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc4n8aj7r2ljblki0w0iluxtki` (`interest_id`),
  KEY `FKmy2h1hhscnjuln7sccxi83osq` (`user_id`),
  CONSTRAINT `FKc4n8aj7r2ljblki0w0iluxtki` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`id`),
  CONSTRAINT `FKmy2h1hhscnjuln7sccxi83osq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_detail`
--

LOCK TABLES `interest_detail` WRITE;
/*!40000 ALTER TABLE `interest_detail` DISABLE KEYS */;
INSERT INTO `interest_detail` VALUES (1,5,3),(2,6,3),(3,88,3),(4,2,3),(5,3,3);
/*!40000 ALTER TABLE `interest_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Thừa Thiên Huế',16.4637117,107.5908628),(2,'Thừa Thiên Huế',16.4807087,107.6058793),(3,'Thừa Thiên Huế',16.4632846,107.6156167),(4,'Thừa Thiên Huế',16.4559478,107.5803718),(5,'Thừa Thiên Huế',16.4559478,107.5803718),(6,'Thừa Thiên Huế',16.4559478,107.5803718);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(38,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` enum('CANCEL','PAID') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `about_me` longtext,
  `accommodation` varchar(255) DEFAULT NULL,
  `pet` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,NULL,'Hue, Việt Nam','A dog and a cat','Baly Hotel'),(2,'House','Hue, Việt Nam',NULL,NULL),(3,NULL,'Hue, Việt Nam','Tôi có 1 chú Mèo tên là Lemon',NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `guest_detail_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `status` enum('AWAITING_APPROVAL','CANCEL','FINISH','WAIT_FOR_CHECKIN') DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `weekend_price` decimal(38,2) DEFAULT NULL,
  `total_price` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4ga4wn4q86wi5d8ulse2vf7en` (`guest_detail_id`),
  UNIQUE KEY `UK_qud8p54c7bqomj3csvmci1ig3` (`payment_id`),
  KEY `FKhuvmnyun00xjxygyva3wlv1mf` (`house_id`),
  KEY `FKm4oimk0l1757o9pwavorj6ljg` (`user_id`),
  CONSTRAINT `FK8g1s9tyunsjdv96dyiobv51bb` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `FKhuvmnyun00xjxygyva3wlv1mf` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
  CONSTRAINT `FKm4oimk0l1757o9pwavorj6ljg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKmj2ygkn70jgh6hliohpajtted` FOREIGN KEY (`guest_detail_id`) REFERENCES `guest_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2022-03-16','2022-03-21','2023-09-15',6,29,1,NULL,'WAIT_FOR_CHECKIN',21.00,21.00,154.00),(2,'2022-04-02','2022-04-10','2023-09-15',6,28,2,NULL,'WAIT_FOR_CHECKIN',21.00,21.00,197.00),(11,'2022-07-20','2022-08-01','2023-09-15',5,24,11,NULL,'AWAITING_APPROVAL',21.00,21.00,292.00),(13,'2022-08-15','2022-08-20','2023-09-15',6,27,13,NULL,'WAIT_FOR_CHECKIN',21.00,21.00,154.00),(14,'2022-08-15','2022-08-28','2023-09-15',5,23,14,NULL,'AWAITING_APPROVAL',21.00,21.00,316.00),(16,'2022-09-17','2022-09-23','2023-09-15',3,11,16,NULL,'AWAITING_APPROVAL',42.00,43.00,292.00),(17,'2022-10-20','2022-10-21','2023-09-15',3,12,17,NULL,'AWAITING_APPROVAL',42.00,43.00,50.00),(18,'2022-01-08','2023-01-10','2023-09-15',3,10,18,NULL,'AWAITING_APPROVAL',42.00,43.00,17695.00),(19,'2022-02-01','2023-02-04','2023-09-15',5,22,19,NULL,'AWAITING_APPROVAL',21.00,21.00,8814.00),(20,'2022-02-15','2023-02-20','2023-09-15',6,26,20,NULL,'WAIT_FOR_CHECKIN',21.00,21.00,8864.00),(21,'2022-02-28','2023-03-03','2023-09-15',5,21,21,NULL,'AWAITING_APPROVAL',21.00,21.00,8814.00),(22,'2022-04-02','2023-04-23','2022-04-01',5,20,22,NULL,'AWAITING_APPROVAL',21.00,21.00,9245.00),(24,'2023-04-26','2023-05-01','2023-04-20',3,9,24,NULL,'AWAITING_APPROVAL',42.00,43.00,245.00),(25,'2023-05-01','2023-05-12','2023-04-25',5,19,25,NULL,'AWAITING_APPROVAL',21.00,21.00,268.00),(26,'2023-06-01','2023-06-12','2023-05-01',6,25,26,NULL,'WAIT_FOR_CHECKIN',21.00,21.00,269.00),(27,'2023-06-25','2023-07-05','2023-06-20',2,5,27,NULL,'WAIT_FOR_CHECKIN',148.00,151.00,1694.00),(28,'2023-07-20','2023-07-23','2023-07-16',5,18,28,NULL,'AWAITING_APPROVAL',21.00,21.00,76.00),(29,'2023-07-20','2023-07-31','2023-07-16',1,4,29,NULL,'AWAITING_APPROVAL',36.00,43.00,487.00),(30,'2023-08-20','2023-08-21','2023-08-02',5,17,30,NULL,'AWAITING_APPROVAL',21.00,21.00,26.00),(31,'2023-08-20','2023-08-23','2023-08-03',4,16,31,NULL,'WAIT_FOR_CHECKIN',13.00,13.00,50.00),(32,'2023-08-20','2023-08-23','2023-08-10',2,6,32,NULL,'WAIT_FOR_CHECKIN',148.00,151.00,506.00),(33,'2023-08-20','2023-09-01','2023-08-16',4,15,33,NULL,'WAIT_FOR_CHECKIN',13.00,13.00,184.00),(34,'2023-09-01','2023-09-05','2023-08-30',4,14,34,NULL,'WAIT_FOR_CHECKIN',13.00,13.00,65.00);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `user_id` int DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `review_point_id` int DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r1isnsigf38g7130qs34jgpye` (`review_point_id`),
  KEY `FKiyf57dy48lyiftdrf7y87rnxi` (`user_id`),
  KEY `FK6ecwggu7yjrhb0buspnijuns0` (`house_id`),
  CONSTRAINT `FK6ecwggu7yjrhb0buspnijuns0` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
  CONSTRAINT `FKiyf57dy48lyiftdrf7y87rnxi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKnixvbkd7v1kuirq1yl5wkh8y7` FOREIGN KEY (`review_point_id`) REFERENCES `review_point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Vị trí căn hộ rất tiện để đi thăm quan tp Huế. Anh chị chủ nhà vô cùng nhiệt tình và giúp bọn mình rất nhiều. Chắc chắn lần sau mình sẽ tiếp tục ủng hộ Nguyên House.',29,'2022-03-22',13,6,_binary '\0'),(2,'Homestay đẹp , sạch sẽ , rộng rãi , nội thất hiện đại đầy đủ. Nơi đây ở ví trị thuận tiện cho việc đi lại và tham quan các điểm . Anh chị chủ rất dễ thương và hiếu khách . Bọn mình cảm thấy rất thoải mải và dễ chịu ở đây vì có cảm giác như ở chính ngôi nhà của mình vậy',28,'2022-04-12',14,6,_binary '\0'),(3,'Vị trí gần trung tâm, đi lai thuận tiện.',24,'2022-08-02',15,5,_binary '\0'),(4,'Phòng rộng, sạch sẽ, vị trí thuận lợi để di chuyển, view ban công đẹp ❤️',27,'2022-08-21',16,6,_binary '\0'),(5,'Tuyệt vời mọi thứ',23,'2022-09-01',17,5,_binary '\0'),(6,'chỗ ở sạch sẽ được dọn dẹp gọn gàng trước khi tụi mình đến, chủ nhà nhiệt tình checkin checkout đều nhanh gọn. nhà từ những dụng cụ bếp nhỏ nhất đều rất đầy đủ nha, có 3 phòng ngủ nhưng 1 phòng hơi nhỏ. phù hợp đi khoảng 4-5 người là đẹp',11,'2022-09-23',6,3,_binary '\0'),(7,'Hoàn toàn hài lòng với nơi ở và sự nhiệt tình của chủ nhà.',12,'2022-10-21',7,3,_binary '\0'),(8,'Rất tuyệt vời, chủ nhà còn giúp mình mua quà mang về',10,'2023-01-11',8,3,_binary '\0'),(9,'chủ nhà rất dễ thương và nhiệt tình hỗ trợ khách hết mình, vị trí gần trung tâm siêu thuận tiện',22,'2023-02-04',18,5,_binary '\0'),(10,'Phòng rộng rãi, sạch sẽ, thoáng mát, chủ nhà nhiệt tình',26,'2023-02-21',19,6,_binary '\0'),(11,'Chỗ ở sạch sẽ và đầy đủ, chủ nhà thân thiện',21,'2023-03-03',20,5,_binary '\0'),(12,'Không gian sạch sẽ, thuận tiện đi lại, chủ nhà thân thiện',20,'2023-04-23',21,5,_binary '\0'),(13,'Mình thực sự cảm thấy may mắn khi chọn Gems làm nơi lưu trú cho kì nghỉ vừa rồi. Phòng ốc mới, có đầy đủ các thiết bị gia dụng như một ngôi nhà bình thường, rất phù hợp để đi theo nhóm. Chúng mình vừa có không gian sinh hoạt riêng tư trong phòng ngủ vừa có thể cùng nhau xem phim, nghe nhạc, chuyện trò nơi phòng khách. Có đủ đồ bếp để có thể nấu nướng, bảo quản thực phẩm, bàn ăn đủ rộng để 4 người ngồi cùng nhau. View phòng ngủ về đêm siêu đẹp, nhìn thấy cả thành phố bên dưới với rất nhiều đèn điện chiếu sáng lung linh. Phòng ngủ master còn nhìn ra được đồng lúa chín và vườn cây, cảm giác rất nhẹ nhõm, yên bình. Chủ nhà thì rất là thân thiện, nhiệt tình và dễ mến. Nói chung đây là trải nghiệm đẹp của mình tại Huế cũng như tại airbnb. Thực sự là một trải nghiệm xuất sắc mà rất khó để có thể có ở những khách sạn thông thường. Chúc chủ nhà có nhiều khách dễ thương nha <3',9,'2023-05-01',9,3,_binary '\0'),(14,'Phòng đẹp, chủ nhà thân thiện',19,'2023-05-12',22,5,_binary '\0'),(15,'sạch sẽ, anh chủ nhiệt tình',25,'2023-06-12',23,6,_binary '\0'),(16,'Pour ce 2eme séjour à Hué que nous apprécions beaucoup nous avons choisi de nous excentrer de 5-6kms pour ne pas être dans le bouillonnement permanent d’hué. Nous étions en Scooter de location et cela ne nous a pas dérangé du tout. La maison est par ailleurs sublime. Toute neuve. Construite avec des matériaux luxueux et meublée avec goût. L accueil a été très amical et arrangeant. Merci pour ces 2 jours superbes.',5,'2023-07-05',2,2,_binary '\0'),(17,'Nơi ở rất tiện nghi sạch sẽ & gần trung tâm. Mình ở lầu 3 với view trống & không ai nhìn trộm được, nên rất riêng tư và thoải mái mở rèm.',18,'2023-07-23',24,5,_binary '\0'),(18,'nice house, nice host. The house is fully furnished and enough for 6 people to stay. There is also a swimming pool and gym for free.',4,'2023-08-01',1,1,_binary '\0'),(19,'Phòng đẹp, sạch, sáng, ga nệm kh bị rít sạch sẽ. Host dễ thương, nhiệt tình!',17,'2023-08-21',25,5,_binary '\0'),(20,'Clean and comfortable',16,'2023-08-23',10,4,_binary '\0'),(21,'amazing host. spectacular spot. will def get again when in hue',6,'2023-08-23',3,2,_binary '\0'),(22,'Good place',15,'2023-09-02',11,4,_binary '\0'),(23,'Tung\'s homestay locates at a quiet street but within 5 minutes walk there is a local market and only about 8 minutes walk to the railway station, super convenient if you arrive or depart taking trains. Highly recommend',14,'2023-09-07',12,4,_binary '\0'),(701,'Fantastic guest. We truly enjoyed hosting them and would happily welcome back. Travel safe!',13,'2023-04-21',NULL,2,_binary '');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_point`
--

DROP TABLE IF EXISTS `review_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_point` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accuracy_point` int NOT NULL,
  `check_in_point` int NOT NULL,
  `cleanliness_point` int NOT NULL,
  `communication_point` int NOT NULL,
  `location_point` int NOT NULL,
  `value_point` int NOT NULL,
  `avg_point` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_point`
--

LOCK TABLES `review_point` WRITE;
/*!40000 ALTER TABLE `review_point` DISABLE KEYS */;
INSERT INTO `review_point` VALUES (1,5,5,5,5,5,5,5),(2,5,5,5,5,5,5,5),(3,5,5,5,5,5,4,4.8),(6,5,5,5,5,5,5,5),(7,4,4,5,5,5,5,4.7),(8,5,5,5,4,4,4,4.5),(9,5,5,5,5,5,5,5),(10,5,5,5,5,5,5,5),(11,5,5,5,5,5,5,5),(12,5,5,4,5,5,5,4.8),(13,4,5,4,4,4,5,5),(14,5,5,5,5,5,5,5),(15,5,5,5,5,5,5,5),(16,5,5,5,5,5,5,5),(17,4,4,4,4,4,4,4),(18,5,5,5,5,5,5,5),(19,5,5,5,5,5,5,5),(20,5,5,5,5,5,5,5),(21,5,5,5,5,5,5,5),(22,5,5,5,5,5,5,5),(23,5,5,5,5,5,5,5),(24,5,5,5,5,5,5,5),(25,5,5,5,5,5,5,5);
/*!40000 ALTER TABLE `review_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_point_house`
--

DROP TABLE IF EXISTS `review_point_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_point_house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accuracy_point` double NOT NULL,
  `avg_point` double NOT NULL,
  `check_in_point` double NOT NULL,
  `cleanliness_point` double NOT NULL,
  `communication_point` double NOT NULL,
  `location_point` double NOT NULL,
  `value_point` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_point_house`
--

LOCK TABLES `review_point_house` WRITE;
/*!40000 ALTER TABLE `review_point_house` DISABLE KEYS */;
INSERT INTO `review_point_house` VALUES (1,5,4.9,5,5,5,5,4.5),(2,4.8,4.8,4.8,5,4.8,4.8,4.8),(3,5,5,5,4.7,5,5,5),(4,4.9,4.91,4.9,4.9,4.9,4.9,4.9),(6,4.9,4.97,4.9,4.9,4.9,4.8,5);
/*!40000 ALTER TABLE `review_point_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmbwc7b9ddb7r414y87yeskgl1` (`house_id`),
  CONSTRAINT `FKmbwc7b9ddb7r414y87yeskgl1` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'Phòng ngủ 1',3),(2,'Phòng ngủ 2',3),(3,'Phòng ngủ 3',3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` longtext,
  `icon_none_active` longtext,
  `input` enum('BOOLEAN','INT','STRING','TIME') DEFAULT NULL,
  `type` enum('CHECKIN','HOUSE_RULES') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (1,'Mang theo thú cưng','M13.7 13.93a4 4 0 0 1 5.28.6l.29.37 4.77 6.75a4 4 0 0 1 .6 3.34 4 4 0 0 1-4.5 2.91l-.4-.08-3.48-.93a1 1 0 0 0-.52 0l-3.47.93a4 4 0 0 1-2.94-.35l-.4-.25a4 4 0 0 1-1.2-5.2l.23-.37 4.77-6.75a4 4 0 0 1 .96-.97zm3.75 1.9a2 2 0 0 0-2.98.08l-.1.14-4.84 6.86a2 2 0 0 0 2.05 3.02l.17-.04 4-1.07a1 1 0 0 1 .5 0l3.97 1.06.15.04a2 2 0 0 0 2.13-2.97l-4.95-7.01zM27 12a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM5 12a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm22 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM5 14a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm6-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','m3.7 2.3 26 26-1.4 1.4-26-26zm8.17 13.81 1.44 1.44L9.6 22.8a2 2 0 0 0 1.98 3.13l.17-.04 4-1.07a1 1 0 0 1 .38-.03l.13.03 4 1.07a2 2 0 0 0 1.3-.1l1.46 1.47a4 4 0 0 1-3.09.6l-.2-.04-3.73-1-3.73 1a4 4 0 0 1-2.94-.35l-.2-.11-.2-.13a4 4 0 0 1-1.08-5.4l.11-.18zM27 12a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM5 12a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm22 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM5 14a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM21 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 4a4 4 0 0 1 3.38 6.14l-1.49-1.5a2 2 0 0 0-2.54-2.53L8.86 4.6A3.98 3.98 0 0 1 11 4zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','BOOLEAN','HOUSE_RULES'),(2,'Tổ chức sự kiện',NULL,'M5.12 9.36 7 11.25v.05c.12 4.47 2.85 8.2 8.3 11.2l.39.21.27.14.3-.19c.46-.28.89-.57 1.3-.85L19 23.24c-.5.35-1 .7-1.55 1.04l2.2 2.92a1.13 1.13 0 0 1-.9 1.8H17v3h-2v-3h-1.75a1.13 1.13 0 0 1-.9-1.8l2.14-2.86C8.2 20.92 5 16.46 5 11c0-.56.04-1.1.12-1.64zM3.71 2.3l26 26-1.42 1.42-26-26zM16 25.67 15 27h2zM16 0c5.9 0 11 5.28 11 11 0 2.92-1.17 5.68-3.47 8.29l-1.42-1.42c1.79-2.06 2.74-4.17 2.87-6.33l.02-.27V11c0-4.64-4.21-9-9-9a8.98 8.98 0 0 0-6.73 3.03L7.85 3.6A10.97 10.97 0 0 1 16 0z','BOOLEAN','HOUSE_RULES'),(3,'Hút thuốc, sử dụng vape, thuốc lá điện tử','M30 19v8h-2v-8zm-4 0v8H3a2 2 0 0 1-2-1.85V21a2 2 0 0 1 1.85-2H3zm-2 2H3v4h21zM21 3a4 4 0 0 1 3.36 6.18l-.1.14.13.04a8 8 0 0 1 5.6 7.4L30 17h-2a6 6 0 0 0-5.78-6H21V9a2 2 0 0 0 .15-4H21zm-4 0v2a4 4 0 0 0-.2 8H22a4 4 0 0 1 4 3.8v.2h-2a2 2 0 0 0-1.85-2H17a6 6 0 0 1-.23-12z','m3.7 2.3 26 26-1.4 1.4-26-26zM14.77 19l2 2H3v4h17.76l2 2H3a2 2 0 0 1-2-1.85V21a2 2 0 0 1 1.85-2H3zM30 19v6.76l-2-2V19zm-4 0v2.76L23.24 19zM21 3a4 4 0 0 1 3.36 6.18l-.1.14.13.04a8 8 0 0 1 5.6 7.4L30 17h-2a6 6 0 0 0-5.78-6H21V9a2 2 0 0 0 .15-4H21zm1 10a4 4 0 0 1 4 3.8v.2h-2a2 2 0 0 0-1.85-2H19.24l-2-2zM17 3v2a4 4 0 0 0-4 3.76l-1.68-1.69A6 6 0 0 1 16.78 3z','BOOLEAN','HOUSE_RULES'),(4,'Chụp ảnh và quay phim vì mục đích thương mại','M17.59 2a2 2 0 0 1 1.28.47l.13.12L21.42 5H25a5 5 0 0 1 4.98 4.56l.02.22V24a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V10a5 5 0 0 1 4.78-5h3.83L13 2.6a2 2 0 0 1 1.07-.57l.17-.02.18-.01zm0 2h-3.17l-2.97 3H7a3 3 0 0 0-3 2.82V24a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V10a3 3 0 0 0-2.82-3h-4.59zM16 9a8 8 0 1 1 0 16 8 8 0 0 1 0-16zm0 2a6 6 0 1 0 0 12 6 6 0 0 0 0-12zM7 9a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','M2.41 3.83 3.83 2.4l25.45 25.46-1.41 1.41zm.49 3.31 1.45 1.45c-.2.37-.32.8-.34 1.23L4 10v14a3 3 0 0 0 2.82 3h15.94l2 2H7a5 5 0 0 1-5-4.78V10c0-1.06.33-2.05.9-2.86zM17.59 2a2 2 0 0 1 1.28.47l.13.12L21.42 5H25a5 5 0 0 1 4.98 4.56l.02.22V24a5 5 0 0 1-.24 1.52L28 23.76V10a3 3 0 0 0-2.82-3h-4.59l-3-3h-3.17l-2.97 3h-.2l-2-2h1.36L13 2.6a2 2 0 0 1 1.07-.57l.17-.02.18-.01zM8.96 13.2l1.5 1.5a6 6 0 0 0 7.84 7.84l1.5 1.5A8 8 0 0 1 8.96 13.2zM16 9a8 8 0 0 1 7.64 10.4l-1.68-1.68a6 6 0 0 0-6.67-6.67L13.6 9.35A8 8 0 0 1 16 9z','BOOLEAN','HOUSE_RULES'),(5,'Khung giờ cần giữ yên lặng','M15.77 1.05a1 1 0 0 1 .94 1.5A12.93 12.93 0 0 0 15 9a13 13 0 0 0 14.07 12.96 1 1 0 0 1 .95 1.49A15 15 0 0 1 17 31a15 15 0 0 1-1.23-29.95zM14.1 3.32A13.01 13.01 0 0 0 17 29a12.98 12.98 0 0 0 9.96-4.64l.22-.28.08-.1h-.2A15 15 0 0 1 13.01 9.63v-.33L13 9c0-1.71.29-3.39.84-4.96L14 3.6z',NULL,'TIME','HOUSE_RULES'),(6,'Khung thời gian nhận phòng','M16 .33a15.67 15.67 0 1 1 0 31.34A15.67 15.67 0 0 1 16 .33zm0 2a13.67 13.67 0 1 0 0 27.34 13.67 13.67 0 0 0 0-27.34zm1 3v10.1l8.74 5.04-1 1.73L15 16.58V5.33z',NULL,'TIME','CHECKIN'),(7,'Thời gian trả phòng','M16 .33a15.67 15.67 0 1 1 0 31.34A15.67 15.67 0 0 1 16 .33zm0 2a13.67 13.67 0 1 0 0 27.34 13.67 13.67 0 0 0 0-27.34zm1 3v10.1l8.74 5.04-1 1.73L15 16.58V5.33z',NULL,'TIME','CHECKIN'),(8,'Số lượng khách','M22 5a6 6 0 0 1 3.64 10.77A9 9 0 0 1 31 23.74V24h-2a7 7 0 0 0-6-6.93v-2.2A4 4 0 0 0 22 7a4 4 0 0 0-3.68 5.57A5 5 0 0 1 21 17a4.99 4.99 0 0 1-1.6 3.67 9 9 0 0 1 5.6 8.06V29h-2a7 7 0 0 0-6-6.93v-2.24a3 3 0 1 0-2 0v2.24a7 7 0 0 0-6 6.69V29H7a9 9 0 0 1 5.6-8.34 5 5 0 0 1 1.08-8.09A4 4 0 1 0 9 14.87v2.2a7 7 0 0 0-6 6.69V24H1a9 9 0 0 1 5.36-8.23A6 6 0 1 1 15.92 10h.16A6 6 0 0 1 22 5z',NULL,'INT','HOUSE_RULES'),(9,'Các nội quy khác','M16 1a4 4 0 0 1 3.81 2.8l.06.2h3.46A3.67 3.67 0 0 1 27 7.47l.01.2v19.66A3.67 3.67 0 0 1 23.53 31l-.2.01H8.67A3.67 3.67 0 0 1 5 27.53l-.01-.2V7.67A3.67 3.67 0 0 1 8.47 4l.2-.01h3.46l.04-.16a4 4 0 0 1 3.42-2.82L15.8 1zM9 6h-.33c-.88 0-1.6.67-1.66 1.52L7 7.67v19.66c0 .88.67 1.6 1.52 1.66l.15.01h14.66c.88 0 1.6-.67 1.66-1.52l.01-.15V7.67c0-.88-.67-1.6-1.52-1.66L23.33 6H23v5H9zm1 13a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm8 0v2h-6v-2zm-8-5a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm10 0v2h-8v-2zM16 3a2 2 0 0 0-2 1.85V6h-3v3h10V6h-2.97L18 4.88A2 2 0 0 0 16 3zm0 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2z',NULL,'STRING','HOUSE_RULES');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_house`
--

DROP TABLE IF EXISTS `rule_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rule_house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` time(6) DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `other` longtext,
  `status` bit(1) NOT NULL,
  `house_id` int DEFAULT NULL,
  `rule_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl4tvcae9360spyeyq3sfk57bt` (`house_id`),
  KEY `FKhrdmpx0ythl2mjfk0khfttn7h` (`rule_id`),
  CONSTRAINT `FKhrdmpx0ythl2mjfk0khfttn7h` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`),
  CONSTRAINT `FKl4tvcae9360spyeyq3sfk57bt` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_house`
--

LOCK TABLES `rule_house` WRITE;
/*!40000 ALTER TABLE `rule_house` DISABLE KEYS */;
INSERT INTO `rule_house` VALUES (1,'14:00:00.000000','20:00:00.000000',NULL,_binary '',1,6),(2,NULL,'12:00:00.000000',NULL,_binary '',1,7),(3,NULL,NULL,NULL,_binary '\0',1,1),(4,NULL,NULL,NULL,_binary '',1,4),(5,NULL,NULL,NULL,_binary '\0',1,3),(6,NULL,NULL,'Giữ gìn đồ đạc, nếu hư hại sẽ yêu cầu bồi thường',_binary '',1,9),(7,'15:00:00.000000',NULL,NULL,_binary '',2,6),(9,NULL,'12:00:00.000000',NULL,_binary '',2,7),(10,NULL,NULL,NULL,_binary '\0',2,1),(11,NULL,NULL,NULL,_binary '\0',2,2),(12,NULL,NULL,NULL,_binary '\0',2,3),(13,'14:00:00.000000','22:00:00.000000',NULL,_binary '',3,6),(14,NULL,'12:00:00.000000',NULL,_binary '',3,7),(15,NULL,NULL,NULL,_binary '\0',3,1),(16,'22:00:00.000000','06:00:00.000000',NULL,_binary '',3,5),(17,NULL,NULL,NULL,_binary '\0',3,2),(18,NULL,NULL,NULL,_binary '\0',3,3),(19,NULL,NULL,'1.Quý khách vui lòng xuất trình CMND, thẻ CCCD hoặc hộ chiếu để làm thủ tục nhận phòng. \n2.Bảo quản tài sản trong căn hộ: Không thay đổi, di chuyển đồ đạc trong phòng hoặc từ phòng này sang phòng khác. Trường hợp tài sản, đồ dùng trong phòng bị mất, hỏng do lỗi của Quý khách, Quý khách sẽ phải bồi thường 100% giá trị.\n3. Quý khách vui lòng dọn dẹp vệ sinh sạch sẽ, sau khi sử dụng khu vực bếp và khu vực ăn uống,sinh hoặt cùng mọi người.\n 4. Giữ gìn vệ sinh chung: không vứt giấy vệ sinh và rác thải vào thiết bị vệ sinh gây tắc cống. \n5. Quý khách vui lòng để giày dép gọn gàng ở tủ để giày ngay cửa ra vào.\n6. Không thêm người: Không đưa thêm người vào phòng lưu trú qua đêm khi chưa đăng ký trước với chủ nhà.\n7. Khi ra khỏi phòng, Quý khách vui lòng tắt quạt/đèn, điều hoà, đóng cửa.                                                                          8. Checkout: Báo trước cho chủ nhà giờ checkout.\nThời gian trả phòng là 12:00 AM, nếu muộn hơn sẽ phải thanh toán thêm phụ phí 50.000vnd/giờ. Trong trường hợp cần thiết, xin vui lòng liên hệ với chủ nhà.\n9. Khách có nhu cầu dọn dẹp vệ sinh, setup lại phòng vui lòng báo cho chủ nhà.phí vệ sinh ,setup lại phòng 100.000vnđ, khách tự trả tiền phí này.\n10. Checkout phòng nếu nhà quá bẩn thì chủ nhà sẽ phụ thu thêm phí vệ sinh sau kì ở.',_binary '',3,9),(21,'13:00:00.000000',NULL,NULL,_binary '',5,6),(22,NULL,'12:00:00.000000',NULL,_binary '',5,7),(23,NULL,NULL,NULL,_binary '\0',5,1),(24,NULL,NULL,'Hạn chế gây tiếng ồn lơn sau 23h',_binary '',5,9),(25,'13:00:00.000000',NULL,NULL,_binary '',6,6),(26,NULL,'12:00:00.000000',NULL,_binary '',6,7),(27,NULL,NULL,NULL,_binary '\0',6,1),(28,NULL,NULL,NULL,_binary '\0',6,3);
/*!40000 ALTER TABLE `rule_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surcharge`
--

DROP TABLE IF EXISTS `surcharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surcharge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `percent` double NOT NULL,
  `type` enum('SERVICE_FEE','TAX') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surcharge`
--

LOCK TABLES `surcharge` WRITE;
/*!40000 ALTER TABLE `surcharge` DISABLE KEYS */;
INSERT INTO `surcharge` VALUES (1,'Thuế',12,'TAX'),(2,'Phí dịch vụ AirBnb',14,'SERVICE_FEE');
/*!40000 ALTER TABLE `surcharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `identity_paper_id` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `profile_id` int DEFAULT NULL,
  `role` enum('ADMIN','GUEST','HOST') DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dhlcfg8h1drrgu0irs1ro3ohb` (`address_id`),
  UNIQUE KEY `UK_ee9adtuij5ha0i5pidj2t2w8f` (`identity_paper_id`),
  UNIQUE KEY `UK_1mcjtpxmwom9h9bf2q0k412e0` (`profile_id`),
  CONSTRAINT `FK6jalc21249xg0ngedonce9w55` FOREIGN KEY (`address_id`) REFERENCES `address_user` (`id`),
  CONSTRAINT `FKof44u64o1d7scaukghm9veo23` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`),
  CONSTRAINT `FKpemp3dfw0g3lhwui66we8gfe0` FOREIGN KEY (`identity_paper_id`) REFERENCES `identity_paper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,NULL,NULL,'admin@gmail.com','John','Admin',NULL,NULL,_binary '',NULL,NULL,NULL,'ADMIN',NULL),(2,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/oobzk08zaahvca46jkqt',NULL,NULL,'','Hue','0366666622',NULL,_binary '',1,'2020-02-01',NULL,'HOST',NULL),(3,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/jig2yadz7mfmrc01qtje',NULL,NULL,'Mai Ly','( Miley)','0362222222',NULL,_binary '',2,'2021-02-21',1,'HOST',NULL),(4,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/mgvopnrwrxya8o7it1ex',NULL,NULL,NULL,'Được','0111111111',NULL,_binary '',NULL,'2021-02-01',NULL,'HOST',NULL),(5,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/eiabzquebtetr6z98dya',NULL,'agathe@gmail.com',NULL,'Agathe','0123123123',NULL,_binary '',NULL,'2020-10-23',NULL,'HOST',NULL),(6,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/mwpv7bumydpoyckclrqe',NULL,NULL,NULL,'Kennald','0321432125',NULL,_binary '',NULL,'2020-02-01',NULL,'HOST',NULL),(7,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/zi82tyxtptc3yfwlhkpe',NULL,NULL,NULL,'Trang','0512142312',NULL,_binary '',NULL,'2022-02-01',NULL,'HOST',NULL),(8,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/b0o6xdoswn7avvrcntmn',NULL,NULL,NULL,'Gems','0412512512',NULL,_binary '',3,'2021-05-11',3,'HOST',NULL),(9,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/e0brqrkgqppjjuxyiy5k',NULL,NULL,NULL,'Ngọc','0512312512',NULL,_binary '',NULL,'2021-02-21',NULL,'GUEST',NULL),(10,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/wqyzlvyywkmthhctsmkk',NULL,NULL,NULL,'Phung','0531121234',NULL,_binary '',NULL,'2023-10-01',NULL,'GUEST',NULL),(11,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/m91mgd9tsgrxvl2bftfx',NULL,NULL,NULL,'Bình','0234112412',NULL,_binary '',NULL,'2020-06-01',NULL,'GUEST',NULL),(12,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/f969fwtrdxvxwytnshhz',NULL,NULL,NULL,'Hạnh','0125123151',NULL,_binary '',NULL,'2020-02-26',NULL,'GUEST',NULL),(13,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/fnd27aubc3g9jy3t334z',NULL,'tung@gmail.com',NULL,'Tùng','0366423411',NULL,_binary '',4,'2020-03-02',2,'HOST',NULL),(14,NULL,NULL,NULL,'sarah@gmail.com',NULL,'Sarah','0374125125',NULL,_binary '',NULL,'2023-01-03',NULL,'GUEST',NULL),(15,NULL,NULL,NULL,'thinh@gmail.com',NULL,'Thịnh','0362312412',NULL,_binary '',NULL,'2023-04-06',NULL,'GUEST',NULL),(16,NULL,NULL,NULL,'soul@gmail.com',NULL,'SouL','0372341224',NULL,_binary '',NULL,'2021-02-01',NULL,'GUEST',NULL),(17,NULL,NULL,NULL,NULL,NULL,'Gia Ky',NULL,NULL,_binary '',NULL,'2020-04-03',NULL,'GUEST',NULL),(18,NULL,NULL,NULL,NULL,NULL,'Hải',NULL,NULL,_binary '',NULL,'2022-01-20',NULL,'GUEST',NULL),(19,NULL,NULL,NULL,NULL,NULL,'Trâm',NULL,NULL,_binary '',NULL,'2023-01-21',NULL,'GUEST',NULL),(20,NULL,NULL,NULL,NULL,NULL,'Vinh',NULL,NULL,_binary '',NULL,'2023-03-20',NULL,'GUEST',NULL),(21,NULL,NULL,NULL,NULL,NULL,'Thao',NULL,NULL,_binary '',NULL,'2020-02-01',NULL,'GUEST',NULL),(22,NULL,NULL,NULL,NULL,NULL,'Caitlin',NULL,NULL,_binary '',NULL,'2023-02-11',NULL,'GUEST',NULL),(23,NULL,NULL,NULL,NULL,NULL,'Hiep',NULL,NULL,_binary '',NULL,'2020-02-20',NULL,'GUEST',NULL),(24,NULL,NULL,NULL,NULL,NULL,'Hanh',NULL,NULL,_binary '',NULL,'2021-02-01',NULL,'GUEST',NULL),(25,NULL,NULL,NULL,NULL,NULL,'My Huyen',NULL,NULL,_binary '',NULL,'2020-02-01',NULL,'GUEST',NULL),(26,NULL,NULL,NULL,NULL,NULL,'Nguyễn',NULL,NULL,_binary '',NULL,'2022-02-01',NULL,'GUEST',NULL),(27,NULL,NULL,NULL,NULL,NULL,'Cam',NULL,NULL,_binary '',NULL,'2020-02-01',NULL,'GUEST',NULL),(28,NULL,NULL,NULL,NULL,NULL,'Mai',NULL,NULL,_binary '',NULL,'2022-02-01',NULL,'GUEST',NULL),(29,NULL,NULL,NULL,NULL,NULL,'Thuy Linh',NULL,NULL,_binary '',NULL,'2020-02-01',NULL,'GUEST',NULL),(30,NULL,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/wrm8kntd5d5zjg08vvfc',NULL,'janet@gmail.com',NULL,'Janet','123',NULL,_binary '',NULL,'2021-05-01',NULL,'GUEST',NULL),(46,'8ed28837-0619-4f5c-a1d4-5eca7f029a69',NULL,'2000-03-08 17:00:00.000000','xehikaval@mailinator.com','Gemma','Alvarez','123456',NULL,_binary '',NULL,NULL,NULL,'GUEST','$2a$10$IwfhaEz1VDRN1n.PSbDxUeS2TZcH.f47rkariJaxbFsorgO5oPWU6'),(47,'ff19ce14-d7a8-4ae3-8ef0-3e5fb9f7ba64',NULL,'1974-12-24 17:00:00.000000','pugahyv@mailinator.com','Martha','Peterson','12345678',NULL,_binary '',NULL,NULL,NULL,'GUEST','$2a$10$Czh87KRbdnypJIXJRu5i1O4YHV5SCKb5w.f5k2r6wZOua1kp28OIi'),(48,'6c025ac4-56cb-4384-9914-d3d28958c4db',NULL,'1998-10-14 17:00:00.000000','ablackzero9@gmail.com','Anh','Cao','1',NULL,_binary '',NULL,'2023-09-27',NULL,'ADMIN','$2a$10$gBdc7z3bO4oFHFwgfn9Vh.qkF34fF0sy6VdM0Jii.fwzC5Xh2f3B6');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-29 10:57:01
