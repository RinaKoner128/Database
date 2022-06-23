drop database if exists comp;
create database comp;
use comp;

drop table if exists positions;
create table positions(
id serial primary key,
name varchar(255) comment 'Название Должности',
salary decimal(15,2) comment 'Зарплата'
) comment = 'Должность';

drop table if exists departments;
create table departments(
id serial primary key,
name varchar(255) comment 'Название Отдела',
phone bigint,
fax bigint
) comment = 'Отдел';

drop table if exists clientele;
create table clientele(
id serial primary key,
lastname varchar(255) not null,
firstname varchar(255) not null,
secondname varchar(255),
phone bigint not null,
email varchar(100)
) comment = 'Клиент';

drop table if exists facilities;
create table facilities(
id serial primary key,
number bigint comment 'Номер склада',
address varchar(255) comment 'Адрес'
) comment = 'Склад';

drop table if exists types;
create table types(
id serial primary key,
name varchar(255) comment 'Категория товара'
) comment = 'Категории';

drop table if exists manufacturer;
create table manufacturer(
id serial primary key,
name varchar(255) comment 'Название производства',
phone bigint comment 'Контактный телефон',
address varchar(255) comment 'Адрес производства'
) comment = 'Производитель';

drop table if exists item;
create table item(
id serial primary key,
id_types BIGINT UNSIGNED NOT NULL,
id_manufacturer BIGINT UNSIGNED NOT NULL,
name varchar(255) comment 'Название',
price decimal(15,2) comment 'Цена',
description text comment 'Описание',
foreign key (id_types) references types(id),
foreign key (id_manufacturer) references manufacturer(id)
) comment = 'Товар';

drop table if exists facilities_item;
create table facilities_item(
id serial primary key,
id_types BIGINT UNSIGNED NOT NULL,
id_facilities BIGINT UNSIGNED NOT NULL,
quantity bigint comment '',
foreign key (id_types) references types(id),
foreign key (id_facilities) references facilities(id)
) comment = 'Товар на складе';

drop table if exists workers;
create table workers(
id serial primary key,
id_positions BIGINT UNSIGNED NOT NULL,
id_departments BIGINT UNSIGNED NOT NULL,
id_facilities BIGINT UNSIGNED NOT NULL,
lastname varchar(255) not null,
firstname varchar(255) not null,
secondname varchar(255),
foreign key (id_positions) references positions(id),
foreign key (id_departments) references departments(id),
foreign key (id_facilities) references facilities(id)
) comment = 'Сотрудник';

drop table if exists ordes;
create table ordes(
id serial primary key,
id_workers BIGINT UNSIGNED NOT NULL,
id_facilities BIGINT UNSIGNED NOT NULL,
id_item BIGINT UNSIGNED NOT NULL,
id_clientele BIGINT UNSIGNED NOT NULL,
number bigint not null,
quantity bigint not null,
data_tabase datetime not null default current_timestamp,
data_veilance datetime not null default current_timestamp,
data_conomy datetime not null default current_timestamp,
foreign key (id_workers) references workers(id),
foreign key (id_facilities) references facilities(id),
foreign key (id_item) references item(id),
foreign key (id_clientele) references clientele(id)
) comment = 'Смета';

-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_15
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
-- Table structure for table `clientele`
--

DROP TABLE IF EXISTS `clientele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientele` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Клиент';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientele`
--

LOCK TABLES `clientele` WRITE;
/*!40000 ALTER TABLE `clientele` DISABLE KEYS */;
INSERT INTO `clientele` VALUES (1,'Torphy','Jamison','Pascale',89538713554,'yboehm@example.com'),(2,'Gaylord','Trinity','Tatyana',89273032568,'larkin.columbus@example.net'),(3,'Kshlerin','Rosina','Yolanda',89338603279,'rolfson.ashton@example.org'),(4,'Hayes','Khalil','Rita',89168771567,'ernie.reynolds@example.net'),(5,'Medhurst','Layne','Maeve',89132943719,'dejon.dooley@example.org');
/*!40000 ALTER TABLE `clientele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название Отдела',
  `phone` bigint(20) DEFAULT NULL,
  `fax` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Отдел';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Jacobson PLC',89249791914,833655),(2,'Conroy-Carroll',89778862652,324299),(3,'Daugherty, Fay and Jones',89459012125,710179),(4,'Weimann and Sons',89456933594,676695),(5,'Windler-Schulist',89954372052,789924);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facilities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `number` bigint(20) DEFAULT NULL COMMENT 'Номер склада',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Адрес',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Склад';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,7,'877 Daisha Garden\nPort Clarissaville, SD 50611-9479'),(2,8,'0383 Shanie Underpass Apt. 973\nMillerchester, MT 69128'),(3,4,'0848 Hintz Trail Suite 985\nLourdesshire, RI 96709-1284'),(4,6,'8425 Mallie Mill Suite 476\nAdriennebury, VA 86571');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities_item`
--

DROP TABLE IF EXISTS `facilities_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facilities_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_types` bigint(20) unsigned NOT NULL,
  `id_facilities` bigint(20) unsigned NOT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_types` (`id_types`),
  KEY `id_facilities` (`id_facilities`),
  CONSTRAINT `facilities_item_ibfk_1` FOREIGN KEY (`id_types`) REFERENCES `types` (`id`),
  CONSTRAINT `facilities_item_ibfk_2` FOREIGN KEY (`id_facilities`) REFERENCES `facilities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товар на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities_item`
--

LOCK TABLES `facilities_item` WRITE;
/*!40000 ALTER TABLE `facilities_item` DISABLE KEYS */;
INSERT INTO `facilities_item` VALUES (1,1,1,173),(2,2,2,6),(3,3,3,225),(4,4,4,2),(5,5,1,154),(6,1,2,122),(7,2,3,4),(8,3,4,241),(9,4,1,198),(10,5,2,187);
/*!40000 ALTER TABLE `facilities_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_types` bigint(20) unsigned NOT NULL,
  `id_manufacturer` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `price` decimal(15,2) DEFAULT NULL COMMENT 'Цена',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Описание',
  PRIMARY KEY (`id`),
  KEY `id_types` (`id_types`),
  KEY `id_manufacturer` (`id_manufacturer`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_types`) REFERENCES `types` (`id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`id_manufacturer`) REFERENCES `manufacturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товар';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,1,'aliquid',366873159.87,'Doloribus totam reiciendis explicabo distinctio delectus iusto enim qui. Voluptatem est eos velit exercitationem. Itaque sit ut laboriosam dolorem eum enim. Qui corrupti ut fugiat corporis quas eligendi corporis nihil.'),(2,2,2,'fuga',1579971.49,'Minima quia unde quibusdam enim similique maxime placeat. Accusantium consequatur id hic. Voluptates ipsa consequuntur quaerat. Fuga eos inventore neque quidem sed occaecati.'),(3,3,3,'occaecati',973.26,'Laboriosam sunt praesentium ratione placeat eaque. Reiciendis optio iure dolorem perferendis vero qui consequuntur. Magnam id omnis sed ducimus recusandae.'),(4,4,4,'facere',808272.43,'Ipsa explicabo voluptatem sunt nisi. Consequatur sunt quaerat at quis saepe tenetur. Mollitia voluptatem numquam et asperiores. Magnam vel fuga repellendus doloremque iusto omnis non quia.'),(5,5,5,'asperiores',6.00,'Dicta similique fugiat voluptatem ad qui nesciunt. Impedit facilis temporibus quam dolor in totam. Dicta sint et pariatur aliquam aut tenetur.'),(6,1,1,'adipisci',15737850.17,'Libero et est ex alias placeat velit laborum in. In quo similique neque suscipit. Soluta ex quidem et ullam aut neque voluptatem. Eveniet ut sint quo quia quo et ut.'),(7,2,2,'voluptatem',820367.48,'Ut veritatis accusantium nulla totam et. Qui esse sint assumenda. Illum nihil et ut fuga quaerat suscipit nam. In deleniti ut quas placeat ut dolor quia.'),(8,3,3,'dolorem',0.00,'Consequatur illum sequi perspiciatis aut sequi atque eum. Accusamus fugit ea libero aut. Voluptatem vitae delectus perspiciatis quia dolore minus mollitia modi. Non voluptas nobis corrupti.'),(9,4,4,'cumque',17.85,'Ut deleniti veritatis facere reprehenderit. Ut doloribus sapiente occaecati rerum. Fuga consequuntur nihil sed voluptatem dignissimos temporibus quis doloremque.'),(10,5,5,'perferendis',5693.00,'Qui velit laborum aut enim labore rerum sed aut. Voluptatem quas aliquam perferendis ut quasi est. Facilis culpa quisquam sint dolorem cupiditate libero. Hic nostrum ut nam et sed.');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название производства',
  `phone` bigint(20) DEFAULT NULL COMMENT 'Контактный телефон',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Адрес производства',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Производитель';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Jerde-Schneider',89483875815,'02602 Toy Cove\nWest Alyshamouth, NE 19124-4931'),(2,'Ondricka-Doyle',89671988871,'2433 Monahan Forks Apt. 546\nErnietown, LA 30458-0221'),(3,'Botsford, Tromp and Ruecker',89370087572,'355 Josephine Shoals Apt. 422\nKochview, CT 65983-6242'),(4,'Mertz-Renner',89532913997,'4580 Harvey Burg Apt. 358\nNew Caleighport, NM 85567'),(5,'Goyette-Hauck',89038571918,'0220 Schneider Corner\nLilianbury, IL 39302');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordes`
--

DROP TABLE IF EXISTS `ordes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_workers` bigint(20) unsigned NOT NULL,
  `id_facilities` bigint(20) unsigned NOT NULL,
  `id_item` bigint(20) unsigned NOT NULL,
  `id_clientele` bigint(20) unsigned NOT NULL,
  `number` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `data_tabase` datetime NOT NULL DEFAULT current_timestamp(),
  `data_veilance` datetime NOT NULL DEFAULT current_timestamp(),
  `data_conomy` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_workers` (`id_workers`),
  KEY `id_facilities` (`id_facilities`),
  KEY `id_item` (`id_item`),
  KEY `id_clientele` (`id_clientele`),
  CONSTRAINT `ordes_ibfk_1` FOREIGN KEY (`id_workers`) REFERENCES `workers` (`id`),
  CONSTRAINT `ordes_ibfk_2` FOREIGN KEY (`id_facilities`) REFERENCES `facilities` (`id`),
  CONSTRAINT `ordes_ibfk_3` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  CONSTRAINT `ordes_ibfk_4` FOREIGN KEY (`id_clientele`) REFERENCES `clientele` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Смета';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordes`
--

LOCK TABLES `ordes` WRITE;
/*!40000 ALTER TABLE `ordes` DISABLE KEYS */;
INSERT INTO `ordes` VALUES (1,1,1,1,1,4,0,'1974-08-13 09:22:53','2008-05-24 17:35:42','1970-08-15 03:29:58'),(2,2,2,2,2,7,0,'1981-08-30 05:05:22','2000-05-13 04:40:29','1975-06-14 17:41:26'),(3,3,3,3,3,6,3,'2005-11-30 02:48:52','1991-12-02 22:12:32','1999-05-18 11:02:22'),(4,4,4,4,4,2,10,'1977-10-03 01:38:31','1986-08-20 08:51:48','1994-01-30 07:31:43'),(5,5,1,5,5,2,4,'1976-03-13 06:04:42','2004-12-19 03:41:31','2006-02-21 16:33:02'),(6,6,2,6,1,8,0,'2003-09-11 02:07:46','1985-07-06 01:06:55','1980-05-13 13:48:42');
/*!40000 ALTER TABLE `ordes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название Должности',
  `salary` decimal(15,2) DEFAULT NULL COMMENT 'Зарплата',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Должность';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Illum omnis delectus aut maxime aut necessitatibus ut.',39485.00),(2,'Repellendus nesciunt quia saepe eveniet quis dolorem.',39267.00),(3,'Maxime atque harum totam autem.',64314.00),(4,'Asperiores ut molestiae vel dolores sunt omnis.',56341.00),(5,'Consequuntur accusamus repellendus est non quas est.',65905.00),(6,'Ea exercitationem voluptatem amet placeat amet.',39727.00),(7,'Est ab repudiandae et ex laudantium aperiam adipisci explicabo.',33456.00);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Категория товара',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Категории';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'culpa'),(2,'est'),(3,'facere'),(4,'aspernatur'),(5,'est');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_positions` bigint(20) unsigned NOT NULL,
  `id_departments` bigint(20) unsigned NOT NULL,
  `id_facilities` bigint(20) unsigned NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_positions` (`id_positions`),
  KEY `id_departments` (`id_departments`),
  KEY `id_facilities` (`id_facilities`),
  CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`id_positions`) REFERENCES `positions` (`id`),
  CONSTRAINT `workers_ibfk_2` FOREIGN KEY (`id_departments`) REFERENCES `departments` (`id`),
  CONSTRAINT `workers_ibfk_3` FOREIGN KEY (`id_facilities`) REFERENCES `facilities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сотрудник';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,1,1,1,'Kemmer','Sean','Jadyn'),(2,2,2,2,'Luettgen','Lelia','Lauriane'),(3,3,3,3,'Bradtke','Johnathon','Arielle'),(4,4,4,4,'Gusikowski','Ernie','Amalia'),(5,5,5,1,'Frami','Marlin','Muriel'),(6,6,1,2,'Beatty','Randall','Glenna'),(7,7,2,3,'Crona','Parker','Izabella');
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

