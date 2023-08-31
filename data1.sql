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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `icon_path` longtext,
  `name` varchar(255) DEFAULT NULL,
  `comfortable_type_id` int DEFAULT NULL,
  `popular` bit(1) NOT NULL,
  `description` longtext,
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
INSERT INTO `comfortable` VALUES (1,'M7.5 2a4.5 4.5 0 0 1 4.47 4H14v2H8V6h1.95A2.5 2.5 0 0 0 5 6.34V16h26v2h-2v5a5 5 0 0 1-3 4.58V30h-2v-2H8v2H6v-2.42a5 5 0 0 1-3-4.34V18H1v-2h2V6.5A4.5 4.5 0 0 1 7.5 2zM27 18H5v5a3 3 0 0 0 2.65 2.98l.17.01L8 26h16a3 3 0 0 0 3-2.82V23z','Bồn tắm',1,_binary '\0',NULL),(3,'M10 2a3 3 0 0 1 3 2.82V16h14a1 1 0 0 1 1 .88V17a8 8 0 0 1-7.75 8h-4.77l1.45 3.63a1 1 0 0 1-.7 1.35l-.11.01L16 30H4a1 1 0 0 1-1-.88V5a3 3 0 0 1 2.82-3H10zm15.91 16H5v10h9.52l-1.45-3.63a1 1 0 0 1 .7-1.35l.11-.01L14 23h6a6 6 0 0 0 5.85-4.67l.05-.23.01-.1zM10 4H6a1 1 0 0 0-1 .88V16h6V5a1 1 0 0 0-.77-.97L10.12 4 10 4zm11 9a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-8 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm6-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Bồn cầu vệ sinh thông minh',1,_binary '\0',NULL),(4,'M18 1v2h-7v2h1a2 2 0 0 1 2 1.85V9.1a5 5 0 0 1 4 4.67V28a3 3 0 0 1-2.82 3H5a3 3 0 0 1-3-2.82V14a5 5 0 0 1 4-4.9V7a2 2 0 0 1 1.85-2H9V3H6V1h12zm-2 15.06c-1.14.15-2.08.6-3.58 1.55l-.34.23C9.63 19.41 8.29 20 6 20a9 9 0 0 1-2-.22V28a1 1 0 0 0 .88 1H15a1 1 0 0 0 1-.88V16.06zM27 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm-14-2H7a3 3 0 0 0-3 2.82v3.89A6.85 6.85 0 0 0 6 18c1.63 0 2.64-.36 4.4-1.46l.64-.4c2.01-1.32 3.28-1.93 4.96-2.09V14a3 3 0 0 0-3-3zm14 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25 2a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM12 7H8v2h4V7zm13-3a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Xà phòng tắm',1,_binary '\0',NULL),(5,'M16 1c4.26 0 7.6 4.44 7.97 10h.91a2 2 0 0 1 2 2v.22l-1.79 16A2 2 0 0 1 23.26 31l-.16.01H8.9a2 2 0 0 1-1.97-1.62l-.02-.16L6.44 25H5a2 2 0 0 1-2-1.85V14a5 5 0 0 1 4.78-5h.52c.94-4.62 4-8 7.7-8zm8.21 18H17v4a2 2 0 0 1-1.85 2h-6.7l.45 4h14.2zM15 21H5v2h10zm0-10H8a3 3 0 0 0-3 2.82V19h10zm9.88 2H17v4h7.44zM16 3c-2.52 0-4.8 2.44-5.65 6H15a2 2 0 0 1 2 1.85V11h4.96c-.34-4.55-2.95-8-5.96-8z','Sản phẩm vệ sinh',1,_binary '\0',NULL),(6,'M20 1v2h-3v2h1a2 2 0 0 1 2 1.85V9a4 4 0 0 1 4 3.8V27a4 4 0 0 1-3.8 4H12a4 4 0 0 1-4-3.8V13a4 4 0 0 1 3.8-4h.2V7a2 2 0 0 1 1.85-2H15V3H8V1zm2 21H10v5a2 2 0 0 0 1.85 2H20a2 2 0 0 0 2-1.85V27zm0-6H10v4h12zm-2-5h-8a2 2 0 0 0-2 1.85V14h12v-1a2 2 0 0 0-2-2zm-2-4h-4v2h4z','Dầu xả',1,_binary '\0',NULL),(7,'M14 27v.2a4 4 0 0 1-3.8 3.8H4v-2h6.15a2 2 0 0 0 1.84-1.84L12 27zM10 1c.54 0 1.07.05 1.58.14l.38.07 17.45 3.65a2 2 0 0 1 1.58 1.79l.01.16v6.38a2 2 0 0 1-1.43 1.91l-.16.04-13.55 2.83 1.76 6.5A2 2 0 0 1 15.87 27l-.18.01h-3.93a2 2 0 0 1-1.88-1.32l-.05-.15-1.88-6.76A9 9 0 0 1 10 1zm5.7 24-1.8-6.62-1.81.38a9 9 0 0 1-1.67.23h-.33L11.76 25zM10 3a7 7 0 1 0 1.32 13.88l.33-.07L29 13.18V6.8L11.54 3.17A7.03 7.03 0 0 0 10 3zm0 2a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6z','Máy sấy tóc',1,_binary '\0',NULL),(8,'M16 32a12 12 0 0 0 12-12c0-6.22-3.67-12.51-10.92-18.89L16 .18l-1.08.93C7.67 7.5 4 13.78 4 20c0 6.58 5.4 12 12 12zm0-2c-5.5 0-10-4.53-10-10 0-5.33 3.12-10.88 9.42-16.65l.41-.37.17-.15.58.52c6.04 5.53 9.15 10.85 9.4 15.98l.02.34V20a10 10 0 0 1-10 10zm-3.45-5.1a8.95 8.95 0 0 1 2.12-4.92l.24-.26.44-.47a6.97 6.97 0 0 0 1.83-4.41v-.72a6.03 6.03 0 0 0-2.02-.06 4.98 4.98 0 0 1-1.44 4 10.95 10.95 0 0 0-2.87 5.02 6.03 6.03 0 0 0 1.7 1.83zM16 26h.25l.25-.02v-.14c0-1.32.51-2.58 1.46-3.53a10.98 10.98 0 0 0 3.02-5.66 6.03 6.03 0 0 0-1.8-1.74 8.97 8.97 0 0 1-2.17 5.5l-.23.25-.45.46a6.96 6.96 0 0 0-1.82 4.42v.27c.47.12.97.19 1.49.19z','Nước nóng',1,_binary '\0',NULL),(9,'M7 1a3 3 0 0 0-3 2.82V31h2V4a1 1 0 0 1 .88-1H18a1 1 0 0 1 1 .88V5h-5a1 1 0 0 0-1 .88V9h-3v2h19V9h-2V6a1 1 0 0 0-.88-1H21V4a3 3 0 0 0-2.82-3H7zm13 28a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM15 7h10v2H15V7z','Vòi sen tắm ngoài trời',1,_binary '\0',NULL),(10,'M20 1v2h-3v2h1a2 2 0 0 1 2 1.85V9a4 4 0 0 1 4 3.8V27a4 4 0 0 1-3.8 4H12a4 4 0 0 1-4-3.8V13a4 4 0 0 1 3.8-4h.2V7a2 2 0 0 1 1.85-2H15V3H8V1zm2 21H10v5a2 2 0 0 0 1.85 2H20a2 2 0 0 0 2-1.85V27zm0-6H10v4h12zm-2-5h-8a2 2 0 0 0-2 1.85V14h12v-1a2 2 0 0 0-2-2zm-2-4h-4v2h4z','Dầu gội đầu',1,_binary '\0',NULL),(11,'M18 1v2h-7v2h1a2 2 0 0 1 2 1.85V9.1a5 5 0 0 1 4 4.67V28a3 3 0 0 1-2.82 3H5a3 3 0 0 1-3-2.82V14a5 5 0 0 1 4-4.9V7a2 2 0 0 1 1.85-2H9V3H6V1h12zm-2 15.06c-1.14.15-2.08.6-3.58 1.55l-.34.23C9.63 19.41 8.29 20 6 20a9 9 0 0 1-2-.22V28a1 1 0 0 0 .88 1H15a1 1 0 0 0 1-.88V16.06zM27 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm-14-2H7a3 3 0 0 0-3 2.82v3.89A6.85 6.85 0 0 0 6 18c1.63 0 2.64-.36 4.4-1.46l.64-.4c2.01-1.32 3.28-1.93 4.96-2.09V14a3 3 0 0 0-3-3zm14 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25 2a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM12 7H8v2h4V7zm13-3a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Sữa tắm',1,_binary '\0',NULL),(12,'M11 1v7l1.9 20.82v.17a2.01 2.01 0 0 1-1.81 2 2 2 0 0 1-.18.01H2.92a2.01 2.01 0 0 1-1.82-2v-.09l1.9-21V1zm6 0h.15a2 2 0 0 1 1.84 1.84L19 3v7.12l-2 8V31h-2V17.96l.03-.16.03-.16L16.72 11H13V1zm11 0a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H21v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7V9h7V7h-7V5h7V3h-7V1zM9.09 9H4.9L3.1 29h7.81v-.06zM17 3h-2v6h2zM9 3H5v4h4z','Tiện nghi thiết yếu',2,_binary '\0','Khăn tắm, khăn trải giường, xà phòng và giấy vệ sinh'),(13,'M19.59 2a2 2 0 0 1 1.28.47l.13.12L29.41 11a2 2 0 0 1 .58 1.24l.01.17V25a5 5 0 0 1-4.78 5H4a2 2 0 0 1-2-1.85V7a5 5 0 0 1 4.78-5H7zM7 4a3 3 0 0 0-3 2.82V21a3 3 0 0 0 2.82 3H26v2H7a4.98 4.98 0 0 1-3-1v3h21a3 3 0 0 0 3-2.82V22H6v-2h22v-6h-5a5 5 0 0 1-5-4.78V4zm20.59 8L20 4.42V9a3 3 0 0 0 2.82 3H23z','Bộ chăn ga gối',2,_binary '\0',NULL),(14,'M25 1a3 3 0 0 1 3 2.82V26a3 3 0 0 1-2.82 3H25v2h-2v-2H9v2H7v-2a3 3 0 0 1-3-2.82V4a3 3 0 0 1 2.82-3H25zm1 20H6v5a1 1 0 0 0 .88 1H25a1 1 0 0 0 1-.88V21zm-10 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm9-20h-8v16h9V4a1 1 0 0 0-.88-1H25zM15 3H7a1 1 0 0 0-1 .88V19h9V3zm-3 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm8 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Nơi để quần áo',2,_binary '\0',NULL),(15,'M26.29 2a3 3 0 0 1 2.96 2.58c.5 3.56.75 7.37.75 11.42s-.25 7.86-.75 11.42a3 3 0 0 1-2.79 2.57l-.17.01H5.7a3 3 0 0 1-2.96-2.58C2.25 23.86 2 20.05 2 16s.25-7.86.75-11.42a3 3 0 0 1 2.79-2.57L5.7 2zm0 2H5.72a1 1 0 0 0-1 .86A80.6 80.6 0 0 0 4 16c0 3.96.24 7.67.73 11.14a1 1 0 0 0 .87.85l.11.01h20.57a1 1 0 0 0 1-.86c.48-3.47.72-7.18.72-11.14 0-3.96-.24-7.67-.73-11.14a1 1 0 0 0-.87-.85zM16 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm0 2a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm-4.8 5.58c1.36.2 2.64.8 3.68 1.75l.46.45a8.97 8.97 0 0 0 4.62 2.28 5.02 5.02 0 0 1-2.01 1.55 10.98 10.98 0 0 1-4.26-2.65 4.96 4.96 0 0 0-2.66-1.38 4.68 4.68 0 0 1 .17-2zm3.09-3.28c1.34.55 2.58 1.36 3.64 2.42a4.97 4.97 0 0 0 3 1.44 4.99 4.99 0 0 1-.07 2 6.97 6.97 0 0 1-4.11-1.8l-.47-.45a8.96 8.96 0 0 0-4.07-2.17 5 5 0 0 1 2.08-1.44zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy sấy quần áo',2,_binary '\0',NULL),(16,'M16 2a5 5 0 0 1 1.66 9.72 1 1 0 0 0-.65.81l-.01.13v.81l13.23 9.05a3 3 0 0 1 1.3 2.28v.2a3 3 0 0 1-3 3H3.47a3 3 0 0 1-1.69-5.48L15 13.47v-.81a3 3 0 0 1 1.82-2.76l.17-.07a3 3 0 1 0-3.99-3V7h-2a5 5 0 0 1 5-5zm0 13.21L2.9 24.17A1 1 0 0 0 3.46 26h25.07a1 1 0 0 0 .57-1.82z','Giá phơi quần áo',2,_binary '\0',NULL),(17,'M26.8 4a3 3 0 0 0-1.87.83l-.02.02-.11-.02A47.19 47.19 0 0 0 7.94 4.7l-.85.15-.02-.02A3 3 0 0 0 2 7v.21a3 3 0 0 0 .56 1.54l.03.03-.05.28a44.99 44.99 0 0 0 0 13.88l.05.28-.03.03A3 3 0 0 0 5 28h.2a3 3 0 0 0 1.87-.83l.02-.02.11.02a47.19 47.19 0 0 0 16.86.13l.85-.15.02.02A3 3 0 0 0 30 25v-.21a3 3 0 0 0-.56-1.54l-.03-.03.05-.28c.71-4.74.72-9.16 0-13.88l-.05-.28.03-.03A3 3 0 0 0 27 4h-.2zm.2 2a1 1 0 0 1 .68 1.74l-.4.36.09.54a43.3 43.3 0 0 1 0 14.72l-.1.54.4.36a1 1 0 1 1-1.52 1.27l-.37-.6-.68.15a45.29 45.29 0 0 1-18.2 0l-.68-.14-.37.59a1 1 0 1 1-1.52-1.27l.4-.36-.1-.54a43.25 43.25 0 0 1 0-14.72l.1-.54-.4-.36a1 1 0 1 1 1.52-1.27l.37.6.68-.15a45.29 45.29 0 0 1 18.2 0l.68.14.37-.59A1 1 0 0 1 27 6z','Thêm chăn gối',2,_binary '\0',NULL),(18,'M16 2a5 5 0 0 1 1.66 9.72 1 1 0 0 0-.65.81l-.01.13v.81l13.23 9.05a3 3 0 0 1 1.3 2.28v.2a3 3 0 0 1-3 3H3.47a3 3 0 0 1-1.69-5.48L15 13.47v-.81a3 3 0 0 1 1.82-2.76l.17-.07a3 3 0 1 0-3.99-3V7h-2a5 5 0 0 1 5-5zm0 13.21L2.9 24.17A1 1 0 0 0 3.46 26h25.07a1 1 0 0 0 .57-1.82z','Móc treo quần áo',2,_binary '\0',NULL),(19,'M12 28a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM16.03 3h.3a12.5 12.5 0 0 1 11.82 9.48l.07.3 1.73 7.79.03.14A2 2 0 0 1 28.15 23H2.1a2 2 0 0 1-1.85-1.84v-7.38a5 5 0 0 1 4.77-4.77L5.25 9h9V5h-14V3zm11.53 16H2.25v2H28zM16.24 5v6H5.07a3 3 0 0 0-2.82 2.82V17H27.1l-.84-3.78-.07-.28a10.5 10.5 0 0 0-9.6-7.92L16.32 5z','Bàn là',2,_binary '\0',NULL),(20,'M2 30a1 1 0 0 1-1-1.03l.01-.11 3-21A1 1 0 0 1 5 7c2.21 0 4.09-.31 5.63-.93 1.5-.6 3.03-1.83 4.6-3.71a1 1 0 0 1 1.54 0c1.57 1.88 3.1 3.11 4.6 3.71C22.91 6.7 24.8 7 27 7a1 1 0 0 1 .97.75l.02.1 3 21a1 1 0 0 1-.88 1.14L30 30H2zM16 4.52l-.17.18a12.85 12.85 0 0 1-4.46 3.23c-1.42.57-3.06.9-4.9 1.03l-.5.02h-.1L3.15 28H6v-4.33a3 3 0 0 1 .48-1.63l.12-.17 2.3-3.07a2 2 0 0 1 1.43-.8H12v-3a1 1 0 0 1 .88-1H19a1 1 0 0 1 1 .88V18h1.5a2 2 0 0 1 1.5.67l.1.13 2.3 3.07a3 3 0 0 1 .6 1.58V28h2.85L26.13 8.98h-.1a17.1 17.1 0 0 1-4.63-.77l-.77-.28a12.46 12.46 0 0 1-4.15-2.9l-.31-.33L16 4.5zM24 25H8v3h16v-3zm-2.5-5h-11l-2.25 3h15.5l-2.25-3zM18 16h-4v2h4v-2z','Màn chống muỗi',2,_binary '\0',NULL),(21,'M1 2V0h30v2h-2v18a2 2 0 0 1-1.85 2H17v2.17a3 3 0 1 1-2 0V22H5a2 2 0 0 1-2-1.85V2zm15 24a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM27 2H5v18h22z','Mành chắn sáng cho phòng',2,_binary '\0',NULL),(22,'M25 2a5 5 0 0 1 5 4.78V25a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V7a5 5 0 0 1 4.78-5H7zm0 2H7a3 3 0 0 0-3 2.82V11h2V6h20v20H6v-5H4v4a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V7a3 3 0 0 0-2.82-3zm-1 4H8v16h16zm-8 3a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM6 13H4v6h2z','Két sắt',2,_binary '\0',NULL),(23,'M26.29 2a3 3 0 0 1 2.96 2.58c.5 3.56.75 7.37.75 11.42s-.25 7.86-.75 11.42a3 3 0 0 1-2.79 2.57l-.17.01H5.7a3 3 0 0 1-2.96-2.58C2.25 23.86 2 20.05 2 16s.25-7.86.75-11.42a3 3 0 0 1 2.79-2.57L5.7 2zm0 2H5.72a1 1 0 0 0-1 .86A80.6 80.6 0 0 0 4 16c0 3.96.24 7.67.73 11.14a1 1 0 0 0 .87.85l.11.01h20.57a1 1 0 0 0 1-.86c.48-3.47.72-7.18.72-11.14 0-3.96-.24-7.67-.73-11.14A1 1 0 0 0 26.3 4zM16 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm-5.84 7.5c-.34 0-.68.02-1.02.07a7 7 0 0 0 13.1 4.58 9.09 9.09 0 0 1-6.9-2.37l-.23-.23a6.97 6.97 0 0 0-4.95-2.05zM16 9a7 7 0 0 0-6.07 3.5h.23c2.26 0 4.44.84 6.12 2.4l.24.24a6.98 6.98 0 0 0 6.4 1.9A7 7 0 0 0 16 9zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy giặt',2,_binary '\0',NULL),(24,'M30 2v2h-8a5 5 0 0 0-5 4.78V14h9a4 4 0 0 1 4 3.8V26a4 4 0 0 1-3.8 4H6a4 4 0 0 1-4-3.8V18a4 4 0 0 1 3.8-4H15V9a7 7 0 0 1 6.76-7H30zm-4 14H6a2 2 0 0 0-2 1.85V26a2 2 0 0 0 1.85 2H26a2 2 0 0 0 2-1.85V18a2 2 0 0 0-1.85-2H26zm-15 3v2h2v2h-2v2H9v-2H7v-2h2v-2h2zm13 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy chơi game arcade',3,_binary '\0',NULL),(25,NULL,'Khung lưới bao sân',3,_binary '\0',NULL),(26,'M1.67 2.68A2 2 0 0 1 4.1.72l.14.04L16.01 4.3 27.78.91a2 2 0 0 1 2.53 1.63l.02.14v23.25a2 2 0 0 1-1.27 1.85l-.15.06-12.62 3.78a1 1 0 0 1-.46.03l-.12-.03L3.1 27.84a2 2 0 0 1-1.42-1.75v-.17zm2 0v23.24L16 29.62l12.33-3.7V2.82L16.28 6.3a1 1 0 0 1-.46.03l-.1-.03zm21.66 17.48v2.08L16 25.04v-2.08zm0-6v2.08L16 19.04v-2.08zm0-6v2.08L16 13.04v-2.08z','Sách và ấn phẩm để đọc',3,_binary '\0',NULL),(27,NULL,'Sàn bowling',3,_binary '\0',NULL),(28,NULL,'Leo núi trong nhà',3,_binary '\0',NULL),(29,'M24 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H19v-2h5a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3H8a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H15v-8h-2a2 2 0 0 1-2-1.85V13a2 2 0 0 1 1.85-2H19a2 2 0 0 1 2 1.85V19a2 2 0 0 1-1.85 2H17v8a2 2 0 0 1-1.85 2H8a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H8zm-5 12h-6v6h2v-4h2v4h2z','Kết nối Ethernet',3,_binary '\0',NULL),(30,'M10 5a2 2 0 0 1 2 1.85V15h8V7a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V9h2a2 2 0 0 1 2 1.85V15h2v2h-2v4a2 2 0 0 1-1.85 2H26v2a2 2 0 0 1-1.85 2H22a2 2 0 0 1-2-1.85V17h-8v8a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V23H4a2 2 0 0 1-2-1.85V17H0v-2h2v-4a2 2 0 0 1 1.85-2H6V7a2 2 0 0 1 1.85-2H8zm14 2h-2v18h2zM10 7H8v18h2zm18 4h-2v10h2zM6 11H4v10h2z','Thiết bị tập thể dục',3,_binary '\0',NULL),(31,'M30 2v2h-8a5 5 0 0 0-5 4.78V14h9a4 4 0 0 1 4 3.8V26a4 4 0 0 1-3.8 4H6a4 4 0 0 1-4-3.8V18a4 4 0 0 1 3.8-4H15V9a7 7 0 0 1 6.76-7H30zm-4 14H6a2 2 0 0 0-2 1.85V26a2 2 0 0 0 1.85 2H26a2 2 0 0 0 2-1.85V18a2 2 0 0 0-1.85-2H26zm-15 3v2h2v2h-2v2H9v-2H7v-2h2v-2h2zm13 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy chơi điện tử',3,_binary '\0',NULL),(32,NULL,'Bắn súng laser',3,_binary '\0',NULL),(33,NULL,'Trò chơi kích thước lớn',3,_binary '\0',NULL),(34,NULL,'Sân golf mini',3,_binary '\0',NULL),(35,NULL,'Rạp chiếu phim',3,_binary '\0',NULL),(36,'M1 8a7 7 0 0 1 6.76-7H10a7 7 0 0 1 6.98 6.52l.02.24v.42A3 3 0 0 0 19.83 11H23a8 8 0 0 1 8 7.75V27a1 1 0 0 1-.88 1H29v3h-2v-3H5v3H3v-3H2a1 1 0 0 1-1-.88V8zm2 18h26v-6h-2v4h-2v-4h-2v4h-2v-4h-2v4h-2v-4h-2v4h-2v-4h-2v4H9v-4H7v4H5v-4H3v6zm7-23H8a5 5 0 0 0-5 4.78V18h25.91l-.01-.1a6 6 0 0 0-5.43-4.88l-.25-.02H20a5 5 0 0 1-5-4.77v-.42A5 5 0 0 0 10 3z','Đàn piano',3,_binary '\0',NULL),(37,'M27 23a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM18 1a11 11 0 0 1 0 22 9.08 9.08 0 0 1-1.51-.12l-.63-.12a7 7 0 0 0-5.94 1.75l-.2.2-4.01 4a1 1 0 0 1-1.32.08l-.1-.08-3-3a1 1 0 0 1-.08-1.32l.08-.1 3.94-3.93a7 7 0 0 0 1.98-5.9l-.09-.61A13.21 13.21 0 0 1 7 12 11 11 0 0 1 18 1zm-1.59 19.82-7.32-7.31.1.62a9 9 0 0 1-2.33 7.42l-.21.22L3.4 25 5 26.59l3.3-3.3a9 9 0 0 1 7.65-2.54l.3.04.16.04zM18 3a9 9 0 0 0-8.9 7.68L19.32 20.9A9 9 0 0 0 18 3z','Bàn bóng bàn',3,_binary '\0',NULL),(38,'M28 5a3 3 0 0 1 3 2.82V24a3 3 0 0 1-2.82 3h-4.46l1.23 3.68-1.9.64L21.61 27H4a3 3 0 0 1-3-2.82V8a3 3 0 0 1 2.82-3H28zm0 18a1 1 0 0 0-.12 2h.24a1 1 0 0 0-.12-2zM4 23a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM25.17 7H19v1.18a3 3 0 0 1-6 0V7H6.83A3 3 0 0 1 3 10.83v10.34A3 3 0 0 1 6.83 25H13v-1a3 3 0 0 1 6-.18V25h1.95l-3.22-9.64 1.9-.63L23.05 25h2.12a2.99 2.99 0 0 1-.17-.82V24a3 3 0 0 1 4-2.83V10.83A3 3 0 0 1 25.17 7zM16 23a1 1 0 0 0-1 .88V25h2v-1a1 1 0 0 0-1-1zm2-11a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm10-5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM4 7a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm13 0h-2v1.12a1 1 0 0 0 2 0V7z','Bàn bi-da',3,_binary '\0',NULL),(39,'M26 3a5 5 0 0 1 5 4.78V24a5 5 0 0 1-4.78 5H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H6zm0 2H6a3 3 0 0 0-3 2.82V24a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3zm1 2v15.41l-3.3 3.3-1.4-1.42 2.7-2.7V7zM14 7a9 9 0 1 1 0 18 9 9 0 0 1 0-18zm0 2a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm0 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy quay đĩa',3,_binary '\0',NULL),(40,NULL,'Đường dốc trượt ván',3,_binary '\0',NULL),(41,'M24 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H8a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H8zm0 2H8a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H24a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3zm-8 10a7 7 0 1 1 0 14 7 7 0 0 1 0-14zm0 2a5 5 0 1 0 0 10 5 5 0 0 0 0-10zm0 2a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm0-14a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z','Hệ thống âm thanh',3,_binary '\0',NULL),(42,NULL,'Phòng theo chủ đề',3,_binary '\0',NULL),(43,'M9 29v-2h2v-2H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H26a5 5 0 0 1 5 4.78V20a5 5 0 0 1-4.78 5H21v2h2v2zm10-4h-6v2h6zm7-20H6a3 3 0 0 0-3 2.82V20a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3z','TV',3,_binary '\0',NULL),(44,'M17 1v4.03l4.03-2.32 1 1.73L17 7.34v6.93l6-3.47V5h2v4.65l3.49-2.02 1 1.74L26 11.38l4.03 2.33-1 1.73-5.03-2.9L18 16l6 3.46 5.03-2.9 1 1.73L26 20.62l3.49 2.01-1 1.74L25 22.35V27h-2v-5.8l-6-3.47v6.93l5.03 2.9-1 1.73L17 26.97V31h-2v-4.03l-4.03 2.32-1-1.73 5.03-2.9v-6.93L9 21.2V27H7v-4.65l-3.49 2.02-1-1.74L6 20.62l-4.03-2.33 1-1.73L8 19.46 14 16l-6-3.46-5.03 2.9-1-1.73L6 11.38 2.51 9.37l1-1.74L7 9.65V5h2v5.8l6 3.47V7.34l-5.03-2.9 1-1.73L15 5.03V1z','Điều hòa nhiệt độ',4,_binary '\0',NULL),(45,'M20.33 3.08c1.5 2.24.96 5.55-1.38 9.9l-.12.2.18.18c.1.13.21.26.3.4l.23.38.14.02c.7.06 1.78-.11 2.87-.48.89-.3 1.78-.78 2.68-1.45l.66-.52a3 3 0 0 1 4.77 1.33l.12.44c.59 3.35.02 5.73-1.86 6.98-2.24 1.5-5.54.96-9.9-1.39a3 3 0 0 1-.27-.16l-.07.07-.39.3-.28.19V20c-.03.7.15 1.68.48 2.68.3.88.78 1.78 1.45 2.68l.26.33.26.33a3 3 0 0 1-.36 4.22C19 31 17.95 31 17 31h-.54l-1.39-.1c-1.24-.19-2.56-.65-3.36-1.84-1.5-2.25-.96-5.55 1.39-9.91.04-.09.1-.17.15-.25a4.12 4.12 0 0 1-.37-.4.82.82 0 0 0-.18-.23.5.5 0 0 0-.21-.11c-.7-.1-1.85.06-3.04.46-.88.3-1.78.78-2.68 1.45l-.66.52a3 3 0 0 1-4.77-1.33l-.12-.44c-.59-3.35-.02-5.73 1.86-6.98 2.24-1.5 5.55-.96 9.9 1.38l.1.05c.3-.3.55-.5.72-.61l.2-.13.03-.2c.06-.7-.11-1.78-.48-2.88a9.6 9.6 0 0 0-1.45-2.68l-.52-.66a3 3 0 0 1 1.33-4.77l.44-.12c3.35-.59 5.73-.02 6.98 1.86zm-5.31 16.8-.16.22c-2.04 3.77-2.5 6.45-1.49 7.85 1.13 1.55 4.63 1.55 5.44.77.38-.36.47-.89.2-1.31l-.37-.45a11.94 11.94 0 0 1-2.05-3.64 10.93 10.93 0 0 1-.59-3.03V20h-.14a4.01 4.01 0 0 1-.63-.07l-.21-.05zM4.09 13.52c-1.56 1.13-1.56 4.63-.78 5.44.36.38.9.46 1.32.19l.44-.36c1.2-.96 2.42-1.64 3.65-2.05 1.16-.4 2.33-.6 3.28-.6V16c0-.14 0-.28.02-.42l.08-.46-.16-.12c-3.78-2.03-6.46-2.5-7.85-1.48zm23.24-.36-.45.36c-1.2.96-2.41 1.64-3.64 2.05-1.15.38-2.3.6-3.24.6-.01.25-.05.5-.1.74l-.07.26.19.14c3.77 2.03 6.45 2.5 7.85 1.48 1.55-1.13 1.55-4.63.78-5.44-.36-.38-.9-.47-1.32-.19zM16 14a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM13.2 3.39c-.37.36-.46.89-.18 1.31l.36.45c.95 1.2 1.64 2.42 2.05 3.64.37 1.14.59 2.27.59 3.2l.54.05.3.05.2.05.1-.13c2.04-3.77 2.5-6.45 1.49-7.84-1.13-1.56-4.63-1.56-5.44-.78z','Quạt trần',4,_binary '\0',NULL),(46,'M16 0a5 5 0 0 1 5 4.78v12.98l.26.21a7.98 7.98 0 0 1 2.72 5.43l.02.3v.3a8 8 0 1 1-13.25-6.04l.25-.2V5A5 5 0 0 1 15.56.02l.22-.01zm0 2a3 3 0 0 0-3 2.82V18.78l-.43.3a6 6 0 1 0 7.06.15l-.2-.16-.43-.3V11h-4V9h4V7h-4V5h4a3 3 0 0 0-3-3zm1 11v7.13A4 4 0 0 1 16 28a4 4 0 0 1-1-7.87V13zm-1 9a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Hệ thống sưởi',4,_binary '\0',NULL),(47,'M31 6v2h-1v23h-6V13H8v18H2V8H1V6zm-15.37 9 .96.7c3.32 2.42 5.14 5.06 5.38 7.93l.02.28v.21l.01.14c0 3.18-2.7 5.74-6 5.74a5.9 5.9 0 0 1-5.99-5.39v-.21l-.01-.15a9.3 9.3 0 0 1 1.64-4.99l.22-.34.68-.98 1.24.79zM28 8H4v21h2V13a2 2 0 0 1 1.7-1.98l.15-.01L8 11h16a2 2 0 0 1 2 1.85V29h2zM16 25.36l-.1.09c-.61.65-.9 1.23-.9 1.72 0 .42.41.83 1 .83s1-.4 1-.83c0-.45-.24-.97-.76-1.56l-.15-.16zm.35-7.32-1.77 3.56-1.46-.93-.15.27a7.28 7.28 0 0 0-.94 2.75l-.02.29-.01.26v.12c.03.92.4 1.76 1.03 2.4.14-1.14.86-2.24 2.1-3.33l.23-.2.64-.53.64.53c1.38 1.16 2.19 2.32 2.33 3.53A3.6 3.6 0 0 0 20 24.49l.01-.22V24c-.1-1.86-1.12-3.7-3.13-5.5l-.27-.24zM31 2v2H1V2z','Lò sưởi trong nhà',4,_binary '\0',NULL),(48,'M16 2a10 10 0 0 1 1 19.95V28h6v2H9v-2h6v-6.05A10 10 0 0 1 16 2zm1.44 12.63a2.98 2.98 0 0 1-1.22.36L16 15v.01a2.51 2.51 0 0 0-2.5 2.52c0 1.17.78 2.16 1.85 2.44a7.99 7.99 0 0 0 6.96-3.05 4.61 4.61 0 0 1-4.87-2.29zM10.52 10a2.52 2.52 0 0 0-2.5 2.16l-.02.1a8 8 0 0 0 3.66 6.46 4.53 4.53 0 0 1-.16-1.19c0-1.59.82-2.99 2.05-3.8a3 3 0 0 1-.46-1l-.05-.24-.01-.12-.03-.3A2.52 2.52 0 0 0 10.52 10zm10.95 5a2.52 2.52 0 0 0 2.47-1.98 8 8 0 0 0-4.24-8.11c.2.5.3 1.05.3 1.62a4.53 4.53 0 0 1-1.7 3.54 3 3 0 0 1 .6 2.68v-.07A2.56 2.56 0 0 0 21.47 15zM16 11a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-.32-7a8 8 0 0 0-6.77 4.3l.16-.07A4.54 4.54 0 0 1 10.52 8c1.43 0 2.72.67 3.55 1.7A2.98 2.98 0 0 1 16 9a2.52 2.52 0 0 0 2-2.48 2.52 2.52 0 0 0-2.16-2.5l-.16-.01z','Quạt cầm tay',4,_binary '\0',NULL),(49,'M25 2a5 5 0 0 1 5 4.78V25a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V7a5 5 0 0 1 4.78-5H7zm0 2H7a3 3 0 0 0-3 2.82V25a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V7a3 3 0 0 0-2.82-3zM11.1 17a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17zm9.8 0h2.03A7 7 0 0 1 17 22.93V20.9a5 5 0 0 0 3.9-3.9zM16 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm1-5.93A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9zm-2 0v2.03a5 5 0 0 0-3.9 3.9H9.07A7 7 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy phát hiện khí CO',5,_binary '\0',NULL),(50,'M7 28H5V15a11 11 0 0 1 8.06-10.6 3 3 0 0 1 4.63-1.88L20.35.24l1.3 1.52L19.04 4H23v2h-4.17A3 3 0 0 1 17 7.83v.24a7 7 0 0 1 5.98 6.45l.02.24V30a2 2 0 0 1-1.85 2H11a2 2 0 0 1-2-1.85V24H7zm9-18a5 5 0 0 0-4.98 4.57l-.02.22V30h10V14.82A5 5 0 0 0 16 10zm-2.65-3.6A9 9 0 0 0 7 14.73V22h2v-7.26a7 7 0 0 1 6-6.67v-.24a3.01 3.01 0 0 1-1.65-1.43zM16 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2z','Bình chữa cháy',5,_binary '\0',NULL),(51,'M26 3a5 5 0 0 1 5 4.78V24a5 5 0 0 1-4.78 5H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H6zm0 2H6a3 3 0 0 0-3 2.82V24a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3zm-7 4v4h4v6h-4v4h-6v-4H9v-6h4V9zm-2 2h-2v4h-4v2h4v4h2v-4h4v-2h-4z','Bộ sơ cứu',5,_binary '\0',NULL),(52,'M16 1a15 15 0 1 1 0 30 15 15 0 0 1 0-30zm0 2a13 13 0 1 0 0 26 13 13 0 0 0 0-26zm-4.9 14a5 5 0 0 0 3.9 3.9v2.03A7 7 0 0 1 9.07 17zm9.8 0h2.03A7 7 0 0 1 17 22.93V20.9a5 5 0 0 0 3.9-3.9zM16 13a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm1-5.93A7 7 0 0 1 22.93 15H20.9a5 5 0 0 0-3.9-3.9zm-2 0v2.03a5 5 0 0 0-3.9 3.9H9.07A7 7 0 0 1 15 9.07zM23 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy báo khói',5,_binary '\0',NULL),(53,'M26 2a1 1 0 0 1 .92.61l.04.12 2 7a1 1 0 0 1-.85 1.26L28 11h-3v5h6v2h-2v13h-2v-2.54a3.98 3.98 0 0 1-1.73.53L25 29H7a3.98 3.98 0 0 1-2-.54V31H3V18H1v-2h5v-4a1 1 0 0 1 .88-1h.36L6.09 8.4l1.82-.8L9.43 11H12a1 1 0 0 1 1 .88V16h10v-5h-3a1 1 0 0 1-.99-1.16l.03-.11 2-7a1 1 0 0 1 .84-.72L22 2h4zm1 16H5v7a2 2 0 0 0 1.7 1.98l.15.01L7 27h18a2 2 0 0 0 2-1.85V18zm-16-5H8v3h3v-3zm14.24-9h-2.49l-1.43 5h5.35l-1.43-5z','Không gian riêng để làm việc',6,_binary '\0',NULL),(54,'M21 1a5 5 0 0 1 5 4.78V26a5 5 0 0 1-4.78 5H11a5 5 0 0 1-5-4.78V6a5 5 0 0 1 4.78-5H11zm0 2H11a3 3 0 0 0-3 2.82V26a3 3 0 0 0 2.82 3H21a3 3 0 0 0 3-2.82V6a3 3 0 0 0-2.82-3zM10 25a2 2 0 0 1 2 1.85V27h-2zm0-4a6 6 0 0 1 6 5.78V27h-2a4 4 0 0 0-3.8-4H10zm0-4a10 10 0 0 1 10 9.72V27h-2a8 8 0 0 0-7.75-8H10z','Bộ phát Wi-fi bỏ túi',6,_binary '\0',NULL),(55,'M16 20.33a3.67 3.67 0 1 1 0 7.34 3.67 3.67 0 0 1 0-7.34zm0 2a1.67 1.67 0 1 0 0 3.34 1.67 1.67 0 0 0 0-3.34zM16 15a9 9 0 0 1 8.04 4.96l-1.51 1.51a7 7 0 0 0-13.06 0l-1.51-1.51A9 9 0 0 1 16 15zm0-5.33c4.98 0 9.37 2.54 11.94 6.4l-1.45 1.44a12.33 12.33 0 0 0-20.98 0l-1.45-1.45A14.32 14.32 0 0 1 16 9.66zm0-5.34c6.45 0 12.18 3.1 15.76 7.9l-1.43 1.44a17.64 17.64 0 0 0-28.66 0L.24 12.24c3.58-4.8 9.3-7.9 15.76-7.9z','Wi-fi',6,_binary '\0',NULL),(56,'M4 25c.51 0 .94.5 1 1v2h22v-2c0-.51.5-1 1-1h3v2h-2v2c0 .51-.5 1-1 1H4c-.5 0-1-.5-1-1v-2H1v-2zm16-10a5.7 5.7 0 0 1 5.67 5.2l.18 2.6a3 3 0 0 1-2.79 3.2H9.14a3 3 0 0 1-3-3l.17-2.57A5.93 5.93 0 0 1 12 15zm-5 2h-2v3h-2v-2.83a3.83 3.83 0 0 0-2.67 3.19A21.5 21.5 0 0 0 8.14 23c0 .51.36.94.86 1h14c.51-.04.83-.45.86-.95a343.57 343.57 0 0 0-.17-2.48 3.83 3.83 0 0 0-2.69-3.4V20h-2v-3h-2v3h-2zm9-15h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.51-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15z','Khay nướng bánh',7,_binary '\0',NULL),(57,'M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z','Đồ dùng nướng thịt ngoài trời',7,_binary '\0','Vỉ nướng, than củi, xiên tre/xiên sắt, v.v.'),(58,'M4 25c.51 0 .94.5 1 1v2h22v-2c0-.51.5-1 1-1h3v2h-2v2c0 .51-.5 1-1 1H4c-.5 0-1-.5-1-1v-2H1v-2zm16-10a5.7 5.7 0 0 1 5.67 5.2l.18 2.6a3 3 0 0 1-2.79 3.2H9.14a3 3 0 0 1-3-3l.17-2.57A5.93 5.93 0 0 1 12 15zm-5 2h-2v3h-2v-2.83a3.83 3.83 0 0 0-2.67 3.19A21.5 21.5 0 0 0 8.14 23c0 .51.36.94.86 1h14c.51-.04.83-.45.86-.95a343.57 343.57 0 0 0-.17-2.48 3.83 3.83 0 0 0-2.69-3.4V20h-2v-3h-2v3h-2zm9-15h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V13h-2c0-2.16.51-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15z','Máy làm bánh mì',7,_binary '\0',NULL),(59,'M23 1a1 1 0 0 1 1 .88V6l-.02.2-2.9 14.53a5 5 0 0 1 2.31 3.4l.04.25.56 4.5a1 1 0 0 1-.87 1.11L23 30H9a1 1 0 0 1-1-1v-.12l.57-4.5a5 5 0 0 1 2.36-3.65L8.18 7H7a1 1 0 0 0-1 .88V15H4V8a3 3 0 0 1 2.82-3H8V2a1 1 0 0 1 .88-1H23zm-9.5 21a3 3 0 0 0-2.92 2.45l-.03.18-.42 3.37h11.74l-.42-3.37a3 3 0 0 0-2.62-2.6L18.5 22h-5zm2.5 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm5.78-17H10.22l2.6 13H15v-9h2v9h2.18l2.6-13zM22 3H10v2h12V3z','Máy xay sinh tố',7,_binary '\0',NULL),(60,'M25 2a1 1 0 0 1 .94.65l.03.1 1 4A1 1 0 0 1 26.11 8L26 8h-9v2h-2V8H5v20h3a5 5 0 0 1-.72-4.66l.1-.26 2.52-6.04-1.8-3.6a1 1 0 0 1 .78-1.43L9 12h14a1 1 0 0 1 .94 1.34l-.05.1L22.62 16H24a5 5 0 0 1 5 4.78V25h-2v-4a3 3 0 0 0-2.82-3H22.5l2.12 5.08A5 5 0 0 1 24 28h3v2H4a1 1 0 0 1-1-.88V3a1 1 0 0 1 .88-1H4zM12.65 22a6.64 6.64 0 0 0-2.91.63l-.5 1.22a3 3 0 0 0-.2.68l-.03.23L9 25a3 3 0 0 0 2.82 3h8.19l.23-.01a3 3 0 0 0 2.6-2.02c-1.7-.12-2.93-.67-4.84-1.9l-.37-.23c-2.14-1.4-3.18-1.84-4.98-1.84zm7.68-4h-8.66l-.92 2.19a9.06 9.06 0 0 1 1.9-.19c2.19 0 3.51.52 5.75 1.95l.38.25c1.74 1.13 2.74 1.62 4.03 1.76l-.04-.11zm1.05-4H10.62l1 2h8.76zm2.84-10H5v2h19.72z','Cà phê',7,_binary '\0',NULL),(61,'M25 2a1 1 0 0 1 .94.65l.03.1 1 4A1 1 0 0 1 26.11 8L26 8h-9v2h-2V8H5v20h3a5 5 0 0 1-.72-4.66l.1-.26 2.52-6.04-1.8-3.6a1 1 0 0 1 .78-1.43L9 12h14a1 1 0 0 1 .94 1.34l-.05.1L22.62 16H24a5 5 0 0 1 5 4.78V25h-2v-4a3 3 0 0 0-2.82-3H22.5l2.12 5.08A5 5 0 0 1 24 28h3v2H4a1 1 0 0 1-1-.88V3a1 1 0 0 1 .88-1H4zM12.65 22a6.64 6.64 0 0 0-2.91.63l-.5 1.22a3 3 0 0 0-.2.68l-.03.23L9 25a3 3 0 0 0 2.82 3h8.19l.23-.01a3 3 0 0 0 2.6-2.02c-1.7-.12-2.93-.67-4.84-1.9l-.37-.23c-2.14-1.4-3.18-1.84-4.98-1.84zm7.68-4h-8.66l-.92 2.19a9.06 9.06 0 0 1 1.9-.19c2.19 0 3.51.52 5.75 1.95l.38.25c1.74 1.13 2.74 1.62 4.03 1.76l-.04-.11zm1.05-4H10.62l1 2h8.76zm2.84-10H5v2h19.72z','Máy pha cà phê',7,_binary '\0',NULL),(62,'M26 1a5 5 0 0 1 5 5c0 6.39-1.6 13.19-4 14.7V31h-2V20.7c-2.36-1.48-3.94-8.07-4-14.36v-.56A5 5 0 0 1 26 1zm-9 0v18.12c2.32.55 4 3 4 5.88 0 3.27-2.18 6-5 6s-5-2.73-5-6c0-2.87 1.68-5.33 4-5.88V1zM2 1h1c4.47 0 6.93 6.37 7 18.5V21H4v10H2zm14 20c-1.6 0-3 1.75-3 4s1.4 4 3 4 3-1.75 3-4-1.4-4-3-4zM4 3.24V19h4l-.02-.96-.03-.95C7.67 9.16 6.24 4.62 4.22 3.36L4.1 3.3zm19 2.58v.49c.05 4.32 1.03 9.13 2 11.39V3.17a3 3 0 0 0-2 2.65zm4-2.65V17.7c.99-2.31 2-7.3 2-11.7a3 3 0 0 0-2-2.83z','Đồ nấu ăn cơ bản',7,_binary '\0','Nồi chảo, dầu ăn, muối và tiêu'),(63,'M31 9v21h-2v-7h-6v7h-2v-7a2 2 0 0 1 1.85-2H29V9h2zM3 9v12h6a2 2 0 0 1 2 1.85V30H9v-7H3v7H1V9h2zm14-2v2.08a6 6 0 0 1 5 5.7V15h5v2H17v13h-2V17H5v-2h5a6 6 0 0 1 5-5.92V7h2zm-1 4a4 4 0 0 0-4 3.8v.2h8a4 4 0 0 0-4-4z','Bàn ăn',7,_binary '\0',NULL),(64,'M29 1v2a13 13 0 0 0-.3 26h.3v2a15 15 0 0 1-.31-30zM3 1h2v6h2V1h2v6h2V1h2v9a5 5 0 0 1-4 4.9V31H7V14.9a5.01 5.01 0 0 1-3.98-4.44L3 10.22V10zm26 6v2a7 7 0 0 0-.24 14H29v2a9 9 0 0 1-.27-18zM11 9H5v1.15a3 3 0 0 0 6 .03V10z','Bát đĩa và đồ bạc',7,_binary '\0','Bát, đũa, đĩa, cốc, v.v.'),(65,'M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zm0 10H4v16h24zm-2 2v4a3 3 0 0 1-2 2.83V24h2v2h-6v-2h2v-3.17a3 3 0 0 1-2-2.65V14zm-14 0a6 6 0 1 1 0 12 6 6 0 0 1 0-12zm0 2a4 4 0 1 0 0 8 4 4 0 0 0 0-8zm12 0h-2v2a1 1 0 0 0 .77.97l.11.02.12.01a1 1 0 0 0 1-.88V18zm4-12H4v6h24zm-6 2v2H10V6zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Máy rửa chén bát',7,_binary '\0',NULL),(66,'M25 1a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H7a2 2 0 0 1-2-1.85V3a2 2 0 0 1 1.85-2H7zm0 10H7v18h18zm-15 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM25 3H7v6h18zM10 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Tủ đông',7,_binary '\0',NULL),(67,'M26 28v2H6v-2h20zM16 1a8.64 8.64 0 0 1 7.83 5H28a1 1 0 0 1 1 1.08c-.3 3.87-1.58 6.45-3.9 7.56l.9 10.27a1 1 0 0 1-.88 1.08L25 26H7a1 1 0 0 1-1-.97v-.12L7.4 8.9c.02-.3.06-.6.12-.89H5a1 1 0 0 0-1 .88V19H2V9a3 3 0 0 1 2.82-3h3.35A8.64 8.64 0 0 1 16 1zm6.43 7H9.57a6.65 6.65 0 0 0-.14.7l-.04.36L8.1 24h15.82L22.6 9.06A6.67 6.67 0 0 0 22.43 8zm-5.45 3a9.82 9.82 0 0 1-2.7 5.78l-.23.24A6.96 6.96 0 0 0 12.07 21h-2.02a8.96 8.96 0 0 1 2.36-5.16l.23-.23A7.99 7.99 0 0 0 14.97 11h2.01zm4 0 .02.5a9.6 9.6 0 0 1-2.72 6.28l-.23.24A6.97 6.97 0 0 0 16.28 21h-2.06a8.96 8.96 0 0 1 2.19-4.16l.22-.23C18.09 15.16 19 13.2 19 11.5a4.94 4.94 0 0 0-.03-.5h2.01zm5.9-3h-2.4l.1.63.02.26.3 3.51c.99-.79 1.64-2.16 1.96-4.17l.03-.23zM16 3a6.63 6.63 0 0 0-5.55 3h11.1a6.63 6.63 0 0 0-5.04-2.98L16.23 3H16z','Ấm đun nước nóng',7,_binary '\0',NULL),(68,'M27 0a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V2a2 2 0 0 1 1.85-2H5zm0 2H5v26h22zm-3 22a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.33 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.34 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 24a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm13-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm-10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM21 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Bếp',7,_binary '\0','Không gian cho khách tự nấu ăn'),(69,'M27 0a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V2a2 2 0 0 1 1.85-2H5zm0 2H5v26h22zm-3 22a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.33 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5.34 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM8 24a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm13-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm-10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM21 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4z','Bếp nhỏ',7,_binary '\0',NULL),(70,'M29 3a2 2 0 0 1 2 1.85V27a2 2 0 0 1-1.85 2H3a2 2 0 0 1-2-1.85V5a2 2 0 0 1 1.85-2H3zm0 2H3v22h26zm-6 2v18H5V7zm-2 2H7v14h3a4.97 4.97 0 0 1-1-2.72V17h10v3a4.98 4.98 0 0 1-1 3h3zm-4 10h-6v1a3 3 0 0 0 2.65 2.98l.17.01.18.01a3 3 0 0 0 3-2.82V20zm9-8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Lò vi sóng',7,_binary '\0',NULL),(71,'M27 3a2 2 0 0 1 2 1.85V26a2 2 0 0 1-1.85 2H26v2h-2v-2H8v2H6v-2H5a2 2 0 0 1-2-1.85V5a2 2 0 0 1 1.85-2H5zm0 12H5v11h4v-3a2 2 0 0 1 1.85-2H11v-3h2v3a2 2 0 0 1 2 1.85V26h2v-3a2 2 0 0 1 1.85-2H19v-3h2v3a2 2 0 0 1 2 1.85V26h4zm-14 8h-2v3h2zm8 0h-2v3h2zm6-18H5v8h22zM8 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Tủ lạnh mini',7,_binary '\0',NULL),(72,'M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zm0 10H4v16h24zm-2 2v12H6V14zm-2 2H8v8h16zm4-12H4v6h24zm-3 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-6 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM7 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Lò nướng',7,_binary '\0',NULL),(73,'M25 1a2 2 0 0 1 2 1.85V29a2 2 0 0 1-1.85 2H7a2 2 0 0 1-2-1.85V3a2 2 0 0 1 1.85-2H7zm0 10H7v18h18zm-15 2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM25 3H7v6h18zM10 5a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Tủ lạnh',7,_binary '\0',NULL),(74,'M21 3a9 9 0 0 1 9 8.73V16h1v2h-1v9a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V18H1v-2h1v-4a9 9 0 0 1 8.73-9H11zm7 11H4v13h24zm-8 2v2h-8v-2zM9 16a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm14 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM21 5H11a7 7 0 0 0-7 6.76V12h7V8h10v4h7a7 7 0 0 0-6.76-7zm-2 5h-6v2h6z','Nồi cơm điện',7,_binary '\0',NULL),(75,'M20.93 2a3.93 3.93 0 0 1 3.93 3.93c0 .87-.29 1.7-.83 2.4l-.03.04V10a5 5 0 0 1 5 4.78V27a2 2 0 0 1-1.85 2H26v1h-2v-1H8v1H6v-1H5a2 2 0 0 1-2-1.85V17H1v-2h2a5 5 0 0 1 4.78-5H8V8.38a3.93 3.93 0 0 1 0-4.9l.14-.17.15-.16a3.93 3.93 0 0 1 2.56-1.14l.22-.01h9.86zM24 12H8a3 3 0 0 0-3 2.82V27h22V15a3 3 0 0 0-2.82-3H24zM8 23a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM20.93 4h-9.86a1.93 1.93 0 0 0-1.36 3.3 1 1 0 0 1 .28.57L10 8v2h12V8a1 1 0 0 1 .12-.48l.07-.1.08-.1.12-.13a1.93 1.93 0 0 0-1.31-3.18L20.93 4z','Máy nướng bánh mỳ',7,_binary '\0',NULL),(76,'M19 2a1 1 0 0 1 1 .88V6h8v2h-2v20a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V8H4V6h8V3a1 1 0 0 1 .88-1H13zm5 6H8v20h16zm-12 2v16h-2V10zm5 0v16h-2V10zm5 0v16h-2V10zm-4-6h-4v2h4z','Thùng rác có chức năng nén rác',7,_binary '\0',NULL),(77,'m9.24 3-.2.4a20.37 20.37 0 0 0-1.7 5.02v.03A9 9 0 0 1 10.16 8c2.26 0 4.44.84 6.12 2.4l.24.24a6.98 6.98 0 0 0 4.95 2.05 6.99 6.99 0 0 0 3.53-.95v-.23a19.57 19.57 0 0 0-2.04-8.1l-.2-.41H9.24zm.92 7a7 7 0 0 0-3.11.73C7 11.15 7 11.57 7 12a9 9 0 0 0 9 9c4.06 0 7.7-3.14 8.72-6.92a9 9 0 0 1-3.25.6 8.98 8.98 0 0 1-6.13-2.4l-.23-.23A6.97 6.97 0 0 0 10.16 10zm13.8-9 .29.52A21.78 21.78 0 0 1 27 12c0 5.4-4.53 10.4-10 10.95V29h6v2H9v-2h6v-6.04A11 11 0 0 1 5 12c0-3.6.92-7.09 2.75-10.48L8.04 1h15.92z','Ly uống rượu vang',7,_binary '\0',NULL),(78,'M16 1a5 5 0 0 1 5 5 5 5 0 0 1 0 10 5 5 0 0 1-4 4.9v4.29A9.04 9.04 0 0 1 23.95 22a8.94 8.94 0 0 1 3.74.81l.31.15v2.33A6.96 6.96 0 0 0 23.95 24a6.88 6.88 0 0 0-6.93 5.87l-.02.15v.1a1 1 0 0 1-.88.87L16 31a1 1 0 0 1-.97-.77l-.02-.12A6.95 6.95 0 0 0 7.97 24 6.96 6.96 0 0 0 4 25.23v-2.31a9.16 9.16 0 0 1 11 2.3V20.9a5 5 0 0 1-4-4.68V16h-.22a5 5 0 0 1 0-10H11v-.22A5 5 0 0 1 16 1zm2.86 14.1a4.98 4.98 0 0 1-5.72 0l-.07.23a3 3 0 1 0 5.85 0zM11 8a3 3 0 1 0 .67 5.93l.23-.07A4.98 4.98 0 0 1 11 11c0-1.06.33-2.05.9-2.86l-.23-.07A3.01 3.01 0 0 0 11 8zm10 0c-.23 0-.45.03-.67.07l-.23.07c.57.8.9 1.8.9 2.86a4.98 4.98 0 0 1-.9 2.86l.23.07A3 3 0 1 0 21 8zm-5 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0-5a3 3 0 0 0-2.93 3.67l.07.23a4.98 4.98 0 0 1 5.72 0l.07-.23A3 3 0 0 0 16 3z','Sân sau',8,_binary '\0','Không gian ngoài trời tại chỗ ở thường có cỏ bao phủ'),(79,'M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z','Lò nướng BBQ',8,_binary '\0',NULL),(80,'M21.54.8a13.67 13.67 0 0 1 9.74 16.43l-.08.3-.26.97-12.35-3.3-3.86 14.13h-2.07l4-14.66-12.12-3.24.26-.97A13.67 13.67 0 0 1 21.54.8zM5.67 21a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM25.33 4.92l.05.17c.74 2.34.77 5.38 0 8.5l-.1.33-.24.93 4.45 1.2.03-.2c.68-4.21-1-8.36-4.2-10.93zm-3.46-1.75-2.75 10.1 3.99 1.06.25-.93c1.23-4.6.44-8.83-1.5-10.23zm-1.95-.45c-2.28.38-4.9 3.46-6.14 7.79l-.08.3-.25.93 3.73 1zm-3.67-.26-.22.04a11.68 11.68 0 0 0-8.8 7.03l-.13.31-.07.19 4.48 1.2.25-.94c.9-3.33 2.55-6.12 4.5-7.83z','Tiện nghi khi đi tắm biển',8,_binary '\0','Khăn tắm biển, ô, chăn bãi biển, dụng cụ lặn dùng ống thở'),(81,'M11 6v2H9.62l2 4h10.24L20.3 8H17V6h4a1 1 0 0 1 .88.53l.05.11 3.62 9.38a5 5 0 1 1-1.92.58l-.53-1.36-7.44 6.51a1 1 0 0 1-.54.24L15 22h-4.1A5 5 0 0 1 1 21a5 5 0 0 1 6.3-4.83l1.8-3.62a1 1 0 0 1 .36-.4L7.38 8H5V6zM6 18a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm20 0a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm-15.5-3.76-1.41 2.83A5 5 0 0 1 10.9 20h2.48zM21.48 14h-8.86l2.7 5.4z','Xe đạp',8,_binary '\0',NULL),(82,'M2.61 1h13.34c.28-.02.58.08.8.33l.08.12 12 18a1 1 0 0 1-.72 1.54L28 21H17v2h12v1c0 1.84-.62 3.53-1.66 4.88l.13.1c.36.3.83.48 1.34.51l.19.01v2c-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1.01.15-1.4.41l-.13.1c-.77.65-1.77.99-2.8.99-.96 0-1.88-.29-2.62-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1 .15-1.39.41l-.14.1c-.76.65-1.77.99-2.8.99-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.95-.52-1.53-.52-.51 0-1 .15-1.38.41l-.14.1c-.7.6-1.6.93-2.55.98L3 31.5v-2c.52 0 1-.15 1.39-.41l.27-.21a7.99 7.99 0 0 1-1.64-4.3L3 24.26 2.98 23H15V9H2.61l1.34-4zm24.3 24H5.09l.02.09c.2 1.13.73 2.16 1.48 2.97a4.48 4.48 0 0 1 3.56.92c.4.33.95.52 1.53.52a2.4 2.4 0 0 0 1.52-.52A4.38 4.38 0 0 1 16 28c.95 0 1.87.29 2.61.83l.2.15c.4.33.94.52 1.52.52.52 0 1.01-.15 1.4-.41l.13-.1a4.38 4.38 0 0 1 3.3-.96l.25.03.08-.08a5.97 5.97 0 0 0 1.35-2.6l.06-.28zM17 5.3V19h9.13zM5.39 3l.66 2-.66 2H15V3z','Bến thuyền',8,_binary '\0',NULL),(83,'m15.59 1.91 1.02.8C22.17 7.04 25 11.46 25 15.98a8.99 8.99 0 0 1-.5 3.02H31v2h-2v9a1 1 0 0 1-.88 1H4a1 1 0 0 1-1-.88V21H1v-2h6.42c-.28-.9-.42-1.91-.42-3.01 0-2.25 1.1-4.82 3.27-7.75l.27-.35.55-.73 1.78 1.12L15.6 1.9zM27 21H5v8h22v-8zM16.4 5.1l-2.6 6.1-2.21-1.37-.17.24C9.87 12.3 9.07 14.2 9 15.77l-.01.21c0 1.1.17 2.04.48 2.85l.07.17h3a6.1 6.1 0 0 1-.05-.83c0-1.52.86-3.19 2.52-5.07l.24-.27.74-.81.74.8c1.82 2 2.76 3.76 2.76 5.35 0 .3-.02.57-.05.83h3.06l-.14-.07a6.7 6.7 0 0 0 .63-2.95c0-3.42-2.03-6.93-6.17-10.51l-.43-.36zm-.4 9.94-.08.1c-.9 1.14-1.36 2.11-1.41 2.88l-.01.15c0 .35.03.63.09.83h2.82c.06-.2.09-.48.09-.83 0-.79-.46-1.8-1.42-3.04l-.08-.1z','Bếp đốt lửa trại',8,_binary '\0',NULL),(84,'M3 30H1V2h2v12h26V2h2v28h-2v-4.2l-.52.07a16.99 16.99 0 0 1-2.13.13c-1.8 0-3.55-.28-5.17-.81A16.81 16.81 0 0 1 16 26a16.5 16.5 0 0 1-13-6.24zm8.15-14H3l.14.3a14.4 14.4 0 0 0 14.99 7.55A16.08 16.08 0 0 1 11.15 16zM29 19.76a16.26 16.26 0 0 1-4.77 4.09 14.92 14.92 0 0 0 4.77-.09zM13.35 16a14.21 14.21 0 0 0 7.83 7.07A14.22 14.22 0 0 0 29 16.01V16z','Võng',8,_binary '\0',NULL),(85,'M30.97 2.26a74.69 74.69 0 0 1-2.73 8.66c-1.63 4.26-3.45 7.41-5.85 10.06l1.46 1.46a3.48 3.48 0 0 1 3.95.46l2.16 2.14a3.48 3.48 0 0 1-4.77 5.06l-2.15-2.14a3.48 3.48 0 0 1-.6-4.1l-1.45-1.45c-4.67 4.4-11.37 7.38-18.83 8.58a1 1 0 0 1-1.13-1.21l.4-1.73C3.38 20.27 5.74 15.08 9.6 11L8.15 9.56A3.48 3.48 0 0 1 4.2 9.1L2.04 6.96A3.48 3.48 0 0 1 6.81 1.9l2.15 2.14a3.48 3.48 0 0 1 .6 4.1l1.46 1.47c4.52-4.06 11.16-7.02 18.78-8.59a1 1 0 0 1 1.17 1.24zm-6.51 22.2a1.48 1.48 0 0 0-.1 1.97l2.1 2.11a1.48 1.48 0 0 0 2.19-1.97l-2.1-2.11a1.48 1.48 0 0 0-2.1 0zM11 12.42c-3.46 3.68-5.67 8.4-7.48 15.5l-.2.83.17-.04c6.4-1.29 12.07-3.96 16.08-7.72L18 19.41l-1.3 1.3a3.83 3.83 0 0 1-5.25.15l-.16-.15a3.83 3.83 0 0 1-.15-5.26L12.58 14l-1.57-1.58zm2.99 3-1.3 1.29a1.83 1.83 0 0 0-.1 2.46l.1.12a1.83 1.83 0 0 0 2.47.12L16.6 18l-2.6-2.59zM28.6 3.3C22.8 4.7 16.9 7 12.4 11l8.5 8.5c3.71-4.08 5.7-9.3 7.24-14.57l.46-1.63zm-6.7 6.8a3.83 3.83 0 0 1 .15 5.26L20.9 16.5l-1.41-1.41.99-.99a1.83 1.83 0 0 0 .1-2.46l-.1-.12a1.83 1.83 0 0 0-2.47-.12l-1.1 1.1-1.42-1.41.99-.99a3.83 3.83 0 0 1 5.41 0zM3.46 3.46a1.48 1.48 0 0 0-.1 1.97l2.1 2.11a1.48 1.48 0 0 0 2.19-1.97l-2.1-2.11a1.48 1.48 0 0 0-2.1 0z','Thuyền Kayak',8,_binary '\0',NULL),(86,'M29 15v16h-2v-6h-6v6h-2v-6.15a2 2 0 0 1 1.84-1.84L21 23h6v-8zM5 15v8h6a2 2 0 0 1 2 1.85V31h-2v-6H5v6H3V15zM16 1a15 15 0 0 1 13.56 8.57 1 1 0 0 1-.8 1.42l-.1.01H17v8h8v2h-8v10h-2V21H7v-2h8v-8H3.35a1 1 0 0 1-.95-1.32l.04-.1A15 15 0 0 1 16 1zm0 2A13 13 0 0 0 5.4 8.47l-.2.28-.16.25h21.92l-.17-.25a13 13 0 0 0-10.1-5.73L16.34 3z','Khu vực ăn uống ngoài trời',8,_binary '\0',NULL),(87,'M29 15v16h-2v-6h-6v6h-2v-6.15a2 2 0 0 1 1.84-1.84L21 23h6v-8zM5 15v8h6a2 2 0 0 1 2 1.85V31h-2v-6H5v6H3V15zM16 1a15 15 0 0 1 13.56 8.57 1 1 0 0 1-.8 1.42l-.1.01H17v8h8v2h-8v10h-2V21H7v-2h8v-8H3.35a1 1 0 0 1-.95-1.32l.04-.1A15 15 0 0 1 16 1zm0 2A13 13 0 0 0 5.4 8.47l-.2.28-.16.25h21.92l-.17-.25a13 13 0 0 0-10.1-5.73L16.34 3z','Nội thất ngoài trời',8,_binary '\0',NULL),(88,'M13 2h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C11.6 10 11.2 10.9 11.06 12H9.04c.1-1.07.38-1.97.9-3H6a10 10 0 0 0 20 .28V9h-3.77a7.44 7.44 0 0 0-1.17 3h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4h2c0 1.93-.4 3.17-1.5 5L28 7v2c0 .68-.06 1.35-.17 2H30v2h-2.68a12.04 12.04 0 0 1-5.9 6.7l4.5 9.89-1.83.82-2-4.41H17v4h-2v-4H9.92L7.9 30.41l-1.82-.82 4.49-9.88A12.04 12.04 0 0 1 4.68 13H2v-2h2.17A12.06 12.06 0 0 1 4 9.3V7h7.13l.39-.6c1.11-1.8 1.47-2.8 1.47-4.4zm-.57 18.46L10.83 24H15v-3.04a11.95 11.95 0 0 1-2.57-.5zm4.57.5V24h4.17l-1.6-3.54c-.69.21-1.4.37-2.13.45zM18 2h2c0 2.06-.48 3.35-1.77 5.42l-.75 1.19C16.6 10 16.2 10.9 16.06 12h-2.02c.15-1.62.71-2.84 1.91-4.74l.57-.88C17.63 4.6 17.99 3.61 17.99 2z','Bếp ngoài trời',8,_binary '\0',NULL),(89,'M23 1a2 2 0 0 1 2 1.85V19h4v2h-2v8h2v2H3v-2h2v-8H3v-2h4V3a2 2 0 0 1 1.85-2H9zM9 21H7v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm4 0h-2v8h2zm-10-8H9v6h6zm8 0h-6v6h6zM15 3H9v8h6zm8 0h-6v8h6z','Sân hoặc ban công',8,_binary '\0',NULL),(90,'M5 17a1 1 0 0 1-.93-1.36 13.28 13.28 0 0 1 15.3-8.33 4 4 0 1 1 7.03 3.8l-.13.2.21.24a13.81 13.81 0 0 1 2.45 4.09 1 1 0 0 1-.82 1.35L28 17H17v9h13v2h-4v3h-2v-3H9v3H7v-3H2v-2h3.59l-4.3-4.3 1.42-1.4L8.4 26H15v-9zm11.5-8a11.2 11.2 0 0 0-9.77 5.69l-.17.31h19.88l-.17-.32a11.2 11.2 0 0 0-9.12-5.66L16.81 9zM31 8v2h-3V8zm-8-1a2 2 0 0 0-1.67.9 13.1 13.1 0 0 1 3.45 2.01A2 2 0 0 0 23 7zm4.95-4.36 1.41 1.41-2.12 2.12-1.41-1.41zm-9.9 0 2.12 2.12-1.41 1.41-2.12-2.12zM24 1v3h-2V1z','Ghế tắm nắng',8,_binary '\0',NULL),(91,'M30 1a1 1 0 0 1 1 .88V30a1 1 0 0 1-.88 1H2a1 1 0 0 1-1-.88V2a1 1 0 0 1 .88-1H2zM3 3v26h12V3zm7 9v6.58l1.8-1.79 1.4 1.42-3.5 3.5a1 1 0 0 1-1.31.08l-.1-.08-3.5-3.5 1.42-1.42L8 18.6V12zm12.39-1.5a1 1 0 0 1 1.22 0l.1.09 3.5 3.5-1.42 1.41L24 13.7V20h-2v-6.3l-1.8 1.8-1.4-1.41 3.5-3.5zM17 29h12V3H17z','Thang máy',9,_binary '\0','Nhà hoặc tòa nhà có thang máy rộng ít nhất 132 cm và cửa ra vào rộng ít nhất 81 cm.'),(92,'M2 4h2v2h2V4h2v5a3 3 0 0 1-2 2.83V17a1 1 0 0 0 .88 1H10V5a3 3 0 0 1 3-3h12a3 3 0 0 1 3 3v23h2v2H2v-2h8v-8H7a3 3 0 0 1-3-2.82v-5.35a3 3 0 0 1-2-2.64V4zm23 0H12.88A1 1 0 0 0 12 5v23h14V5a1 1 0 0 0-1-1zm-4.43 13-1.8 3H21a1 1 0 0 1 .91 1.41l-.05.1-2.1 3.49h-2.33l1.8-3H17a1 1 0 0 1-.91-1.41l.05-.1 2.1-3.49h2.33zM23 6a1 1 0 0 1 1 1v6a1 1 0 0 1-1 1h-8a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h8zm-1 2h-6v4h6V8zM6 8H4v1a1 1 0 0 0 .77.97l.11.02L5 10a1 1 0 0 0 1-.88V8z','Thiết bị sạc xe điện',9,_binary '\0','Khách có thể sạc xe điện tại chỗ ở.'),(93,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z','Chỗ đỗ xe miễn phí tại nơi ở',9,_binary '\0',NULL),(94,NULL,'Sân khúc côn cầu',9,_binary '\0',NULL),(95,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z','Miễn phí đỗ xe trên đường/phố',9,_binary '\0',NULL),(96,'M10 5a2 2 0 0 1 2 1.85V15h8V7a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V9h2a2 2 0 0 1 2 1.85V15h2v2h-2v4a2 2 0 0 1-1.85 2H26v2a2 2 0 0 1-1.85 2H22a2 2 0 0 1-2-1.85V17h-8v8a2 2 0 0 1-1.85 2H8a2 2 0 0 1-2-1.85V23H4a2 2 0 0 1-2-1.85V17H0v-2h2v-4a2 2 0 0 1 1.85-2H6V7a2 2 0 0 1 1.85-2H8zm14 2h-2v18h2zM10 7H8v18h2zm18 4h-2v10h2zM6 11H4v10h2z','Phòng tập thể hình',9,_binary '\0',NULL),(97,'M9.5 2a4.5 4.5 0 0 1 3.53 7.3c.6.21 1.17.54 1.66.98l.19.19L17.4 13H31v2h-2v14a2 2 0 0 1-1.85 2H5a2 2 0 0 1-2-1.85V15H1v-2h2.1a5 5 0 0 1 2.96-3.6A4.5 4.5 0 0 1 9.5 2zm7.08 13H5v14h22V15h-7.59l3.3 3.3-1.42 1.4zM9.5 4a2.5 2.5 0 0 0-1 4.8V11H8a3 3 0 0 0-2.83 2h9.41l-1.12-1.12a3 3 0 0 0-1.92-.87l-.2-.01h-.84V8.8a2.5 2.5 0 0 0-1-4.8zm15.49-3a6.96 6.96 0 0 1-1.8 4.07l-.45.46A8.97 8.97 0 0 0 20.35 11h-2a10.97 10.97 0 0 1 3.2-7.12A4.96 4.96 0 0 0 22.97 1zm2 0h2a10.96 10.96 0 0 1-3.2 7.12A4.97 4.97 0 0 0 24.38 11h-2a6.97 6.97 0 0 1 1.8-4.06l.44-.47A8.96 8.96 0 0 0 26.99 1z','Bồn tắm nước nóng',9,_binary '\0',NULL),(98,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z','Chỗ đỗ xe ngoài khuôn viên, có thu phí',9,_binary '\0',NULL),(99,'M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z','Chỗ đỗ xe có thu phí trong khuôn viên',9,_binary '\0',NULL),(100,'M24 26c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 28c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 28c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 26c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 26zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 23c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 23c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 21c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 21zM20 3a4 4 0 0 1 4 3.8V9h4v2h-4v5a4 4 0 0 1 2.5.86l.17.15c.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 18c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 18c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 16c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5a3.96 3.96 0 0 1 2.44-1H16v-5H4V9h12V7a2 2 0 0 0-4-.15V7h-2a4 4 0 0 1 7-2.65A3.98 3.98 0 0 1 20 3zm-2 13.52.46.31.21.18c.35.31.83.49 1.33.49a2 2 0 0 0 1.2-.38l.13-.11c.2-.19.43-.35.67-.49V11h-4zM20 5a2 2 0 0 0-2 1.85V9h4V7a2 2 0 0 0-2-2z','Bể bơi',9,_binary '\0',NULL),(101,'M19 1v2H4v14h1.27a7.52 7.52 0 0 1 3.75-4.65 4.5 4.5 0 1 1 6.96 0A7.51 7.51 0 0 1 19.73 17H28v-4.97h2V29c0 1.05-1 2-2 2H4c-1.05 0-2-1-2-2V3c0-1.05 1-2 2-2h15zM4 19v10h24V19H4zm8.5-12a2.5 2.5 0 0 0-1.15 4.72l.15.07v1.8A5.5 5.5 0 0 0 7.37 17h10.25a5.51 5.51 0 0 0-3.9-3.36l-.22-.05v-1.8a2.5 2.5 0 0 0-1-4.79zM28 1h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V12h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15V1zm-5 0h2c0 2.06-.48 3.34-1.77 5.42l-.75 1.19c-1.06 1.7-1.44 2.68-1.48 4.15V12h-2c0-2.16.52-3.47 1.95-5.73l.57-.88c1.06-1.7 1.44-2.68 1.47-4.15V1z','Phòng xông hơi khô',9,_binary '\0',NULL),(102,'M11 23H5v4h20.59L2.29 3.7l1.42-1.4L27 25.58V5h-4v6h-8V9h6V3h8v24.59l.7.7-1.4 1.42-.72-.71H3v-8h6v-6h2z','Nhà một tầng',9,_binary '\0','Trong nhà không có cầu thang'),(107,'M2 31a1 1 0 0 1-1-1 9 9 0 0 1 17.95-1H21c.74 0 1.43-.27 1.97-.74A2.99 2.99 0 0 0 24 26.2L24 26V14H13v6h-2v-7a1 1 0 0 1 .88-1H25a1 1 0 0 1 1 .88V15h4a1 1 0 0 1 1 .88V25a1 1 0 0 1-.88 1H26a4.99 4.99 0 0 1-1.71 3.77 4.98 4.98 0 0 1-3.03 1.22L21 31zm3.85-6.64a7 7 0 0 0-2.7 4.16l-.05.3-.03.18h4.1zM10 23c-.82 0-1.61.14-2.35.4l1.6 5.6h1.5l1.6-5.6a6.97 6.97 0 0 0-1.86-.38l-.25-.02zm4.15 1.36L12.82 29h4.1l-.02-.18a7 7 0 0 0-2.75-4.46zM29 17h-3v7h3zM20 1c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C16.6 9 16.2 9.9 16.06 11h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4zm5 0c0 2.06-.48 3.34-1.77 5.42l-.75 1.19C21.6 9 21.2 9.9 21.06 11h-2.02c.15-1.61.71-2.84 1.91-4.73l.57-.88c1.11-1.79 1.47-2.78 1.47-4.4z','Bữa sáng',10,_binary '\0','Có cung cấp bữa sáng'),(108,'M24 0v6h-4.3c.13 1.4.67 2.72 1.52 3.78l.2.22-1.5 1.33a9.05 9.05 0 0 1-2.2-5.08c-.83.38-1.32 1.14-1.38 2.2v4.46l4.14 4.02a5 5 0 0 1 1.5 3.09l.01.25.01.25v8.63a3 3 0 0 1-2.64 2.98l-.18.01-.21.01-12-.13A3 3 0 0 1 4 29.2L4 29.02v-8.3a5 5 0 0 1 1.38-3.45l.19-.18L10 12.9V8.85l-4.01-3.4.02-.7A5 5 0 0 1 10.78 0H11zm-5.03 25.69a8.98 8.98 0 0 1-6.13-2.41l-.23-.23A6.97 6.97 0 0 0 6 21.2v7.82c0 .51.38.93.87 1H7l11.96.13h.13a1 1 0 0 0 .91-.88l.01-.12v-3.52c-.34.04-.69.06-1.03.06zM17.67 2H11a3 3 0 0 0-2.92 2.3l-.04.18-.01.08 3.67 3.1h2.72l.02-.1a4.29 4.29 0 0 1 3.23-3.4zM30 4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-3-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-5 0h-2.33v2H22zm8-2a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM20 20.52a3 3 0 0 0-.77-2l-.14-.15-4.76-4.61v-4.1H12v4.1l-5.06 4.78a3 3 0 0 0-.45.53 9.03 9.03 0 0 1 7.3 2.34l.23.23A6.98 6.98 0 0 0 20 23.6z','Có dịch vụ dọn vệ sinh trong thời gian ở',10,_binary '\0',NULL),(109,'M11.67 0v1.67h8.66V0h2v1.67h6a2 2 0 0 1 2 1.85v16.07a2 2 0 0 1-.46 1.28l-.12.13L21 29.75a2 2 0 0 1-1.24.58H6.67a5 5 0 0 1-5-4.78V3.67a2 2 0 0 1 1.85-2h6.15V0zm16.66 11.67H3.67v13.66a3 3 0 0 0 2.82 3h11.18v-5.66a5 5 0 0 1 4.78-5h5.88zm-.08 8h-5.58a3 3 0 0 0-3 2.82v5.76zm-18.58-16h-6v6h24.66v-6h-6v1.66h-2V3.67h-8.66v1.66h-2z','Cho phép ở dài hạn',10,_binary '\0','Cho phép ở từ 28 ngày trở lên'),(110,'M30 29v2H2v-2zM20 1a2 2 0 0 1 2 1.85V5h3a5 5 0 0 1 5 4.78V22a5 5 0 0 1-4.78 5H7a5 5 0 0 1-5-4.78V10a5 5 0 0 1 4.78-5H10V3a2 2 0 0 1 1.85-2H12zm5 6H7a3 3 0 0 0-3 2.82V22a3 3 0 0 0 2.82 3H25a3 3 0 0 0 3-2.82V10a3 3 0 0 0-3-3zm-8 2v9.5l3.3-3.3 1.4 1.42-4.64 4.65-.11.1a1.5 1.5 0 0 1-1.9 0l-.11-.1-4.65-4.65 1.42-1.41L15 18.5V9zm3-6h-8v2h8z','Cho phép gửi hành lý',10,_binary '\0','Để thuận tiện cho khách khi họ đến sớm hoặc rời đi muộn'),(118,'M24 27c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 29c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 29c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 29c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 27c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 27c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 27zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 24c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 24c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 24c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 22c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 22c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 22zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 19c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 19c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 19c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 17c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 17c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 17zM16 1a9 9 0 0 1 8.76 11.07c.71.13 1.37.45 1.91.94.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1 1.95 1.95 0 0 0-1.14-.5H23.96a2 2 0 0 0-1.15.38l-.14.11A3.98 3.98 0 0 1 20 15.5a3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 14c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1 1.95 1.95 0 0 0-1.14-.5H7.96a2 2 0 0 0-1.15.38l-.14.11a3.96 3.96 0 0 1-2.44 1L4 15.5v-2h.19a1.95 1.95 0 0 0 1.14-.5 3.92 3.92 0 0 1 1.9-.93A9 9 0 0 1 16 1zm0 2a7 7 0 0 0-6.64 9.23c.49.17.93.43 1.31.78.35.32.83.49 1.33.49.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 12c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5a2 2 0 0 0 1.2-.38l.13-.11c.38-.35.82-.6 1.3-.78A7 7 0 0 0 16 3z','Lối ra bãi biển',11,_binary '\0','Khách có thể tận hưởng bãi biển lân cận'),(119,'M28 2a2 2 0 0 1 2 2v24a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 2H4v15.5h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 18c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1v3h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 23c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1V28h24zm-6 3a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z','Lối ra hồ',11,_binary '\0','Khách có thể ra hồ bằng lối đi hoặc cầu tàu'),(120,'M24 1a2 2 0 0 1 2 1.85V5h2a2 2 0 0 1 2 1.85V28a3 3 0 0 1-3 3H5a3 3 0 0 1-3-2.82V3a2 2 0 0 1 1.85-2H4zm4 6h-2v21a1 1 0 0 0 2 .12V28zM8 3H4v25a1 1 0 0 0 .88 1H24V3h-4a6 6 0 0 1-12 .23zm6 22a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4.67a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4.66a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM14 11a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm4-8h-8a4 4 0 0 0 8 .2z','Hiệu giặt ủi tự động gần đây',11,_binary '\0',NULL),(121,'M25 1a2 2 0 0 1 2 1.85V29h2v2H3v-2h2V3a2 2 0 0 1 1.85-2H7zm0 2H7v26h18zm-3 12a1 1 0 1 1 0 2 1 1 0 0 1 0-2z','Lối vào riêng',11,_binary '\0','Đường hoặc lối vào tòa nhà riêng'),(122,'M21.54.8a13.67 13.67 0 0 1 9.74 16.43l-.08.3-.26.97-12.35-3.3-3.86 14.13h-2.07l4-14.66-12.12-3.24.26-.97A13.67 13.67 0 0 1 21.54.8zM5.67 21a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM25.33 4.92l.05.17c.74 2.34.77 5.38 0 8.5l-.1.33-.24.93 4.45 1.2.03-.2c.68-4.21-1-8.36-4.2-10.93zm-3.46-1.75-2.75 10.1 3.99 1.06.25-.93c1.23-4.6.44-8.83-1.5-10.23zm-1.95-.45c-2.28.38-4.9 3.46-6.14 7.79l-.08.3-.25.93 3.73 1zm-3.67-.26-.22.04a11.68 11.68 0 0 0-8.8 7.03l-.13.31-.07.19 4.48 1.2.25-.94c.9-3.33 2.55-6.12 4.5-7.83z','Lối vào khu nghỉ dưỡng',11,_binary '\0','Khách có thể sử dụng các cơ sở nghỉ dưỡng gần đó'),(123,'m20.88 1.51.05.12 1.86 4.64a3 3 0 0 1 .2.89l.01.23V30a1 1 0 0 1-.88 1H18a1 1 0 0 1-1-.88V7.38a3 3 0 0 1 .14-.9l.08-.2 1.85-4.65a1 1 0 0 1 1.8-.12zm8 0 .05.12 1.86 4.64a3 3 0 0 1 .2.89l.01.23V30a1 1 0 0 1-.88 1H26a1 1 0 0 1-1-.88V7.38a3 3 0 0 1 .14-.9l.08-.2 1.85-4.65a1 1 0 0 1 1.8-.12zM9.66 3.21l1.93.53-2.72 10.14 4.16 10.83 1.6-.64.74 1.86-1.62.65 1.2 3.13-1.87.72-1.19-3.11-1.52.6-.74-1.85 1.54-.62L8 17.16l-2.35 8.8 1.93.51-.52 1.93-1.93-.52-.78 2.9-1.93-.52.78-2.9-1.93-.51.51-1.93 1.93.51L6.77 14l-3.72-9.7 1.87-.72 2.73 7.13 2-7.48zM21 21h-2v8h2v-8zm8 0h-2v8h2v-8zm-8-5h-2v3h2v-3zm8 0h-2v3h2v-3zM20 4.7 19.07 7a1 1 0 0 0-.06.25l-.01.13V14h2V7.26l-.03-.13-.04-.12L20 4.7zm8 0L27.07 7a1 1 0 0 0-.06.25l-.01.13V14h2V7.38a1 1 0 0 0 0-.12l-.03-.13-.04-.12L28 4.7z','Đường trượt tuyết thẳng tới cửa',11,_binary '\0','Khách có thể đến chỗ thang máy trượt tuyết mà không cần lái xe hoặc đi phương tiện có trả phí'),(124,'M28 2a2 2 0 0 1 2 2v24a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 2H4v15.5h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 18c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1v3h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 23c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1V28h24zm-6 3a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z','Ven sông/hồ/biển',11,_binary '\0','Ngay cạnh nguồn nước');
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comfortable_detail`
--

LOCK TABLES `comfortable_detail` WRITE;
/*!40000 ALTER TABLE `comfortable_detail` DISABLE KEYS */;
INSERT INTO `comfortable_detail` VALUES (1,7,1),(2,5,1),(3,10,1),(4,4,1),(5,8,1),(6,11,1),(7,23,1),(8,12,1),(9,18,1),(10,13,1),(11,17,1),(12,21,1),(13,19,1),(14,16,1),(15,14,1),(16,43,1),(17,30,1),(18,44,1),(19,52,1),(20,50,1),(21,51,1),(22,55,1),(23,53,1),(24,68,1),(25,73,1),(26,62,1),(27,64,1),(28,67,1),(29,63,1),(30,89,1),(31,93,1),(32,95,1),(33,100,1),(34,96,1),(35,98,1),(36,99,1),(37,109,1),(38,108,1),(39,7,2),(40,5,2),(41,10,2),(42,6,2),(43,4,2),(44,3,2),(45,8,2),(46,12,2),(47,18,2),(48,13,2),(49,17,2),(50,21,2),(51,19,2),(52,14,2),(53,29,2),(54,43,2),(55,31,2),(56,30,2),(57,44,2),(58,45,2),(59,48,2),(60,55,2),(61,53,2),(62,68,2),(63,71,2),(64,62,2),(65,64,2),(66,66,2),(67,78,2),(68,86,2),(69,93,2),(70,95,2),(71,100,2),(72,7,3),(73,5,3),(74,10,3),(75,6,3),(76,4,3),(77,11,3),(78,23,3),(79,15,3),(80,12,3),(81,18,3),(82,13,3),(83,17,3),(84,21,3),(85,19,3),(86,16,3),(87,14,3),(88,29,3),(89,43,3),(90,41,3),(91,44,3),(92,52,3),(93,55,3),(94,53,3),(95,68,3),(96,73,3),(97,70,3),(98,62,3),(99,64,3),(100,66,3),(101,67,3),(102,75,3),(103,59,3),(104,74,3),(105,63,3),(106,60,3),(107,89,3),(108,93,3),(109,100,3),(110,91,3),(111,96,3),(112,110,3);
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

-- Dump completed on 2023-08-31  9:37:31
