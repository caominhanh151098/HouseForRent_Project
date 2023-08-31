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
  `type` enum('BUNK','KING','QUEEN','SINGER','SOFA') DEFAULT NULL,
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
INSERT INTO `bed` VALUES (1,1,1,'SINGER'),(2,1,2,'SINGER'),(3,1,3,'SINGER');
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_detail`
--

DROP TABLE IF EXISTS `category_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_hotel_id` int DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1ijy8k2yr34ebkoh6jimv8aav` (`category_hotel_id`),
  KEY `FKsjnytb0l01cgknwqq6u4x8tw4` (`house_id`),
  CONSTRAINT `FK1ijy8k2yr34ebkoh6jimv8aav` FOREIGN KEY (`category_hotel_id`) REFERENCES `category_hotel` (`id`),
  CONSTRAINT `FKsjnytb0l01cgknwqq6u4x8tw4` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_detail`
--

LOCK TABLES `category_detail` WRITE;
/*!40000 ALTER TABLE `category_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_detail` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_hotel`
--

LOCK TABLES `category_hotel` WRITE;
/*!40000 ALTER TABLE `category_hotel` DISABLE KEYS */;
INSERT INTO `category_hotel` VALUES (1,'Thật ấn tượng!','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/jrlfatnhakiqa9mgdfd7'),(2,'Đảo','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ljm5fbpxgjttxcmdxkmv\n'),(3,'Nông thôn','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/eaj1wyrpx1vse5btsc8h'),(4,'chơi golf','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/pvinh0ojadeuzq03jvgq'),(5,'Nhà thuyền','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/vcyputrivgknjuco5wlo'),(6,'Phòng','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ii6kiagqj6z28yigt834'),(7,'Hồ bơi tuyệt vời','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/isfyyedepfi2qr616qa6'),(8,'Biệt thự','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/yjvs9fddqjyrkdowsbqx'),(9,'Khung cảnh tuyệt vời','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/bts87qite7aegjon3aau'),(10,'Nhà nhỏ','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ylyyg6cbxtwciu1a7fyx'),(11,'Container','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ebmjhfql6lv4rpbygj9e'),(12,'Vui chơi','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ho0os0vt2auhwexcusou'),(13,'Nhà mái vòm','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/r5rnu59hj26lxiiy0h08'),(14,'Nhà khung chữ A','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/h1lxk9es4tnq9jptyku4'),(15,'Thuyền ','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/vlacklca6ufubparqikv'),(16,'Hướng biển','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/g3ogseuofvxjcp9cpkld'),(17,'Được ưa chuộng','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/qxr4a4won2fgzlhtp3f8\n'),(18,'Nhà trên cây ','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ual0tqvg8iu8vwi9d5qw\n'),(19,'Các thành phố nổi tiếng','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/hqldjbibkqjdsrxxcdkm\n'),(20,'Khu cắm trại','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/qe1ibuyds7nxozkfmkjv'),(21,'Thiết kế','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/y68gtvie907anic8hwax'),(22,'Không gian sáng tạo','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/femnbkybntho2jxnlmqp'),(23,'Grand Piano','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/hevfbutnal88xjpfsbfi'),(24,'Sa mạc','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/jxo0w5sctvb5ctmb1mue'),(25,'Nông trại','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/xzdz4uylqfuc3hhcmjhv'),(26,'Mới','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ncu9farpbyitcuo6lh2w'),(27,'Nhà trên núi','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/fuwxpeiourhte7kjxrqy'),(28,'Bắc cực','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ndfjvevzrpntzwzbkntl'),(29,'Công viên quốc gia','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/c9efjghbxhfjuumunqjf'),(30,'Lâu đài','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/lv7nrrkyog5alhhevlzs'),(31,'Hang động','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/rjo7rdfnbecoqhdwmlqj'),(32,'Mang tính lịch sử','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/rc7wyblbw1zhq4vcdpod'),(33,'Bãi biển','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/eadru9ud2p3otcmsjl4n'),(34,'Cabin','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/pazb0xui5g8jg7hvfzn4'),(35,'Nhiệt đới','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/pqih3vdon1lzm8rlilus'),(36,'Hồ','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/urgvb7loyxwp3yy5ghaa'),(37,'Lướt sóng','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/b2s8e2yihk3wfteydfdu'),(38,'Ven hồ','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/baamnfty9owo72h5oyda'),(39,'Nhà dưới lòng đất','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/udahvqhxehcuezhbb2ab'),(40,'Nhà không sử dụng điện lưới','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/tvvapjva0arrbiqd7a0a'),(41,'Vườn nho','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/giyzaolybe2mq26wpprv'),(42,'Phục vụ bữa sáng','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/xu8qysod4t0d00dzn4gw'),(43,'Trượt tuyết','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/uqjsptk0qmv6c0r2xlbb'),(44,'Xe cắm trại','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/vnnzrsan9wjvltjai023'),(45,'Luxe','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/y9uyqwbazjjwf9kbgepn'),(46,'Hanok','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/enzefudoolnntoefamjr'),(47,'Nhà phong cách Cycladic','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/tkwrrpcl5yopkw4bnm86'),(48,'Bếp của bếp trưởng','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/rjs3ib7imv0ftja7mrgo'),(49,'Cối xay gió','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/nreizfrvosooqt1mczde\n'),(50,'Ryokan','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ac1sd5jdb4srhfdc5dli\n'),(51,'Minsu','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/lqxbgfeckvpoc54p41xh'),(52,'Lều mục đồng','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/onfwuxfyioj1kpyazog3'),(53,'Casa Particular','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/oyiddvs9wc0jw78thqaf'),(54,'Tháp','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/v8d4lrpn3tedcgd1tzbb'),(55,'Nhà nông trại','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/t4rgffalvyks3rersixr'),(56,'Lều yurt','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/ebb16pqwiuqs0kfvysqt'),(57,'Hỗ trợ người dùng xe lăn','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/stwetk1lvxaj0jtildr7'),(58,'Đường trượt tuyết thẳng tới chỗ ở','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/x4fu6j8geypw09lyvp8k'),(59,'Dammuso','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/pbisip5se8cxoduyr6xd'),(60,'Nhà chỏm nón','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/zfkyqhchhgiasvp73wzr'),(61,'Riad','https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/CategoryHouse/mwcyp7hgnvncjkxol7cz');
/*!40000 ALTER TABLE `category_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comfortable`
--

DROP TABLE IF EXISTS `comfortable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comfortable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comfortable_type_id` int DEFAULT NULL,
  `description` longtext,
  `icon_path` longtext,
  PRIMARY KEY (`id`),
  KEY `FK4hig7w7jfelkyegt83uyom8dr` (`comfortable_type_id`),
  CONSTRAINT `FK4hig7w7jfelkyegt83uyom8dr` FOREIGN KEY (`comfortable_type_id`) REFERENCES `comfortable_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comfortable`
--

LOCK TABLES `comfortable` WRITE;
/*!40000 ALTER TABLE `comfortable` DISABLE KEYS */;
INSERT INTO `comfortable` VALUES (1,'Hướng nhìn ra đường chân trời thành phố',1,NULL,'M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zM15 13H9v8H4v7h24v-7h-3v4H15zm-3 10a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM28 4H4v15h3v-6a2 2 0 0 1 1.85-2H15a2 2 0 0 1 2 1.85V23h6v-2a2 2 0 0 1 1.85-2H28zM12 19a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm10-8a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z'),(2,'Máy sấy tóc',2,NULL,'M14 27v.2a4 4 0 0 1-3.8 3.8H4v-2h6.15a2 2 0 0 0 1.84-1.84L12 27zM10 1c.54 0 1.07.05 1.58.14l.38.07 17.45 3.65a2 2 0 0 1 1.58 1.79l.01.16v6.38a2 2 0 0 1-1.43 1.91l-.16.04-13.55 2.83 1.76 6.5A2 2 0 0 1 15.87 27l-.18.01h-3.93a2 2 0 0 1-1.88-1.32l-.05-.15-1.88-6.76A9 9 0 0 1 10 1zm5.7 24-1.8-6.62-1.81.38a9 9 0 0 1-1.67.23h-.33L11.76 25zM10 3a7 7 0 1 0 1.32 13.88l.33-.07L29 13.18V6.8L11.54 3.17A7.03 7.03 0 0 0 10 3zm0 2a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6z'),(3,'Sản phẩm vệ sinh',2,NULL,'M16 1c4.26 0 7.6 4.44 7.97 10h.91a2 2 0 0 1 2 2v.22l-1.79 16A2 2 0 0 1 23.26 31l-.16.01H8.9a2 2 0 0 1-1.97-1.62l-.02-.16L6.44 25H5a2 2 0 0 1-2-1.85V14a5 5 0 0 1 4.78-5h.52c.94-4.62 4-8 7.7-8zm8.21 18H17v4a2 2 0 0 1-1.85 2h-6.7l.45 4h14.2zM15 21H5v2h10zm0-10H8a3 3 0 0 0-3 2.82V19h10zm9.88 2H17v4h7.44zM16 3c-2.52 0-4.8 2.44-5.65 6H15a2 2 0 0 1 2 1.85V11h4.96c-.34-4.55-2.95-8-5.96-8z'),(4,'Dầu gội đầu',2,NULL,'M20 1v2h-3v2h1a2 2 0 0 1 2 1.85V9a4 4 0 0 1 4 3.8V27a4 4 0 0 1-3.8 4H12a4 4 0 0 1-4-3.8V13a4 4 0 0 1 3.8-4h.2V7a2 2 0 0 1 1.85-2H15V3H8V1zm2 21H10v5a2 2 0 0 0 1.85 2H20a2 2 0 0 0 2-1.85V27zm0-6H10v4h12zm-2-5h-8a2 2 0 0 0-2 1.85V14h12v-1a2 2 0 0 0-2-2zm-2-4h-4v2h4z'),(5,'Xà phòng tắm',2,NULL,'M18 1v2h-7v2h1a2 2 0 0 1 2 1.85V9.1a5 5 0 0 1 4 4.67V28a3 3 0 0 1-2.82 3H5a3 3 0 0 1-3-2.82V14a5 5 0 0 1 4-4.9V7a2 2 0 0 1 1.85-2H9V3H6V1h12zm-2 15.06c-1.14.15-2.08.6-3.58 1.55l-.34.23C9.63 19.41 8.29 20 6 20a9 9 0 0 1-2-.22V28a1 1 0 0 0 .88 1H15a1 1 0 0 0 1-.88V16.06zM27 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm-14-2H7a3 3 0 0 0-3 2.82v3.89A6.85 6.85 0 0 0 6 18c1.63 0 2.64-.36 4.4-1.46l.64-.4c2.01-1.32 3.28-1.93 4.96-2.09V14a3 3 0 0 0-3-3zm14 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25 2a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM12 7H8v2h4V7zm13-3a2 2 0 1 0 0 4 2 2 0 0 0 0-4z'),(6,'Nước nóng',2,NULL,'M16 32a12 12 0 0 0 12-12c0-6.22-3.67-12.51-10.92-18.89L16 .18l-1.08.93C7.67 7.5 4 13.78 4 20c0 6.58 5.4 12 12 12zm0-2c-5.5 0-10-4.53-10-10 0-5.33 3.12-10.88 9.42-16.65l.41-.37.17-.15.58.52c6.04 5.53 9.15 10.85 9.4 15.98l.02.34V20a10 10 0 0 1-10 10zm-3.45-5.1a8.95 8.95 0 0 1 2.12-4.92l.24-.26.44-.47a6.97 6.97 0 0 0 1.83-4.41v-.72a6.03 6.03 0 0 0-2.02-.06 4.98 4.98 0 0 1-1.44 4 10.95 10.95 0 0 0-2.87 5.02 6.03 6.03 0 0 0 1.7 1.83zM16 26h.25l.25-.02v-.14c0-1.32.51-2.58 1.46-3.53a10.98 10.98 0 0 0 3.02-5.66 6.03 6.03 0 0 0-1.8-1.74 8.97 8.97 0 0 1-2.17 5.5l-.23.25-.45.46a6.96 6.96 0 0 0-1.82 4.42v.27c.47.12.97.19 1.49.19z'),(7,'Sữa tắm',2,NULL,'M18 1v2h-7v2h1a2 2 0 0 1 2 1.85V9.1a5 5 0 0 1 4 4.67V28a3 3 0 0 1-2.82 3H5a3 3 0 0 1-3-2.82V14a5 5 0 0 1 4-4.9V7a2 2 0 0 1 1.85-2H9V3H6V1h12zm-2 15.06c-1.14.15-2.08.6-3.58 1.55l-.34.23C9.63 19.41 8.29 20 6 20a9 9 0 0 1-2-.22V28a1 1 0 0 0 .88 1H15a1 1 0 0 0 1-.88V16.06zM27 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm-14-2H7a3 3 0 0 0-3 2.82v3.89A6.85 6.85 0 0 0 6 18c1.63 0 2.64-.36 4.4-1.46l.64-.4c2.01-1.32 3.28-1.93 4.96-2.09V14a3 3 0 0 0-3-3zm14 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25 2a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM12 7H8v2h4V7zm13-3a2 2 0 1 0 0 4 2 2 0 0 0 0-4z'),(8,'Máy giặt',3,NULL,'M26.29 2a3 3 0 0 1 2.96 2.58c.5 3.56.75 7.37.75 11.42s-.25 7.86-.75 11.42a3 3 0 0 1-2.79 2.57l-.17.01H5.7a3 3 0 0 1-2.96-2.58C2.25 23.86 2 20.05 2 16s.25-7.86.75-11.42a3 3 0 0 1 2.79-2.57L5.7 2zm0 2H5.72a1 1 0 0 0-1 .86A80.6 80.6 0 0 0 4 16c0 3.96.24 7.67.73 11.14a1 1 0 0 0 .87.85l.11.01h20.57a1 1 0 0 0 1-.86c.48-3.47.72-7.18.72-11.14 0-3.96-.24-7.67-.73-11.14A1 1 0 0 0 26.3 4zM16 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm-5.84 7.5c-.34 0-.68.02-1.02.07a7 7 0 0 0 13.1 4.58 9.09 9.09 0 0 1-6.9-2.37l-.23-.23a6.97 6.97 0 0 0-4.95-2.05zM16 9a7 7 0 0 0-6.07 3.5h.23c2.26 0 4.44.84 6.12 2.4l.24.24a6.98 6.98 0 0 0 6.4 1.9A7 7 0 0 0 16 9zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(9,'Tiện nghi thiết yếu',3,'Khăn tắm, khăn trải giường, xà phòng và giấy vệ sinh','M11 1v7l1.9 20.82v.17a2.01 2.01 0 0 1-1.81 2 2 2 0 0 1-.18.01H2.92a2.01 2.01 0 0 1-1.82-2v-.09l1.9-21V1zm6 0h.15a2 2 0 0 1 1.84 1.84L19 3v7.12l-2 8V31h-2V17.96l.03-.16.03-.16L16.72 11H13V1zm11 0a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H21v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7V9h7V7h-7V5h7V3h-7V1zM9.09 9H4.9L3.1 29h7.81v-.06zM17 3h-2v6h2zM9 3H5v4h4z'),(10,'Móc treo quần áo',3,NULL,'M16 2a5 5 0 0 1 1.66 9.72 1 1 0 0 0-.65.81l-.01.13v.81l13.23 9.05a3 3 0 0 1 1.3 2.28v.2a3 3 0 0 1-3 3H3.47a3 3 0 0 1-1.69-5.48L15 13.47v-.81a3 3 0 0 1 1.82-2.76l.17-.07a3 3 0 1 0-3.99-3V7h-2a5 5 0 0 1 5-5zm0 13.21L2.9 24.17A1 1 0 0 0 3.46 26h25.07a1 1 0 0 0 .57-1.82z'),(11,'Bộ chăn ga gối',3,NULL,'M19.59 2a2 2 0 0 1 1.28.47l.13.12L29.41 11a2 2 0 0 1 .58 1.24l.01.17V25a5 5 0 0 1-4.78 5H4a2 2 0 0 1-2-1.85V7a5 5 0 0 1 4.78-5H7zM7 4a3 3 0 0 0-3 2.82V21a3 3 0 0 0 2.82 3H26v2H7a4.98 4.98 0 0 1-3-1v3h21a3 3 0 0 0 3-2.82V22H6v-2h22v-6h-5a5 5 0 0 1-5-4.78V4zm20.59 8L20 4.42V9a3 3 0 0 0 2.82 3H23z'),(12,'Thêm chăn gối',3,NULL,'M26.8 4a3 3 0 0 0-1.87.83l-.02.02-.11-.02A47.19 47.19 0 0 0 7.94 4.7l-.85.15-.02-.02A3 3 0 0 0 2 7v.21a3 3 0 0 0 .56 1.54l.03.03-.05.28a44.99 44.99 0 0 0 0 13.88l.05.28-.03.03A3 3 0 0 0 5 28h.2a3 3 0 0 0 1.87-.83l.02-.02.11.02a47.19 47.19 0 0 0 16.86.13l.85-.15.02.02A3 3 0 0 0 30 25v-.21a3 3 0 0 0-.56-1.54l-.03-.03.05-.28c.71-4.74.72-9.16 0-13.88l-.05-.28.03-.03A3 3 0 0 0 27 4h-.2zm.2 2a1 1 0 0 1 .68 1.74l-.4.36.09.54a43.3 43.3 0 0 1 0 14.72l-.1.54.4.36a1 1 0 1 1-1.52 1.27l-.37-.6-.68.15a45.29 45.29 0 0 1-18.2 0l-.68-.14-.37.59a1 1 0 1 1-1.52-1.27l.4-.36-.1-.54a43.25 43.25 0 0 1 0-14.72l.1-.54-.4-.36a1 1 0 1 1 1.52-1.27l.37.6.68-.15a45.29 45.29 0 0 1 18.2 0l.68.14.37-.59A1 1 0 0 1 27 6z'),(13,'Mành chắn sáng cho phòng',3,NULL,'M1 2V0h30v2h-2v18a2 2 0 0 1-1.85 2H17v2.17a3 3 0 1 1-2 0V22H5a2 2 0 0 1-2-1.85V2zm15 24a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM27 2H5v18h22z'),(14,'Bàn là',3,NULL,'M12 28a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM16.03 3h.3a12.5 12.5 0 0 1 11.82 9.48l.07.3 1.73 7.79.03.14A2 2 0 0 1 28.15 23H2.1a2 2 0 0 1-1.85-1.84v-7.38a5 5 0 0 1 4.77-4.77L5.25 9h9V5h-14V3zm11.53 16H2.25v2H28zM16.24 5v6H5.07a3 3 0 0 0-2.82 2.82V17H27.1l-.84-3.78-.07-.28a10.5 10.5 0 0 0-9.6-7.92L16.32 5z'),(15,'Giá phơi quần áo',3,NULL,'M16 2a5 5 0 0 1 1.66 9.72 1 1 0 0 0-.65.81l-.01.13v.81l13.23 9.05a3 3 0 0 1 1.3 2.28v.2a3 3 0 0 1-3 3H3.47a3 3 0 0 1-1.69-5.48L15 13.47v-.81a3 3 0 0 1 1.82-2.76l.17-.07a3 3 0 1 0-3.99-3V7h-2a5 5 0 0 1 5-5zm0 13.21L2.9 24.17A1 1 0 0 0 3.46 26h25.07a1 1 0 0 0 .57-1.82z'),(16,'Nơi để quần áo',3,NULL,'M25 1a3 3 0 0 1 3 2.82V26a3 3 0 0 1-2.82 3H25v2h-2v-2H9v2H7v-2a3 3 0 0 1-3-2.82V4a3 3 0 0 1 2.82-3H25zm1 20H6v5a1 1 0 0 0 .88 1H25a1 1 0 0 0 1-.88V21zm-10 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm9-20h-8v16h9V4a1 1 0 0 0-.88-1H25zM15 3H7a1 1 0 0 0-1 .88V19h9V3zm-3 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm8 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(17,'TV',4,NULL,'M9 29v-2h2v-2H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H26a5 5 0 0 1 5 4.78V20a5 5 0 0 1-4.78 5H21v2h2v2zm10-4h-6v2h6zm7-20H6a3 3 0 0 0-3 2.82V20a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3z'),(18,'Thiết bị tập thể dục',4,NULL,'M10 5a2 2 0 0 1 2 1.85V15h8V7a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V9h2a2 2 0 0 1 2 1.85V15h2v2h-2v4a2 2 0 0 1-1.85 2H26v2a2 2 0 0 1-1.85 2H22a2 2 0 0 1-2-1.85V17h-8v8a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V23H4a2 2 0 0 1-2-1.85V17H0v-2h2v-4a2 2 0 0 1 1.85-2H6V7a2 2 0 0 1 1.85-2H8zm14 2h-2v18h2zM10 7H8v18h2zm18 4h-2v10h2zM6 11H4v10h2z'),(19,'Điều hòa nhiệt độ',5,NULL,'M17 1v4.03l4.03-2.32 1 1.73L17 7.34v6.93l6-3.47V5h2v4.65l3.49-2.02 1 1.74L26 11.38l4.03 2.33-1 1.73-5.03-2.9L18 16l6 3.46 5.03-2.9 1 1.73L26 20.62l3.49 2.01-1 1.74L25 22.35V27h-2v-5.8l-6-3.47v6.93l5.03 2.9-1 1.73L17 26.97V31h-2v-4.03l-4.03 2.32-1-1.73 5.03-2.9v-6.93L9 21.2V27H7v-4.65l-3.49 2.02-1-1.74L6 20.62l-4.03-2.33 1-1.73L8 19.46 14 16l-6-3.46-5.03 2.9-1-1.73L6 11.38 2.51 9.37l1-1.74L7 9.65V5h2v5.8l6 3.47V7.34l-5.03-2.9 1-1.73L15 5.03V1z'),(20,'Camera an ninh trong nhà',6,NULL,'M23 3a2 2 0 0 1 2 1.85v1.67l5-2v11.96l-5-2V16a2 2 0 0 1-1.85 2H16.9a5 5 0 0 1-3.98 3.92A5 5 0 0 1 8.22 26H4v4H2V20h2v4h4a3 3 0 0 0 2.87-2.13A5 5 0 0 1 7.1 18H4a2 2 0 0 1-2-1.85V5a2 2 0 0 1 1.85-2H4zM12 14a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm11-9H4v11h3.1a5 5 0 0 1 9.8 0H23zm5 2.48-3 1.2v3.64l3 1.2zM7 7a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(21,'Máy báo khói',6,NULL,'M16 1a15 15 0 1 1 0 30 15 15 0 0 1 0-30zm0 2a13 13 0 1 0 0 26 13 13 0 0 0 0-26zm-4.9 14a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17zm9.8 0h2.03A7 7 0 0 1 17 22.93V20.9a5 5 0 0 0 3.9-3.9zM16 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm1-5.93A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9zm-2 0v2.03a5 5 0 0 0-3.9 3.9H9.07A7 7 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(22,'Bình chữa cháy',6,NULL,'M7 28H5V15a11 11 0 0 1 8.06-10.6 3 3 0 0 1 4.63-1.88L20.35.24l1.3 1.52L19.04 4H23v2h-4.17A3 3 0 0 1 17 7.83v.24a7 7 0 0 1 5.98 6.45l.02.24V30a2 2 0 0 1-1.85 2H11a2 2 0 0 1-2-1.85V24H7zm9-18a5 5 0 0 0-4.98 4.57l-.02.22V30h10V14.82A5 5 0 0 0 16 10zm-2.65-3.6A9 9 0 0 0 7 14.73V22h2v-7.26a7 7 0 0 1 6-6.67v-.24a3.01 3.01 0 0 1-1.65-1.43zM16 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2z'),(23,'Bộ sơ cứu',6,NULL,'M26 3a5 5 0 0 1 5 4.78V24a5 5 0 0 1-4.78 5H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H6zm0 2H6a3 3 0 0 0-3 2.82V24a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3zm-7 4v4h4v6h-4v4h-6v-4H9v-6h4V9zm-2 2h-2v4h-4v2h4v4h2v-4h4v-2h-4z'),(24,'Wi-fi',7,NULL,'M16 20.33a3.67 3.67 0 1 1 0 7.34 3.67 3.67 0 0 1 0-7.34zm0 2a1.67 1.67 0 1 0 0 3.34 1.67 1.67 0 0 0 0-3.34zM16 15a9 9 0 0 1 8.04 4.96l-1.51 1.51a7 7 0 0 0-13.06 0l-1.51-1.51A9 9 0 0 1 16 15zm0-5.33c4.98 0 9.37 2.54 11.94 6.4l-1.45 1.44a12.33 12.33 0 0 0-20.98 0l-1.45-1.45A14.32 14.32 0 0 1 16 9.66zm0-5.34c6.45 0 12.18 3.1 15.76 7.9l-1.43 1.44a17.64 17.64 0 0 0-28.66 0L.24 12.24c3.58-4.8 9.3-7.9 15.76-7.9z'),(25,'Không gian riêng để làm việc',7,NULL,'M26 2a1 1 0 0 1 .92.61l.04.12 2 7a1 1 0 0 1-.85 1.26L28 11h-3v5h6v2h-2v13h-2v-2.54a3.98 3.98 0 0 1-1.73.53L25 29H7a3.98 3.98 0 0 1-2-.54V31H3V18H1v-2h5v-4a1 1 0 0 1 .88-1h.36L6.09 8.4l1.82-.8L9.43 11H12a1 1 0 0 1 1 .88V16h10v-5h-3a1 1 0 0 1-.99-1.16l.03-.11 2-7a1 1 0 0 1 .84-.72L22 2h4zm1 16H5v7a2 2 0 0 0 1.7 1.98l.15.01L7 27h18a2 2 0 0 0 2-1.85V18zm-16-5H8v3h3v-3zm14.24-9h-2.49l-1.43 5h5.35l-1.43-5z'),(26,'Bếp',8,'Không gian cho khách tự nấu ăn','M26 1a5 5 0 0 1 5 5c0 6.39-1.6 13.19-4 14.7V31h-2V20.7c-2.36-1.48-3.94-8.07-4-14.36v-.56A5 5 0 0 1 26 1zm-9 0v18.12c2.32.55 4 3 4 5.88 0 3.27-2.18 6-5 6s-5-2.73-5-6c0-2.87 1.68-5.33 4-5.88V1zM2 1h1c4.47 0 6.93 6.37 7 18.5V21H4v10H2zm14 20c-1.6 0-3 1.75-3 4s1.4 4 3 4 3-1.75 3-4-1.4-4-3-4zM4 3.24V19h4l-.02-.96-.03-.95C7.67 9.16 6.24 4.62 4.22 3.36L4.1 3.3zm19 2.58v.49c.05 4.32 1.03 9.13 2 11.39V3.17a3 3 0 0 0-2 2.65zm4-2.65V17.7c.99-2.31 2-7.3 2-11.7a3 3 0 0 0-2-2.83z'),(27,'Tủ lạnh',8,NULL,'M25 1a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H7a2 2 0 0 1-2-1.85V3a2 2 0 0 1 1.85-2H7zm0 10H7v18h18zm-15 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM25 3H7v6h18zM10 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(28,'Đồ nấu ăn cơ bản',8,'Nồi chảo, dầu ăn, muối và tiêu','M26 1a5 5 0 0 1 5 5c0 6.39-1.6 13.19-4 14.7V31h-2V20.7c-2.36-1.48-3.94-8.07-4-14.36v-.56A5 5 0 0 1 26 1zm-9 0v18.12c2.32.55 4 3 4 5.88 0 3.27-2.18 6-5 6s-5-2.73-5-6c0-2.87 1.68-5.33 4-5.88V1zM2 1h1c4.47 0 6.93 6.37 7 18.5V21H4v10H2zm14 20c-1.6 0-3 1.75-3 4s1.4 4 3 4 3-1.75 3-4-1.4-4-3-4zM4 3.24V19h4l-.02-.96-.03-.95C7.67 9.16 6.24 4.62 4.22 3.36L4.1 3.3zm19 2.58v.49c.05 4.32 1.03 9.13 2 11.39V3.17a3 3 0 0 0-2 2.65zm4-2.65V17.7c.99-2.31 2-7.3 2-11.7a3 3 0 0 0-2-2.83z'),(29,'Bát đĩa và đồ bạc',8,'Bát, đũa, đĩa, cốc, v.v.','M29 1v2a13 13 0 0 0-.3 26h.3v2a15 15 0 0 1-.31-30zM3 1h2v6h2V1h2v6h2V1h2v9a5 5 0 0 1-4 4.9V31H7V14.9a5.01 5.01 0 0 1-3.98-4.44L3 10.22V10zm26 6v2a7 7 0 0 0-.24 14H29v2a9 9 0 0 1-.27-18zM11 9H5v1.15a3 3 0 0 0 6 .03V10z'),(30,'Ấm đun nước nóng',8,NULL,'M26 28v2H6v-2h20zM16 1a8.64 8.64 0 0 1 7.83 5H28a1 1 0 0 1 1 1.08c-.3 3.87-1.58 6.45-3.9 7.56l.9 10.27a1 1 0 0 1-.88 1.08L25 26H7a1 1 0 0 1-1-.97v-.12L7.4 8.9c.02-.3.06-.6.12-.89H5a1 1 0 0 0-1 .88V19H2V9a3 3 0 0 1 2.82-3h3.35A8.64 8.64 0 0 1 16 1zm6.43 7H9.57a6.65 6.65 0 0 0-.14.7l-.04.36L8.1 24h15.82L22.6 9.06A6.67 6.67 0 0 0 22.43 8zm-5.45 3a9.82 9.82 0 0 1-2.7 5.78l-.23.24A6.96 6.96 0 0 0 12.07 21h-2.02a8.96 8.96 0 0 1 2.36-5.16l.23-.23A7.99 7.99 0 0 0 14.97 11h2.01zm4 0 .02.5a9.6 9.6 0 0 1-2.72 6.28l-.23.24A6.97 6.97 0 0 0 16.28 21h-2.06a8.96 8.96 0 0 1 2.19-4.16l.22-.23C18.09 15.16 19 13.2 19 11.5a4.94 4.94 0 0 0-.03-.5h2.01zm5.9-3h-2.4l.1.63.02.26.3 3.51c.99-.79 1.64-2.16 1.96-4.17l.03-.23zM16 3a6.63 6.63 0 0 0-5.55 3h11.1a6.63 6.63 0 0 0-5.04-2.98L16.23 3H16z'),(31,'Bàn ăn',8,NULL,'M31 9v21h-2v-7h-6v7h-2v-7a2 2 0 0 1 1.85-2H29V9h2zM3 9v12h6a2 2 0 0 1 2 1.85V30H9v-7H3v7H1V9h2zm14-2v2.08a6 6 0 0 1 5 5.7V15h5v2H17v13h-2V17H5v-2h5a6 6 0 0 1 5-5.92V7h2zm-1 4a4 4 0 0 0-4 3.8v.2h8a4 4 0 0 0-4-4z'),(32,'Sân hoặc ban công',9,NULL,'M23 1a2 2 0 0 1 2 1.85V19h4v2h-2v8h2v2H3v-2h2v-8H3v-2h4V3a2 2 0 0 1 1.85-2H9zM9 21H7v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm-10-8H9v6h6zm8 0h-6v6h6zM15 3H9v8h6zm8 0h-6v8h6z'),(33,'Chỗ đỗ xe miễn phí tại nơi ở',10,NULL,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z'),(34,'Miễn phí đỗ xe trên đường/phố',10,NULL,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z'),(35,'Bể bơi',10,NULL,'M24 26c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 28c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 26zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 23c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 21zM20 3a4 4 0 0 1 4 3.8V9h4v2h-4v5a4 4 0 0 1 2.5.86l.17.15c.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 18c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 16c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5a3.96 3.96 0 0 1 2.44-1H16v-5H4V9h12V7a2 2 0 0 0-4-.15V7h-2a4 4 0 0 1 7-2.65A3.98 3.98 0 0 1 20 3zm-2 13.52.46.31.21.18c.35.31.83.49 1.33.49a2 2 0 0 0 1.2-.38l.13-.11c.2-.19.43-.35.67-.49V11h-4zM20 5a2 2 0 0 0-2 1.85V9h4V7a2 2 0 0 0-2-2z'),(36,'Phòng thể hình chung trong tòa nhà',10,NULL,'M10 5a2 2 0 0 1 2 1.85V15h8V7a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V9h2a2 2 0 0 1 2 1.85V15h2v2h-2v4a2 2 0 0 1-1.85 2H26v2a2 2 0 0 1-1.85 2H22a2 2 0 0 1-2-1.85V17h-8v8a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V23H4a2 2 0 0 1-2-1.85V17H0v-2h2v-4a2 2 0 0 1 1.85-2H6V7a2 2 0 0 1 1.85-2H8zm14 2h-2v18h2zM10 7H8v18h2zm18 4h-2v10h2zM6 11H4v10h2z'),(37,'Chỗ đỗ xe ngoài khuôn viên, có thu phí',10,NULL,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z'),(38,'Chỗ đỗ xe có thu phí trong khuôn viên',10,NULL,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z'),(39,'Cho phép ở dài hạn',11,'Cho phép ở từ 28 ngày trở lên','M11.67 0v1.67h8.66V0h2v1.67h6a2 2 0 0 1 2 1.85v16.07a2 2 0 0 1-.46 1.28l-.12.13L21 29.75a2 2 0 0 1-1.24.58H6.67a5 5 0 0 1-5-4.78V3.67a2 2 0 0 1 1.85-2h6.15V0zm16.66 11.67H3.67v13.66a3 3 0 0 0 2.82 3h11.18v-5.66a5 5 0 0 1 4.78-5h5.88zm-.08 8h-5.58a3 3 0 0 0-3 2.82v5.76zm-18.58-16h-6v6h24.66v-6h-6v1.66h-2V3.67h-8.66v1.66h-2z'),(40,'Tự nhận phòng',11,NULL,'M16.84 27.16v-3.4l-.26.09c-.98.32-2.03.51-3.11.55h-.7A11.34 11.34 0 0 1 1.72 13.36v-.59A11.34 11.34 0 0 1 12.77 1.72h.59c6.03.16 10.89 5.02 11.04 11.05V13.45a11.3 11.3 0 0 1-.9 4.04l-.13.3 7.91 7.9v5.6H25.7l-4.13-4.13zM10.31 7.22a3.1 3.1 0 1 1 0 6.19 3.1 3.1 0 0 1 0-6.2zm0 2.06a1.03 1.03 0 1 0 0 2.06 1.03 1.03 0 0 0 0-2.06zM22.43 25.1l4.12 4.13h2.67v-2.67l-8.37-8.37.37-.68.16-.3c.56-1.15.9-2.42.96-3.77v-.64a9.28 9.28 0 0 0-9-9h-.55a9.28 9.28 0 0 0-9 9v.54a9.28 9.28 0 0 0 13.3 8.1l.3-.16 1.52-.8v4.62z'),(41,'Khóa thông minh',11,NULL,'M25 1a2 2 0 0 1 2 1.85V29h2v2H3v-2h2V3a2 2 0 0 1 1.85-2H7zm0 2H7v26h18zm-9 6a3 3 0 0 1 3 2.82V14a5 5 0 1 1-6 0v-2a3 3 0 0 1 3-3zm0 6a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-6a1 1 0 0 0-1 .88V13.1a5.02 5.02 0 0 1 2 0V12a1 1 0 0 0-1-1z'),(42,'Có dịch vụ dọn vệ sinh trong thời gian ở',11,NULL,'M24 0v6h-4.3c.13 1.4.67 2.72 1.52 3.78l.2.22-1.5 1.33a9.05 9.05 0 0 1-2.2-5.08c-.83.38-1.32 1.14-1.38 2.2v4.46l4.14 4.02a5 5 0 0 1 1.5 3.09l.01.25.01.25v8.63a3 3 0 0 1-2.64 2.98l-.18.01-.21.01-12-.13A3 3 0 0 1 4 29.2L4 29.02v-8.3a5 5 0 0 1 1.38-3.45l.19-.18L10 12.9V8.85l-4.01-3.4.02-.7A5 5 0 0 1 10.78 0H11zm-5.03 25.69a8.98 8.98 0 0 1-6.13-2.41l-.23-.23A6.97 6.97 0 0 0 6 21.2v7.82c0 .51.38.93.87 1H7l11.96.13h.13a1 1 0 0 0 .91-.88l.01-.12v-3.52c-.34.04-.69.06-1.03.06zM17.67 2H11a3 3 0 0 0-2.92 2.3l-.04.18-.01.08 3.67 3.1h2.72l.02-.1a4.29 4.29 0 0 1 3.23-3.4zM30 4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-3-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5 0h-2.33v2H22zm8-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM20 20.52a3 3 0 0 0-.77-2l-.14-.15-4.76-4.61v-4.1H12v4.1l-5.06 4.78a3 3 0 0 0-.45.53 9.03 9.03 0 0 1 7.3 2.34l.23.23A6.98 6.98 0 0 0 20 23.6z'),(43,'Máy phát hiện khí CO',12,'Chỗ ở này có thể không có máy phát hiện khí CO. Hãy liên hệ với chủ nhà nếu bạn có bất kỳ câu hỏi nào.','M2.05 6.3 4 8.23V25a3 3 0 0 0 2.82 3h16.94l1.95 1.95c-.16.02-.33.04-.5.04L25 30H7a5 5 0 0 1-5-4.78V7c0-.24.02-.48.05-.7zm1.66-4 26 26-1.42 1.4-26-26 1.42-1.4zM25 2a5 5 0 0 1 5 4.78V25a5 5 0 0 1-.05.7L28 23.77V7a3 3 0 0 0-2.82-3H8.24L6.3 2.05c.16-.02.33-.04.5-.04L7 2h18zM11.1 17a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17h2.03zm5.9 4.24 1.35 1.36a6.95 6.95 0 0 1-1.35.33v-1.69zM21.24 17h1.69c-.07.47-.18.92-.34 1.35L21.24 17zM17 9.07A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9V9.07zm-7.6 4.58L10.76 15H9.07c.07-.47.18-.92.33-1.35zM15 9.07v1.69L13.65 9.4A6.95 6.95 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(44,'Lối vào riêng',12,NULL,'m5 9.24 2 2V29h17.76l2 2H3v-2h2V9.24zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zM25 1a2 2 0 0 1 2 1.85v19.91l-2-2V3H7.24L5.71 1.47A2 2 0 0 1 6.85 1H25zm-3 14a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(45,'Hệ thống sưởi',12,NULL,'m11 15.24 2 2v1.54l-.43.3a6 6 0 1 0 9.11 6.85l1.54 1.53a8 8 0 1 1-12.47-9.5l.25-.2v-2.52zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zM15 19.24l5 5a4 4 0 1 1-5-4.11v-.89zM16 22a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm0-22a5 5 0 0 1 5 4.78v11.98l-2-2V11h-3.76l-.24-.24V9h4V7h-4V5h4a3 3 0 0 0-6-.18v3.94l-2-2V5A5 5 0 0 1 15.56.02l.22-.01L16 0z'),(46,'Hướng nhìn ra công viên',1,NULL,'M16 1a5 5 0 0 1 5 5 5 5 0 0 1 0 10 5 5 0 0 1-4 4.9v4.29A9.04 9.04 0 0 1 23.95 22a8.94 8.94 0 0 1 3.74.81l.31.15v2.33A6.96 6.96 0 0 0 23.95 24a6.88 6.88 0 0 0-6.93 5.87l-.02.15v.1a1 1 0 0 1-.88.87L16 31a1 1 0 0 1-.97-.77l-.02-.12A6.95 6.95 0 0 0 7.97 24 6.96 6.96 0 0 0 4 25.23v-2.31a9.16 9.16 0 0 1 11 2.3V20.9a5 5 0 0 1-4-4.68V16h-.22a5 5 0 0 1 0-10H11v-.22A5 5 0 0 1 16 1zm2.86 14.1a4.98 4.98 0 0 1-5.72 0l-.07.23a3 3 0 1 0 5.85 0zM11 8a3 3 0 1 0 .67 5.93l.23-.07A4.98 4.98 0 0 1 11 11c0-1.06.33-2.05.9-2.86l-.23-.07A3.01 3.01 0 0 0 11 8zm10 0c-.23 0-.45.03-.67.07l-.23.07c.57.8.9 1.8.9 2.86a4.98 4.98 0 0 1-.9 2.86l.23.07A3 3 0 1 0 21 8zm-5 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0-5a3 3 0 0 0-2.93 3.67l.07.23a4.98 4.98 0 0 1 5.72 0l.07-.23A3 3 0 0 0 16 3z'),(47,'Hướng nhìn ra vườn',1,NULL,'M16 1a5 5 0 0 1 5 5 5 5 0 0 1 0 10 5 5 0 0 1-4 4.9v4.29A9.04 9.04 0 0 1 23.95 22a8.94 8.94 0 0 1 3.74.81l.31.15v2.33A6.96 6.96 0 0 0 23.95 24a6.88 6.88 0 0 0-6.93 5.87l-.02.15v.1a1 1 0 0 1-.88.87L16 31a1 1 0 0 1-.97-.77l-.02-.12A6.95 6.95 0 0 0 7.97 24 6.96 6.96 0 0 0 4 25.23v-2.31a9.16 9.16 0 0 1 11 2.3V20.9a5 5 0 0 1-4-4.68V16h-.22a5 5 0 0 1 0-10H11v-.22A5 5 0 0 1 16 1zm2.86 14.1a4.98 4.98 0 0 1-5.72 0l-.07.23a3 3 0 1 0 5.85 0zM11 8a3 3 0 1 0 .67 5.93l.23-.07A4.98 4.98 0 0 1 11 11c0-1.06.33-2.05.9-2.86l-.23-.07A3.01 3.01 0 0 0 11 8zm10 0c-.23 0-.45.03-.67.07l-.23.07c.57.8.9 1.8.9 2.86a4.98 4.98 0 0 1-.9 2.86l.23.07A3 3 0 1 0 21 8zm-5 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0-5a3 3 0 0 0-2.93 3.67l.07.23a4.98 4.98 0 0 1 5.72 0l.07-.23A3 3 0 0 0 16 3z'),(48,'Dầu xả',2,NULL,'M20 1v2h-3v2h1a2 2 0 0 1 2 1.85V9a4 4 0 0 1 4 3.8V27a4 4 0 0 1-3.8 4H12a4 4 0 0 1-4-3.8V13a4 4 0 0 1 3.8-4h.2V7a2 2 0 0 1 1.85-2H15V3H8V1zm2 21H10v5a2 2 0 0 0 1.85 2H20a2 2 0 0 0 2-1.85V27zm0-6H10v4h12zm-2-5h-8a2 2 0 0 0-2 1.85V14h12v-1a2 2 0 0 0-2-2zm-2-4h-4v2h4z'),(49,'Bồn cầu vệ sinh thông minh',2,NULL,'M10 2a3 3 0 0 1 3 2.82V16h14a1 1 0 0 1 1 .88V17a8 8 0 0 1-7.75 8h-4.77l1.45 3.63a1 1 0 0 1-.7 1.35l-.11.01L16 30H4a1 1 0 0 1-1-.88V5a3 3 0 0 1 2.82-3H10zm15.91 16H5v10h9.52l-1.45-3.63a1 1 0 0 1 .7-1.35l.11-.01L14 23h6a6 6 0 0 0 5.85-4.67l.05-.23.01-.1zM10 4H6a1 1 0 0 0-1 .88V16h6V5a1 1 0 0 0-.77-.97L10.12 4 10 4zm11 9a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-8 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm6-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(50,'Kết nối Ethernet',4,NULL,'M24 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H19v-2h5a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3H8a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H15v-8h-2a2 2 0 0 1-2-1.85V13a2 2 0 0 1 1.85-2H19a2 2 0 0 1 2 1.85V19a2 2 0 0 1-1.85 2H17v8a2 2 0 0 1-1.85 2H8a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H8zm-5 12h-6v6h2v-4h2v4h2z'),(51,'Máy chơi điện tử',4,NULL,'M30 2v2h-8a5 5 0 0 0-5 4.78V14h9a4 4 0 0 1 4 3.8V26a4 4 0 0 1-3.8 4H6a4 4 0 0 1-4-3.8V18a4 4 0 0 1 3.8-4H15V9a7 7 0 0 1 6.76-7H30zm-4 14H6a2 2 0 0 0-2 1.85V26a2 2 0 0 0 1.85 2H26a2 2 0 0 0 2-1.85V18a2 2 0 0 0-1.85-2H26zm-15 3v2h2v2h-2v2H9v-2H7v-2h2v-2h2zm13 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(52,'Quạt trần',5,NULL,'M20.33 3.08c1.5 2.24.96 5.55-1.38 9.9l-.12.2.18.18c.1.13.21.26.3.4l.23.38.14.02c.7.06 1.78-.11 2.87-.48.89-.3 1.78-.78 2.68-1.45l.66-.52a3 3 0 0 1 4.77 1.33l.12.44c.59 3.35.02 5.73-1.86 6.98-2.24 1.5-5.54.96-9.9-1.39a3 3 0 0 1-.27-.16l-.07.07-.39.3-.28.19V20c-.03.7.15 1.68.48 2.68.3.88.78 1.78 1.45 2.68l.26.33.26.33a3 3 0 0 1-.36 4.22C19 31 17.95 31 17 31h-.54l-1.39-.1c-1.24-.19-2.56-.65-3.36-1.84-1.5-2.25-.96-5.55 1.39-9.91.04-.09.1-.17.15-.25a4.12 4.12 0 0 1-.37-.4.82.82 0 0 0-.18-.23.5.5 0 0 0-.21-.11c-.7-.1-1.85.06-3.04.46-.88.3-1.78.78-2.68 1.45l-.66.52a3 3 0 0 1-4.77-1.33l-.12-.44c-.59-3.35-.02-5.73 1.86-6.98 2.24-1.5 5.55-.96 9.9 1.38l.1.05c.3-.3.55-.5.72-.61l.2-.13.03-.2c.06-.7-.11-1.78-.48-2.88a9.6 9.6 0 0 0-1.45-2.68l-.52-.66a3 3 0 0 1 1.33-4.77l.44-.12c3.35-.59 5.73-.02 6.98 1.86zm-5.31 16.8-.16.22c-2.04 3.77-2.5 6.45-1.49 7.85 1.13 1.55 4.63 1.55 5.44.77.38-.36.47-.89.2-1.31l-.37-.45a11.94 11.94 0 0 1-2.05-3.64 10.93 10.93 0 0 1-.59-3.03V20h-.14a4.01 4.01 0 0 1-.63-.07l-.21-.05zM4.09 13.52c-1.56 1.13-1.56 4.63-.78 5.44.36.38.9.46 1.32.19l.44-.36c1.2-.96 2.42-1.64 3.65-2.05 1.16-.4 2.33-.6 3.28-.6V16c0-.14 0-.28.02-.42l.08-.46-.16-.12c-3.78-2.03-6.46-2.5-7.85-1.48zm23.24-.36-.45.36c-1.2.96-2.41 1.64-3.64 2.05-1.15.38-2.3.6-3.24.6-.01.25-.05.5-.1.74l-.07.26.19.14c3.77 2.03 6.45 2.5 7.85 1.48 1.55-1.13 1.55-4.63.78-5.44-.36-.38-.9-.47-1.32-.19zM16 14a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM13.2 3.39c-.37.36-.46.89-.18 1.31l.36.45c.95 1.2 1.64 2.42 2.05 3.64.37 1.14.59 2.27.59 3.2l.54.05.3.05.2.05.1-.13c2.04-3.77 2.5-6.45 1.49-7.84-1.13-1.56-4.63-1.56-5.44-.78z'),(53,'Quạt cầm tay',5,NULL,'M16 2a10 10 0 0 1 1 19.95V28h6v2H9v-2h6v-6.05A10 10 0 0 1 16 2zm1.44 12.63a2.98 2.98 0 0 1-1.22.36L16 15v.01a2.51 2.51 0 0 0-2.5 2.52c0 1.17.78 2.16 1.85 2.44a7.99 7.99 0 0 0 6.96-3.05 4.61 4.61 0 0 1-4.87-2.29zM10.52 10a2.52 2.52 0 0 0-2.5 2.16l-.02.1a8 8 0 0 0 3.66 6.46 4.53 4.53 0 0 1-.16-1.19c0-1.59.82-2.99 2.05-3.8a3 3 0 0 1-.46-1l-.05-.24-.01-.12-.03-.3A2.52 2.52 0 0 0 10.52 10zm10.95 5a2.52 2.52 0 0 0 2.47-1.98 8 8 0 0 0-4.24-8.11c.2.5.3 1.05.3 1.62a4.53 4.53 0 0 1-1.7 3.54 3 3 0 0 1 .6 2.68v-.07A2.56 2.56 0 0 0 21.47 15zM16 11a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-.32-7a8 8 0 0 0-6.77 4.3l.16-.07A4.54 4.54 0 0 1 10.52 8c1.43 0 2.72.67 3.55 1.7A2.98 2.98 0 0 1 16 9a2.52 2.52 0 0 0 2-2.48 2.52 2.52 0 0 0-2.16-2.5l-.16-.01z'),(54,'Tủ đông',8,NULL,'M25 1a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H7a2 2 0 0 1-2-1.85V3a2 2 0 0 1 1.85-2H7zm0 10H7v18h18zm-15 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM25 3H7v6h18zM10 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(55,'Bếp điện',8,NULL,'M27 0a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V2a2 2 0 0 1 1.85-2H5zm0 2H5v26h22zm-3 22a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.33 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.34 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 24a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm13-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm-10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM21 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4z'),(56,'Sân sau chung – Có hàng rào kín',9,'Không gian ngoài trời tại chỗ ở thường có cỏ bao phủ','M27 0a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V2a2 2 0 0 1 1.85-2H5zm0 2H5v26h22zm-3 22a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.33 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.34 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 24a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm13-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm-10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM21 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4z'),(57,'Khu vực ăn uống ngoài trời',9,NULL,'M29 15v16h-2v-6h-6v6h-2v-6.15a2 2 0 0 1 1.84-1.84L21 23h6v-8zM5 15v8h6a2 2 0 0 1 2 1.85V31h-2v-6H5v6H3V15zM16 1a15 15 0 0 1 13.56 8.57 1 1 0 0 1-.8 1.42l-.1.01H17v8h8v2h-8v10h-2V21H7v-2h8v-8H3.35a1 1 0 0 1-.95-1.32l.04-.1A15 15 0 0 1 16 1zm0 2A13 13 0 0 0 5.4 8.47l-.2.28-.16.25h21.92l-.17-.25a13 13 0 0 0-10.1-5.73L16.34 3z'),(59,'Máy giặt',12,NULL,'m2 6.24 2 2V28h19.76l2 2H4a2 2 0 0 1-2-1.85V6.24zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zM28 2a2 2 0 0 1 2 1.85v21.91l-2-2V4H8.24l-2-2H28zM7.88 12.12l2.38 2.38h-.1c-.34 0-.68.02-1.02.07a7 7 0 0 0 9.21 8.03l1.53 1.52a9 9 0 0 1-12-12zM16 7a9 9 0 0 1 8.12 12.88l-2.7-2.7h.05a7 7 0 0 0 1.45-.14 7 7 0 0 0-9.27-7.63l-1.53-1.53A8.96 8.96 0 0 1 16 7z'),(60,'Máy báo khói',12,'Chỗ ở không có máy báo khói.','M24 26c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 28c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 26zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 23c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 21zM20 3a4 4 0 0 1 4 3.8V9h4v2h-4v5a4 4 0 0 1 2.5.86l.17.15c.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 18c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 16c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5a3.96 3.96 0 0 1 2.44-1H16v-5H4V9h12V7a2 2 0 0 0-4-.15V7h-2a4 4 0 0 1 7-2.65A3.98 3.98 0 0 1 20 3zm-2 13.52.46.31.21.18c.35.31.83.49 1.33.49a2 2 0 0 0 1.2-.38l.13-.11c.2-.19.43-.35.67-.49V11h-4zM20 5a2 2 0 0 0-2 1.85V9h4V7a2 2 0 0 0-2-2z'),(61,'Máy sấy',3,NULL,'M26.29 2a3 3 0 0 1 2.96 2.58c.5 3.56.75 7.37.75 11.42s-.25 7.86-.75 11.42a3 3 0 0 1-2.79 2.57l-.17.01H5.7a3 3 0 0 1-2.96-2.58C2.25 23.86 2 20.05 2 16s.25-7.86.75-11.42a3 3 0 0 1 2.79-2.57L5.7 2zm0 2H5.72a1 1 0 0 0-1 .86A80.6 80.6 0 0 0 4 16c0 3.96.24 7.67.73 11.14a1 1 0 0 0 .87.85l.11.01h20.57a1 1 0 0 0 1-.86c.48-3.47.72-7.18.72-11.14 0-3.96-.24-7.67-.73-11.14a1 1 0 0 0-.87-.85zM16 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm0 2a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm-4.8 5.58c1.36.2 2.64.8 3.68 1.75l.46.45a8.97 8.97 0 0 0 4.62 2.28 5.02 5.02 0 0 1-2.01 1.55 10.98 10.98 0 0 1-4.26-2.65 4.96 4.96 0 0 0-2.66-1.38 4.68 4.68 0 0 1 .17-2zm3.09-3.28c1.34.55 2.58 1.36 3.64 2.42a4.97 4.97 0 0 0 3 1.44 4.99 4.99 0 0 1-.07 2 6.97 6.97 0 0 1-4.11-1.8l-.47-.45a8.96 8.96 0 0 0-4.07-2.17 5 5 0 0 1 2.08-1.44zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(62,'Hệ thống âm thanh Bluetooth',4,NULL,'M24 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H8a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H8zm0 2H8a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H24a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3zm-8 10a7 7 0 1 1 0 14 7 7 0 0 1 0-14zm0 2a5 5 0 1 0 0 10 5 5 0 0 0 0-10zm0 2a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm0-14a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z'),(63,'Lò vi sóng',8,NULL,'M29 3a2 2 0 0 1 2 1.85V27a2 2 0 0 1-1.85 2H3a2 2 0 0 1-2-1.85V5a2 2 0 0 1 1.85-2H3zm0 2H3v22h26zm-6 2v18H5V7zm-2 2H7v14h3a4.97 4.97 0 0 1-1-2.72V17h10v3a4.98 4.98 0 0 1-1 3h3zm-4 10h-6v1a3 3 0 0 0 2.65 2.98l.17.01.18.01a3 3 0 0 0 3-2.82V20zm9-8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(64,'Tủ đông',8,NULL,'M25 1a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H7a2 2 0 0 1-2-1.85V3a2 2 0 0 1 1.85-2H7zm0 10H7v18h18zm-15 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM25 3H7v6h18zM10 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(65,'Máy nướng bánh mỳ',8,NULL,'M20.93 2a3.93 3.93 0 0 1 3.93 3.93c0 .87-.29 1.7-.83 2.4l-.03.04V10a5 5 0 0 1 5 4.78V27a2 2 0 0 1-1.85 2H26v1h-2v-1H8v1H6v-1H5a2 2 0 0 1-2-1.85V17H1v-2h2a5 5 0 0 1 4.78-5H8V8.38a3.93 3.93 0 0 1 0-4.9l.14-.17.15-.16a3.93 3.93 0 0 1 2.56-1.14l.22-.01h9.86zM24 12H8a3 3 0 0 0-3 2.82V27h22V15a3 3 0 0 0-2.82-3H24zM8 23a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM20.93 4h-9.86a1.93 1.93 0 0 0-1.36 3.3 1 1 0 0 1 .28.57L10 8v2h12V8a1 1 0 0 1 .12-.48l.07-.1.08-.1.12-.13a1.93 1.93 0 0 0-1.31-3.18L20.93 4z'),(66,'Máy xay sinh tố',8,NULL,'M23 1a1 1 0 0 1 1 .88V6l-.02.2-2.9 14.53a5 5 0 0 1 2.31 3.4l.04.25.56 4.5a1 1 0 0 1-.87 1.11L23 30H9a1 1 0 0 1-1-1v-.12l.57-4.5a5 5 0 0 1 2.36-3.65L8.18 7H7a1 1 0 0 0-1 .88V15H4V8a3 3 0 0 1 2.82-3H8V2a1 1 0 0 1 .88-1H23zm-9.5 21a3 3 0 0 0-2.92 2.45l-.03.18-.42 3.37h11.74l-.42-3.37a3 3 0 0 0-2.62-2.6L18.5 22h-5zm2.5 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm5.78-17H10.22l2.6 13H15v-9h2v9h2.18l2.6-13zM22 3H10v2h12V3z'),(67,'Nồi cơm điện',8,NULL,'M21 3a9 9 0 0 1 9 8.73V16h1v2h-1v9a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V18H1v-2h1v-4a9 9 0 0 1 8.73-9H11zm7 11H4v13h24zm-8 2v2h-8v-2zM9 16a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm14 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM21 5H11a7 7 0 0 0-7 6.76V12h7V8h10v4h7a7 7 0 0 0-6.76-7zm-2 5h-6v2h6z'),(68,'Cà phê',8,NULL,'M25 2a1 1 0 0 1 .94.65l.03.1 1 4A1 1 0 0 1 26.11 8L26 8h-9v2h-2V8H5v20h3a5 5 0 0 1-.72-4.66l.1-.26 2.52-6.04-1.8-3.6a1 1 0 0 1 .78-1.43L9 12h14a1 1 0 0 1 .94 1.34l-.05.1L22.62 16H24a5 5 0 0 1 5 4.78V25h-2v-4a3 3 0 0 0-2.82-3H22.5l2.12 5.08A5 5 0 0 1 24 28h3v2H4a1 1 0 0 1-1-.88V3a1 1 0 0 1 .88-1H4zM12.65 22a6.64 6.64 0 0 0-2.91.63l-.5 1.22a3 3 0 0 0-.2.68l-.03.23L9 25a3 3 0 0 0 2.82 3h8.19l.23-.01a3 3 0 0 0 2.6-2.02c-1.7-.12-2.93-.67-4.84-1.9l-.37-.23c-2.14-1.4-3.18-1.84-4.98-1.84zm7.68-4h-8.66l-.92 2.19a9.06 9.06 0 0 1 1.9-.19c2.19 0 3.51.52 5.75 1.95l.38.25c1.74 1.13 2.74 1.62 4.03 1.76l-.04-.11zm1.05-4H10.62l1 2h8.76zm2.84-10H5v2h19.72z'),(69,'Thang máy',10,NULL,'M30 1a1 1 0 0 1 1 .88V30a1 1 0 0 1-.88 1H2a1 1 0 0 1-1-.88V2a1 1 0 0 1 .88-1H2zM3 3v26h12V3zm7 9v6.58l1.8-1.79 1.4 1.42-3.5 3.5a1 1 0 0 1-1.31.08l-.1-.08-3.5-3.5 1.42-1.42L8 18.6V12zm12.39-1.5a1 1 0 0 1 1.22 0l.1.09 3.5 3.5-1.42 1.41L24 13.7V20h-2v-6.3l-1.8 1.8-1.4-1.41 3.5-3.5zM17 29h12V3H17z'),(70,'Cho phép gửi hành lý',11,NULL,'M30 29v2H2v-2zM20 1a2 2 0 0 1 2 1.85V5h3a5 5 0 0 1 5 4.78V22a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V10a5 5 0 0 1 4.78-5H10V3a2 2 0 0 1 1.85-2H12zm5 6H7a3 3 0 0 0-3 2.82V22a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V10a3 3 0 0 0-3-3zm-8 2v9.5l3.3-3.3 1.4 1.42-4.64 4.65-.11.1a1.5 1.5 0 0 1-1.9 0l-.11-.1-4.65-4.65 1.42-1.41L15 18.5V9zm3-6h-8v2h8z'),(71,'Bàn phím',11,'Tự vào nhà bằng mã số vào cửa','M24 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H8a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H8zm0 2H8a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H24a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3zm-8 14a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm-2-6.54a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM16 9a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm8 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-2-3.46a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z'),(72,'Camera an ninh trong nhà',12,NULL,'m2 6.24 2 2V16h3.1a5 5 0 0 1 1.76-2.9l1.43 1.43a3 3 0 1 0 4.18 4.18l1.42 1.43a5 5 0 0 1-2.97 1.78A5 5 0 0 1 8.22 26H4v4H2V20h2v4h4a3 3 0 0 0 2.87-2.13A5 5 0 0 1 7.1 18H4a2 2 0 0 1-2-1.85V6.24zM3.7 2.3l26 26-1.4 1.42-26-26 1.4-1.42zM7.25 3H23a2 2 0 0 1 2 1.85v1.67l5-2v11.96l-5-2V16a2 2 0 0 1-1.85 2h-.91l-2-2H23V5H9.24l-2-2zM28 7.48l-3 1.2v3.64l3 1.2V7.48z');
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
  PRIMARY KEY (`id`),
  KEY `FKmgb8gfvom0533iymu2g0w3twk` (`comfortable_id`),
  KEY `FK2n19vwh0b55cp5n2ve8gswkjt` (`house_id`),
  CONSTRAINT `FK2n19vwh0b55cp5n2ve8gswkjt` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
  CONSTRAINT `FKmgb8gfvom0533iymu2g0w3twk` FOREIGN KEY (`comfortable_id`) REFERENCES `comfortable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comfortable_detail`
--

LOCK TABLES `comfortable_detail` WRITE;
/*!40000 ALTER TABLE `comfortable_detail` DISABLE KEYS */;
INSERT INTO `comfortable_detail` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,1),(46,46,2),(47,47,2),(48,1,2),(49,2,2),(50,4,2),(51,48,2),(52,5,2),(53,49,2),(54,6,2),(55,9,2),(56,10,2),(57,11,2),(58,12,2),(59,13,2),(60,14,2),(61,16,2),(62,50,2),(63,17,2),(64,51,2),(65,18,2),(66,19,2),(67,52,2),(68,53,2),(69,20,2),(70,24,2),(71,25,2),(72,26,2),(73,27,2),(74,28,2),(75,29,2),(76,54,2),(77,55,2),(78,56,2),(79,57,2),(80,33,2),(81,34,2),(82,35,2),(83,40,2),(84,41,2),(85,59,2),(86,60,2),(87,1,3),(88,2,3),(89,3,3),(90,4,3),(91,48,3),(92,5,3),(93,6,3),(94,7,3),(95,8,3),(96,61,3),(97,9,3),(98,10,3),(99,11,3),(100,12,3),(101,13,3),(102,14,3),(103,15,3),(104,16,3),(105,50,3),(106,17,3),(107,62,3),(108,19,3),(109,21,3),(110,24,3),(111,25,3),(112,26,3),(113,27,3),(114,63,3),(115,28,3),(116,29,3),(117,64,3),(118,55,3),(119,30,3),(120,65,3),(121,66,3),(122,67,3),(123,31,3),(124,68,3),(125,32,3),(126,33,3),(127,35,3),(128,69,3),(129,36,3),(130,70,3),(131,40,3),(132,71,3),(133,72,3),(134,43,3),(135,44,3),(136,45,3);
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
INSERT INTO `comfortable_type` VALUES (1,'Hướng nhìn đẹp mắt'),(2,'Phòng tắm'),(3,'Phòng ngủ và giặt ủi'),(4,'Giải trí'),(5,'Hệ thống sưởi và làm mát'),(6,'An toàn nhà ở'),(7,'Internet và văn phòng'),(8,'Đồ dùng nấu bếp và ăn uống'),(9,'Ngoài trời'),(10,'Chỗ đỗ xe và cơ sở vật chất'),(11,'Dịch vụ'),(12,'Không bao gồm');
/*!40000 ALTER TABLE `comfortable_type` ENABLE KEYS */;
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
  `pet_allowed` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_request`
--

LOCK TABLES `extra_request` WRITE;
/*!40000 ALTER TABLE `extra_request` DISABLE KEYS */;
INSERT INTO `extra_request` VALUES (2,5,7,0,_binary '\0'),(3,5,7,0,_binary '\0'),(4,5,4,0,_binary '\0');
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
  PRIMARY KEY (`id`),
  KEY `FK8f1jcgkfcpgi1phq9amkgf7qh` (`house_id`),
  KEY `FKh3f2dg11ibnht4fvnmx60jcif` (`user_id`),
  CONSTRAINT `FK8f1jcgkfcpgi1phq9amkgf7qh` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
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
-- Table structure for table `guest_detail`
--

DROP TABLE IF EXISTS `guest_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_adults` int NOT NULL,
  `num_babies` int NOT NULL,
  `num_children_above13` int NOT NULL,
  `num_pets` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_detail`
--

LOCK TABLES `guest_detail` WRITE;
/*!40000 ALTER TABLE `guest_detail` DISABLE KEYS */;
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
  `description` longtext,
  `hotel_name` varchar(255) NOT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `quantity_of_bathrooms` int NOT NULL,
  `quantity_of_beds` int NOT NULL,
  `quantity_of_rooms` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `quantity_of_guests` int NOT NULL,
  `type_house` enum('APARTMENT','HOTEL','HOUSE') DEFAULT NULL,
  `type_room` enum('ENTIRE_PLACE','ROOM','SHARED_ROOM') DEFAULT NULL,
  `avg_review_point` double DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `ex_request_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ekplct0ot20l4u51m38thwgyb` (`location_id`),
  UNIQUE KEY `UK_duw9eitlg390c4hm2w8huylen` (`ex_request_id`),
  KEY `FK5pth02tinuneavlhgv8g4b1wa` (`user_id`),
  CONSTRAINT `FK5pth02tinuneavlhgv8g4b1wa` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKlrspnfw3fofb9estv0sy2qiv2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKqsrwk3yot8a2xvgvkig4hqtmj` FOREIGN KEY (`ex_request_id`) REFERENCES `extra_request` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,'Căn hộ cho thuê 3 phòng ngủ với không gian rộng rãi và hiện đại. Căn hộ này là sự lựa chọn hoàn hảo cho gia đình hoặc nhóm bạn, đầy đủ điều hoà, các thiết bị hiện đại và ánh sáng tự nhiên. Phòng khách, bếp, phòng tắm đã trang bị đầy đủ.','Luxury 3 bedrooms - Nera Garden',42.00,2,3,3,2,7,'APARTMENT','ENTIRE_PLACE',5,1,2),(2,'Indochina Touch By Baly Villa located inside the new greenery urban area called Eco-Garden with thousands of trees, a shared swimming pool, a gymnasium, a surrounding lake and only 2km away from the center and Perfume river making it an ideal getaway for your family.','Indochina Touch by Baly Villa',154.00,4,4,3,3,7,'HOUSE','ENTIRE_PLACE',4.9,2,3),(3,'Căn hộ mini-Gems Apartment 63m2','Apartment-3 bedrooms view Thành Phố +swimming pool',44.00,2,3,3,8,4,'APARTMENT','ENTIRE_PLACE',4.8,3,4);
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (7,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/dac2vyzlbdofy7yiwdxj',1,NULL,NULL),(8,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/e3vwpnm8h5ffkjx1ajnh',1,NULL,NULL),(9,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/grzlwmogg4ktqpej9rp7',1,NULL,NULL),(10,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/urzregtdph9i4xjbbvog',1,NULL,NULL),(11,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/mz1vo0mubpwschi4z8ls',1,NULL,NULL),(12,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/mwyxsd1hw3cy5fxcyigq',1,NULL,NULL),(13,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/tcployrpid06dyclvi5e',1,NULL,NULL),(14,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/rbig9mrzdtpqgrkbl9rm',2,NULL,NULL),(15,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/jwatlusvkzhtcqrfmey7',2,NULL,NULL),(16,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/wxrvqe3lpids19ljnm9r',2,NULL,NULL),(17,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/muyiweh34n6xfseilmfj',2,NULL,NULL),(18,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/hdhmzd8khzv8bhzzhu7d',2,NULL,NULL),(19,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/saapav3r9coxd9eqwjba',2,NULL,NULL),(20,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/vqondwra2hzpcm0rbtbf',2,NULL,NULL),(21,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/mklhwyqr8p7dothi6sqc\n',2,NULL,NULL),(22,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ydjuyr9elpdjibnoldfi',2,NULL,NULL),(23,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/myjorsashn5zkwacfzuf',2,NULL,NULL),(24,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ztpomssby3nsji29bo30',2,NULL,NULL),(25,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/xyy4jpbggebg0bxiefjb',2,NULL,NULL),(26,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/qz6rrtikjprtorj4rfzp',2,NULL,NULL),(27,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ts8swayp4xs6r4enguzi\n',3,NULL,NULL),(28,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/zctiprkpgei42a2snabi\n',3,NULL,NULL),(29,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/wdpffm0jmhdthjivggho',3,NULL,NULL),(30,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ffpzejjqq9kgtcnxuhyv\n',3,NULL,'Khu vực sinh hoặt chung: bếp, phòng khách'),(31,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/cghnzyjlswbm8ltdukum\n',3,NULL,NULL),(32,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ulcdplsegepcsnmuexz7',3,NULL,NULL),(33,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/mrmgq76zqaxnngkyukxk',3,NULL,NULL),(34,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/rm0gtxjmoncp3lnh9fhi',3,3,NULL),(35,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/sv0yi0t5q2frd8ezwf4f\n',3,2,NULL),(36,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ytuhqebudpc6vvbi3fxc\n',3,1,NULL),(37,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/ymexu5zbzudxfrjwxa6z\n',3,NULL,NULL),(38,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/ImageHouse/yhs1xyhcgrhyu6ulxvey\n',3,NULL,NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Thừa Thiên Huế',16.4637117,107.5908628),(2,'Thừa Thiên Huế',16.4807087,107.6058793),(3,'Thừa Thiên Huế',16.4632846,107.6156167);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4ga4wn4q86wi5d8ulse2vf7en` (`guest_detail_id`),
  UNIQUE KEY `UK_qud8p54c7bqomj3csvmci1ig3` (`payment_id`),
  KEY `FKhuvmnyun00xjxygyva3wlv1mf` (`house_id`),
  KEY `FKm4oimk0l1757o9pwavorj6ljg` (`user_id`),
  CONSTRAINT `FK8g1s9tyunsjdv96dyiobv51bb` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `FKhuvmnyun00xjxygyva3wlv1mf` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
  CONSTRAINT `FKm4oimk0l1757o9pwavorj6ljg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKmj2ygkn70jgh6hliohpajtted` FOREIGN KEY (`guest_detail_id`) REFERENCES `guest_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r1isnsigf38g7130qs34jgpye` (`review_point_id`),
  KEY `FKiyf57dy48lyiftdrf7y87rnxi` (`user_id`),
  KEY `FK6ecwggu7yjrhb0buspnijuns0` (`house_id`),
  CONSTRAINT `FK6ecwggu7yjrhb0buspnijuns0` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
  CONSTRAINT `FKiyf57dy48lyiftdrf7y87rnxi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKnixvbkd7v1kuirq1yl5wkh8y7` FOREIGN KEY (`review_point_id`) REFERENCES `review_point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'nice house, nice host. The house is fully furnished and enough for 6 people to stay. There is also a swimming pool and gym for free.',4,'2023-08-01',1,1),(2,'Pour ce 2eme séjour à Hué que nous apprécions beaucoup nous avons choisi de nous excentrer de 5-6kms pour ne pas être dans le bouillonnement permanent d’hué. Nous étions en Scooter de location et cela ne nous a pas dérangé du tout. La maison est par ailleurs sublime. Toute neuve. Construite avec des matériaux luxueux et meublée avec goût. L accueil a été très amical et arrangeant. Merci pour ces 2 jours superbes.',5,'2023-07-05',2,2),(3,'amazing host. spectacular spot. will def get again when in hue',6,'2023-08-23',3,2),(4,'chỗ ở sạch sẽ được dọn dẹp gọn gàng trước khi tụi mình đến, chủ nhà nhiệt tình checkin checkout đều nhanh gọn. nhà từ những dụng cụ bếp nhỏ nhất đều rất đầy đủ nha, có 3 phòng ngủ nhưng 1 phòng hơi nhỏ. phù hợp đi khoảng 4-5 người là đẹp',11,'2022-09-23',6,3),(5,'Hoàn toàn hài lòng với nơi ở và sự nhiệt tình của chủ nhà.',12,'2022-10-21',7,3),(6,'Rất tuyệt vời, chủ nhà còn giúp mình mua quà mang về',10,'2023-01-11',8,3),(7,'Mình thực sự cảm thấy may mắn khi chọn Gems làm nơi lưu trú cho kì nghỉ vừa rồi. Phòng ốc mới, có đầy đủ các thiết bị gia dụng như một ngôi nhà bình thường, rất phù hợp để đi theo nhóm. Chúng mình vừa có không gian sinh hoạt riêng tư trong phòng ngủ vừa có thể cùng nhau xem phim, nghe nhạc, chuyện trò nơi phòng khách. Có đủ đồ bếp để có thể nấu nướng, bảo quản thực phẩm, bàn ăn đủ rộng để 4 người ngồi cùng nhau. View phòng ngủ về đêm siêu đẹp, nhìn thấy cả thành phố bên dưới với rất nhiều đèn điện chiếu sáng lung linh. Phòng ngủ master còn nhìn ra được đồng lúa chín và vườn cây, cảm giác rất nhẹ nhõm, yên bình. Chủ nhà thì rất là thân thiện, nhiệt tình và dễ mến. Nói chung đây là trải nghiệm đẹp của mình tại Huế cũng như tại airbnb. Thực sự là một trải nghiệm xuất sắc mà rất khó để có thể có ở những khách sạn thông thường. Chúc chủ nhà có nhiều khách dễ thương nha <3',9,'2023-05-01',9,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_point`
--

LOCK TABLES `review_point` WRITE;
/*!40000 ALTER TABLE `review_point` DISABLE KEYS */;
INSERT INTO `review_point` VALUES (1,5,5,5,5,5,5,5),(2,5,5,5,5,5,5,5),(3,5,5,5,5,5,4,4.8),(6,5,5,5,5,5,5,5),(7,4,4,5,5,5,5,4.7),(8,5,5,5,4,4,4,4.5),(9,5,5,5,5,5,5,5);
/*!40000 ALTER TABLE `review_point` ENABLE KEYS */;
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `id_card` int NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` enum('ADMIN','LESSOR','STAFF') DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dhlcfg8h1drrgu0irs1ro3ohb` (`address_id`),
  CONSTRAINT `FK6jalc21249xg0ngedonce9w55` FOREIGN KEY (`address_id`) REFERENCES `address_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,NULL,'admin@gmail.com','John',1,'Admin','0123456789','ADMIN',NULL),(2,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/oobzk08zaahvca46jkqt',NULL,'','',2,'Hue','0366666622','LESSOR',NULL),(3,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/jig2yadz7mfmrc01qtje',NULL,' ','Mai Ly',3,'( Miley)','0362222222','LESSOR',NULL),(4,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/mgvopnrwrxya8o7it1ex',NULL,'','',4,'Được','0111111111','LESSOR',NULL),(5,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/eiabzquebtetr6z98dya',NULL,'',' ',5,'Agathe','0123123123','LESSOR',NULL),(6,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/mwpv7bumydpoyckclrqe',NULL,'','',6,'Kennald','0321432125','LESSOR',NULL),(7,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/zi82tyxtptc3yfwlhkpe',NULL,'','',7,'Trang','0512142312','LESSOR',NULL),(8,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/b0o6xdoswn7avvrcntmn',NULL,'','',8,'Gems','0412512512','LESSOR',NULL),(9,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/e0brqrkgqppjjuxyiy5k',NULL,'','',9,'Ngọc','0512312512','STAFF',NULL),(10,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/wqyzlvyywkmthhctsmkk',NULL,'','',10,'Phung','0531121234','STAFF',NULL),(11,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/m91mgd9tsgrxvl2bftfx',NULL,'','',11,'Bình','0234112412','STAFF',NULL),(12,'https://res.cloudinary.com/didieklbo/image/upload/f_auto,q_auto/v1/AvatarUser/f969fwtrdxvxwytnshhz',NULL,'','',12,'Hạnh','0125123151','STAFF',NULL);
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

-- Dump completed on 2023-08-30 15:39:52
