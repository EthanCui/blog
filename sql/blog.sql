-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: cuihu
-- ------------------------------------------------------
-- Server version	5.6.23

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 栏目',7,'add_column'),(20,'Can change 栏目',7,'change_column'),(21,'Can delete 栏目',7,'delete_column'),(22,'Can add 教程',8,'add_article'),(23,'Can change 教程',8,'change_article'),(24,'Can delete 教程',8,'delete_article'),(25,'Can add comment',9,'add_comment'),(26,'Can change comment',9,'change_comment'),(27,'Can delete comment',9,'delete_comment'),(28,'Can moderate comments',9,'can_moderate'),(29,'Can add comment flag',10,'add_commentflag'),(30,'Can change comment flag',10,'change_commentflag'),(31,'Can delete comment flag',10,'delete_commentflag'),(32,'Can add site',11,'add_site'),(33,'Can change site',11,'change_site'),(34,'Can delete site',11,'delete_site'),(35,'Can add 标签',12,'add_tag'),(36,'Can change 标签',12,'change_tag'),(37,'Can delete 标签',12,'delete_tag');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$GtiI8ekkoSgr$FnyFxq8iXGieeP1r9SqYbo0c+qvtc8hhRTDA8y739po=','2016-09-18 11:17:17.837000',1,'cuihu1','','','',1,1,'2016-09-18 11:16:29.410000');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-09-18 11:18:04.696000','1','Python',1,'',7,1),(2,'2016-09-18 11:18:30.923000','1','Python',3,'',7,1),(3,'2016-09-19 03:04:16.899000','30','科技新闻_10',2,'已修改 content 。',8,1),(4,'2016-09-19 03:05:18.153000','30','科技新闻_10',2,'已修改 content 。',8,1),(5,'2016-09-19 03:06:11.247000','30','科技新闻_10',2,'已修改 content 。',8,1),(6,'2016-09-19 03:06:35.122000','30','科技新闻_10',2,'已修改 content 。',8,1),(7,'2016-09-19 03:13:52.542000','30','科技新闻_10',2,'已修改 content 。',8,1),(8,'2016-09-20 06:47:30.786000','2','体育新闻',2,'已修改 intro，nav_display 和 home_display 。',7,1),(9,'2016-09-20 06:48:11.521000','30','科技新闻_10',2,'没有字段被修改。',8,1),(10,'2016-09-21 05:39:48.437000','5','免责声明',1,'',7,1),(11,'2016-09-21 05:40:47.922000','31','免责声明',1,'',8,1),(12,'2016-09-21 05:41:38.591000','31','免责声明',2,'已修改 slug 。',8,1),(13,'2016-09-21 05:42:23.884000','5','免责声明',2,'已修改 slug 。',7,1),(14,'2016-09-21 06:00:37.301000','31','免责声明',3,'',8,1),(15,'2016-09-21 06:00:48.052000','5','免责声明',3,'',7,1),(16,'2016-09-21 06:10:30.081000','6','免责声明',1,'',7,1),(17,'2016-09-21 06:12:00.830000','32','免责声明',1,'',8,1),(18,'2016-09-21 06:46:05.951000','32','免责声明',2,'已修改 content 。',8,1),(19,'2016-09-21 06:48:33.292000','32','免责声明',2,'已修改 content 。',8,1),(20,'2016-09-21 06:53:00.078000','32','免责声明',2,'已修改 content 。',8,1),(21,'2016-09-21 06:53:24.197000','32','免责声明',2,'已修改 content 。',8,1),(22,'2016-09-21 06:54:28.069000','32','免责声明',2,'已修改 content 。',8,1),(23,'2016-09-21 06:54:55.341000','32','免责声明',2,'已修改 content 。',8,1),(24,'2016-09-21 08:14:10.742000','1','体育新闻_1',2,'已修改 content 。',8,1),(25,'2016-09-21 09:24:41.484000','1','cuihu.com',2,'已修改 domain 和 name 。',11,1),(26,'2016-09-22 03:31:17.162000','2','体育新闻',2,'已修改 home_display 。',7,1),(27,'2016-09-22 03:31:28.783000','3','社会新闻',2,'已修改 intro 和 nav_display 。',7,1),(28,'2016-09-22 03:31:36.785000','4','科技新闻',2,'已修改 intro 和 nav_display 。',7,1),(29,'2016-09-22 05:09:50.849000','7','linux',1,'',7,1),(30,'2016-09-22 05:10:08.558000','8','Python',1,'',7,1),(31,'2016-09-22 05:10:32.505000','9','django',1,'',7,1),(32,'2016-09-22 05:34:02.774000','10','acm_pku',1,'',7,1),(33,'2016-09-22 05:35:11.398000','33','acm_pku 1000',1,'',8,1),(34,'2016-09-22 05:42:14.278000','33','acm_pku 1000',2,'已修改 content 。',8,1),(35,'2016-09-23 04:03:25.546000','1','python',1,'',12,1),(36,'2016-09-23 04:03:28.974000','2','linux',1,'',12,1),(37,'2016-09-23 04:03:40.289000','3','健身',1,'',12,1),(38,'2016-09-23 04:03:49.506000','4','django',1,'',12,1),(39,'2016-09-23 04:04:17.825000','5','囚徒健身',1,'',12,1),(40,'2016-09-23 04:04:26.664000','6','罗玉凤',1,'',12,1),(41,'2016-09-23 04:10:55.004000','10','acm_pku',2,'已修改 blog_nav 。',7,1),(42,'2016-09-23 04:11:18.616000','9','django',2,'已修改 blog_nav 。',7,1),(43,'2016-09-23 04:11:26.759000','7','linux',2,'已修改 blog_nav 。',7,1),(44,'2016-09-23 04:11:33.163000','8','Python',2,'已修改 blog_nav 。',7,1),(45,'2016-09-23 04:11:37.852000','2','体育新闻',2,'已修改 news_nav 。',7,1),(46,'2016-09-23 04:11:43.625000','3','社会新闻',2,'已修改 news_nav 。',7,1),(47,'2016-09-23 04:11:49.915000','4','科技新闻',2,'已修改 news_nav 。',7,1),(48,'2016-09-23 05:23:56.082000','32','免责声明',2,'已修改 tags 。',8,1),(49,'2016-09-23 05:24:32.298000','32','免责声明',2,'已修改 tags 。',8,1),(50,'2016-09-23 06:05:10.808000','10','体育新闻_10',2,'已修改 tags 和 content 。',8,1),(51,'2016-09-23 06:05:23.693000','9','体育新闻_9',2,'已修改 tags 和 content 。',8,1),(52,'2016-09-23 06:05:36.034000','27','科技新闻_7',2,'已修改 tags 和 content 。',8,1),(53,'2016-09-23 08:06:26.086000','10','体育新闻_10',2,'没有字段被修改。',8,1),(54,'2016-09-23 09:03:34.081000','1','体育新闻_1',2,'已修改 tags 。',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_flags`
--

DROP TABLE IF EXISTS `django_comment_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(30) NOT NULL,
  `flag_date` datetime(6) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_flags_user_id_641f11c1_uniq` (`user_id`,`comment_id`,`flag`),
  KEY `django_comment_flags_comment_id_7f2b4c55_fk_django_comments_id` (`comment_id`),
  KEY `django_comment_flags_327a6c43` (`flag`),
  CONSTRAINT `django_comment_flags_comment_id_7f2b4c55_fk_django_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `django_comment_flags_user_id_3512f4c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_flags`
--

LOCK TABLES `django_comment_flags` WRITE;
/*!40000 ALTER TABLE `django_comment_flags` DISABLE KEYS */;
INSERT INTO `django_comment_flags` VALUES (1,'moderator approval','2016-09-21 10:16:33.301000',7,1),(2,'moderator approval','2016-09-21 10:16:33.361000',6,1),(3,'moderator approval','2016-09-21 10:16:33.454000',5,1),(4,'moderator approval','2016-09-21 10:16:33.504000',4,1),(5,'moderator approval','2016-09-21 10:16:33.562000',3,1),(6,'moderator approval','2016-09-21 10:16:33.616000',2,1),(7,'moderator approval','2016-09-21 10:16:33.702000',1,1);
/*!40000 ALTER TABLE `django_comment_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comments`
--

DROP TABLE IF EXISTS `django_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` longtext NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime(6) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_commen_content_type_id_5626a505_fk_django_content_type_id` (`content_type_id`),
  KEY `django_comments_site_id_6ea83216_fk_django_site_id` (`site_id`),
  KEY `django_comments_user_id_2c584e2_fk_auth_user_id` (`user_id`),
  KEY `django_comments_submit_date_5c84a37e_uniq` (`submit_date`),
  CONSTRAINT `django_commen_content_type_id_5626a505_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_comments_site_id_6ea83216_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `django_comments_user_id_2c584e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comments`
--

LOCK TABLES `django_comments` WRITE;
/*!40000 ALTER TABLE `django_comments` DISABLE KEYS */;
INSERT INTO `django_comments` VALUES (1,'1','','','','本网站所提供的信息，只供参考之用。','2016-09-21 10:04:02.178000',NULL,1,0,9,1,NULL),(2,'1','','','','本网站所提供的信息，只供参考之用。','2016-09-21 10:10:53.498000',NULL,1,0,9,1,NULL),(3,'1','','','','本网站所提供的信息，只供参考之用。','2016-09-21 10:11:34.590000',NULL,1,0,9,1,NULL),(4,'1','','','','本网站所提供的信息，只供参考之用。','2016-09-21 10:12:31.415000',NULL,1,0,9,1,NULL),(5,'1','','','','本网站所提供的信息，只供参考之用。','2016-09-21 10:12:57.379000',NULL,1,0,9,1,NULL),(6,'1','','','','本网站所提供的信息，只供参考之用。','2016-09-21 10:13:45.940000',NULL,1,0,9,1,NULL),(7,'1','','','','本网站所提供的信息，只供参考之用。','2016-09-21 10:15:43.696000',NULL,1,0,9,1,NULL),(8,'1','','','','本网站所提供的信息，只供参考之用。','2016-09-21 10:35:11.670000',NULL,1,0,9,1,NULL),(9,'1','许氏宗景','','','本网站所提供的信息，只供参考之用。','2016-09-21 10:38:26.203000',NULL,1,0,9,1,NULL);
/*!40000 ALTER TABLE `django_comments` ENABLE KEYS */;
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
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'django_comments','comment'),(10,'django_comments','commentflag'),(6,'sessions','session'),(11,'sites','site'),(8,'website','article'),(7,'website','column'),(12,'website','tag');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-09-18 11:16:08.248000'),(2,'auth','0001_initial','2016-09-18 11:16:12.597000'),(3,'admin','0001_initial','2016-09-18 11:16:13.829000'),(4,'contenttypes','0002_remove_content_type_name','2016-09-18 11:16:14.501000'),(5,'auth','0002_alter_permission_name_max_length','2016-09-18 11:16:14.967000'),(6,'auth','0003_alter_user_email_max_length','2016-09-18 11:16:15.479000'),(7,'auth','0004_alter_user_username_opts','2016-09-18 11:16:15.536000'),(8,'auth','0005_alter_user_last_login_null','2016-09-18 11:16:15.902000'),(9,'auth','0006_require_contenttypes_0002','2016-09-18 11:16:15.940000'),(10,'sessions','0001_initial','2016-09-18 11:16:16.280000'),(11,'website','0001_initial','2016-09-18 11:16:18.619000'),(12,'website','0002_auto_20160918_1737','2016-09-18 11:16:20.188000'),(13,'website','0003_auto_20160919_1355','2016-09-19 06:54:38.071000'),(14,'website','0004_auto_20160919_1721','2016-09-19 09:23:13.180000'),(15,'sites','0001_initial','2016-09-21 09:07:30.065000'),(16,'django_comments','0001_initial','2016-09-21 09:07:33.867000'),(17,'django_comments','0002_update_user_email_field_length','2016-09-21 09:07:34.513000'),(18,'django_comments','0003_add_submit_date_index','2016-09-21 09:07:34.840000'),(19,'website','0005_auto_20160923_1150','2016-09-23 04:01:11.299000'),(20,'website','0006_auto_20160923_1154','2016-09-23 04:01:11.417000');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ynato6wocuy49cova8f35tx4cfz4e7ro','YjllMzdhZTZhZGFjZGVjMzJhNmEzYTc5MWI2MjQzYWE5NmVhMDI1MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1NzJiNGEzNmJiZGQxNWNiNjlhYzY3NTY2NTc2M2NkNDdlYjkzNzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-10-02 11:17:17.884000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'cuihu.com','cuihu.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_article`
--

DROP TABLE IF EXISTS `website_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `slug` varchar(256) NOT NULL,
  `content` longtext NOT NULL,
  `published` tinyint(1) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `pub_date` datetime(6) NOT NULL,
  `update_time` datetime(6),
  PRIMARY KEY (`id`),
  KEY `website_article_author_id_38ff34fa_fk_auth_user_id` (`author_id`),
  KEY `website_article_2dbcba41` (`slug`(255)),
  CONSTRAINT `website_article_author_id_38ff34fa_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_article`
--

LOCK TABLES `website_article` WRITE;
/*!40000 ALTER TABLE `website_article` DISABLE KEYS */;
INSERT INTO `website_article` VALUES (1,'体育新闻_1','article_1','<p><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">　　本网站所提供的信息，只供参考之用。</span></p><p><br/></p><p><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">　　本网站及其雇员一概毋须以任何方式就任何信息传递或传送的失误、不准确或错误对用户或任何其他人士负任何直接或间接的责任。</span></p><p><br/></p><p><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">　　在法律允许的范围内，本网站在此声明,不承担用户或任何人士就使用或未能使用本网站所提供的信息或任何链接或项目所引致的任何直接、间接、附带、从属、特殊、惩罚性或惩戒性的损害赔偿(包括但不限于收益、预期利润的损失或失去的业务、未实现预期的节省)。</span></p><p><br/></p><p><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">　　本网站所提供的信息，若在任何司法管辖地区供任何人士使用或分发给任何人士时会违反该司法管辖地区的法律或条例的规定或会导致本网站或其第三方代理人受限于该司法管辖地区内的任何监管规定时，则该等信息不宜在该司法管辖地区供该等任何人士使用或分发给该等任何人士。用户须自行保证不会受限于任何限制或禁止用户使用或分发本网站所提供信息的当地的规定。</span></p><p><br/></p><p><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">　　本网站图片，文字之类版权申明，因为网站可以由注册用户自行上传图片或文字，本网站无法鉴别所上传图片或文字的知识版权，如果侵犯，请及时通知我们，本网站将在第一时间及时删除。</span></p><p><br/></p><p><span style=\"font-family: 宋体, SimSun; font-size: 14px;\">　　凡以任何方式登陆本网站或直接、间接使用本网站资料者，视为自愿接受本网站声明的约束。</span></p><p><span style=\"font-family: 宋体, SimSun; font-size: 14px;\"><br/></span></p>',1,NULL,'2016-09-19 02:03:08.391000','2016-09-23 09:03:34.072000'),(2,'体育新闻_2','article_2','新闻详细内容： 体育新闻 2',1,NULL,'2016-09-19 02:03:08.441000','2016-09-19 02:03:08.441000'),(3,'体育新闻_3','article_3','新闻详细内容： 体育新闻 3',1,NULL,'2016-09-19 02:03:08.566000','2016-09-19 02:03:08.566000'),(4,'体育新闻_4','article_4','新闻详细内容： 体育新闻 4',1,NULL,'2016-09-19 02:03:08.641000','2016-09-19 02:03:08.641000'),(5,'体育新闻_5','article_5','新闻详细内容： 体育新闻 5',1,NULL,'2016-09-19 02:03:08.691000','2016-09-19 02:03:08.691000'),(6,'体育新闻_6','article_6','新闻详细内容： 体育新闻 6',1,NULL,'2016-09-19 02:03:08.741000','2016-09-19 02:03:08.741000'),(7,'体育新闻_7','article_7','新闻详细内容： 体育新闻 7',1,NULL,'2016-09-19 02:03:08.791000','2016-09-19 02:03:08.791000'),(8,'体育新闻_8','article_8','新闻详细内容： 体育新闻 8',1,NULL,'2016-09-19 02:03:08.841000','2016-09-19 02:03:08.841000'),(9,'体育新闻_9','article_9','<p>&nbsp; &nbsp; 新闻详细内容： 体育新闻 9</p>',1,NULL,'2016-09-19 02:03:08.891000','2016-09-23 06:05:23.684000'),(10,'体育新闻_10','article_10','<p>&nbsp; &nbsp; 新闻详细内容： 体育新闻 10</p>',1,NULL,'2016-09-19 02:03:08.941000','2016-09-23 08:06:26.029000'),(11,'社会新闻_1','article_1','新闻详细内容： 社会新闻 1',1,NULL,'2016-09-19 02:03:09.026000','2016-09-19 02:03:09.026000'),(12,'社会新闻_2','article_2','新闻详细内容： 社会新闻 2',1,NULL,'2016-09-19 02:03:09.095000','2016-09-19 02:03:09.095000'),(13,'社会新闻_3','article_3','新闻详细内容： 社会新闻 3',1,NULL,'2016-09-19 02:03:09.147000','2016-09-19 02:03:09.147000'),(14,'社会新闻_4','article_4','新闻详细内容： 社会新闻 4',1,NULL,'2016-09-19 02:03:09.197000','2016-09-19 02:03:09.197000'),(15,'社会新闻_5','article_5','新闻详细内容： 社会新闻 5',1,NULL,'2016-09-19 02:03:09.247000','2016-09-19 02:03:09.247000'),(16,'社会新闻_6','article_6','新闻详细内容： 社会新闻 6',1,NULL,'2016-09-19 02:03:09.297000','2016-09-19 02:03:09.297000'),(17,'社会新闻_7','article_7','新闻详细内容： 社会新闻 7',1,NULL,'2016-09-19 02:03:09.347000','2016-09-19 02:03:09.347000'),(18,'社会新闻_8','article_8','新闻详细内容： 社会新闻 8',1,NULL,'2016-09-19 02:03:09.397000','2016-09-19 02:03:09.397000'),(19,'社会新闻_9','article_9','新闻详细内容： 社会新闻 9',1,NULL,'2016-09-19 02:03:09.447000','2016-09-19 02:03:09.447000'),(20,'社会新闻_10','article_10','新闻详细内容： 社会新闻 10',1,NULL,'2016-09-19 02:03:09.512000','2016-09-19 02:03:09.512000'),(21,'科技新闻_1','article_1','新闻详细内容： 科技新闻 1',1,NULL,'2016-09-19 02:03:09.601000','2016-09-19 02:03:09.601000'),(22,'科技新闻_2','article_2','新闻详细内容： 科技新闻 2',1,NULL,'2016-09-19 02:03:09.655000','2016-09-19 02:03:09.655000'),(23,'科技新闻_3','article_3','新闻详细内容： 科技新闻 3',1,NULL,'2016-09-19 02:03:09.705000','2016-09-19 02:03:09.705000'),(24,'科技新闻_4','article_4','新闻详细内容： 科技新闻 4',1,NULL,'2016-09-19 02:03:09.755000','2016-09-19 02:03:09.755000'),(25,'科技新闻_5','article_5','新闻详细内容： 科技新闻 5',1,NULL,'2016-09-19 02:03:09.805000','2016-09-19 02:03:09.805000'),(26,'科技新闻_6','article_6','新闻详细内容： 科技新闻 6',1,NULL,'2016-09-19 02:03:09.872000','2016-09-19 02:03:09.872000'),(27,'科技新闻_7','article_7','<p>&nbsp; &nbsp; 新闻详细内容： 科技新闻 7</p>',1,NULL,'2016-09-19 02:03:09.922000','2016-09-23 06:05:35.987000'),(28,'科技新闻_8','article_8','新闻详细内容： 科技新闻 8',1,NULL,'2016-09-19 02:03:09.972000','2016-09-19 02:03:09.972000'),(29,'科技新闻_9','article_9','新闻详细内容： 科技新闻 9',1,NULL,'2016-09-19 02:03:10.026000','2016-09-19 02:03:10.026000'),(30,'科技新闻_10','article_10','<p>&nbsp; &nbsp; 新闻详细内容： 科技新闻 10</p>',1,NULL,'2016-09-19 02:03:10.082000','2016-09-20 06:48:11.504000'),(32,'免责声明','declaration','<p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">&nbsp; &nbsp;访问者在接受本网站服务之前，请务必仔细阅读本条款并同意本声明。访问者访问本网站的行为以及通过各类方式利用本网站的行为，都将被视作是对本声明全部内容的无异议的认可;如有异议，请立即跟本网站协商，并取得本网站的书面同意意见。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第一条访问者在从事与本网站相关的所有行为(包括但不限于访问浏览、利用、转载、宣传介绍)时，必须以善意且谨慎的态度行事;访问者不得故意或者过失的损害或者弱化本网站的各类合法权利与利益，不得利用本网站以任何方式直接或者间接的从事违反中国法律、国际公约以及社会公德的行为，且访问者应当恪守下述承诺：</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　1、传输和利用信息符合中国法律、国际公约的规定、符合公序良俗;</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　2、不将本网站以及与之相关的网络服务用作非法用途以及非正当用途;</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　3、不干扰和扰乱本网站以及与之相关的网络服务;</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　4、遵守与本网站以及与之相关的网络服务的协议、规定、程序和惯例等。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第二条本网站郑重提醒访问者：请在转载、上载或者下载有关作品时务必尊重该作品的版权、著作权;如果您发现有您未署名的作品，请立即和我们联系，我们会在第一时间加上您的署名或作相关处理。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第三条除我们另有明确说明或者中国法律有强制性规定外，本网站用户原创的作品，本网站及作者共同享有版权，其他网站及传统媒体如需使用，须取得本网站的书面授权，未经授权严禁转载或用于其它商业用途。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第四条本网站内容仅代表作者本人的观点，不代表本网站的观点和看法，与本网站立场无关，相关责任作者自负。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第五条本网站有权将在本网站内发表的作品用于其他用途，包括网站、电子杂志等，作品有附带版权声明者除外。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第六条未经常本网站和作者共同同意，其他任何机构不得以任何形式侵犯其作品著作权，包括但不限于：擅自复制、链接、非法使用或转载，或以任何方式建立作品镜像。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第七条本网站所刊载的各类形式(包括但不仅限于文字、图片、图表)的作品仅供参考使用，并不代表本网站同意其说法或描述，仅为提供更多信息，也不构成任何投资建议。对于访问者根据本网站提供的信息所做出的一切行为，除非另有明确的书面承诺文件，否则本网站不承担任何形式的责任。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第八条当本网站以链接形式推荐其他网站内容时，本网站并不对这些网站或资源的可用性负责，且不保证从这些网站获取的任何内容、产品、服务或其他材料的真实性、合法性，对于任何因使用或信赖从此类网站或资源上获取的内容、产品、服务或其他材料而造成(或声称造成)的任何直接或间接损失，本网站均不承担任何责任。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第九条访问者在本网站注册时提供的一些个人资料，本网站除您本人同意及第十条规定外不会将用户的任何资料以任何方式泄露给任何一方。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第十条当政府部门、司法机关等依照法定程序要求本网站披露个人资料时，本网站将根据执法单位之要求或为公共安全之目的提供个人资料。在此情况下之任何披露，本网站均得免责。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第十一条由于用户将个人密码告知他人或与他人共享注册账户，由此导致的任何个人资料泄露，本网站不负任何责任。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第十二条本网站有部分内容来自互联网，如无意中侵犯了哪个媒体、公司、企业或个人等的知识产权，请来电或致函告之，本网站将在规定时间内给予删除等相关处理，若有涉及版权费等问题，请及时提供相关证明等材料并与我们联系，通过友好协商公平公正原则处理纠纷。</span></p><p><br/></p><p><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">　　第十二条以上声明内容的最终解释权归XXXX网站所有。</span></p><p><br/></p>',1,NULL,'2016-09-21 06:12:00.826000','2016-09-23 05:24:32.247000'),(33,'acm_pku 1000','acm_pku_1000','<p>&nbsp; &nbsp;</p><pre class=\"brush:cpp;toolbar:false\">#include&lt;stdio.h&gt;int&nbsp;main(&nbsp;){\r\n&nbsp;int&nbsp;n,i,j,a[20][5],p,q;\r\n&nbsp;scanf(&quot;%d&quot;,&amp;n);\r\n&nbsp;for(i=0;i&lt;n;i++)\r\n&nbsp;&nbsp;for(j=0;j&lt;4;j++)\r\n&nbsp;&nbsp;&nbsp;scanf(&quot;%d&quot;,&amp;a[i][j]);\r\n&nbsp;for(i=0;i&lt;n;i++)\r\n&nbsp;{&nbsp;\r\n&nbsp;&nbsp;p=a[i][1]-a[i][0];\r\n&nbsp;&nbsp;q=a[i][1]/a[i][0];\r\n&nbsp;&nbsp;if(p==a[i][2]-a[i][1])\r\n&nbsp;&nbsp;&nbsp;a[i][4]=a[i][3]+p;\r\n&nbsp;&nbsp;&nbsp;else&nbsp;a[i][4]=a[i][3]*q;\r\n&nbsp;&nbsp;};\r\n&nbsp;for(i=0;i&lt;n;i++)\r\n&nbsp;&nbsp;for(j=0;j&lt;5;j++)\r\n&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;printf(&quot;%d&nbsp;&quot;,a[i][j]);\r\n&nbsp;&nbsp;&nbsp;if(j==4)\r\n&nbsp;&nbsp;&nbsp;printf(&quot;\\n&quot;);\r\n&nbsp;&nbsp;&nbsp;};\r\n&nbsp;printf(&quot;\\n&quot;);\r\n&nbsp;}</pre><p><br/></p>',1,1,'2016-09-22 05:35:11.370000','2016-09-22 05:42:14.274000');
/*!40000 ALTER TABLE `website_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_article_column`
--

DROP TABLE IF EXISTS `website_article_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_article_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`column_id`),
  KEY `website_article_column_column_id_373cdcd_fk_website_column_id` (`column_id`),
  CONSTRAINT `website_article_column_article_id_2205d980_fk_website_article_id` FOREIGN KEY (`article_id`) REFERENCES `website_article` (`id`),
  CONSTRAINT `website_article_column_column_id_373cdcd_fk_website_column_id` FOREIGN KEY (`column_id`) REFERENCES `website_column` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_article_column`
--

LOCK TABLES `website_article_column` WRITE;
/*!40000 ALTER TABLE `website_article_column` DISABLE KEYS */;
INSERT INTO `website_article_column` VALUES (55,1,2),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(52,9,2),(54,10,2),(11,11,3),(12,12,3),(13,13,3),(14,14,3),(15,15,3),(16,16,3),(17,17,3),(18,18,3),(19,19,3),(20,20,3),(21,21,4),(22,22,4),(23,23,4),(24,24,4),(25,25,4),(26,26,4),(53,27,4),(28,28,4),(29,29,4),(36,30,4),(50,32,6),(48,33,10);
/*!40000 ALTER TABLE `website_article_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_article_tags`
--

DROP TABLE IF EXISTS `website_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`tag_id`),
  KEY `website_article_tags_tag_id_6254aae9_fk_website_tag_id` (`tag_id`),
  CONSTRAINT `website_article_tags_article_id_22542b81_fk_website_article_id` FOREIGN KEY (`article_id`) REFERENCES `website_article` (`id`),
  CONSTRAINT `website_article_tags_tag_id_6254aae9_fk_website_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `website_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_article_tags`
--

LOCK TABLES `website_article_tags` WRITE;
/*!40000 ALTER TABLE `website_article_tags` DISABLE KEYS */;
INSERT INTO `website_article_tags` VALUES (17,1,1),(18,1,2),(19,1,3),(20,1,4),(21,1,5),(22,1,6),(7,9,1),(8,9,2),(9,9,6),(14,10,2),(15,10,3),(16,10,4),(10,27,1),(11,27,2),(12,27,3),(13,27,4),(3,32,4);
/*!40000 ALTER TABLE `website_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_column`
--

DROP TABLE IF EXISTS `website_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `slug` varchar(256) NOT NULL,
  `intro` longtext NOT NULL,
  `blog_nav` tinyint(1) NOT NULL,
  `news_nav` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_column_2dbcba41` (`slug`(255))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_column`
--

LOCK TABLES `website_column` WRITE;
/*!40000 ALTER TABLE `website_column` DISABLE KEYS */;
INSERT INTO `website_column` VALUES (2,'体育新闻','sports','sportssportssportssportssportssportssports',0,1),(3,'社会新闻','society','社会新闻',0,1),(4,'科技新闻','tech','科技新闻',0,1),(6,'免责声明','declear','免责声明',0,0),(7,'linux','linux','linux',1,0),(8,'Python','Python','Python',1,0),(9,'django','django','django',1,0),(10,'acm_pku','acm_pku','acm_pku',1,0);
/*!40000 ALTER TABLE `website_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_tag`
--

DROP TABLE IF EXISTS `website_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_tag`
--

LOCK TABLES `website_tag` WRITE;
/*!40000 ALTER TABLE `website_tag` DISABLE KEYS */;
INSERT INTO `website_tag` VALUES (1,'python'),(2,'linux'),(3,'健身'),(4,'django'),(5,'囚徒健身'),(6,'罗玉凤');
/*!40000 ALTER TABLE `website_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-23 17:54:43
