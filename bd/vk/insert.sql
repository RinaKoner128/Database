-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_22
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Spinkaview'),(2,'Emmittberg'),(3,'Parkerfort'),(4,'South Susanashire'),(5,'Stephaniahaven'),(6,'Lake Adalbertobury'),(7,'Port Morgantown'),(8,'New Esperanza'),(9,'Port Turnerton'),(10,'Emmerichtown'),(11,'New Coy'),(12,'Port Skyla'),(13,'Maximusville'),(14,'Lake Blaiseshire'),(15,'North Georgianamouth');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'minima',1),(2,'iure',2),(3,'velit',3),(4,'consectetur',4),(5,'labore',5),(6,'at',6),(7,'aperiam',7),(8,'quibusdam',8),(9,'odio',9),(10,'delectus',10);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_city` bigint(20) unsigned NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_city` (`id_city`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,1,'Kazakhstan'),(2,2,'Korea'),(3,3,'Nigeria'),(4,4,'Denmark'),(5,5,'Guernsey'),(6,6,'Botswana'),(7,7,'Cyprus'),(8,8,'Jordan'),(9,9,'Costa Rica'),(10,10,'Yemen');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,1,'approved','1997-11-07 20:32:14','2019-04-23 21:01:49'),(2,2,'declined','2022-03-24 14:43:25','1987-03-05 20:22:45'),(3,3,'requested','1975-03-27 09:23:41','2006-01-10 20:41:04'),(4,4,'requested','2000-07-14 16:18:01','1975-11-25 12:22:52'),(5,5,'approved','2013-08-07 01:03:18','1982-06-03 07:15:19'),(6,6,'unfriended','2004-12-30 03:29:57','2008-08-20 23:03:00'),(7,7,'unfriended','2018-03-01 18:03:31','1970-07-07 07:17:29'),(8,8,'approved','2008-02-29 23:49:40','1971-01-03 13:12:05'),(9,9,'approved','2009-03-19 22:19:40','2018-05-16 05:54:01'),(10,10,'unfriended','1970-06-03 21:56:44','1972-01-23 00:16:37');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `likes_fk` (`media_id`),
  KEY `likes_fk_1` (`user_id`),
  CONSTRAINT `likes_fk` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `likes_fk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'2009-09-15 11:15:04'),(2,2,2,'2012-03-24 17:37:29'),(3,3,3,'1994-12-26 12:55:44'),(4,4,4,'1996-01-03 12:42:36'),(5,5,5,'2017-11-17 14:49:08'),(6,6,6,'1978-11-22 00:36:31'),(7,7,7,'1994-03-08 05:52:59'),(8,8,8,'1970-12-23 00:04:11'),(9,9,9,'2002-02-15 02:06:09'),(10,10,10,'2009-08-20 01:00:22'),(11,11,11,'1992-04-20 03:47:46'),(12,12,12,'1981-11-21 19:50:40'),(13,13,13,'2006-04-30 22:13:45'),(14,14,14,'1975-03-09 04:46:33');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Iure nemo voluptatem sed molestiae tempore officia. Quas veniam numquam animi et quas minus. Id enim possimus autem adipisci magnam qui. Vitae provident facilis nemo mollitia odio ut.','perferendis',459289,NULL,'1980-04-06 19:46:47','2002-04-03 18:46:29'),(2,2,2,'Quis facere iusto nam esse explicabo quibusdam maiores. Voluptas dolor libero accusamus similique molestiae voluptatum. Est est soluta temporibus repudiandae sapiente quidem dolores. Expedita aspernatur a necessitatibus totam ab. Qui eaque accusantium ea voluptatem.','eos',49245,NULL,'1987-10-19 00:20:48','2011-11-05 21:41:12'),(3,3,3,'Suscipit in cum aut consectetur et molestias saepe cupiditate. Quia nam minus cum harum doloremque dolor facilis. Ullam ratione quas nisi voluptas quis veritatis aliquam.','rerum',7313079,NULL,'2016-06-06 15:48:24','2021-11-24 08:43:17'),(4,4,4,'Ut provident illum aut ea possimus. Non et veritatis velit neque neque et itaque. Veritatis excepturi debitis et reiciendis est sunt facilis.','perspiciatis',519,NULL,'2003-08-27 08:57:54','2017-09-16 22:01:49'),(5,5,5,'Earum ut corrupti voluptatem laudantium qui doloremque. Nostrum consequatur et asperiores eaque qui. Ut earum ratione et tenetur id error. Optio at dolorem quis qui culpa.','quasi',40447217,NULL,'1986-04-02 17:42:46','2019-04-05 12:33:44'),(6,6,6,'Voluptate qui sit in consectetur natus. Cum adipisci consequatur autem molestiae est. Sequi ratione ipsa sed mollitia maxime officia.','nihil',9,NULL,'2015-12-28 18:41:47','1986-02-20 13:10:45'),(7,7,7,'Numquam ut corporis aliquid ipsam enim. Laudantium tenetur dolorem ipsum impedit. Fuga qui cumque qui aut deserunt rerum ut.','perferendis',8411,NULL,'1997-10-08 12:44:56','1981-09-04 01:46:56'),(8,8,8,'Quam quis minima magni quo labore. Est nesciunt fuga odit sapiente laboriosam reiciendis. Dolorem pariatur excepturi sed et.','esse',931992025,NULL,'1988-03-15 09:00:42','1989-03-07 16:43:29'),(9,9,9,'Ut accusantium unde tempora quia. Aut adipisci ut sed earum quis eum. Unde est quis recusandae et.','voluptatem',9,NULL,'1977-06-03 15:37:31','1989-09-16 00:29:06'),(10,10,10,'Molestias sit quaerat sint est. Tempore nostrum qui mollitia ut.','sint',439461496,NULL,'2016-10-04 04:51:53','1989-06-26 20:08:34'),(11,1,11,'Aspernatur quae cum quae et delectus eaque. Quis inventore et minima. Qui voluptatem illum a aut. Sint ea veniam ut et accusantium.','alias',47539520,NULL,'1996-07-14 18:24:39','2021-06-30 18:03:55'),(12,2,12,'Porro eum similique accusantium quas nemo veritatis. Laborum sint consectetur aut et enim nostrum nihil. Error ipsa vel suscipit aperiam sit vel ut delectus.','vel',462049,NULL,'2000-09-09 09:34:02','2007-10-16 00:47:07'),(13,3,13,'Reprehenderit reiciendis sunt debitis fuga eveniet sunt. Sit possimus aspernatur voluptas praesentium. Illum consequuntur qui quia temporibus et consequatur.','ut',22,NULL,'2019-05-01 08:52:41','1972-03-05 11:48:59'),(14,4,14,'Dolorum quia repellendus ex alias odit. Eum fugit fuga vel ab vel eligendi. Dolor voluptatem hic culpa rerum qui cum earum.','et',2,NULL,'2003-09-05 10:16:13','1977-05-10 04:34:26'),(15,5,15,'Optio eaque qui sint animi consequatur aliquam. Esse id magni veniam ea libero. Velit ut veniam iure itaque. Quia nihil ipsa asperiores exercitationem possimus. Eos amet excepturi dolorum quis consequatur dolorem.','rem',9557,NULL,'2021-09-16 01:49:40','1990-06-02 12:04:01'),(16,6,1,'Eum aut nemo est eum sunt. Vero hic temporibus harum sunt deserunt. Quo voluptatum vero asperiores est quia.','assumenda',1,NULL,'2019-05-17 00:20:39','1981-09-16 03:19:50'),(17,7,2,'Non accusamus similique laudantium earum et consectetur et. Qui eum nihil officiis laborum molestiae aut. Sequi ut nemo est voluptas debitis repellendus. Hic beatae quidem facilis distinctio.','architecto',517371,NULL,'2004-10-16 00:14:06','1979-01-10 13:19:49');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'dolores','1982-04-15 06:55:47','2012-11-16 15:41:05'),(2,'hic','1995-04-09 12:30:51','2020-10-12 07:16:36'),(3,'sed','1992-09-05 04:38:16','1988-08-21 16:41:09'),(4,'vel','1976-10-21 04:01:11','2013-08-28 21:56:53'),(5,'in','2000-11-13 19:27:11','1970-07-10 13:40:37'),(6,'suscipit','2010-10-16 17:00:19','2016-03-05 06:42:03'),(7,'quo','1970-08-18 11:26:02','1994-04-11 21:12:59'),(8,'ipsam','2006-03-06 21:16:37','1997-02-12 07:54:51'),(9,'eius','1985-12-28 07:29:30','2009-02-23 21:30:16'),(10,'similique','2013-11-03 04:43:45','1986-05-29 15:38:52');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Esse eligendi nostrum delectus laudantium ut saepe omnis ab. Soluta dolorum animi et. Consequatur doloremque vel corporis aspernatur at rerum.','2021-05-22 16:59:02'),(2,2,2,'Perspiciatis corporis ad at exercitationem nesciunt totam ratione est. Eaque quae ipsum voluptas autem laborum inventore. Distinctio minus est officiis dicta dolor deserunt minima. Cumque qui deserunt suscipit aut perferendis sed facere.','1982-11-30 09:01:52'),(3,3,3,'Dolorem expedita sunt rem aut molestiae et sed. Molestiae aspernatur accusantium consequuntur provident nesciunt molestias nobis. Quia molestiae laborum odio tempore aut labore. Adipisci laboriosam sint dolores est nesciunt.','1977-09-26 15:22:22'),(4,4,4,'Odio nisi laboriosam ad fugit sed reprehenderit aperiam eum. Ea beatae modi temporibus culpa aut totam ex est. Aut ut quo dolore ullam.','1970-08-24 20:53:01'),(5,5,5,'Beatae ut maxime natus inventore voluptas. Repellendus beatae aperiam consequuntur velit enim autem dolor. Repudiandae blanditiis et et totam. Consequatur provident corporis qui.','1992-06-02 20:02:07'),(6,6,6,'Odio ad quia molestiae et. Quas omnis ad fuga alias odio cum. Voluptatum consequatur dolor cumque natus.','2013-01-25 01:27:50'),(7,7,7,'Sit aut quod velit debitis dolores similique. Vel omnis soluta maxime est voluptatem blanditiis. Asperiores ut amet blanditiis optio.','1980-04-20 20:19:39'),(8,8,8,'Expedita totam alias rem accusantium. Omnis voluptas pariatur illum expedita similique. Laboriosam cumque ratione culpa aut incidunt.','2007-09-23 03:31:45'),(9,9,9,'A a quisquam quisquam id quae dolores. Nam officiis neque inventore officiis. Est officiis occaecati architecto totam.','1981-04-25 02:38:29'),(10,10,10,'Odio debitis nobis quia ut cupiditate quia. Nostrum consequatur fugiat sed. Consequuntur ea alias totam numquam sit voluptatem praesentium. Iste doloremque aut sed dolorem error. Sint occaecati omnis aut id.','2000-08-02 15:57:59'),(11,11,11,'Est ratione illum at quia et. Qui error itaque quos voluptas qui sint reiciendis voluptas. Eveniet eum aliquam laudantium reiciendis distinctio nihil dolore. Ullam iste occaecati ab sint.','1993-07-28 04:28:03'),(12,12,12,'Non voluptas quae et doloribus harum similique. Sequi ipsum rerum amet dolor. Eligendi incidunt adipisci minus repudiandae voluptate in distinctio. Cum dolor aut enim eos non quaerat.','1992-04-16 07:14:58');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performer`
--

DROP TABLE IF EXISTS `performer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer`
--

LOCK TABLES `performer` WRITE;
/*!40000 ALTER TABLE `performer` DISABLE KEYS */;
INSERT INTO `performer` VALUES (1,'Elenora Spinka'),(2,'Electa Oberbrunner'),(3,'Mrs. Pink Stoltenberg'),(4,'Keenan Morissette'),(5,'Prof. Veronica Kirlin MD'),(6,'Neva Cremin'),(7,'Mr. Quinton Connelly'),(8,'Carmel Bogisich'),(9,'Wellington Schmeler'),(10,'Lexi Hayes DDS');
/*!40000 ALTER TABLE `performer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'reprehenderit',1),(2,'hic',2),(3,'fugiat',3),(4,'porro',4),(5,'quaerat',5),(6,'non',6),(7,'qui',7),(8,'ut',8),(9,'rem',9),(10,'laboriosam',10);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'laudantium','Et sit animi commodi nostrum dolorem. Occaecati quam omnis illum temporibus non ea. Est quae perferendis ad atque maiores.'),(2,'ea','Aut soluta dignissimos possimus ut. Enim ipsum delectus consequatur debitis aliquid ex quidem. Iusto voluptas impedit ipsam eveniet nihil. Doloribus voluptatem quibusdam voluptas aut repellendus.'),(3,'temporibus','Laboriosam aut rem ducimus. Explicabo commodi cum laborum repellendus. Occaecati qui distinctio quam nesciunt voluptatem nulla. Totam quis cupiditate et sit illo quaerat.'),(4,'aut','Nemo voluptate eos non explicabo. Fuga non numquam rerum qui. Quo et nulla quisquam non.'),(5,'sed','Eligendi nihil atque esse. Et laudantium saepe nulla corporis. Beatae non temporibus qui est quisquam est.'),(6,'enim','Omnis voluptate quo velit maxime. Et laboriosam veritatis facilis quia corrupti omnis. Itaque sunt facilis consequuntur voluptas sint ut corrupti voluptas. Accusamus nisi enim molestiae qui. Ad iste neque ipsa molestiae ut.'),(7,'corporis','Dignissimos tempora unde repellat ut officiis dolore sint atque. Facere et vitae facere quam magnam. Consequatur dolorum dolore blanditiis consectetur voluptatem.'),(8,'et','Cum ut id modi rerum inventore quasi assumenda. Voluptates nostrum repellat magni quas qui. Fugiat reprehenderit amet dolorem sed animi laboriosam. Ut exercitationem assumenda ab quis eos qui.'),(9,'aut','Facilis cupiditate ea saepe fugiat quisquam. Dolores maxime vel dicta. Est voluptatum voluptatem consectetur nihil rem qui dolorum.'),(10,'dolorem','Dolor animi at amet facere. Ut eius reprehenderit et. Sed doloremque quia praesentium ut magnam earum saepe. Recusandae natus tempore cumque ut sunt labore quibusdam.');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_likes`
--

DROP TABLE IF EXISTS `playlist_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_likes` (
  `id_playlist` bigint(20) unsigned NOT NULL,
  `id_likes` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_playlist`,`id_likes`),
  KEY `id_likes` (`id_likes`),
  CONSTRAINT `playlist_likes_ibfk_1` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id`),
  CONSTRAINT `playlist_likes_ibfk_2` FOREIGN KEY (`id_likes`) REFERENCES `likes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_likes`
--

LOCK TABLES `playlist_likes` WRITE;
/*!40000 ALTER TABLE `playlist_likes` DISABLE KEYS */;
INSERT INTO `playlist_likes` VALUES (1,1),(1,11),(2,2),(2,12),(3,3),(3,13),(4,4),(4,14),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `playlist_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_song`
--

DROP TABLE IF EXISTS `playlist_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_song` (
  `id_playlist` bigint(20) unsigned NOT NULL,
  `id_song` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_playlist`,`id_song`),
  KEY `id_song` (`id_song`),
  CONSTRAINT `playlist_song_ibfk_1` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id`),
  CONSTRAINT `playlist_song_ibfk_2` FOREIGN KEY (`id_song`) REFERENCES `song` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_song`
--

LOCK TABLES `playlist_song` WRITE;
/*!40000 ALTER TABLE `playlist_song` DISABLE KEYS */;
INSERT INTO `playlist_song` VALUES (1,37),(1,47),(2,38),(2,48),(3,39),(3,49),(4,40),(5,41),(6,42),(7,43),(8,44),(9,45),(10,46);
/*!40000 ALTER TABLE `playlist_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_users`
--

DROP TABLE IF EXISTS `playlist_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_users` (
  `id_playlist` bigint(20) unsigned NOT NULL,
  `id_users` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_playlist`,`id_users`),
  KEY `id_users` (`id_users`),
  CONSTRAINT `playlist_users_ibfk_1` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id`),
  CONSTRAINT `playlist_users_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_users`
--

LOCK TABLES `playlist_users` WRITE;
/*!40000 ALTER TABLE `playlist_users` DISABLE KEYS */;
INSERT INTO `playlist_users` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `playlist_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `profiles_fk_1` (`photo_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `profiles_fk_1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','1984-11-24',1,'2019-12-09 05:49:32',NULL),(2,'h','2001-05-31',2,'1970-03-23 01:06:10',NULL),(3,'h','1972-01-18',3,'2013-01-14 06:58:51',NULL),(4,'h','2006-10-27',4,'2013-12-28 21:46:31',NULL),(5,'m','2011-10-16',5,'2010-02-10 07:13:27',NULL),(6,'h','2003-04-14',6,'2014-12-24 05:50:50',NULL),(7,'m','1970-10-02',7,'1988-09-18 12:09:40',NULL),(8,'h','2002-11-15',8,'2013-12-02 03:49:22',NULL),(9,'m','1976-04-22',9,'2013-05-13 05:39:55',NULL),(10,'h','1982-07-10',10,'2008-11-24 05:55:14',NULL),(11,'m','1994-07-29',1,'2021-05-23 14:11:47',NULL),(12,'m','1981-12-15',2,'2018-06-17 08:18:30',NULL),(13,'m','1993-05-02',3,'1983-02-20 20:57:33',NULL),(14,'m','1992-09-23',4,'1975-04-12 16:58:02',NULL),(15,'h','2017-12-21',5,'2006-12-07 22:09:07',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_performer` bigint(20) unsigned NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `song_time` time DEFAULT NULL,
  `file` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_performer` (`id_performer`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`id_performer`) REFERENCES `performer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (37,1,'dolor','04:18:23',''),(38,2,'iusto','21:58:50',''),(39,3,'a','07:36:37',''),(40,4,'est','12:30:01',''),(41,5,'in','09:28:13',''),(42,6,'commodi','13:20:58',''),(43,7,'commodi','14:09:58',''),(44,8,'dolore','08:50:31',''),(45,9,'autem','21:40:22',''),(46,10,'dolorem','11:11:12',''),(47,1,'rerum','05:24:17',''),(48,2,'minus','04:14:05',''),(49,3,'quis','22:20:16',''),(50,4,'quae','11:05:22',''),(51,5,'provident','15:19:30',''),(52,6,'et','09:50:32',''),(53,7,'deleniti','18:30:57',''),(54,8,'nostrum','03:26:00','');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  `id_country` bigint(20) unsigned NOT NULL,
  `id_city` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `id_country` (`id_country`),
  KEY `id_city` (`id_city`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cristobal','Nikolaus','delia83@example.com','f700aa6fc3a963de8f60cc6d28da867a4bcaf440',89405522693,1,1),(2,'Ona','Barrows','melyna.pacocha@example.net','46b749f8ff144e90c7097997131b423e9cfa7cef',89255445740,2,2),(3,'Van','Schneider','kareem.reilly@example.com','307306c77a5d2f5d001885666550e3f9b7b8be6e',89899289696,3,3),(4,'Tyra','Lang','muller.jalon@example.org','4600fe7c243c883591ed82b9ebbf8e18bd27886c',89853646908,4,4),(5,'Aurelio','Fadel','skylar.ward@example.com','197ad62b133204814b64b3469da75bb678886f70',89155352916,5,5),(6,'Dorris','Parker','schultz.tod@example.com','d2803349796fd03a7c5b29f6ef402b4b0f04161f',89157355817,6,6),(7,'Aaron','Crona','zbailey@example.com','23735f594464a9ae2877fc7f8fa3462096d31e91',89773700842,7,7),(8,'Davonte','Kessler','langosh.ocie@example.net','4d4e0ea4d394ba3c4d6825ac78d9230b08ab6db4',89049472558,8,8),(9,'Clotilde','Dickens','kyra63@example.com','a6390695282c99c8d3d8ccb75d40ba0d2c437ff6',89828073170,9,9),(10,'Buster','Beier','kris.cesar@example.com','14b31c42f53d5ffc2356fa349a5912dd13343762',89600262037,10,10),(11,'Vincent','Schaefer','kreiger.zoe@example.org','01fcb29d10a7925c54921134493fd304dd6f6c06',89399746453,1,11),(12,'Elizabeth','Howell','mona57@example.org','7458753e2b8f9b6c33457b8981033f2f27d04851',89777564653,2,12),(13,'Jacklyn','Rolfson','lprice@example.com','9f3f2d15f87bc3f5112131b63932c8c54e6fd279',89948706358,3,13),(14,'Kathryn','Shields','durgan.marian@example.com','bcbf47ea83cd2bb7b9b9bfd8eb48f9e21abf4010',89712478843,4,14),(15,'Lukas','Romaguera','lhaag@example.com','a6a3fc8182a14f85fa7bd0605de53d0b9ec8fbc7',89819103811,5,15);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-02  8:12:11
insert ignore into users
value
('167','Valeriy','Ivanov','sdbhsfdhbs@dfdf.re','h4fv5fv4v4','894512338254','4','4'),
('168','Valeriy','Petrov','sdbhsddhbs@dfdf.re','h4fv5fv4v4','894512138254','4','4'),
('169','Valeriy','Sidorov','sdbhebdhbs@dfdf.re','h4fv5fv4v4','894512132754','4','4'),
('170','Valeriy','Kalashnikov','wdbhsbdhbs@dfdf.re','h4fv5fv4v4','894522138754','4','4'),
('171','Valeriy','Jons','sdbhsbhbs@dfdf.re','h4fv5fv4v4','894512138752','4','4');
insert into messages
value ('13','167','168','ghvjkhjhjhh','20230425');

select distinct firstname as 'Имя' from users order by firstname;
ALTER TABLE profiles ADD COLUMN is_active boolean default true NOT NULL;
update profiles set is_active = false
where YEAR(CURRENT_DATE)-YEAR(birthday)<18;
delete from messages
where created_at > current_timestamp();