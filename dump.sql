/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.1-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	11.8.1-MariaDB-2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `accounts_cart`
--

DROP TABLE IF EXISTS `accounts_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL CHECK (`quantity` >= 0),
  `user_id` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_cart_user_id_18c76270_fk_auth_user_id` (`user_id`),
  KEY `accounts_cart_product_id_53e5d9f5_fk_accounts_product_id` (`product_id`),
  CONSTRAINT `accounts_cart_product_id_53e5d9f5_fk_accounts_product_id` FOREIGN KEY (`product_id`) REFERENCES `accounts_product` (`id`),
  CONSTRAINT `accounts_cart_user_id_18c76270_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cart`
--

LOCK TABLES `accounts_cart` WRITE;
/*!40000 ALTER TABLE `accounts_cart` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `accounts_cart` VALUES
(21,2,3,3);
/*!40000 ALTER TABLE `accounts_cart` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `accounts_cartitem`
--

DROP TABLE IF EXISTS `accounts_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_cartitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL CHECK (`quantity` >= 0),
  `cart_id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_cartitem_cart_id_a647ef63_fk_accounts_cart_id` (`cart_id`),
  KEY `accounts_cartitem_product_id_5003850a_fk_accounts_product_id` (`product_id`),
  CONSTRAINT `accounts_cartitem_cart_id_a647ef63_fk_accounts_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `accounts_cart` (`id`),
  CONSTRAINT `accounts_cartitem_product_id_5003850a_fk_accounts_product_id` FOREIGN KEY (`product_id`) REFERENCES `accounts_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cartitem`
--

LOCK TABLES `accounts_cartitem` WRITE;
/*!40000 ALTER TABLE `accounts_cartitem` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `accounts_cartitem` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `accounts_category`
--

DROP TABLE IF EXISTS `accounts_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_category`
--

LOCK TABLES `accounts_category` WRITE;
/*!40000 ALTER TABLE `accounts_category` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `accounts_category` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `accounts_order`
--

DROP TABLE IF EXISTS `accounts_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_order_user_id_ec204867_fk_auth_user_id` (`user_id`),
  CONSTRAINT `accounts_order_user_id_ec204867_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_order`
--

LOCK TABLES `accounts_order` WRITE;
/*!40000 ALTER TABLE `accounts_order` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `accounts_order` VALUES
(1,450.00,'2025-03-24 18:50:20.671541',3),
(2,690.00,'2025-03-24 19:32:12.630476',3),
(3,900.00,'2025-03-25 10:03:20.149050',3),
(4,450.00,'2025-03-27 08:57:14.499739',3),
(5,450.00,'2025-04-24 11:53:19.180674',3),
(6,450.00,'2025-04-24 12:10:58.115245',3),
(7,450.00,'2025-04-24 12:13:07.613243',3),
(8,450.00,'2025-04-24 12:34:20.832850',3),
(9,730.00,'2025-04-24 14:20:49.367621',3),
(10,1630.00,'2025-04-24 16:21:08.271635',3);
/*!40000 ALTER TABLE `accounts_order` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `accounts_product`
--

DROP TABLE IF EXISTS `accounts_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_product`
--

LOCK TABLES `accounts_product` WRITE;
/*!40000 ALTER TABLE `accounts_product` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `accounts_product` VALUES
(3,'Gaming Laptop','The latest gaming laptop in the house',450.00,'product_images/gaming-laptop.webp','electronics'),
(4,'Smart Phone','Oppo ray 9 packed with android 14',280.00,'product_images/smartphone.jpg','electronics'),
(5,'HeadPhones','The best headphones in the market with adjustable volume',150.00,'product_images/headphones.jpg','electronics'),
(6,'Shoes','Light weight shoes with great comfort',20.00,'product_images/shoes.webp','fashion'),
(7,'Huawei phone','A huawei y5 android phone',150.00,'product_images/Huawei.png','electronics'),
(8,'Office Laptop','An incredible laptop with smooth experience',450.00,'product_images/laptop1.jpg','electronics'),
(9,'Laptop','An all purpose laptop',500.00,'product_images/laptop2.jpg','electronics'),
(10,'Iphone','latest Iphone 15',500.00,'product_images/Iphone.jpg','electronics'),
(11,'Headset','An incredible headset with smooth experience',50.00,'product_images/headset1.jpg','electronics'),
(12,'Router','A wireless home and office router',50.00,'product_images/router.jpg','home');
/*!40000 ALTER TABLE `accounts_product` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `accounts_userprofile`
--

DROP TABLE IF EXISTS `accounts_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_userprofile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_picture` varchar(100) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_userprofile_user_id_92240672_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `accounts_userprofile` VALUES
(3,'default.jpg',NULL,3);
/*!40000 ALTER TABLE `accounts_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add product',7,'add_product'),
(26,'Can change product',7,'change_product'),
(27,'Can delete product',7,'delete_product'),
(28,'Can view product',7,'view_product'),
(29,'Can add cart',8,'add_cart'),
(30,'Can change cart',8,'change_cart'),
(31,'Can delete cart',8,'delete_cart'),
(32,'Can view cart',8,'view_cart'),
(33,'Can add order',9,'add_order'),
(34,'Can change order',9,'change_order'),
(35,'Can delete order',9,'delete_order'),
(36,'Can view order',9,'view_order'),
(37,'Can add cart item',10,'add_cartitem'),
(38,'Can change cart item',10,'change_cartitem'),
(39,'Can delete cart item',10,'delete_cartitem'),
(40,'Can view cart item',10,'view_cartitem'),
(41,'Can add user profile',11,'add_userprofile'),
(42,'Can change user profile',11,'change_userprofile'),
(43,'Can delete user profile',11,'delete_userprofile'),
(44,'Can view user profile',11,'view_userprofile'),
(45,'Can add category',12,'add_category'),
(46,'Can change category',12,'change_category'),
(47,'Can delete category',12,'delete_category'),
(48,'Can view category',12,'view_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `auth_user` VALUES
(3,'pbkdf2_sha256$600000$jbbI1lWb6ZCCBUu1shtV4f$SrJN6jfq5Natt5lirpl8NMV2aCcYtohmw4oeXPtm/J4=','2025-04-24 17:39:01.124614',1,'Ahmed','','','ahmedazizomar4@gmail.com',1,1,'2025-03-24 18:47:11.415404');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_admin_log` VALUES
(3,'2025-03-24 18:48:24.109949','1','Gaming Laptop',1,'[{\"added\": {}}]',7,3),
(4,'2025-03-24 18:49:23.334082','2','Smart Phone',1,'[{\"added\": {}}]',7,3),
(5,'2025-03-24 20:51:37.044670','2','Smart Phone',3,'',7,3),
(6,'2025-03-24 20:51:37.044746','1','Gaming Laptop',3,'',7,3),
(7,'2025-03-24 20:52:22.341719','3','Gaming Laptop',1,'[{\"added\": {}}]',7,3),
(8,'2025-03-24 20:53:23.717734','4','Smart Phone',1,'[{\"added\": {}}]',7,3),
(9,'2025-03-24 20:54:18.976531','5','HeadPhones',1,'[{\"added\": {}}]',7,3),
(10,'2025-03-24 20:55:00.670873','6','Shoes',1,'[{\"added\": {}}]',7,3),
(11,'2025-04-24 17:27:23.002885','7','Huawei phone',1,'[{\"added\": {}}]',7,3),
(12,'2025-04-24 17:28:28.888425','8','Office Laptop',1,'[{\"added\": {}}]',7,3),
(13,'2025-04-24 17:29:07.493157','9','Laptop',1,'[{\"added\": {}}]',7,3),
(14,'2025-04-24 17:30:04.787843','10','Iphone',1,'[{\"added\": {}}]',7,3),
(15,'2025-04-24 17:31:02.834624','11','Headset',1,'[{\"added\": {}}]',7,3),
(16,'2025-04-24 17:31:46.314281','12','Router',1,'[{\"added\": {}}]',7,3),
(17,'2025-04-24 17:33:51.909769','13','Router',1,'[{\"added\": {}}]',7,3),
(18,'2025-04-24 17:38:49.526906','13','Router',3,'',7,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_content_type` VALUES
(8,'accounts','cart'),
(10,'accounts','cartitem'),
(12,'accounts','category'),
(9,'accounts','order'),
(7,'accounts','product'),
(11,'accounts','userprofile'),
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-03-24 18:41:26.263299'),
(2,'auth','0001_initial','2025-03-24 18:41:29.303458'),
(3,'accounts','0001_initial','2025-03-24 18:41:31.225767'),
(4,'admin','0001_initial','2025-03-24 18:41:31.555685'),
(5,'admin','0002_logentry_remove_auto_add','2025-03-24 18:41:31.576543'),
(6,'admin','0003_logentry_add_action_flag_choices','2025-03-24 18:41:31.603102'),
(7,'contenttypes','0002_remove_content_type_name','2025-03-24 18:41:31.970174'),
(8,'auth','0002_alter_permission_name_max_length','2025-03-24 18:41:32.182929'),
(9,'auth','0003_alter_user_email_max_length','2025-03-24 18:41:32.354087'),
(10,'auth','0004_alter_user_username_opts','2025-03-24 18:41:32.388511'),
(11,'auth','0005_alter_user_last_login_null','2025-03-24 18:41:32.622516'),
(12,'auth','0006_require_contenttypes_0002','2025-03-24 18:41:32.630010'),
(13,'auth','0007_alter_validators_add_error_messages','2025-03-24 18:41:32.700668'),
(14,'auth','0008_alter_user_username_max_length','2025-03-24 18:41:32.905649'),
(15,'auth','0009_alter_user_last_name_max_length','2025-03-24 18:41:33.036583'),
(16,'auth','0010_alter_group_name_max_length','2025-03-24 18:41:33.211022'),
(17,'auth','0011_update_proxy_permissions','2025-03-24 18:41:33.251446'),
(18,'auth','0012_alter_user_first_name_max_length','2025-03-24 18:41:33.403219'),
(19,'sessions','0001_initial','2025-03-24 18:41:33.598644'),
(20,'accounts','0002_order_complete','2025-03-24 19:22:03.558537'),
(21,'accounts','0003_remove_order_complete','2025-03-24 19:23:57.900926'),
(22,'accounts','0004_category','2025-03-24 20:41:37.435241'),
(23,'accounts','0002_alter_product_category','2025-04-24 17:35:55.111900'),
(24,'accounts','0003_alter_product_category','2025-04-24 17:35:55.140161');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_session` VALUES
('lbmbnbc9glmgguwvv3h3fvhk7phf3ry4','.eJxVjMsOwiAQRf-FtSHlzbh07zeQgQGpGkhKuzL-uzbpQrf3nHNfLOC21rCNvISZ2JkpdvrdIqZHbjugO7Zb56m3dZkj3xV-0MGvnfLzcrh_BxVH_dYu-pJJCp0SAZBxUhIYg65om4TwELWdTJJYlJURLFgnYdIWvVc6OsHeH99INwE:1u80XN:v79shwDlm0Uqr5kYERBGaco1UVj0r_MGV3aHewM_taY','2025-05-08 17:39:01.141039'),
('p8zd8kj67f6mr53minazqxmttfbaa58d','.eJxVjEEOgjAQRe_StWlKp5Tq0j1naGamM4IaSCisjHdXEha6_e-9_zIZt3XIW5Ulj8VcDJjT70bID5l2UO443WbL87QuI9ldsQettp-LPK-H-3cwYB2-tagPHTasjAVA2TkXNYI2kRwptXxmIR9LFwJ5aVU4-RScB0AAkmTeHw-5OK0:1txj2W:hC5MVswvnFMgr7ts-VUsuqUwjgslQu68GsmpMsSH9Mc','2025-04-10 08:56:40.098008');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-04-24 20:57:03
