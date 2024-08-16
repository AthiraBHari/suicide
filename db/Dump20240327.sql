-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: suicide
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `activity_id` int(45) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` int(45) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user_id` int(45) NOT NULL,
  `counsellor_id` int(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2024-02-27','13:21:00',1,1,'rejected');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assign`
--

DROP TABLE IF EXISTS `assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign` (
  `assign_id` int(45) NOT NULL AUTO_INCREMENT,
  `task_id` int(45) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`assign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign`
--

LOCK TABLES `assign` WRITE;
/*!40000 ALTER TABLE `assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add appointment',7,'add_appointment'),(26,'Can change appointment',7,'change_appointment'),(27,'Can delete appointment',7,'delete_appointment'),(28,'Can view appointment',7,'view_appointment'),(29,'Can add assign',8,'add_assign'),(30,'Can change assign',8,'change_assign'),(31,'Can delete assign',8,'delete_assign'),(32,'Can view assign',8,'view_assign'),(33,'Can add complaint',9,'add_complaint'),(34,'Can change complaint',9,'change_complaint'),(35,'Can delete complaint',9,'delete_complaint'),(36,'Can view complaint',9,'view_complaint'),(37,'Can add counsellor',10,'add_counsellor'),(38,'Can change counsellor',10,'change_counsellor'),(39,'Can delete counsellor',10,'delete_counsellor'),(40,'Can view counsellor',10,'view_counsellor'),(41,'Can add feedback',11,'add_feedback'),(42,'Can change feedback',11,'change_feedback'),(43,'Can delete feedback',11,'delete_feedback'),(44,'Can view feedback',11,'view_feedback'),(45,'Can add login',12,'add_login'),(46,'Can change login',12,'change_login'),(47,'Can delete login',12,'delete_login'),(48,'Can view login',12,'view_login'),(49,'Can add task',13,'add_task'),(50,'Can change task',13,'change_task'),(51,'Can delete task',13,'delete_task'),(52,'Can view task',13,'view_task'),(53,'Can add user',14,'add_user'),(54,'Can change user',14,'change_user'),(55,'Can delete user',14,'delete_user'),(56,'Can view user',14,'view_user'),(57,'Can add extracular',15,'add_extracular'),(58,'Can change extracular',15,'change_extracular'),(59,'Can delete extracular',15,'delete_extracular'),(60,'Can view extracular',15,'view_extracular'),(61,'Can add activity',16,'add_activity'),(62,'Can change activity',16,'change_activity'),(63,'Can delete activity',16,'delete_activity'),(64,'Can view activity',16,'view_activity'),(65,'Can add result',17,'add_result'),(66,'Can change result',17,'change_result'),(67,'Can delete result',17,'delete_result'),(68,'Can view result',17,'view_result');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint` (
  `complaint_id` int(45) NOT NULL AUTO_INCREMENT,
  `complaint` varchar(45) NOT NULL,
  `replay` varchar(45) NOT NULL,
  `user_id` int(45) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,'Add Complaintsok','hai',1,'2024-02-27','13:05:16');
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counsellor`
--

DROP TABLE IF EXISTS `counsellor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counsellor` (
  `counsellor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `experience` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`counsellor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counsellor`
--

LOCK TABLES `counsellor` WRITE;
/*!40000 ALTER TABLE `counsellor` DISABLE KEYS */;
INSERT INTO `counsellor` VALUES (1,'Athira B Hari','athirabhari.abh@gmail.com','+917012179796','female','mca','2','123'),(2,'Athira B Hari','athirabhari.abh@gmail.com','7012179796','female','mbbs','1','123'),(3,'rdfgj','sdr@edfgh','01234567898','male','asd','6 ','11111'),(4,'qwerty','sdr@edfgh','01234567898','male','asd','6 ','12345678');
/*!40000 ALTER TABLE `counsellor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (16,'activity','activity'),(1,'admin','logentry'),(7,'appointment','appointment'),(8,'assign','assign'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'complaint','complaint'),(5,'contenttypes','contenttype'),(10,'counsellor','counsellor'),(15,'extracular','extracular'),(11,'feedback','feedback'),(12,'login','login'),(17,'result','result'),(6,'sessions','session'),(13,'task','task'),(14,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'activity','0001_initial','2024-03-18 06:50:36.531436'),(2,'contenttypes','0001_initial','2024-03-18 06:50:36.620508'),(3,'auth','0001_initial','2024-03-18 06:50:37.483397'),(4,'admin','0001_initial','2024-03-18 06:50:37.663749'),(5,'admin','0002_logentry_remove_auto_add','2024-03-18 06:50:37.697148'),(6,'admin','0003_logentry_add_action_flag_choices','2024-03-18 06:50:37.722128'),(7,'appointment','0001_initial','2024-03-18 06:50:37.746997'),(8,'assign','0001_initial','2024-03-18 06:50:37.763445'),(9,'contenttypes','0002_remove_content_type_name','2024-03-18 06:50:37.893822'),(10,'auth','0002_alter_permission_name_max_length','2024-03-18 06:50:37.918829'),(11,'auth','0003_alter_user_email_max_length','2024-03-18 06:50:37.951818'),(12,'auth','0004_alter_user_username_opts','2024-03-18 06:50:37.968324'),(13,'auth','0005_alter_user_last_login_null','2024-03-18 06:50:38.041308'),(14,'auth','0006_require_contenttypes_0002','2024-03-18 06:50:38.057404'),(15,'auth','0007_alter_validators_add_error_messages','2024-03-18 06:50:38.073734'),(16,'auth','0008_alter_user_username_max_length','2024-03-18 06:50:38.098621'),(17,'auth','0009_alter_user_last_name_max_length','2024-03-18 06:50:38.123458'),(18,'auth','0010_alter_group_name_max_length','2024-03-18 06:50:38.155982'),(19,'auth','0011_update_proxy_permissions','2024-03-18 06:50:38.180076'),(20,'auth','0012_alter_user_first_name_max_length','2024-03-18 06:50:38.205325'),(21,'complaint','0001_initial','2024-03-18 06:50:38.221833'),(22,'counsellor','0001_initial','2024-03-18 06:50:38.230113'),(23,'extracular','0001_initial','2024-03-18 06:50:38.245760'),(24,'feedback','0001_initial','2024-03-18 06:50:38.262216'),(25,'login','0001_initial','2024-03-18 06:50:38.270293'),(26,'result','0001_initial','2024-03-18 06:50:38.286741'),(27,'sessions','0001_initial','2024-03-18 06:50:38.343580'),(28,'task','0001_initial','2024-03-18 06:50:38.360017'),(29,'user','0001_initial','2024-03-18 06:50:38.376346');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3bvh1pnrdgvarb4fmu7u4n3ogfi0t5og','eyJ1X2lkIjoyfQ:1rm7E4:liHmnm09ur9cg82Jfg-Izk4YC6-1-qKtjZjnLLZ5bJI','2024-04-01 07:16:04.085836'),('48hjtyxivdgohv4g5ihiu6uoivbzcyjg','eyJ1X2lkIjozfQ:1roFhP:FWy15h2m39i5e8bGlc_RIZzhTTvhHlX4Sdup1rAgm8k','2024-04-07 04:43:11.817127'),('iobbp1sxfmrgsxxpvo555bpidvpi6lxb','eyJ1X2lkIjoxfQ:1rnuhH:z2fBR5MZbLsShH4P8q4ruJiNbUa85YM1kD5N9bVgyeI','2024-04-06 06:17:39.795260'),('izdwuv6b34jhqh8xxmjqlzf43xp7ju1y','eyJ1X2lkIjo0fQ:1rm7IN:j5NJ7JO_FJxuVo4fS-5OHG90txD7woA39GgLCBMugwU','2024-04-01 07:20:31.617694'),('uajmdxubn4t5htt68b6it6zsnqut4c0d','eyJ1X2lkIjoxfQ:1rpOAA:UOzHQuSLK6f6jWSennWQHTx9cN2uS_F5i5gK-3MS80I','2024-04-10 07:57:34.494772');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extracular`
--

DROP TABLE IF EXISTS `extracular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extracular` (
  `extracular_id` int(45) NOT NULL,
  `activities` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(45) NOT NULL,
  `user_id` int(45) NOT NULL,
  PRIMARY KEY (`extracular_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extracular`
--

LOCK TABLES `extracular` WRITE;
/*!40000 ALTER TABLE `extracular` DISABLE KEYS */;
/*!40000 ALTER TABLE `extracular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int(45) NOT NULL,
  `feedback` varchar(45) NOT NULL,
  `user_id` int(45) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'add feedback',1,'2024-02-27','20:21:19'),(2,'add feessdback',1,'2024-02-27','20:21:23');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `u_id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','admin',1,'admin'),(2,'Athira B Hari','123',2,'counsellor'),(3,'dani','dani@gmail.com',3,'user'),(4,'arun','111',4,'user'),(5,'rdfgj','11111',3,'counsellor'),(6,'aaa','22222',5,'user'),(7,'qwerty','12345678',4,'counsellor'),(8,'manu','manumanu',6,'user');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `result_id` int(45) NOT NULL,
  `result_type` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `task_id` int(45) NOT NULL AUTO_INCREMENT,
  `task` varchar(45) NOT NULL,
  `upload_task` varchar(450) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'iu','Online Music Streaming Service.jpg','pending'),(2,'klbk','Online Music Streaming Service (3).jpg','accepted'),(3,'klbk','Online Music Streaming Service (3).jpg','pending'),(4,'aa','Online Music Streaming Service (2).jpg','pending'),(5,'new','uuuuu.jpg','pending'),(6,'new','uuuuu.jpg','accepted');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(45) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'athi@gmail.com','athirabhari.abh@gmail.com','7012179796','12','male','mca','mmm'),(2,'athi@gmail.com','athirabhari.abh@gmail.com','7012179796','12','female','sss','ddddd'),(3,'dani','dani@gmail.com','7884','12','male','mca','111'),(4,'arun','arun@gmail.com','9567049511','29','male','sss','111'),(5,'aaa','dfgyh@rghyh','01234567890','29','male','asd','22222'),(6,'manu','ann123@dsefr','01234567898','26','male','asd','manumanu');
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

-- Dump completed on 2024-03-27 14:00:05
