CREATE DATABASE  IF NOT EXISTS `restaurant_reserve` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant_reserve`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurant_reserve
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `credit_card_number` char(16) NOT NULL,
  `card_type` enum('Visa','Amex','MasterCard','Discover') DEFAULT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`credit_card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES ('1234567891234567','Visa','2024-12-01');
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card_access`
--

DROP TABLE IF EXISTS `credit_card_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card_access` (
  `credit_card_number` char(16) NOT NULL,
  `user_name` varchar(256) NOT NULL,
  PRIMARY KEY (`credit_card_number`,`user_name`),
  KEY `access_fk2` (`user_name`),
  CONSTRAINT `access_fk1` FOREIGN KEY (`credit_card_number`) REFERENCES `credit_card` (`credit_card_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `access_fk2` FOREIGN KEY (`user_name`) REFERENCES `customer_account` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card_access`
--

LOCK TABLES `credit_card_access` WRITE;
/*!40000 ALTER TABLE `credit_card_access` DISABLE KEYS */;
INSERT INTO `credit_card_access` VALUES ('1234567891234567','KailashSenthilkumar');
/*!40000 ALTER TABLE `credit_card_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `cuisine_name` varchar(256) NOT NULL,
  PRIMARY KEY (`cuisine_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
INSERT INTO `cuisine` VALUES ('American'),('Indian'),('Italian'),('Mexican'),('Nepali');
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_account`
--

DROP TABLE IF EXISTS `customer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_account` (
  `customer_first_name` varchar(256) NOT NULL,
  `customer_last_name` varchar(256) NOT NULL,
  `user_name` varchar(256) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_account`
--

LOCK TABLES `customer_account` WRITE;
/*!40000 ALTER TABLE `customer_account` DISABLE KEYS */;
INSERT INTO `customer_account` VALUES ('Kailash','Senthilkumar','KailashSenthilkumar');
/*!40000 ALTER TABLE `customer_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `order_number` int NOT NULL,
  `order_date` datetime NOT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`restaurant_id`,`order_number`),
  CONSTRAINT `customer_order_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,'2023-12-08 16:42:26',3);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredient_name` varchar(256) NOT NULL,
  `allergen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ingredient_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES ('Almond',1),('American Cheese',0),('Avocado',0),('Basmati Rice',0),('Bell Pepper',0),('Chicken',0),('Chocolate',0),('Egg',0),('Garlic',0),('Lettuce',0),('Lime Juice',0),('Mozzarella Cheese',0),('Mushroom',0),('Olives',0),('Onion',0),('Seltzer',0),('Shrimp',1),('Tomato',0),('Vodka',0),('Whole Wheat Flour (Contains Gluten)',1);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_category`
--

DROP TABLE IF EXISTS `item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_category` (
  `category_type` varchar(100) NOT NULL,
  PRIMARY KEY (`category_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_category`
--

LOCK TABLES `item_category` WRITE;
/*!40000 ALTER TABLE `item_category` DISABLE KEYS */;
INSERT INTO `item_category` VALUES ('Appetizer'),('Beverages'),('Desserts'),('Entree'),('Sides');
/*!40000 ALTER TABLE `item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_name` varchar(256) NOT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`restaurant_id`,`menu_name`),
  CONSTRAINT `menu_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('Dunkin Donuts Menu',1),('Dunkin Donuts Menu',2),('Wow Tikka Daily Menu',3),('Wow Tikka Weekend Specials',3),('BarTaco Dinner Menu',4),('BarTaco Lunch Menu',4),('Joe\'s Speciality Pizza Menu',5);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(256) NOT NULL,
  `item_qty` int DEFAULT NULL,
  `item_made_to_order` tinyint(1) NOT NULL DEFAULT '1',
  `item_price` float NOT NULL,
  `menu_name` varchar(256) NOT NULL,
  `restaurant_id` int NOT NULL,
  `category_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `menu_item_fk1` (`category_type`),
  KEY `menu_item_fk2` (`restaurant_id`,`menu_name`),
  CONSTRAINT `menu_item_fk1` FOREIGN KEY (`category_type`) REFERENCES `item_category` (`category_type`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `menu_item_fk2` FOREIGN KEY (`restaurant_id`, `menu_name`) REFERENCES `menu` (`restaurant_id`, `menu_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_item_chk1` CHECK ((((`item_qty` is not null) and (`item_qty` >= 0) and (`item_made_to_order` = false)) or ((`item_qty` is null) and (`item_made_to_order` = true))))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES (1,'Egg Sandwich',NULL,1,4.49,'Dunkin Donuts Menu',1,'Appetizer'),(2,'Egg Sandwich',NULL,1,4.49,'Dunkin Donuts Menu',2,'Appetizer'),(3,'Veggie Delight Pizza',NULL,1,9.49,'Joe\'s Speciality Pizza Menu',5,'Entree'),(4,'Chicken Dum Biryani',NULL,1,15.49,'Wow Tikka Weekend Specials',3,'Entree'),(5,'Almond Chocolate Pastry',50,0,20,'BarTaco Dinner Menu',4,'Desserts'),(6,'Taco Platter',NULL,1,25,'BarTaco Lunch Menu',4,'Entree'),(7,'Tomato Salsa Shrimp Salad',NULL,1,15,'BarTaco Lunch Menu',4,'Sides'),(8,'Moscow Mule',NULL,1,15,'BarTaco Dinner Menu',4,'Beverages'),(9,'Samosa',290,0,3.49,'Wow Tikka Daily Menu',3,'Appetizer');
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item_ingredient`
--

DROP TABLE IF EXISTS `menu_item_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_ingredient` (
  `item_id` int NOT NULL,
  `ingredient_name` varchar(256) NOT NULL,
  PRIMARY KEY (`item_id`,`ingredient_name`),
  KEY `mig_fk2` (`ingredient_name`),
  CONSTRAINT `mig_fk1` FOREIGN KEY (`item_id`) REFERENCES `menu_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mig_fk2` FOREIGN KEY (`ingredient_name`) REFERENCES `ingredient` (`ingredient_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item_ingredient`
--

LOCK TABLES `menu_item_ingredient` WRITE;
/*!40000 ALTER TABLE `menu_item_ingredient` DISABLE KEYS */;
INSERT INTO `menu_item_ingredient` VALUES (5,'Almond'),(6,'American Cheese'),(6,'Avocado'),(4,'Basmati Rice'),(4,'Chicken'),(6,'Chicken'),(9,'Chicken'),(5,'Chocolate'),(1,'Egg'),(2,'Egg'),(3,'Garlic'),(6,'Lettuce'),(7,'Lettuce'),(8,'Lime Juice'),(3,'Mozzarella Cheese'),(3,'Mushroom'),(3,'Olives'),(3,'Onion'),(6,'Onion'),(9,'Onion'),(8,'Seltzer'),(7,'Shrimp'),(3,'Tomato'),(6,'Tomato'),(7,'Tomato'),(8,'Vodka'),(1,'Whole Wheat Flour (Contains Gluten)'),(2,'Whole Wheat Flour (Contains Gluten)'),(3,'Whole Wheat Flour (Contains Gluten)');
/*!40000 ALTER TABLE `menu_item_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_number` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_qty` int DEFAULT '1',
  `item_price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`restaurant_id`,`order_number`,`item_id`),
  KEY `oi_fk2` (`item_id`),
  CONSTRAINT `oi_fk1` FOREIGN KEY (`restaurant_id`, `order_number`) REFERENCES `customer_order` (`restaurant_id`, `order_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `oi_fk2` FOREIGN KEY (`item_id`) REFERENCES `menu_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,3,9,10,3.49);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_item_price` BEFORE INSERT ON `order_item` FOR EACH ROW BEGIN
	SET NEW.item_price = (SELECT item_price FROM menu_item WHERE item_id = NEW.item_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_item_inventory_qty` BEFORE INSERT ON `order_item` FOR EACH ROW BEGIN
	DECLARE inventory_count INT;
    DECLARE made_to_order_flag BOOLEAN;
    SELECT item_qty INTO inventory_count FROM menu_item WHERE menu_item.item_id = NEW.item_id;
    SELECT item_made_to_order INTO made_to_order_flag FROM menu_item WHERE menu_item.item_id = NEW.item_id;
    
    IF made_to_order_flag = False AND inventory_count < NEW.item_qty THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item Inventory Less Than Order Requirement!';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_item_qty_inventory_upon_order` AFTER INSERT ON `order_item` FOR EACH ROW BEGIN
	DECLARE made_to_order_flag BOOLEAN;
    SELECT item_made_to_order INTO made_to_order_flag FROM menu_item WHERE menu_item.item_id = NEW.item_id;
    
    IF made_to_order_flag = False THEN
		UPDATE menu_item
        SET menu_item.item_qty = menu_item.item_qty - NEW.item_qty WHERE menu_item.item_id = NEW.item_id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `places_order`
--

DROP TABLE IF EXISTS `places_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places_order` (
  `order_number` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `credit_card_number` char(16) NOT NULL,
  `user_name` varchar(256) NOT NULL,
  PRIMARY KEY (`restaurant_id`,`order_number`,`user_name`,`credit_card_number`),
  KEY `po_fk2` (`credit_card_number`,`user_name`),
  CONSTRAINT `po_fk1` FOREIGN KEY (`restaurant_id`, `order_number`) REFERENCES `customer_order` (`restaurant_id`, `order_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `po_fk2` FOREIGN KEY (`credit_card_number`, `user_name`) REFERENCES `credit_card_access` (`credit_card_number`, `user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_order`
--

LOCK TABLES `places_order` WRITE;
/*!40000 ALTER TABLE `places_order` DISABLE KEYS */;
INSERT INTO `places_order` VALUES (1,3,'1234567891234567','KailashSenthilkumar');
/*!40000 ALTER TABLE `places_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `user_name` varchar(256) NOT NULL,
  `restaurant_id` int NOT NULL,
  `reservation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_name`,`restaurant_id`,`reservation_date`),
  KEY `r_fk2` (`restaurant_id`),
  CONSTRAINT `r_fk1` FOREIGN KEY (`user_name`) REFERENCES `customer_account` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `r_fk2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(100) NOT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipcode` char(5) NOT NULL,
  `type_identifier` enum('Franchise-Based','Single Establishment') NOT NULL,
  PRIMARY KEY (`restaurant_id`),
  UNIQUE KEY `restaurant_altkey` (`street`,`city`,`state`,`zipcode`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Dunkin Donuts','08:00:00','17:30:00','100 Forsyth St','Boston','Massachusetts','02115','Franchise-Based'),(2,'Dunkin Donuts','08:00:00','17:30:00','360 Huntington Ave','Boston','Massachusetts','02115','Franchise-Based'),(3,'Wow Tikka','10:00:00','22:00:00','235 Park Drive','Boston','Massachusetts','02215','Single Establishment'),(4,'BarTaco','11:00:00','22:30:00','100 Seaport St','Harbor Point','Massachusetts','02110','Single Establishment'),(5,'Joe\'s Pizza','10:00:00','02:00:00','Times Square','Manhattan','New York','10018','Single Establishment');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_cuisine`
--

DROP TABLE IF EXISTS `restaurant_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_cuisine` (
  `restaurant_id` int NOT NULL,
  `cuisine_name` varchar(256) NOT NULL,
  PRIMARY KEY (`restaurant_id`,`cuisine_name`),
  KEY `restaurant_cuisine_fk2` (`cuisine_name`),
  CONSTRAINT `restaurant_cuisine_fk1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `restaurant_cuisine_fk2` FOREIGN KEY (`cuisine_name`) REFERENCES `cuisine` (`cuisine_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_cuisine`
--

LOCK TABLES `restaurant_cuisine` WRITE;
/*!40000 ALTER TABLE `restaurant_cuisine` DISABLE KEYS */;
INSERT INTO `restaurant_cuisine` VALUES (1,'American'),(2,'American'),(4,'American'),(5,'American'),(3,'Indian'),(5,'Italian'),(4,'Mexican'),(3,'Nepali');
/*!40000 ALTER TABLE `restaurant_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `review_rating` enum('0','1','2','3','4','5') NOT NULL,
  `review_date` date NOT NULL,
  `review_description` varchar(1000) DEFAULT NULL,
  `user_name` varchar(256) NOT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_fk1` (`user_name`),
  KEY `review_fk2` (`restaurant_id`),
  CONSTRAINT `review_fk1` FOREIGN KEY (`user_name`) REFERENCES `customer_account` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_fk2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'3','2023-12-08','Good..! Could do better.','KailashSenthilkumar',3);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'restaurant_reserve'
--

--
-- Dumping routines for database 'restaurant_reserve'
--
/*!50003 DROP FUNCTION IF EXISTS `display_review_restaurant_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `display_review_restaurant_count`(id_p INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE review_count INT;
    IF id_p IN (SELECT restaurant_id FROM restaurant) AND id_p IN (SELECT DISTINCT restaurant_id FROM review) THEN
		SELECT COUNT(review_id) INTO review_count FROM review WHERE restaurant_id = id_p;
	ELSE 
		SELECT 0 INTO review_count;
	END IF;
    RETURN review_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `display_review_restaurant_user_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `display_review_restaurant_user_count`(id_p INT, uname_p VARCHAR(256)) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE review_count INT;
    IF id_p IN (SELECT restaurant_id FROM restaurant) AND id_p IN (SELECT DISTINCT restaurant_id FROM review) 
		AND uname_p IN (SELECT user_name FROM customer_account) AND uname_p IN (SELECT DISTINCT uname_p FROM review) THEN
		SELECT COUNT(review_id) INTO review_count FROM review WHERE restaurant_id = id_p AND user_name = uname_p;
	ELSE 
		SELECT 0 INTO review_count;
	END IF;
    RETURN review_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `display_review_uname_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `display_review_uname_count`(uname_p VARCHAR(256)) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE review_count INT;
    IF uname_p IN (SELECT user_name FROM customer_account) AND uname_p IN (SELECT DISTINCT user_name FROM review) THEN
		SELECT COUNT(review_id) INTO review_count FROM review WHERE user_name = uname_p;
	ELSE 
		SELECT 0 INTO review_count;
	END IF;
    RETURN review_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_order_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_order_item`(ord_num_p INT, item_id_p INT, qty_p INT, id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM customer_order WHERE order_number = ord_num_p AND restaurant_id = id_p;
    IF id_p NOT IN (SELECT restaurant_id FROM restaurant) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Does Not Exist';
	ELSE 
		IF row_found = 0 THEN
			CALL create_customer_order(ord_num_p, id_p, CURRENT_TIMESTAMP);
			INSERT INTO order_item(order_number, restaurant_id, item_id, item_qty) VALUES (ord_num_p, id_p, item_id_p, qty_p);
		ELSE 
			INSERT INTO order_item(order_number, restaurant_id, item_id, item_qty) VALUES (ord_num_p, id_p, item_id_p, qty_p);
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_credit_card` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_credit_card`(num_p CHAR(16), type_p ENUM('Visa', 'Amex', 'MasterCard', 'Discover'), date_p DATE,
									uname_p VARCHAR(256))
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    DECLARE row_found_3 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM credit_card WHERE credit_card_number = num_p;
    SELECT COUNT(*) INTO row_found_2 FROM customer_account WHERE user_name = uname_p;
    SELECT COUNT(*) INTO row_found_3 FROM credit_card_access WHERE credit_card_number = num_p AND user_name = uname_p;
    IF row_found_3 != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User-Credit Card Pair Already Exists!';
	ELSE 
		IF row_found_1 != 0 AND row_found_2 = 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User Not Present in DB!';
		END IF;
        IF row_found_1 = 0 AND row_found_2 = 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot Create Credit Card For Invalid User';
		END IF;
        IF row_found_1 = 0 AND row_found_2 != 0 THEN
			INSERT INTO credit_card(credit_card_number, card_type, expiry_date) VALUES (num_p, type_p, date_p);
            INSERT INTO credit_card_access(credit_card_number, user_name) VALUES (num_p, uname_p);
		END IF;
        IF row_found_1 != 0 AND row_found_2 != 0 THEN
			INSERT INTO credit_card_access(credit_card_number, user_name) VALUES (num_p, uname_p);
		END IF;
    END IF;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_cuisine`(cuisine_name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM cuisine WHERE cuisine.cuisine_name = cuisine_name_p;
    
    IF row_found != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cuisine Already Exists!';
	ELSE
		INSERT INTO cuisine(cuisine_name) VALUES(cuisine_name_p);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_customer_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_customer_account`(fname_p VARCHAR(256), lname_p VARCHAR(256), uname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM customer_account WHERE user_name = uname_p;
    IF row_found != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username Already Exists!';
	ELSE 
		INSERT INTO customer_account(customer_first_name, customer_last_name, user_name) VALUES (fname_p, lname_p, uname_p);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_customer_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_customer_order`(ord_num_p INT, id_p INT, date_p DATETIME)
BEGIN
	DECLARE row_found1 INT DEFAULT 0;
    DECLARE row_found2 INT DEFAULT 0;
    DECLARE next_ord_num INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found1 FROM restaurant WHERE restaurant_id = id_p;
    IF row_found1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Restaurant Selected!';
	ELSE 
		SELECT COUNT(*) INTO row_found2 FROM customer_order WHERE order_number = ord_num_p AND restaurant_id = id_p;
        IF row_found2 != 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order Already Present';
		ELSE
			IF id_p NOT IN (SELECT DISTINCT restaurant_id FROM customer_order) THEN
				SELECT 1 INTO next_ord_num;
			ELSE
				SELECT max(order_number) + 1 INTO next_ord_num FROM customer_order WHERE restaurant_id = id_p;
			END IF;
            SELECT next_ord_num INTO ord_num_p;
			INSERT INTO customer_order(order_number, restaurant_id, order_date) VALUES(ord_num_p, id_p, date_p);
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_ingredient`(name_p VARCHAR(256), allergen_p BOOLEAN)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM ingredient WHERE ingredient_name = name_p;
    IF row_found != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ingredient Already Exists!';
	ELSE
		INSERT INTO ingredient(ingredient_name, allergen) VALUES (name_p, allergen_p);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_item_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_item_category`(type_name VARCHAR(100))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM item_category WHERE category_type = type_name;
    IF row_found != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item Category Already Exists!';
	ELSE 
		INSERT INTO item_category(category_type) VALUES (type_name);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_menu`(id_p INT, name_p VARCHAR(256))
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM restaurant WHERE restaurant_id = id_p;
    SELECT COUNT(*) INTO row_found_2 FROM menu WHERE restaurant_id = id_p AND menu_name = name_p;
    
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Not Found!';
	END IF;
    IF row_found_1 != 0 AND row_found_2 != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant - Menu Pair Already Exists';
	END IF;
    IF row_found_1 != 0 AND row_found_2 = 0 THEN
		INSERT INTO menu(menu_name, restaurant_id) VALUES (name_p, id_p);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_menu_item`(item_name_p VARCHAR(256), qty_p INT, mto_p BOOLEAN, price_p FLOAT,
								  menu_name_p VARCHAR(256), id_p INT, type_p VARCHAR(100))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    DECLARE row_found_fk1 INT DEFAULT 0;
    DECLARE row_found_fk2 INT DEFAULT 0;
    
    SELECT COUNT(*) INTO row_found_fk1 FROM menu WHERE menu_name = menu_name_p AND restaurant_id = id_p;
    SELECT COUNT(*) INTO row_found_fk2 FROM item_category WHERE category_type = type_p;
    
    IF qty_p IS NULL AND mto_p IS TRUE THEN
		SELECT COUNT(item_id) INTO row_found FROM menu_item WHERE item_name = item_name_p AND item_qty IS NULL 
															AND item_made_to_order IS TRUE AND menu_name = menu_name_p
                                                            AND restaurant_id = id_p AND category_type = type_p
                                                            AND item_price = price_p;
	ELSEIF qty_p IS NOT NULL AND mto_p IS FALSE THEN
		SELECT COUNT(item_id) INTO row_found FROM menu_item WHERE item_name = item_name_p AND item_qty IS NOT NULL 
															AND item_made_to_order IS FALSE AND menu_name = menu_name_p
                                                            AND restaurant_id = id_p AND category_type = type_p
                                                            AND item_price = price_p;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item Can Either be Made to Order or Should have a fixed inventory!';
	END IF;
    IF row_found != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Menu Item Already Exists';
	ELSE
		IF row_found_fk1 = 0 OR row_found_fk2 = 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Choose a Valid Value for Menu Name - Restaurant Pair / Item Category Type';
		ELSE 
			INSERT INTO menu_item(item_name, item_qty, item_made_to_order, item_price, menu_name, restaurant_id, category_type)
            VALUES(item_name_p, qty_p, mto_p, price_p, menu_name_p, id_p, type_p);
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_menu_item_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_menu_item_ingredient`(item_id_p INT, name_p VARCHAR(256))
BEGIN
	DECLARE row_found1 INT DEFAULT 0;
    DECLARE row_found2 INT DEFAULT 0;
    DECLARE row_found3 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found1 FROM menu_item WHERE item_id = item_id_p;
    SELECT COUNT(*) INTO row_found2 FROM ingredient WHERE ingredient_name = name_p;
    SELECT COUNT(*) INTO row_found3 FROM menu_item_ingredient WHERE item_id = item_id_p AND ingredient_name = name_p;
    IF row_found1 = 0 OR row_found2 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Menu Item/Ingredient';
	ELSE 
		IF row_found3 != 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ingredient Already Exists for Menu Item';
		ELSE
			INSERT INTO menu_item_ingredient(item_id, ingredient_name) VALUES (item_id_p, name_p);
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_places_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_places_order`(ord_num_p INT, id_p INT, card_number_p CHAR(16), uname_p VARCHAR(256))
BEGIN
	DECLARE row_found1 INT DEFAULT 0;
    DECLARE row_found2 INT DEFAULT 0;
    DECLARE row_found3 INT DEFAULT 0;
    DECLARE row_found4 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found1 FROM places_order WHERE order_number = ord_num_p 
													  AND restaurant_id = id_p AND credit_card_number = card_number_p
                                                      AND user_name = uname_p;
	SELECT COUNT(*) INTO row_found2 FROM customer_order WHERE order_number = ord_num_p AND restaurant_id = id_p;
    SELECT COUNT(*) INTO row_found3 FROM credit_card_access WHERE credit_card_number = card_number_p AND user_name = uname_p;
    SELECT COUNT(*) INTO row_found4 FROM restaurant WHERE restaurant_id = id_p;
    
    IF row_found3 = 0 OR row_found4 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Restaurant/Credit Card Number/Username';
	ELSE
		IF row_found1 != 0 AND row_found2 != 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order Already Exists!';
		END IF;
        IF row_found1 != 0 AND row_found2 = 0 THEN
			CALL create_customer_order(ord_num_p, id_p, CURRENT_TIMESTAMP);
		END IF;
        IF row_found1 = 0 AND row_found2 != 0 THEN
			INSERT INTO places_order(order_number, restaurant_id, credit_card_number, user_name) VALUES 
				(ord_num_p, id_p, card_number_p, uname_p);
		END IF;
        IF row_found1 = 0 AND row_found2 = 0 THEN
			INSERT INTO places_order(order_number, restaurant_id, credit_card_number, user_name) VALUES 
				(ord_num_p, id_p, card_number_p, uname_p);
			CALL create_customer_order(ord_num_p, id_p, CURRENT_TIMESTAMP);
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_reservation_tuple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_reservation_tuple`(uname_p VARCHAR(256), id_p INT, date_p DATETIME)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM reservation WHERE user_name = uname_p AND restaurant_id = id_p AND reservation_date = date_p;
    IF row_found != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Same Reservation Exists!';
	ELSE
		IF row_found = 0 AND uname_p IN (SELECT user_name FROM customer_account) AND id_p IN (SELECT restaurant_id FROM restaurant) THEN
			INSERT INTO reservation(user_name, restaurant_id, reservation_date) VALUES (uname_p, id_p, date_p);
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Username And/Or Restaurant!';
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_restaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_restaurant`(name_p VARCHAR(100), open_time_p TIME, close_time_p TIME, street_p VARCHAR(20),
									city_p VARCHAR(50), state_p VARCHAR(50), zip_p CHAR(5),
                                    type_p ENUM('Franchise-Based', 'Single Establishment'))
BEGIN 
    DECLARE row_counter INT DEFAULT 0;
    
    SELECT COUNT(restaurant_id) INTO row_counter 
    FROM restaurant 
    WHERE (restaurant.street = street_p) AND (restaurant.city = city_p) AND (restaurant.state = state_p)
			AND (restaurant.zipcode = zip_p);
	
    IF row_counter > 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Already Exists in Location';
	ELSE
		INSERT INTO restaurant(restaurant_name, open_time, close_time, street, city, state, zipcode, type_identifier)
			VALUES(name_p, open_time_p, close_time_p, street_p, city_p, state_p, zip_p, type_p);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_restaurant_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_restaurant_cuisine`(id_p INT, name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    DECLARE valid_id INT DEFAULT 0;
    DECLARE valid_name INT DEFAULT 0;
    
    SELECT COUNT(*) INTO valid_id FROM restaurant WHERE restaurant_id = id_p;
    SELECT COUNT(*) INTO valid_name FROM cuisine WHERE cuisine_name = name_p;
    SELECT COUNT(*) INTO row_found FROM restaurant_cuisine WHERE restaurant_id = id_p AND cuisine_name = name_p;
    
    IF valid_id != 0 AND valid_name != 0 AND row_found != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Cuisine Combination Already Exists';
	END IF;
    
    IF valid_id = 0 OR valid_name = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant ID/Cuisine Name Does Not Exist';
	END IF;
    
    IF valid_id != 0 AND valid_name != 0 AND row_found = 0 THEN
		INSERT INTO restaurant_cuisine(restaurant_id, cuisine_name) VALUES (id_p, name_p);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_review`(rate_p ENUM('0', '1', '2', '3', '4', '5'), date_p DATE, desc_p VARCHAR(1000), 
							  uname_p VARCHAR(256), id_p INT)
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    DECLARE row_found_3 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM review WHERE review_date = date_p AND user_name = uname_p AND restaurant_id = id_p;
	SELECT COUNT(*) INTO row_found_2 FROM restaurant WHERE restaurant_id = id_p;
    SELECT COUNT(*) INTO row_found_3 FROM customer_account WHERE user_name = uname_p;
    IF row_found_2 = 0 OR row_found_3 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer User Name And/Or Restaurant ID does not exist!';
	ELSE 
		IF row_found_1 != 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Review Already Exists!';
		ELSE
			INSERT INTO review(review_rating, review_date, review_description, user_name, restaurant_id) VALUES
				(rate_p, date_p, desc_p, uname_p, id_p);
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_credit_card` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_credit_card`(num_p CHAR(16))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM credit_card WHERE credit_card_number = num_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Credit Card Number Entered Does Not Exist!';
	ELSE 
		DELETE FROM credit_card WHERE credit_card_number = num_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_cuisine`(cuisine_name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM cuisine WHERE cuisine_name = cuisine_name_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Cuisine Exists With This Name';
	ELSE
		DELETE FROM cuisine WHERE cuisine_name = cuisine_name_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_customer_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_customer_account`(uname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM customer_account WHERE user_name = uname_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No User Found!';
	ELSE 
		DELETE FROM customer_account WHERE user_name = uname_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_from_menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_from_menu`(id_p INT, name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu WHERE restaurant_id = id AND menu_name = name_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Restaurant-Menu Pair';
	ELSE 
		DELETE FROM menu WHERE restaurant_id = id_p AND menu_name = name_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_ingredient`(name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found WHERE ingredient_name = name_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ingredient Not Found';
	ELSE
		DELETE FROM ingredient WHERE ingredient_name = name_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_item_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_item_category`(type_name_p VARCHAR(100))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM item_category WHERE category_type = type_name_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item Category Not Found!';
	ELSE 
		DELETE FROM item_category WHERE category_type = type_name_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_menu_item`(item_id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu_item WHERE item_id = item_id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item Not Found';
	ELSE 
		DELETE FROM menu_item WHERE item_id = item_id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_menu_item_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_menu_item_ingredient`(item_id_p INT, name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu_item_ingredient WHERE item_id = item_id_p AND ingredient_name = name_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Menu Item - Ingredient Pair not Found';
	ELSE 
		DELETE FROM menu_item_ingredient WHERE item_id = item_id_p AND ingredient_name = name_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_reservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_reservation`(uname_p VARCHAR(256), id_p INT, time_p DATETIME)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM reservation WHERE user_name = uname_p 
													AND restaurant_id = id_p AND reservation_date = time_p;
	IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Reservation Found';
	ELSE 
		DELETE FROM reservation WHERE user_name = uname_p AND restaurant_id = id_p AND reservation_date = time_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_restaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_restaurant`(id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM restaurant WHERE restaurant.restaurant_id = id_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Not Found!';
	ELSE
		DELETE FROM restaurant WHERE restaurant_id = id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_restaurant_cuisine_pair` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_restaurant_cuisine_pair`(id_p INT, name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM restaurant_cuisine WHERE restaurant_id = id_p AND cuisine_name = name_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tuple not found!';
	ELSE 
		DELETE FROM restaurant_cuisine WHERE restaurant_id = id_p AND cuisine_name = name_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_review`(rev_id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM review WHERE review_id = rev_id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Review Not Found!';
	ELSE 
		DELETE FROM review WHERE review_id = rev_id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user_credit_card` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user_credit_card`(uname_p VARCHAR(256), card_p CHAR(16))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM credit_card_access WHERE user_name = uname_p AND credit_card_number = card_p;
    IF row_found = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User-Credit Card Pair Does Not Exist!';
	ELSE 
		DELETE FROM credit_card_access WHERE user_name = uname_p AND credit_card_number = card_p;
        IF card_p NOT IN (SELECT DISTINCT credit_card_number FROM credit_card_access) THEN
			DELETE FROM credit_card WHERE credit_card_number = card_p;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_available_menu_items` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_available_menu_items`(menu_name_p VARCHAR(256), id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu_item WHERE menu_name = menu_name_p AND restaurant_id = id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Menu Items for This Menu Name-Restaurant Pair';
	ELSE 
		SELECT item_id, item_name, item_qty, item_made_to_order, item_price FROM menu_item WHERE
			menu_name = menu_name_p AND restaurant_id = id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_customer_account_fname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_customer_account_fname`(fname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM customer_account WHERE customer_first_name = fname_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No User Found!';
	ELSE
		SELECT customer_first_name, customer_last_name, user_name FROM customer_account WHERE customer_first_name LIKE fname_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_customer_account_lname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_customer_account_lname`(lname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM customer_account WHERE customer_last_name = lname_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No User Found!';
	ELSE
		SELECT customer_first_name, customer_last_name, user_name FROM customer_account WHERE customer_last_name LIKE lname_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_customer_account_uname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_customer_account_uname`(uname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM customer_account WHERE user_name = uname_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No User Found!';
	ELSE
		SELECT customer_first_name, customer_last_name, user_name FROM customer_account WHERE user_name LIKE uname_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_customer_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_customer_order`(id_p INT, date_p DATE)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found WHERE restaurant_id = id_p AND order_date = date_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Orders Found!';
	ELSE
		SELECT * FROM customer_order WHERE restaurant_id = id_p AND order_date = date_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_ingredient_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_ingredient_menu_item`(item_id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu_item_ingredient WHERE item_id = item_id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Menu Item Not Found!';
	ELSE
		SELECT ingredient_name FROM menu_item_ingredient WHERE item_id = item_id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_menus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_menus`(id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu WHERE restaurant_id = id_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Not Found!';
	ELSE 
		SELECT X.restaurant_id, restaurant_name, menu_name
        FROM (SELECT * FROM menu WHERE restaurant_id = id_p) AS X
        INNER JOIN restaurant
        ON restaurant.restaurant_id = X.restaurant_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_menu_item_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_menu_item_category`(type_p VARCHAR(100), id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu_item WHERE category_type = type_p AND restaurant_id = id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Menu Items for this Item Category in Selected Restaurant';
	ELSE 
		SELECT item_id, item_name, item_qty, item_made_to_order, item_price, menu_name, restaurant_name, X.restaurant_id
        FROM (SELECT * FROM menu_item WHERE category_type = type_p AND restaurant_id = id_p) AS X
        INNER JOIN restaurant
        ON restaurant.restaurant_id = X.restaurant_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_menu_item_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_menu_item_ingredient`(name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu_ingredient WHERE ingredient_name = name_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Menu Items Have this Ingredient';
	ELSE 
		SELECT id, item_name, restaurant_name 
        FROM (SELECT X.item_id AS id, item_name, restaurant_id
				FROM (SELECT * FROM menu_item_ingredient WHERE ingredient_name = name_p) AS X
				INNER JOIN menu_item ON X.item_id = menu_item.item_id) AS Y
		INNER JOIN restaurant
        ON Y.restaurant_id = restaurant.restaurant_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_order_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_order_item`(ord_num_p INT, id_p INT)
BEGIN 
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM order_item WHERE order_number = ord_num_p AND restaurant_id = id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order Does not Exist!';
	ELSE
		SELECT X.item_id, item_name, X.item_qty, X.item_price
        FROM (SELECT * FROM order_item WHERE order_number = ord_num_p AND restaurant_id = id_p) AS X
        INNER JOIN menu_item
        ON menu_item.item_id = X.item_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_places_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_places_order`(uname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM places_order WHERE user_name = uname_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Orders Found';
	ELSE 
		SELECT order_number, X.restaurant_id, restaurant_name, credit_card_number
        FROM (SELECT * FROM places_order WHERE user_name = uname_p) AS X
        INNER JOIN restaurant
        ON restaurant.restaurant_id  = X.restaurant_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_reservation_restaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_reservation_restaurant`(id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM reservation WHERE restaurant_id = id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Has Never Had Reservations';
	ELSE 	
		SELECT * FROM reservation WHERE restaurant_id = id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_reservation_restaurant_upcoming` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_reservation_restaurant_upcoming`(id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM reservation WHERE restaurant_id = id_p AND reservation_time >= CURRENT_TIMESTAMP;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Reservation Found';
	ELSE 	
		SELECT * FROM reservation WHERE restaurant_id = id_p AND reservation_date >= CURRENT_TIMESTAMP;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_reservation_uname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_reservation_uname`(uname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM reservation WHERE user_name = uname_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User Does Not Have Any Reservation';
	ELSE 	
		SELECT * FROM reservation WHERE user_name = uname_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_reservation_uname_upcoming` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_reservation_uname_upcoming`(uname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM reservation WHERE user_name = uname_p AND reservation_date >= CURRENT_TIMESTAMP;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Reservation Found';
	ELSE 	
		SELECT * FROM reservation WHERE user_name = uname_p AND reservation_date >= CURRENT_TIMESTAMP;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_restaurants_based_on_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_restaurants_based_on_cuisine`(name_p VARCHAR(256))
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM cuisine WHERE cuisine_name = name_p;
    SELECT COUNT(*) INTO row_found_2 FROM restaurant_cuisine WHERE cuisine_name = name_p;
    
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Such Cuisine Exists in the Database!';
	END IF;
    IF row_found_2 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Restaurant Exists With This Cuisine';
	END IF;
    IF row_found_1 != 0 AND row_found_2 != 0 THEN
		SELECT X.restaurant_id AS id, restaurant_name, cuisine_name 
        FROM (SELECT * FROM restaurant_cuisine WHERE cuisine_name = name_p) AS X
        INNER JOIN restaurant
        ON X.restaurant_id = restaurant.restaurant_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_restaurants_menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_restaurants_menu`(name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu WHERE menu_name = name_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Restaurant Exists with this Menu Name';
	ELSE 
		SELECT X.restaurant_id, restaurant_name, X.menu_name
        FROM (SELECT * FROM menu WHERE menu_name = name_p) AS X
        INNER JOIN restaurant
        ON restaurant.restaurant_id = X.restaurant_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_restaurant_based_on_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_restaurant_based_on_name`(IN name_p VARCHAR(100))
BEGIN
	SELECT * FROM restaurant WHERE restaurant_name LIKE name_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_review_restaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_review_restaurant`(id_p INT)
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM review WHERE restaurant_id = id_p;
    SELECT COUNT(*) INTO row_found_2 FROM restaurant WHERE restaurant_id = id_p;
    IF row_found_2 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such restaurant exists in the DB!';
	END IF;
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Reviews Created for this restaurant!';
	END IF;
    IF row_found_2 !=0 AND row_found_1 != 0 THEN
		SELECT * FROM review WHERE restaurant_id = id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_review_uname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_review_uname`(uname_p VARCHAR(256))
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM review WHERE user_name = uname_p;
    SELECT COUNT(*) INTO row_found_2 FROM customer_account WHERE user_name = uname_p;
    IF row_found_2 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such user exists in the DB!';
	END IF;
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User has not created any reviews';
	END IF;
    IF row_found_2 !=0 AND row_found_1 != 0 THEN
		SELECT review_id, review_rating, review_date, review_description, restaurant_name
        FROM (SELECT * FROM review WHERE user_name = uname_p) AS X
        INNER JOIN restaurant 
        ON X.restaurant_id = restaurant.restaurant_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_review_uname_restaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_review_uname_restaurant`(uname_p VARCHAR(256), id_p INT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM review WHERE user_name = uname_p AND restaurant_id = id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Reviews found for Username - Restaurant Pair!';
	ELSE 
        SELECT review_id, review_rating, review_date, review_description, restaurant_name
        FROM (SELECT * FROM review WHERE user_name = uname_p AND restaurant_id = id_p) AS X
        INNER JOIN restaurant 
        ON X.restaurant_id = restaurant.restaurant_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_user_credit_card` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_user_credit_card`(uname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM credit_card_access WHERE user_name = uname_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User Does Not Have a Credit Card';
	ELSE
		SELECT X.credit_card_number AS card_number, card_type, expiry_date FROM credit_card
		INNER JOIN (SELECT * FROM credit_card_access WHERE user_name = uname_p) AS X
        ON credit_card.credit_card_number = X.credit_card_number;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_cuisine`(cuisine_name_p VARCHAR(256))
BEGIN
	SELECT * FROM cuisine WHERE cuisine_name LIKE cuisine_name_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_credit_card_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_credit_card_info`(old_num_p CHAR(16), new_num_p CHAR(16), type_p ENUM('Visa', 'Amex', 'MasterCard', 'Discover'), date_p DATE)
BEGIN
	DECLARE row_found1 INT DEFAULT 0;
    DECLARE row_found2 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found1 FROM credit_card WHERE credit_card_number = old_num_p;
    SELECT COUNT(*) INTO row_found2 FROM credit_card WHERE credit_card_number = new_num_p;
    IF row_found1 = 0 OR row_found2 != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Old Credit Card Does Not Exist / New Credit Card Already Exists';
	ELSE 
		UPDATE credit_card SET credit_card_number = new_num_p, card_type = type_p, expiry_date = date_p WHERE credit_card_number  = old_num_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_cuisine`(old_name_p VARCHAR(256), new_name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM cuisine WHERE cuisine_name = old_name_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Cuisine Exists With Old Name';
	ELSE
		UPDATE cuisine SET cuisine_name = new_name_p WHERE cuisine_name = old_name;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_cuisine_restaurant_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_cuisine_restaurant_cuisine`(id_p INT, old_name_p VARCHAR(256), new_name_p VARCHAR(256))
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
	DECLARE row_found_2 INT DEFAULT 0;
    DECLARE rest_id_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM cuisine WHERE cuisine_name = new_name_p;
    SELECT COUNT(*) INTO row_found_2 FROM restaurant_cuisine WHERE restaurant_id = id_p AND cuisine_name = old_name_p;
    SELECT COUNT(*) INTO rest_id_found FROM restaurant_cuisine WHERE restaurant_id = id_p;
    
    IF rest_id_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tuple not found! Need to Create a Tuple for this Restaurant';
	END IF;
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid New Cuisine! The New Cuisine Value Must Exist in the DB';
	END IF;
    IF row_found_1 != 0 AND row_found_2 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Restaurant Exists With This Cuisine';
	END IF;
    IF row_found_1 != 0 AND row_found_2 != 0 AND rest_id_found != 0 THEN
		UPDATE restaurant_cuisine
        SET cuisine_name = new_name_p
        WHERE restaurant_id = id_p AND cuisine_name = old_name_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_customer_account_fname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer_account_fname`(fname_p VARCHAR(256), uname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM customer_account WHERE user_name = uname_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No User Found!';
	ELSE
		UPDATE customer_account
        SET customer_first_name = fname_p WHERE user_name = uname_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_customer_account_lname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer_account_lname`(lname_p VARCHAR(256), uname_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM customer_account WHERE user_name = uname_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No User Found!';
	ELSE
		UPDATE customer_account
        SET customer_last_name = lname_p WHERE user_name = uname_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_customer_account_uname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer_account_uname`(old_uname_p VARCHAR(256), new_uname_p VARCHAR(256))
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM customer_account WHERE user_name = old_uname_p;
    SELECT COUNT(*) INTO row_found_2 FROM customer_account WHERE user_name = new_uname_p;
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No User Found!';
	END IF;
    IF row_found_2 != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'New Username Already Exists! Use Something else';
	END IF;
    IF row_found_1 != 0 AND row_found_2 = 0 THEN
		UPDATE customer_account
        SET user_name = new_uname_p WHERE user_name = old_uname_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ingredient_allergen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_ingredient_allergen`(name_p VARCHAR(256), allergen_p BOOLEAN)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found WHERE ingredient_name = name_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ingredient Not Found';
	ELSE
		UPDATE ingredient SET allergen = allergen_p WHERE ingredient_name = name_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ingredient_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_ingredient_name`(old_name_p VARCHAR(256), new_name_p VARCHAR(256))
BEGIN
	DECLARE row_found1 INT DEFAULT 0;
    DECLARE row_found2 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found1 WHERE ingredient_name = old_name_p;
    SELECT COUNT(*) INTO row_found2 WHERE ingredient_name = new_name_p;
    IF row_found1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ingredient Not Found';
	ELSE 
		IF row_found2 != 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'New Ingredient Already Exists';
		ELSE 
			UPDATE ingredient SET ingredient_name = new_name_p WHERE ingredient_name = old_name_p;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_item_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_item_category`(old_name_p VARCHAR(100), new_name_p VARCHAR(100))
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM item_category WHERE item_category.category_name = old_name_p;
    SELECT COUNT(*) INTO row_found_2 FROM item_category WHERE item_category.category_name = new_name_p;
    
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item Category Not Found!';
	END IF;
    IF row_found_2 != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'New Item Category Already Exists!';
	END IF;
    IF row_found_1 != 0 AND row_found_2 = 0 THEN
		UPDATE item_category
        SET category_type = new_name_p
        WHERE category_type = old_name_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_item_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_item_ingredient`(item_id_p INT, old_name_p VARCHAR(256), new_name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu_item_ingredient WHERE item_id = item_id_p AND ingredient_name = old_name_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Menu Item - Ingredient Pair';
	ELSE 
		IF new_name_p NOT IN (SELECT ingredient_name FROM ingredient) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'New Ingredient Does not Exist!';
		ELSE 
			UPDATE menu_item_ingredient SET ingredient_name = new_name_p WHERE item_id = item_id_p AND ingredient_name = old_name_p;
        END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_item_mto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_item_mto`(item_id_p INT, mto_p BOOLEAN)
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE mto_flag BOOLEAN;
    SELECT COUNT(*) INTO row_found_1 FROM menu_item WHERE item_id = item_id_p;
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Item Chosen';
	ELSE 
		SELECT item_made_to_order INTO mto_flag FROM menu_item WHERE item_id = item_id_p;
        IF mto_flag = True AND mto_p = False THEN
			UPDATE menu_item SET item_made_to_order = mto_p, item_qty = 0 WHERE item_id = item_id_p;
		END IF;
        IF mto_flag = False AND mto_p = True THEN
			UPDATE menu_item SET item_made_to_order = mto_p, item_qty = NULL WHERE item_id = item_id_p;
		END IF;
        IF mto_flag = True AND mto_p = True THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item is Already Made to Order';
		END IF;
        IF mto_flag = False AND mto_p = False THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item is Already Not Made to ORder';
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_item_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_item_name`(item_id_p INT, name_p VARCHAR(256))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu_item WHERE item_id = item_id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item Not Found';
	ELSE 
		UPDATE menu_item SET item_name = name_p WHERE item_id = item_id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_item_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_item_price`(item_id_p INT, price_p FLOAT)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM menu_item WHERE item_id = item_id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item Not Found';
	ELSE 
		UPDATE menu_item SET item_price = price_p WHERE item_id = item_id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_item_qty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_item_qty`(item_id_p INT, qty_p INT)
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE mto_flag BOOLEAN;
    SELECT COUNT(*) INTO row_found_1 FROM menu_item WHERE item_id = item_id_p;
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Item Chosen';
	ELSE 
		SELECT item_made_to_order INTO mto_flag FROM menu_item WHERE item_id = item_id_p;
        IF mto_flag = True THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item is Made to Order. Cannot change Quantity';
		ELSE
			IF qty_p <= (SELECT item_qty FROM menu_item WHERE item_id = item_id_p) THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot Decrease Quantity';
			ELSE
				UPDATE menu_item SET item_qty = qty_p WHERE item_id = item_id_p;
			END IF;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_name`(id_p INT, old_name_p VARCHAR(256), new_name_p VARCHAR(256))
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    DECLARE row_found_3 INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found_1 FROM menu WHERE restaurant_id = id_p;
    SELECT COUNT(*) INTO row_found_2 FROM menu WHERE restaurant_id = id_p AND menu_name = old_name_p;
    SELECT COUNT(*) INTO row_found_3 FROM menu WHERE restaurant_id = id_p AND menu_name = new_name_p;
    
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Does Not Have a Menu';
	ELSE 
		IF row_found_2 = 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant-Menu Paid Does Not Exist With Old Menu Name';
		END IF;
        IF row_found_3 != 0 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant-Menu Pair Already Exists With New Menu Name';
		END IF;
        IF row_found_2 != 0 AND row_found_3 = 0 THEN
			UPDATE menu
            SET menu_name = new_name_p
            WHERE restaurant_id = id_p AND menu_name = old_name_p;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_reservation_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_reservation_time`(uname_p VARCHAR(256), id_p INT, old_time_p DATETIME, new_time_p DATETIME)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM reservation WHERE user_name = uname_p 
													AND restaurant_id = id_p AND reservation_date = old_time_p
                                                    AND reservation_date != new_time_p; 
	IF old_time_p < CURRENT_TIMESTAMP OR new_time_p < CURRENT_TIMESTAMP THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Time Choice(s)';
	END IF;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Reservation Found';
	ELSE 
		IF old_time_p >= CURRENT_TIMESTAMP AND new_time_p >= CURRENT_TIMESTAMP THEN
			UPDATE reservation
            SET reservation_date = new_time_p
            WHERE user_name = uname_p AND restaurant_id = id_p AND reservation_date = old_time_p;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_restaurant_close_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_restaurant_close_time`(id_p INT, close_time_p TIME)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM restaurant WHERE restaurant.restaurant_id = id_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Not Found!';
	ELSE
		UPDATE restaurant SET close_time = close_time_p WHERE restaurant_id = id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_restaurant_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_restaurant_location`(id_p INT, street_p VARCHAR(20), city_p VARCHAR(50), state_p VARCHAR(50), zipcode_p CHAR(5))
BEGIN
	DECLARE row_found_1 INT DEFAULT 0;
    DECLARE row_found_2 INT DEFAULT 0;
    
    SELECT COUNT(*) INTO row_found_1 FROM restaurant WHERE restaurant.restaurant_id = id_p;
    SELECT COUNT(*) INTO row_found_2 FROM restaurant WHERE restaurant.street = street_p 
															AND restaurant.city = city_p 
                                                            AND restaurant.state = state_p 
                                                            AND restaurant.zipcode = zipcode_p;
	
    IF row_found_1 = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Not Found!';
	END IF;
    
    IF row_found_2 != 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Another Restaurant with Same Location Exists!';
	END IF;
    
    IF row_found_1 != 0 AND row_found_2 = 0 THEN
		UPDATE restaurant
        SET restaurant.street = street_p, restaurant.city = city_p, restaurant.state = state_p, restaurant.zipcode = zipcode_p
        WHERE restaurant.id = id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_restaurant_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_restaurant_name`(id_p INT, name_p VARCHAR(100))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM restaurant WHERE restaurant.restaurant_id = id_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Not Found!';
	ELSE
		UPDATE restaurant SET restaurant_name = name_p WHERE restaurant_id = id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_restaurant_open_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_restaurant_open_time`(id_p INT, open_time_p TIME)
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM restaurant WHERE restaurant.restaurant_id = id_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Not Found!';
	ELSE
		UPDATE restaurant SET open_time = open_time_p WHERE restaurant_id = id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_restaurant_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_restaurant_type`(id_p INT, type_p ENUM('Franchise-Based', 'Single Establishment'))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM restaurant WHERE restaurant.restaurant_id = id_p;
    
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Restaurant Not Found!';
	ELSE
		UPDATE restaurant SET type_identifier = type_p WHERE restaurant_id = id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_review_description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_review_description`(rev_id_p INT, desc_p VARCHAR(1000))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM review WHERE review_id = rev_id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Review Not Found!';
	ELSE 
		UPDATE review
        SET review_description = desc_p WHERE review_id = rev_id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_review_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_review_rating`(rev_id_p INT, rate_p ENUM('0', '1', '2', '3', '4', '5'))
BEGIN
	DECLARE row_found INT DEFAULT 0;
    SELECT COUNT(*) INTO row_found FROM review WHERE review_id = rev_id_p;
    IF row_found = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Review Not Found!';
	ELSE 
		UPDATE review SET review_rating = rate_p WHERE review_id = rev_id_p;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 18:17:02
