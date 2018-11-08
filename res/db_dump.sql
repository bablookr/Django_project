-- MySQL dump 10.13  Distrib 5.6.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: BHU
-- ------------------------------------------------------
-- Server version	5.6.31-0ubuntu0.14.04.2

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
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Class` (
  `Class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Course_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Semester` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Class_id`,`Course_id`,`Semester`),
  KEY `Course_id` (`Course_id`),
  CONSTRAINT `Class_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `Course` (`Course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
INSERT INTO `Class` VALUES (1,1,2),(2,2,3),(3,3,3),(4,4,4),(5,5,4),(9,11,5);
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `Course_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` varchar(40) NOT NULL,
  `Credits` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`Course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (1,'Introduction to Programming',8),(2,'Introduction to Networking',8),(3,'Data Structures',8),(4,'Algorithms',8),(5,'Artificial Intelligence',8),(6,'Database Management System',8),(7,'Computer Graphics',8),(8,'Data Mining',4),(9,'Natural Language Processing',4),(10,'Intelligent Computing',4),(11,'Ubiqutous Computing',4);
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Username` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Username` (`Username`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Login_details` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (101,'KK Shukla','KK Shukla'),(102,'HP Gupta','Hari Prabhat Gupta'),(103,'SK Singh','Sanjay Kumar Singh'),(201,'R Srivastav','Rajeev Srivastav'),(202,'RB Mishra','Ravi Bhusan Mishra'),(1001,'RNReng','RN Rai');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login_details`
--

DROP TABLE IF EXISTS `Login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login_details` (
  `Username` varchar(40) NOT NULL DEFAULT '',
  `Paswsword` varchar(40) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login_details`
--

LOCK TABLES `Login_details` WRITE;
/*!40000 ALTER TABLE `Login_details` DISABLE KEYS */;
INSERT INTO `Login_details` VALUES ('Abhiram Ravindran','a220a209a9fe14cba06bd0fb07a07ac8ba898705'),('Anant Dadu','e389fd705a931423184c8bc84bd51a7c94b87415'),('Atishay Jain','fa4e4e3b61596f3606baf2934008b5e55e608be9'),('Ayush Shrivastava','7280cdc1b0f538e323af3207d62d34ce03fcaec9'),('Babloo Kumar','1f4c04aef93ffad378dd3bafb9f28d566e26a830'),('HP Gupta','88397323eef6e70da693135f30e18e5c9de0b8e6'),('KK Shukla','ecb08c4bd92a41f27e4b1ef016fe9ae38cffed4c'),('Manish Kumar Maggu','bbd60c673f92cceedc432ca09c6bf0f54ef35f11'),('R Srivastav','efbf1d09486f00cc9b3b1e54d8d0d4fcb4ac9b6d'),('RB Mishra','44b42176bc4908dee03e07a97894fbe255cf77e2'),('RNReng','38014bc87166dbda5fa3066c292c0bbeb51e5dcb'),('SK Singh','73f650e147195bd7283d081675a1d171472665bc');
/*!40000 ALTER TABLE `Login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notice`
--

DROP TABLE IF EXISTS `Notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notice` (
  `Notice_no` int(10) unsigned NOT NULL DEFAULT '0',
  `Class_id` int(10) unsigned NOT NULL,
  `Headline` varchar(40) DEFAULT ' ',
  `Info` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Notice_no`),
  KEY `Class_id` (`Class_id`),
  CONSTRAINT `Notice_ibfk_1` FOREIGN KEY (`Class_id`) REFERENCES `Class` (`Class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notice`
--

LOCK TABLES `Notice` WRITE;
/*!40000 ALTER TABLE `Notice` DISABLE KEYS */;
INSERT INTO `Notice` VALUES (101,1,'Class started','The classes for course 1 has been started.'),(201,2,'Class started','The classes for course 1 has been started.'),(202,2,'Class timings','The timings for course 2 is from 4 to 5.'),(301,3,'Class started','The classes for course 1 has been started.'),(401,4,'Class started','The classes for course 1 has been started.');
/*!40000 ALTER TABLE `Notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reference`
--

DROP TABLE IF EXISTS `Reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reference` (
  `Ref_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Course_id` int(10) unsigned NOT NULL,
  `Info` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Ref_id`),
  KEY `Course_id` (`Course_id`),
  CONSTRAINT `Reference_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `Course` (`Course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reference`
--

LOCK TABLES `Reference` WRITE;
/*!40000 ALTER TABLE `Reference` DISABLE KEYS */;
INSERT INTO `Reference` VALUES (101,1,'Let Us C'),(102,1,'ANSI C'),(201,2,'tutorialspoint.com'),(301,3,'Data Structures in C/C++'),(401,4,'Algorithms by Cormen');
/*!40000 ALTER TABLE `Reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `Roll` int(10) unsigned NOT NULL DEFAULT '0',
  `Username` varchar(40) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT ' ',
  `last_name` varchar(40) DEFAULT ' ',
  `Year_of_admission` year(4) DEFAULT NULL,
  PRIMARY KEY (`Roll`),
  KEY `Username` (`Username`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Login_details` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (14074005,'Babloo Kumar','Male','babloo.kumar.cse14@iitbhu.ac.in','Babloo',' ','Kumar',2014),(14075001,'Abhiram Ravindran','Male','abhiram.ravindran.cse14@iitbhu.ac.in','Abhiram',' ','Ravindran',2013),(14075005,'Anant Dadu','Male','anant.dadu.cse14@iitbhu.ac.in','Anant',' ','Dadu',2013),(14075010,'Atishay Jain','Male','atishay.jain.cse14@iitbhu.ac.in','Atishay',' ','Jain',2013),(14075014,'Ayush Shrivastava','Male','ayush.shrivastava.cse14@iitbhu.ac.in','Ayush',' ','Shrivastav',2013);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attends`
--

DROP TABLE IF EXISTS `attends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attends` (
  `Roll` int(10) unsigned NOT NULL DEFAULT '0',
  `Class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Course_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Semester` int(10) unsigned NOT NULL DEFAULT '0',
  `Attendance` int(10) unsigned DEFAULT NULL,
  `PT1_marks` int(10) unsigned DEFAULT NULL,
  `PT2_marks` int(10) unsigned DEFAULT NULL,
  `EndSem_marks` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Roll`,`Class_id`,`Course_id`,`Semester`),
  KEY `Class_id` (`Class_id`,`Course_id`,`Semester`),
  CONSTRAINT `attends_ibfk_1` FOREIGN KEY (`Roll`) REFERENCES `Student` (`Roll`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attends_ibfk_2` FOREIGN KEY (`Class_id`, `Course_id`, `Semester`) REFERENCES `Class` (`Class_id`, `Course_id`, `Semester`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends`
--

LOCK TABLES `attends` WRITE;
/*!40000 ALTER TABLE `attends` DISABLE KEYS */;
INSERT INTO `attends` VALUES (14074005,1,1,2,2,1,0,0),(14074005,2,2,3,1,1,0,0),(14074005,3,3,3,1,1,0,0),(14074005,4,4,4,1,1,0,0),(14075001,1,1,2,2,0,0,0),(14075001,2,2,3,1,0,0,0),(14075001,3,3,3,1,0,0,0),(14075001,4,4,4,1,0,0,0),(14075005,1,1,2,2,0,0,0),(14075005,2,2,3,1,0,0,0),(14075005,3,3,3,1,0,0,0),(14075005,4,4,4,1,0,0,0),(14075010,1,1,2,2,0,0,0),(14075010,2,2,3,1,0,0,0),(14075010,3,3,3,1,0,0,0),(14075010,4,4,4,1,0,0,0),(14075014,1,1,2,2,0,0,0),(14075014,2,2,3,1,0,0,0),(14075014,3,3,3,1,0,0,0),(14075014,4,4,4,1,11,0,0);
/*!40000 ALTER TABLE `attends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-10-19 06:56:50'),(2,'auth','0001_initial','2016-10-19 06:56:57'),(3,'admin','0001_initial','2016-10-19 06:56:58'),(4,'admin','0002_logentry_remove_auto_add','2016-10-19 06:56:58'),(5,'contenttypes','0002_remove_content_type_name','2016-10-19 06:56:59'),(6,'auth','0002_alter_permission_name_max_length','2016-10-19 06:57:00'),(7,'auth','0003_alter_user_email_max_length','2016-10-19 06:57:01'),(8,'auth','0004_alter_user_username_opts','2016-10-19 06:57:01'),(9,'auth','0005_alter_user_last_login_null','2016-10-19 06:57:01'),(10,'auth','0006_require_contenttypes_0002','2016-10-19 06:57:01'),(11,'auth','0007_alter_validators_add_error_messages','2016-10-19 06:57:01'),(12,'auth','0008_alter_user_username_max_length','2016-10-19 06:57:02'),(13,'sessions','0001_initial','2016-10-19 06:57:02');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_ref`
--

DROP TABLE IF EXISTS `fac_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_ref` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Ref_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Ref_id`),
  KEY `Ref_id` (`Ref_id`),
  CONSTRAINT `fac_ref_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Faculty` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fac_ref_ibfk_2` FOREIGN KEY (`Ref_id`) REFERENCES `Reference` (`Ref_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_ref`
--

LOCK TABLES `fac_ref` WRITE;
/*!40000 ALTER TABLE `fac_ref` DISABLE KEYS */;
INSERT INTO `fac_ref` VALUES (103,101),(103,301),(101,401);
/*!40000 ALTER TABLE `fac_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_ref`
--

DROP TABLE IF EXISTS `stu_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu_ref` (
  `Roll` int(10) unsigned NOT NULL DEFAULT '0',
  `Ref_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Roll`,`Ref_id`),
  KEY `Ref_id` (`Ref_id`),
  CONSTRAINT `stu_ref_ibfk_1` FOREIGN KEY (`Roll`) REFERENCES `Student` (`Roll`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu_ref_ibfk_2` FOREIGN KEY (`Ref_id`) REFERENCES `Reference` (`Ref_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_ref`
--

LOCK TABLES `stu_ref` WRITE;
/*!40000 ALTER TABLE `stu_ref` DISABLE KEYS */;
INSERT INTO `stu_ref` VALUES (14075014,102),(14074005,201);
/*!40000 ALTER TABLE `stu_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Course_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Semester` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Class_id`,`Course_id`,`Semester`),
  KEY `Class_id` (`Class_id`,`Course_id`,`Semester`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Faculty` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`Class_id`, `Course_id`, `Semester`) REFERENCES `Class` (`Class_id`, `Course_id`, `Semester`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES (102,1,1,2),(101,2,2,3),(103,3,3,3),(202,5,5,4),(102,9,11,5);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-22 15:34:43
