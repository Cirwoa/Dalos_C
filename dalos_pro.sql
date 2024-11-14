-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: dalos_pro
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuario nuevo',7,'add_usuarionuevo'),(26,'Can change usuario nuevo',7,'change_usuarionuevo'),(27,'Can delete usuario nuevo',7,'delete_usuarionuevo'),(28,'Can view usuario nuevo',7,'view_usuarionuevo'),(29,'Can add login usuario',9,'add_loginusuario'),(30,'Can change login usuario',9,'change_loginusuario'),(31,'Can delete login usuario',9,'delete_loginusuario'),(32,'Can view login usuario',9,'view_loginusuario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$9hW79MNkcZ57vDtcGMGpx4$P/Yb2KFspQXr6zIu0Y1PjfrT0mbMup7WkAV+v4pdOVo=','2024-11-08 06:04:29.451502',1,'ciro','','','gaalesixo@gmail.com',1,1,'2024-11-08 06:04:08.575294'),(2,'pbkdf2_sha256$870000$MZksTHAjlHf6PULVKyZwnx$QoTARlopmlz7hXC9FXr2u9GGad3v8Qb09C+nfntU6gk=','2024-11-12 06:27:22.273255',0,'Cirowo1','','','',0,1,'2024-11-12 06:27:13.837862'),(3,'pbkdf2_sha256$870000$18NXM4k9AXmfixFGRK9RCE$V30QiQf/kYdiQ3MZ4nfl+QNFCYb3QMIaWDX6HepOr4w=',NULL,0,'Ciroo','','','',0,1,'2024-11-12 06:40:43.444368'),(4,'pbkdf2_sha256$870000$3Vkh3von2RrYrWzYcvDBm1$ZJm/aqlBIpzTtsPc4W8h93YM5O0d4dopuOOlqh2fq5s=',NULL,0,'Ciroo1','','','',0,1,'2024-11-12 06:41:57.947052'),(5,'pbkdf2_sha256$870000$G8CZndj1s317Ce8lyYK0Lv$n82wLk5TFvKLFD62O3B+37xaQNhaNY3sr4gB1Wsv1so=',NULL,0,'Ciroo2','','','',0,1,'2024-11-12 06:51:36.079958');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dalos_app_loginusuario`
--

DROP TABLE IF EXISTS `dalos_app_loginusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dalos_app_loginusuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dalos_app_loginusuario`
--

LOCK TABLES `dalos_app_loginusuario` WRITE;
/*!40000 ALTER TABLE `dalos_app_loginusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `dalos_app_loginusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dalos_app_usuarionuevo`
--

DROP TABLE IF EXISTS `dalos_app_usuarionuevo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dalos_app_usuarionuevo` (
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo_electronico` varchar(254) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT '1000.00',
  PRIMARY KEY (`dni`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dalos_app_usuarionuevo`
--

LOCK TABLES `dalos_app_usuarionuevo` WRITE;
/*!40000 ALTER TABLE `dalos_app_usuarionuevo` DISABLE KEYS */;
INSERT INTO `dalos_app_usuarionuevo` VALUES ('ciro','chan','12345678','1994-03-12','jh@gmail.com','ciro','123',1000.00),('edu','bardo','1263871','2000-12-12','lulu@gmail.com','edu','800',1000.00),('cirow','chan','45661920','2000-12-12','wuwuwu@gmail.com','Cirow','123',1000.00),('rocio','baston','5986758','2000-12-12','rochio@hotmail.com','chio1','567',1000.00),('gonx','lol','99999988','2000-01-09','locotron@gmail.com','gonx','456',1000.00);
/*!40000 ALTER TABLE `dalos_app_usuarionuevo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-08 06:08:54.995114','55667789','efra',3,'',7,1),(2,'2024-11-08 06:08:54.995148','4735735','gael',3,'',7,1),(3,'2024-11-08 06:08:54.995161','47353126','gonn',3,'',7,1),(4,'2024-11-08 06:13:39.878687','45661920','hola',3,'',7,1),(5,'2024-11-08 06:13:39.878720','37662012','Ciro',3,'',7,1),(6,'2024-11-08 06:27:09.933082','45661920','9990333108314879545231',3,'',8,1),(7,'2024-11-08 06:27:09.933132','37662012','9990333109679751017018',3,'',8,1),(8,'2024-11-08 06:27:16.770477','47662011','Ciro',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'Dalos_app','cuentanueva'),(9,'Dalos_app','loginusuario'),(7,'Dalos_app','usuarionuevo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Dalos_app','0001_initial','2024-11-05 15:15:22.780800'),(2,'Dalos_app','0002_user','2024-11-05 15:15:22.814229'),(3,'Dalos_app','0003_usuarionuevo_delete_user_delete_usuario','2024-11-05 15:15:22.847782'),(4,'contenttypes','0001_initial','2024-11-05 15:15:22.896911'),(5,'auth','0001_initial','2024-11-05 15:15:23.468177'),(6,'admin','0001_initial','2024-11-05 15:15:23.584104'),(7,'admin','0002_logentry_remove_auto_add','2024-11-05 15:15:23.599698'),(8,'admin','0003_logentry_add_action_flag_choices','2024-11-05 15:15:23.599698'),(9,'contenttypes','0002_remove_content_type_name','2024-11-05 15:15:23.684338'),(10,'auth','0002_alter_permission_name_max_length','2024-11-05 15:15:23.753461'),(11,'auth','0003_alter_user_email_max_length','2024-11-05 15:15:23.769083'),(12,'auth','0004_alter_user_username_opts','2024-11-05 15:15:23.784735'),(13,'auth','0005_alter_user_last_login_null','2024-11-05 15:15:23.837633'),(14,'auth','0006_require_contenttypes_0002','2024-11-05 15:15:23.837633'),(15,'auth','0007_alter_validators_add_error_messages','2024-11-05 15:15:23.853290'),(16,'auth','0008_alter_user_username_max_length','2024-11-05 15:15:23.868883'),(17,'auth','0009_alter_user_last_name_max_length','2024-11-05 15:15:23.884502'),(18,'auth','0010_alter_group_name_max_length','2024-11-05 15:15:23.900143'),(19,'auth','0011_update_proxy_permissions','2024-11-05 15:15:23.900143'),(20,'auth','0012_alter_user_first_name_max_length','2024-11-05 15:15:23.915744'),(21,'sessions','0001_initial','2024-11-05 15:15:23.953788'),(22,'Dalos_app','0004_cuentanueva_alter_usuarionuevo_nombre_usuario_and_more','2024-11-08 07:09:35.290134'),(23,'Dalos_app','0005_alter_cuentanueva_options','2024-11-08 07:09:35.294586'),(24,'Dalos_app','0006_alter_usuarionuevo_contraseña','2024-11-08 07:09:35.356912'),(25,'Dalos_app','0007_remove_cuentanueva_id_alter_cuentanueva_dni_usuario','2024-11-08 07:09:35.513139'),(26,'Dalos_app','0008_delete_cuentanueva_usuarionuevo_alias_and_more','2024-11-08 07:09:35.718352'),(27,'Dalos_app','0009_remove_usuarionuevo_alias_remove_usuarionuevo_cbu_and_more','2024-11-08 07:09:35.915688'),(31,'Dalos_app','0010_delete_loginusuario','2024-11-10 05:57:08.764273'),(32,'Dalos_app','0011_loginusuario','2024-11-10 05:57:08.878726'),(33,'Dalos_app','0012_alter_usuarionuevo_monto','2024-11-10 05:57:08.885857'),(34,'Dalos_app','0002_loginusuario_usuarionuevo_delete_usuario_and_more','2024-11-14 10:12:21.650758');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('97hrc4vt2msr5170a5ne5nxiyholzmon','eyJ1c2VyX2lkIjoiMTIzNDU2NzgiLCJub21icmVfdXN1YXJpbyI6ImNpcm8ifQ:1tBWxe:AAkIChEvuqJzaHHMTWJhGY-KRR7qY8gKcnftfyjd_Mg','2024-11-14 11:20:26.820306'),('a8k0lf78415gpaaprseofdfeebc1sn24','.eJxVjMsOwiAUBf-FtSG8ygWX7vsN5PKSqoGktCvjv0uTLnR7Zua8icN9K27vaXVLJFfCyeV38xieqR4gPrDeGw2tbuvi6aHQk3Y6t5het9P9OyjYy6iNYQDcMo0StPBZWoPAcp54QJZsUmCHoqS10yCZKy8AUGQto0cVFfl8AbL5NwE:1t9I6f:Sxe5bxmR0ldiWRrSIfGhm6taAz1w-uFCh1v-n8tTXss','2024-11-08 07:04:29.454834'),('fwlwtxq11maa272os0qk04jbzdqh1f0u','.eJxVjMsOwiAURP-FtSGhCLe4dO83kPtSqoYmpV0Z_11JutDdZM6ZeZmM21ry1nTJk5iTGczhtyPkh9YO5I71Nlue67pMZLtid9rsZRZ9nnf376BgK32d4Aqek0sQdAiRPDv3jYTk6ciKHkE0cAyjaHSOkb0I0QgKgAnN-wP3ZTj7:1tAkN0:uPfPSaHKcJQnVZG_2mrjVJrVTk7uMhClfMtOCRwh6Zw','2024-11-12 07:27:22.277794');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14  7:24:52
