/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: localhost    Database: plasticseeds
-- ------------------------------------------------------
-- Server version	11.8.2-MariaDB

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
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_category` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `article_category` VALUES
('16e37591-b42e-458b-ab32-fec35c8e81b7','Acrylonitrile Butadiene Styrene','acrylonitrile-butadiene-styrene','<p>Acrylonitrile Butadiene Styrene Desc</p>','055736-184-1200x800.jpg','2024-07-18 11:41:30',NULL,'2024/11/04/','5'),
('45090b14-345c-472c-ae8e-8fce71a33eb0','oke','oke','<p>qwkoeqkwe		</p>','055743-95-1200x800.jpg','2024-11-03 22:44:00',NULL,'2024/11/04/','81'),
('90b8bb56-ef9c-4769-a566-e149e9e3a072','Polypropylene','polypropylene','<p>Polypropylene Desc</p>','2024/07/20_150815-594-1200x800.jpg','2024-03-29 09:58:14',NULL,'2024/07/20/','8'),
('fb78c8bd-3688-4c68-8096-1c9cddd1deeb','High Impact Polystyrene','high-impact-polystyrene','<p>High Impact Polystyrene Desc</p>','2024/07/20_150824-19-1200x800.jpg','2024-07-20 01:35:21',NULL,'2024/07/20/','192');
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_tag` (
  `id` char(36) NOT NULL,
  `article_id` char(36) NOT NULL,
  `tag_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_tag_article_id_index` (`article_id`),
  KEY `article_tag_tag_id_index` (`tag_id`),
  CONSTRAINT `article_tag_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `article_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag`
--

LOCK TABLES `article_tag` WRITE;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `article_tag` VALUES
('019f40cd-b6bb-4859-885a-c4c3984e34f3','b542c866-62fe-4db4-b175-ef9a9ca2ac4b','92421597-1777-4be6-9f68-0af8f72c3806','2024-07-20 08:07:28',NULL),
('0f72a8a8-f17a-44db-a0b8-0ff09d051b24','49844875-cb8d-43b5-bf35-b8a2f39995bc','3d2db04a-6c2a-447a-82d5-046322dbd25e','2024-07-20 08:07:35',NULL),
('69f368a8-0948-4e50-9ea3-655c6a43a2cc','49844875-cb8d-43b5-bf35-b8a2f39995bc','7dfc38ee-a41a-4abd-ac27-b45ec27f9ac9','2024-07-20 08:07:35',NULL),
('7afe8b1f-e3f0-4cde-af79-10ee3f08f44b','64c311b6-04a4-4208-b644-07e8ca7f88f4','0bf3194f-517a-4102-b7b6-7044cd0dab2b','2024-07-20 08:07:42',NULL),
('89e3a41c-88a3-4d51-b0bc-f5f9fbfa98bd','b542c866-62fe-4db4-b175-ef9a9ca2ac4b','7dfc38ee-a41a-4abd-ac27-b45ec27f9ac9','2024-07-20 08:07:28',NULL),
('b1c35b3d-1000-4183-b394-318db7358bb7','49844875-cb8d-43b5-bf35-b8a2f39995bc','92421597-1777-4be6-9f68-0af8f72c3806','2024-07-20 08:07:35',NULL),
('c0951d93-1a8a-4b4e-a35a-5a93bb4d6634','49844875-cb8d-43b5-bf35-b8a2f39995bc','6b5a1c4f-9c98-4d3c-9707-80d7a1dffc25','2024-07-20 08:07:35',NULL),
('caeb12d5-6e0d-4113-a87f-5a0c1a77319b','b542c866-62fe-4db4-b175-ef9a9ca2ac4b','3d2db04a-6c2a-447a-82d5-046322dbd25e','2024-07-20 08:07:28',NULL);
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` char(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `teaser` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `article_category_id` char(36) NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `photo_caption` varchar(255) DEFAULT NULL,
  `author` char(36) NOT NULL,
  `pageview` bigint(20) NOT NULL DEFAULT 0,
  `status` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_article_category_id_index` (`article_category_id`),
  KEY `articles_author_index` (`author`),
  KEY `articles_created_by_index` (`created_by`),
  KEY `articles_updated_by_index` (`updated_by`),
  CONSTRAINT `articles_article_category_id_foreign` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`id`),
  CONSTRAINT `articles_author_foreign` FOREIGN KEY (`author`) REFERENCES `users` (`id`),
  CONSTRAINT `articles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `articles_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `articles` VALUES
('49844875-cb8d-43b5-bf35-b8a2f39995bc','content tiga edit',NULL,'content-tiga-edit','<p>content tiga edit</p>','content tiga teaser edit',NULL,'90b8bb56-ef9c-4769-a566-e149e9e3a072','2024/07/20_150735-805-1200x800.jpg',NULL,'ae95d36f-e6a3-4519-9c78-b6bd8cceb165',5,'1','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','2024-04-11 04:33:53',NULL,'2024-04-30 11:33:00',NULL,'2024/07/20/'),
('498448sz-cb8d-43b5-bf35-b8a2f39995bc','content tiga edit v2',NULL,'content-tiga-edit-v2','<p>content tiga edit v2</p>','content tiga teaser edit',NULL,'90b8bb56-ef9c-4769-a566-e149e9e3a072','',NULL,'ae95d36f-e6a3-4519-9c78-b6bd8cceb165',5,'1','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','2024-04-10 21:33:53',NULL,'2024-04-30 04:33:00',NULL,''),
('64c311b6-04a4-4208-b644-07e8ca7f88f4','test 123',NULL,'test-123','<p>test 123</p>','test 123',NULL,'90b8bb56-ef9c-4769-a566-e149e9e3a072','2024/07/20_150742-594-1200x800.jpg',NULL,'ae95d36f-e6a3-4519-9c78-b6bd8cceb165',0,'1','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','2024-05-12 06:58:39',NULL,'2024-05-12 16:00:00',NULL,'2024/07/20/'),
('64c311sz-04a4-4208-b644-07e8ca7f88f4','test 123',NULL,'test-123','<p>test 123</p>','test 123',NULL,'90b8bb56-ef9c-4769-a566-e149e9e3a072','2024/07/20_150742-594-1200x800.jpg',NULL,'ae95d36f-e6a3-4519-9c78-b6bd8cceb165',0,'1','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','2024-05-11 23:58:39',NULL,'2024-05-12 09:00:00',NULL,'2024/07/20/'),
('b542c866-62fe-4db4-b175-ef9a9ca2ac4b','content satu',NULL,'content-satu','<p>content satu</p>','content satu teaser',NULL,'90b8bb56-ef9c-4769-a566-e149e9e3a072','2024/07/20_150728-1040-1200x800.jpg',NULL,'ae95d36f-e6a3-4519-9c78-b6bd8cceb165',2,'1','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','2024-04-11 04:28:22',NULL,'2024-04-30 11:28:00',NULL,'2024/07/20/'),
('b542c8sz-62fe-4db4-b175-ef9a9ca2ac4b','content satu',NULL,'content-satu','<p>content satu</p>','content satu teaser',NULL,'90b8bb56-ef9c-4769-a566-e149e9e3a072','2024/07/20_150728-1040-1200x800.jpg',NULL,'ae95d36f-e6a3-4519-9c78-b6bd8cceb165',2,'1','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','ae95d36f-e6a3-4519-9c78-b6bd8cceb165','2024-04-10 21:28:22',NULL,'2024-04-30 04:28:00',NULL,'2024/07/20/');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `configs` (
  `id` char(36) NOT NULL,
  `navbar_logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `branding_name` varchar(255) DEFAULT NULL,
  `home_title` varchar(255) DEFAULT NULL COMMENT 'Home Page Title',
  `home_description` text DEFAULT NULL COMMENT 'Home Page Description',
  `products_title` varchar(255) DEFAULT NULL COMMENT 'Products Page Title',
  `products_description` text DEFAULT NULL COMMENT 'Products Page Description',
  `product_detail_title` varchar(255) DEFAULT NULL COMMENT 'Product Detail Page Title',
  `product_detail_description` text DEFAULT NULL COMMENT 'Product Detail Page Description',
  `about_title` varchar(255) DEFAULT NULL COMMENT 'About Page Title',
  `about_description` text DEFAULT NULL COMMENT 'About Page Description',
  `contact_title` varchar(255) DEFAULT NULL COMMENT 'Contact Page Title',
  `contact_description` text DEFAULT NULL COMMENT 'Contact Page Description',
  `articles_title` varchar(255) DEFAULT NULL COMMENT 'Articles Page Title',
  `articles_description` text DEFAULT NULL COMMENT 'Articles Page Description',
  `article_detail_title` varchar(255) DEFAULT NULL COMMENT 'Article Detail Page Title',
  `article_detail_description` text DEFAULT NULL COMMENT 'Article Detail Page Description',
  `color_header` varchar(50) DEFAULT NULL,
  `color_title` varchar(50) DEFAULT NULL,
  `color_label` varchar(50) DEFAULT NULL,
  `color_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `configs` VALUES
('1941c74f-efcf-4ba3-9208-40796d8959c7','065039-new.webp','2024-09-24 18:36:13',NULL,'2024/11/03/','Biji Plastik','Home Title','Home Description','Products Title','Products Description','Product Detail Title','Product Detail Description','About Page','About Description','Contact Title','Contact Description','Articles Title','Articles Description','Article Detail Title','Article Detail Description','#be9cf2','#904ef4','#6600ff','#020005');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` char(36) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `customers` VALUES
('0ea23253-ad21-4c07-a50f-6224169f1ee2','pt. customer edit','email@customers.com edit','018237123431 00','2024/07/20_150604-1040-1200x800.jpg','Rio Justicio Edit','jl. jalan edit','2024-04-15 10:33:06',NULL,'2024/07/20/'),
('9095c0af-0b49-49d4-b3e3-109ad5b2751e','PT. Justc Dev Indonesia','email@customers.com edit','08123123','2024/07/20_150611-805-1200x800.jpg','Rio Justicio','jl. okplqke','2024-07-20 05:14:35',NULL,'2024/07/20/'),
('b84a1b2e-bfe6-48e5-9096-cee766528c6f','Mulya Plastindo','user@bijiplastik.com','081234358731','2024/07/20_150617-231-1200x800.jpg','Rio Justicio Edit','jl gatsu','2024-07-20 05:15:04',NULL,'2024/07/20/');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `hero`
--

DROP TABLE IF EXISTS `hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hero` (
  `id` char(36) NOT NULL,
  `headline` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero`
--

LOCK TABLES `hero` WRITE;
/*!40000 ALTER TABLE `hero` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `hero` VALUES
('3b13506d-622b-42ef-bd68-cad0125ad186','Historical Plastic Seeds Edit','<p>Historical Plastic Seeds Desc Edit</p>','2024-05-06 11:32:38',NULL,NULL);
/*!40000 ALTER TABLE `hero` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `introduction`
--

DROP TABLE IF EXISTS `introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `introduction` (
  `id` char(36) NOT NULL,
  `description_introduction` text DEFAULT NULL,
  `description_about` text DEFAULT NULL,
  `description_products` text DEFAULT NULL,
  `description_product_category` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `label_introduction` text DEFAULT NULL,
  `label_about` text DEFAULT NULL,
  `label_products` text DEFAULT NULL,
  `label_product_category` text DEFAULT NULL,
  `title_customers` text DEFAULT NULL,
  `label_customers` text DEFAULT NULL,
  `description_customers` text DEFAULT NULL,
  `title_articles` text DEFAULT NULL,
  `label_articles` text DEFAULT NULL,
  `description_articles` text DEFAULT NULL,
  `title_introduction` text DEFAULT NULL,
  `title_about` text DEFAULT NULL,
  `title_products` text DEFAULT NULL,
  `title_product_category` text DEFAULT NULL,
  `title_recycles` text DEFAULT NULL,
  `label_recycles` text DEFAULT NULL,
  `description_recycles` text DEFAULT NULL,
  `title_services` text DEFAULT NULL,
  `label_services` text DEFAULT NULL,
  `description_services` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `introduction`
--

LOCK TABLES `introduction` WRITE;
/*!40000 ALTER TABLE `introduction` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `introduction` VALUES
('52f8316a-f1e5-4aa2-a2fc-a11f49e98c8e','<p>Indonesia menghasilkan sekitar 7,8 juta ton limbah plastik setiap tahun, namun sekitar 4,9 juta ton dari jumlah tersebut tidak dikelola dengan baik karena infrastruktur yang kurang memadai. Dari jumlah tersebut, sekitar 600.000 ton mencemari saluran air dan lautan. Dengan masalah ini, tingkat daur ulang limbah plastik hanya mencapai sekitar 10-15% dari total limbah plastik yang ada.</p>','<p>Mulya Plastindo, didirikan pada tahun 2020, memulai usahanya di bidang Fabrikasi, Daur Ulang Plastik, Perdagangan, dan Konstruksi. Mengikuti perkembangan industri. Perusahaan ini mengkhususkan diri dalam penyediaan bahan baku plastik daur ulang (PP, ABS, HIPS), serta menawarkan layanan daur ulang dan konstruksi plastik & cetakan.</p>','<p><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">Pada era modern ini, plastik telah menjadi komponen integral dalam berbagai aspek kehidupan sehari-hari dan industri. Ketika membahas material plastik, kita akan melihat tiga varietas yang khas dalam keluarga plastik termoplastik : </span><em style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">Polypropylene</em><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\"> (PP), </span><em style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">Acrylonitrile Butadiene Styrene</em><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\"> (ABS), dan </span><em style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">High Impact Polystyrene</em><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\"> (HIPS). Masing-masing memiliki karakteristik unik yang membuatnya ideal untuk aplikasi tertentu, mulai dari kemasan hingga produk konsumen dan otomotif.</span></p>','<p>fgb</p>','2024-03-29 02:40:06',NULL,'<p>Permasalahan limbah plastik di Indonesia merupakan isu yang sangat kompleks dan menantang.</p>','<p>Mulya Plastindo punya satu tujuan - mendaur ulang minimal 30% dari 7,8 juta ton limbah plastik setiap tahunnya dengan fokus kami saat inipada Polypropylene (PP), Acrylonitrile Butadiene Styrene (ABS), dan High Impact Polystyrene (HIPS).</p>','<p><strong style=\"color: rgb(142, 195, 179); background-color: rgb(255, 255, 255);\">Plastik dalam Era Modern: Eksplorasi Material Termoplastik PP, ABS, dan HIPS</strong></p>','<p>123123123</p>','<h1><strong style=\"background-color: rgb(255, 255, 255); color: rgb(142, 195, 179);\">Check our Customers</strong></h1>','<p><strong style=\"color: rgb(142, 195, 179); background-color: rgb(255, 255, 255);\">Check our Customers Label</strong></p>','<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry','<p><strong style=\"background-color: rgb(255, 255, 255); color: rgb(142, 195, 179);\">Check our Plastic News</strong></p>','<p><strong style=\"background-color: rgb(255, 255, 255); color: rgb(142, 195, 179);\">Check our Plastic News Label</strong></p>','<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','<h1><strong style=\"color: rgb(142, 195, 179); background-color: rgb(255, 255, 255);\">Pengantar</strong></h1>','<p>Tentang Mulya Plastindo</p>','<p><strong style=\"background-color: rgb(255, 255, 255); color: rgb(142, 195, 179);\">Check our Products</strong></p>',NULL,'<p>Proses Daur Ulang</p>','<p>Cara kami proses daur ulang</p>','<p>Biji Plastik daur ulang kami selalu terjamin kualitasnya dan kebersihannya. Hal tersebut merupakan bagian dari komitmen kami untuk selalu menyediakan produk terbaik dan berkontribusi pada pengelolaan lingkungan hidup.</p>','<p>Jasa Kami</p>','<p><br></p>','<p>Sebagai produsen plastik, kami juga menerima jasa penggilingan dan jasa proses dari berbagai kebutuhan konsumen.</p>');
/*!40000 ALTER TABLE `introduction` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2024_03_24_084434_create_hero_table',1),
(5,'2024_03_24_084447_create_introduction_table',1),
(6,'2024_03_24_084457_create_page_contact_table',1),
(7,'2024_03_24_084506_create_page_about_table',1),
(8,'2024_03_24_084517_create_customers_table',1),
(9,'2024_03_24_084523_create_plastic_type_table',1),
(10,'2024_03_24_084524_create_product_requests_table',1),
(11,'2024_03_24_084533_create_product_category_table',1),
(12,'2024_03_24_084534_create_products_table',1),
(13,'2024_03_24_084603_create_configs_table',1),
(14,'2024_03_24_084607_create_article_category_table',1),
(15,'2024_03_24_084608_create_articles_table',1),
(16,'2024_03_24_085132_create_permission_tables',1),
(17,'2024_04_04_182351_create_tags_table',2),
(18,'2024_04_04_182352_create_tags_table',3),
(19,'2024_04_04_182512_add_tag_id_to_articles_table',3),
(20,'2024_04_07_132409_create_recommendations_tables',4),
(21,'2024_04_07_192128_adjust_v2_in_articles_table',5),
(22,'2024_04_09_101249_create_article_tag_table',6),
(23,'2024_04_09_101250_create_article_tag_table',7),
(24,'2024_04_09_103134_drop_index_and_column_tag_id_articles_table',7),
(25,'2024_04_09_101251_create_article_tag_table',8),
(26,'2024_04_07_132410_create_recommendations_tables',9),
(27,'2024_04_09_101252_create_article_tag_table',10),
(28,'2024_04_09_101253_create_article_tag_table',11),
(29,'2024_04_09_101254_create_article_tag_table',12),
(30,'2024_04_07_132411_create_recommendations_tables',13),
(31,'2024_04_14_234755_add_field_deleted_at_in_articles_table',14),
(32,'2024_04_20_154529_create_personal_access_tokens_table',15),
(33,'2024_04_22_210114_create_permissions_table',16),
(34,'2024_04_22_210119_create_roles_table',17),
(35,'2024_04_23_183951_add_field_roles_in_users_table',18),
(36,'2024_04_23_183952_add_field_roles_in_users_table',19),
(37,'2024_03_24_085133_create_permission_tables',20),
(38,'2024_03_24_085134_create_permission_tables',21),
(39,'2024_03_24_085135_create_permission_tables',22),
(40,'2024_05_04_182342_add_field_label_in_introdutcion_table',23),
(41,'2024_05_05_220026_add_field_pageview_in_products_table',24),
(42,'2024_05_12_174914_add_field_best_seller_in_products_table',25),
(43,'2024_07_15_171827_add_field_address_notes_recipient_in_product_requests_table',26),
(44,'2024_07_16_143547_add_column_product_id_in_product_requests_table',27),
(45,'2024_07_16_143548_add_column_product_id_in_product_requests_table',28),
(46,'2024_07_16_145335_edit_column_plastic_type_id_in_product_requests_table',29),
(47,'2024_07_20_131955_add_column_path_in_page_about',30),
(48,'2024_07_20_132524_add_column_path_in_articles',31),
(49,'2024_07_20_134044_add_column_path_in_configs',32),
(50,'2024_07_20_140001_add_column_path_in_page_contact',33),
(51,'2024_07_20_140506_add_column_path_in_hero',34),
(52,'2024_07_20_140758_add_column_path_in_article_category',34),
(53,'2024_07_20_150431_add_column_path_in_customers',35),
(54,'2024_07_20_153644_add_column_path_in_products',36),
(55,'2024_07_20_200143_add_column_after_application_in_products',37),
(56,'2024_07_22_180445_change_column_type_in_products',37),
(57,'2024_09_24_161849_add_column_label_title_in_introduction',38),
(58,'2024_09_25_013245_add_column_branding_name_in_configs',39),
(59,'2024_10_02_162058_add_column_title_and_description_in_configs',40),
(60,'2024_10_02_171331_add_column_title_and_description_in_configs',41),
(61,'2024_11_02_144114_add_column_color_in_configs',42),
(62,'2024_11_02_175022_add_column_desc_in_page_about',43),
(63,'2024_11_03_045604_add_column_color_in_products',44),
(64,'2024_11_04_053320_add_column_code_in_article_category',45),
(65,'2024_11_20_131059_create_recycles_table',46),
(66,'2024_11_20_131850_add_column_path_in_recycles',47),
(67,'2024_11_20_152833_add_column_for_recycles_in_introduction',48),
(68,'2024_11_21_023353_add_column_for_services_in_introduction',49);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_uuid` char(36) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_uuid` char(36) NOT NULL,
  PRIMARY KEY (`permission_uuid`,`model_uuid`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_uuid`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_uuid_foreign` FOREIGN KEY (`permission_uuid`) REFERENCES `permissions` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_uuid` char(36) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_uuid` char(36) NOT NULL,
  PRIMARY KEY (`role_uuid`,`model_uuid`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_uuid`,`model_type`),
  CONSTRAINT `model_has_roles_role_uuid_foreign` FOREIGN KEY (`role_uuid`) REFERENCES `roles` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `model_has_roles` VALUES
('f48a0760-2bd7-4b00-9030-674e2b2abb85','App\\Models\\User','80d61c7b-d147-47f2-8cbc-3ced628c5095'),
('57cdb319-28cb-413f-acd3-3a7cf2d0d004','App\\Models\\User','849b88a0-8989-4caf-b53b-8dc107dbb8a8'),
('03a7dad9-03b4-49bb-9f2a-6c8496111616','App\\Models\\User','ae95d36f-e6a3-4519-9c78-b6bd8cceb165');
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `page_about`
--

DROP TABLE IF EXISTS `page_about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_about` (
  `id` char(36) NOT NULL,
  `vision` text DEFAULT NULL,
  `mission` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_about`
--

LOCK TABLES `page_about` WRITE;
/*!40000 ALTER TABLE `page_about` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `page_about` VALUES
('495fd9bf-7a2d-4811-a940-3371dd0774ca','<p>Menjadi perusahaan penyedia bahan baku biji plastik recycle terbaik di Indonesian.</p>','<p>Menjaga penuh kualitas produk dan kepuasan pelanggan.</p>','082121-samplevid.mp4,082121-1040-1200x800.jpg','2024-04-27 01:40:58',NULL,'2024/11/04/','<p>Maju Makmur Plastindo, didirikan pada tahun 1995 merupakan perusahaan penyedia bahan baku biji plastik recycle baik untuk industri manufaktur plastik maupun kebutuhan ekspor.</p><p>Dengan pengalaman dan jaringan yang luas, kami juga memberikan dukungan kepada para pelanggan setia kami dalam hal konsultasi bahan baku plastik yang dapat meningkatkan penghematan biaya produksi, serta dukungan pasokan yg konsisten dalam hal jumlah dan kualitas.</p><p>Adapun produk utama kami adalah ABS (Acrylonitrile Butadiene Styrene), HIPS (High Impact Polystyrene). Biji plastik daur ulang kami selalu terjamin kualitas dan kebersihannya.</p><p>Selain memproduksi biji plastik recycle, kami juga menerima jasa proses bijiplastik (PP, ABS, HIPS) dari berbagai sisa hasil industri dalam kondisi bersih, akan kami daur ulang menjadi biji plastik recycle untuk anda dengan harga terjangkau dan kualitas yang baik.</p>');
/*!40000 ALTER TABLE `page_about` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `page_contact`
--

DROP TABLE IF EXISTS `page_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_contact` (
  `id` char(36) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_contact`
--

LOCK TABLES `page_contact` WRITE;
/*!40000 ALTER TABLE `page_contact` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `page_contact` VALUES
('b0c30364-efcf-4680-9c6b-d26b2c7ed2c4','Mulya Plastindo','asd-servicesbijiplastik@gmail.com','+62 813-8900-0303','015618-805-1200x800.jpg','<p><br></p>','Jl. Kisaiman. II No.2, RT.002/RW.005, Koang Jaya, Kec. Karawaci, Kota Tangerang, Banten 15112','2024-04-14 19:32:29',NULL,'2024/09/25/');
/*!40000 ALTER TABLE `page_contact` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `permissions` VALUES
('035b44e5-d940-4b91-8ffa-448a71fc79b9','contact-us.store','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('0b328ab6-10ac-42ca-98e0-1dc4b0ca25d8','product-requests.index','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('0f7a10df-3e99-446d-a064-2d36034a37e2','users.update','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('0f98dd8e-8818-4826-ac78-3ac00261c79f','hero.update','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('106a4aaa-0817-4dd6-952e-9d115c2d041c','introduction.destroy','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('10b978a8-9993-41cc-8861-60ab0c375c11','introduction.create','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('110db197-6c64-48b9-b3d4-82d2123a5144','tags.update','web','2024-04-27 12:36:54','2024-04-27 12:36:54'),
('11c360fa-f8c1-480c-92df-ccc49d51577d','article.update','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('18bdd402-10e1-4ada-8135-2e239b2f04b5','hero.index','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('19f785d7-0549-4513-be4e-e7ec649e055c','introduction.index','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('1a325f9e-16e2-4bf7-8917-63b66c292d14','plastic-type.index','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('1ab672d0-b34d-4055-af80-ba5f2a0d2c1e','contact-us.edit','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('1b303e5c-8c89-49e7-8194-d9fd1f3be2e4','customers.update','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('1d95b425-49e5-445c-bdb4-7e5f71c0cb80','users.edit','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('25bfae80-2845-4f3a-baa2-52071a86d33a','contact-us.update','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('260e4d88-c6f5-4ba5-9c35-10c14e44d993','introduction.edit','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('2632058e-91a5-41d8-8700-fcbd69b0d368','contact-us.destroy','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('3011b59e-22b7-4169-b6f9-30cb0ddb0e6f','article.create','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('3619e13d-5a7e-4ae3-bcb6-e958b4f7ea85','contact-us.index','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('3692cf82-aaec-464d-8f52-da86d90b378f','article_category.create','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('39fa0b96-1791-4443-b86e-2a37df104d4a','tags.index','web','2024-04-27 12:36:54','2024-04-27 12:36:54'),
('3a0f5d00-6760-420b-8125-bcd1b8aa2dfb','article_category.store','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('3acf4fbe-653a-40d2-935c-0149e992e8bd','tags.store','web','2024-04-27 12:36:54','2024-04-27 12:36:54'),
('3e7ec7fb-3057-400b-a468-9752bbed1ee3','hero.show','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('3f545378-bf7f-4479-9819-badd5f7cea50','article.destroy','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('3fabaaeb-e7a7-46ab-b706-540ca0113de6','article.edit','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('3fb8c556-4e67-40e1-bc6d-94e678a3de26','customers.destroy','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('4a471dcf-a79c-49fb-9119-104571fe2449','customers.create','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('4bb8d246-734c-4f8c-a014-b3b0f0dab5fc','hero.edit','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('4cb1f391-9227-4469-b2dd-3d02e9223532','contact-us.show','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('5175d12b-0e25-4fae-b591-e3df83dcd12d','hero.destroy','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('5500486b-c11a-4e07-9a80-b3de14e70dbb','article.store','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('5b790767-c96c-429d-bd5b-7935b7b16f72','customers.show','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('5b7c4fb8-6f3b-46d1-ac2d-5f7820fff1ab','users.index','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('5bf89d28-6699-4757-aba9-eadac38a0ec9','article_category.destroy','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('5f334e1d-4745-4c9f-a9db-952c3f6e8994','plastic-type.destroy','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('5fa73b4a-fef5-4dde-a4ed-c03f81e03f89','product-requests.update','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('60e4ee86-9c75-4467-b5a4-86b3c29af032','product-requests.store','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('6438fd98-2fe9-4d23-855a-872fac7d72e6','tags.show','web','2024-04-27 12:36:54','2024-04-27 12:36:54'),
('6685a666-07c1-4fdd-a053-adc13b3f20e4','product-requests.create','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('688c8d2d-a6fe-43dd-9dbc-9206fe838982','auth.login','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('6f53148b-ef99-45f4-92af-a51cf37eaa01','users.store','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('80929543-7c9c-4c0f-baee-05f0d76aa906','article_category.update','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('82ca7ffd-8dc8-464a-8b78-9535f4e63d25','auth.dologin','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('88715c98-39bb-4ea1-ade1-6c00a200ea52','plastic-type.create','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('891616e5-a50e-475e-9cdd-6b838cb7a0b2','introduction.store','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('8e6ef636-cb5d-4c95-a00d-1d6520b5e629','plastic-type.show','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('8fad3a46-02bc-42fa-9d63-b5ad531112ca','hero.store','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('96db1c75-a8f9-4f3f-9455-aaaeb9123a50','dashboard','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('991688f5-2133-41ad-bbaf-c6dc32c9db3b','product-requests.edit','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('99c756a2-c496-4eec-8a44-a85a220cba73','article_category.index','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('9d297365-86ab-47a1-90ec-8b9e924f36df','article.index','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('9e852074-f83c-4bfe-982a-c010e6cfe116','introduction.show','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('a9573036-b2ed-490f-8f7b-4ae8523e6aad','all','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('aa4f6b30-a07b-4f01-8397-a24312226d82','auth.doregister','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('b0a7c55e-29c8-4190-855b-d65da444920f','users.show','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('ba9a9096-b2b1-4271-875c-756890e7c2ef','hero.create','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('bbb87afd-d26b-4baf-a962-12c18a32b034','contact-us.create','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('bc47ee59-b517-46ff-ae23-5750fac878ad','plastic-type.update','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('bd9d3f2f-feea-4555-89fe-a05eb26fa45e','tags.create','web','2024-04-27 12:36:54','2024-04-27 12:36:54'),
('c0d63250-bc9b-4ee3-8af7-88ca136dbee5','tags.destroy','web','2024-04-27 12:36:54','2024-04-27 12:36:54'),
('c357285f-85f9-48b5-b454-ef73796d5c52','plastic-type.store','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('c89833ec-3d23-4c15-b5b3-0541a630511c','product-requests.destroy','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('cfe90f45-ea7c-4507-ba78-fded6e79e55e','plastic-type.edit','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('d9037368-ef54-4195-9ad5-c0315da4c043','customers.edit','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('e6c06cf1-2c96-4724-95d1-9221a0ab5542','tags.edit','web','2024-04-27 12:36:54','2024-04-27 12:36:54'),
('ea6477e3-43aa-4f67-a84c-fe9f5cf2f1e9','auth.dologout','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('eabb29d8-fd5b-4307-b8c7-261e0dc38a7e','auth.register','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('ec52e091-40db-4eed-8ca1-096484ad845b','customers.store','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('ed47fd59-0548-49da-bd07-f7865ae5ccbe','article_category.show','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('eeee2aae-1c4a-4597-b9d4-8bde84fd5ba5','product-requests.show','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('f497e600-18e6-4c98-b614-99ac4aeffc97','article_category.edit','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('f629df58-ef74-4dfb-a46d-71487f903a4a','article.show','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('f7c206ef-22aa-487d-b9a0-1beff23dce79','customers.index','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('f87ddc89-4d42-4331-98f0-96b7b7370154','introduction.update','web','2024-04-27 12:36:52','2024-04-27 12:36:52'),
('fdeebb1f-59f7-497e-8b91-9f4e52668561','users.destroy','web','2024-04-27 12:36:53','2024-04-27 12:36:53'),
('ffd1eb43-490b-4fa0-b7f6-3a1936343a92','users.create','web','2024-04-27 12:36:53','2024-04-27 12:36:53');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `plastic_types`
--

DROP TABLE IF EXISTS `plastic_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plastic_types` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plastic_types`
--

LOCK TABLES `plastic_types` WRITE;
/*!40000 ALTER TABLE `plastic_types` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plastic_types` VALUES
('bc2f61b4-16ea-4733-b93f-9fa3abeb47c9','asdqwe amxkcma','asdqwe-amxkcma','2024-04-20 10:33:48',NULL),
('d68748b5-a7e8-4cce-b491-57167bc631ae','Acrylonitrile Butadiene Styrene','acrylonitrile-butadiene-styrene','2024-04-20 10:16:26',NULL);
/*!40000 ALTER TABLE `plastic_types` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` char(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `product_requests`
--

DROP TABLE IF EXISTS `product_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_requests` (
  `id` char(36) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `plastic_type_id` char(36) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_requests_plastic_type_id_index` (`plastic_type_id`),
  KEY `product_requests_status_index` (`status`),
  KEY `product_requests_product_id_index` (`product_id`),
  CONSTRAINT `product_requests_plastic_type_id_foreign` FOREIGN KEY (`plastic_type_id`) REFERENCES `plastic_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_requests`
--

LOCK TABLES `product_requests` WRITE;
/*!40000 ALTER TABLE `product_requests` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `product_requests` VALUES
('087e381a-8556-44fc-a2b1-8edc0a252ec0','Rio Justiciof','riojusticiof@gmail.com','09912831212',NULL,'Justc Dev',1,'PENDING','2024-10-20 20:20:02',NULL,NULL,NULL,NULL,'0af7ebf7-2dfc-405d-9196-4100da2681f0'),
('0a0e32c8-cadb-48f0-87c8-7ff2a207af3b','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:02:52',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('0aba7083-6569-433b-bd41-2de6897b41f4','Rio','riojusticiof@gmail.com','01289391283',NULL,'Just Dev',1,'PENDING','2024-10-02 06:50:34',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('0b43bcd0-a957-4e6d-83c0-27bde44c1880','Rio Justicio','riojusticiof@gmail.com','09182398123',NULL,'Justc Dev',1,'PENDING','2024-10-20 21:31:48',NULL,NULL,NULL,NULL,'0af7ebf7-2dfc-405d-9196-4100da2681f0'),
('24436afe-195e-44e3-8328-c64aa0035682','Rio J','riojusticiof@gmail.com','091283912381',NULL,'Jusqwd',1,'PENDING','2024-10-02 19:53:01',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('38fa1ac4-a2f2-42f0-932d-66fbd13c0eb5','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:02:51',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('5bdc7b9f-a1c7-445b-8259-f455e14c3ad1','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:00:03',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('6110f150-4609-4fed-8304-e609e41b51a1','Rio','riojusticiof@gmail.com','098128371231',NULL,'Justc Dev',1,'PENDING','2024-10-02 06:46:23',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('76b56303-be31-4c67-92d4-6be9c3efeab7','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:02:52',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('79452d28-e5e4-48a1-a396-30d44eaa0e01','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:02:53',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('94023a7b-4964-49cf-8109-bea3cce65dfb','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:02:20',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('ba6dcce6-5949-40f5-90ea-9bdd5ea0bb4f','Rio Justicio','riojusticiof@gmail.com','08123948239',NULL,'Justc Dev',1,'PENDING','2024-10-20 20:18:30',NULL,NULL,NULL,NULL,'0af7ebf7-2dfc-405d-9196-4100da2681f0'),
('bd8e2901-71b3-449a-a636-8ea4933bc856','Rio','riojusticiof@gmail.com','091283981923',NULL,'Justc Dev',1,'PENDING','2024-10-02 06:39:08',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('c0091a5e-b0af-48a4-a1f9-be6bb4e8f4c3','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:02:50',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('c1dbe11d-73fa-4c49-b072-5e4df8f10a3c','Rio Justicio','riojusticiof@gmail.com','08123948239',NULL,'Justc Dev',1,'PENDING','2024-10-20 21:58:00',NULL,NULL,NULL,NULL,'0af7ebf7-2dfc-405d-9196-4100da2681f0'),
('c6ea87cb-570a-43d5-8dd2-723265141518','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:02:53',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('cee87bc7-2430-4e5a-8167-a9c8bb6bc337','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:02:20',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('cf58f8f3-0fc1-418d-97c3-e13e577154c4','Rio','riojusticiof@gmail.com','01928391283123',NULL,'Coba',1,'PENDING','2024-10-02 19:48:57',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('d1f16338-1e1f-4adc-a30d-e4f17df81135','Rio Justicio','riojusticiof@gmail.com','081297440058',NULL,'Justc Dev',1,'PENDING','2024-10-02 20:18:32',NULL,NULL,NULL,NULL,'b8c99b25-2cab-415d-bee6-e5819b1272b9'),
('de97befc-9895-40b3-a7cc-0d44ba00adb0','Produc','produ@sks.com','012938123',NULL,'PT PD',102,'PENDING','2024-07-16 07:55:59',NULL,NULL,NULL,NULL,'0af7ebf7-2dfc-405d-9196-4100da2681f0'),
('e1ca0e2a-1bdf-4087-a0ba-ecfb4782a307','Rio','riojusticiof@gmail.com','09192389182312',NULL,'Justc Dev',1,'PENDING','2024-10-02 06:48:53',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c'),
('fefc322f-e24e-4f67-99a6-64c1635795c1','Rio','jusqkowdkoqw@gma.com','-9182391823123',NULL,'justc dev',1,'PENDING','2024-10-02 20:02:52',NULL,NULL,NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c');
/*!40000 ALTER TABLE `product_requests` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` char(36) NOT NULL,
  `product_category_id` char(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `suitable` varchar(255) DEFAULT NULL,
  `mfi` varchar(255) DEFAULT NULL,
  `photo` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pageview` bigint(20) NOT NULL DEFAULT 0,
  `best_seller` tinyint(4) NOT NULL DEFAULT 0,
  `path` varchar(100) DEFAULT NULL,
  `after_application_path` varchar(100) DEFAULT NULL,
  `after_application` text DEFAULT NULL,
  `after_application_description` text DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_category_id_index` (`product_category_id`),
  CONSTRAINT `products_product_category_id_index` FOREIGN KEY (`product_category_id`) REFERENCES `article_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `products` VALUES
('0af7ebf7-2dfc-405d-9196-4100da2681f0','90b8bb56-ef9c-4769-a566-e149e9e3a072','PP White v2','pp-white-v2','<p>desc</p>','Medium Cycle Time Injection','3.5 - 7-5','[\"085828-109-1200x800.jpg\",\"085828-184-1200x800.jpg\"]','2024-05-06 07:21:52',NULL,0,0,'2024/07/23/','2024/07/23/','[\"085828-19-1200x800.jpg\",\"085828-95-1200x800.jpg\"]',NULL,'White'),
('0af7ebsz-2dfc-405d-9196-4100da2681f0','90b8bb56-ef9c-4769-a566-e149e9e3a072','PP White v2','pp-white-v2','<p>desc</p>','Medium Cycle Time Injection','3.5 - 7-5','[\"085828-109-1200x800.jpg\",\"085828-184-1200x800.jpg\"]','2024-05-06 00:21:52',NULL,0,0,'2024/07/23/','2024/07/23/','[\"085828-19-1200x800.jpg\",\"085828-95-1200x800.jpg\"]',NULL,'White'),
('9b068da7-2722-4eba-96be-a71521b53647','16e37591-b42e-458b-ab32-fec35c8e81b7','PP Black','pp-black','<p>PP Black Desc</p>','Medium Cycle Time Injection','2.5-12.5','[\"085841-1040-1200x800.jpg\",\"085841-109-1200x800.jpg\"]','2024-07-23 01:43:39',NULL,0,1,'2024/07/23/','2024/07/23/','[\"085841-640-1200x800.jpg\",\"085841-19-1200x800.jpg\"]',NULL,'Black'),
('9b068dsz-2722-4eba-96be-a71521b53647','16e37591-b42e-458b-ab32-fec35c8e81b7','PP Black','pp-black','<p>PP Black Desc</p>','Medium Cycle Time Injection','2.5-12.5','[\"085841-1040-1200x800.jpg\",\"085841-109-1200x800.jpg\"]','2024-07-22 18:43:39',NULL,0,1,'2024/07/23/','2024/07/23/','[\"085841-640-1200x800.jpg\",\"085841-19-1200x800.jpg\"]',NULL,'Black'),
('dbf6820d-e8cd-407b-a115-ee2686c7226c','90b8bb56-ef9c-4769-a566-e149e9e3a072','PP White','pp-white','<p>White color Homopolymer PP made from woven bag. Has a Medium Izod, perfect for bright color products..</p>','Medium Cycle Time Injection','3.5 - 7-5','[\"085752-640-1200x800.jpg\",\"085752-805-1200x800.jpg\"]','2024-05-05 17:41:10',NULL,1,0,'2024/07/23/','2024/07/23/','[\"085752-109-1200x800.jpg\",\"085752-184-1200x800.jpg\"]',NULL,'White'),
('dbf682sz-e8cd-407b-a115-ee2686c7226c','90b8bb56-ef9c-4769-a566-e149e9e3a072','PP White','pp-white','<p>White color Homopolymer PP made from woven bag. Has a Medium Izod, perfect for bright color products..</p>','Medium Cycle Time Injection','3.5 - 7-5','[\"085752-640-1200x800.jpg\",\"085752-805-1200x800.jpg\"]','2024-05-05 10:41:10',NULL,1,0,'2024/07/23/','2024/07/23/','[\"085752-109-1200x800.jpg\",\"085752-184-1200x800.jpg\"]',NULL,'White');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendations` (
  `id` char(36) NOT NULL,
  `article_id` char(36) DEFAULT NULL,
  `recommendation_article_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `recommendation_product_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recommendations_article_id_index` (`article_id`),
  KEY `recommendations_product_id_index` (`product_id`),
  CONSTRAINT `recommendations_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `recommendations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendations`
--

LOCK TABLES `recommendations` WRITE;
/*!40000 ALTER TABLE `recommendations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `recommendations` VALUES
('11567f36-f6b4-43de-82f3-f30c6bcf75d1','64c311b6-04a4-4208-b644-07e8ca7f88f4','49844875-cb8d-43b5-bf35-b8a2f39995bc',NULL,NULL,'2024-07-20 08:07:42',NULL),
('1522c8d0-68f3-4c58-806b-e7157b9eb7f2',NULL,'49844875-cb8d-43b5-bf35-b8a2f39995bc','0af7ebf7-2dfc-405d-9196-4100da2681f0',NULL,'2024-11-02 22:03:34',NULL),
('35682ee3-e08b-4f67-95b5-4ffeac4f4a87','49844875-cb8d-43b5-bf35-b8a2f39995bc','49844875-cb8d-43b5-bf35-b8a2f39995bc',NULL,NULL,'2024-07-20 08:07:35',NULL),
('45e7f492-82d1-42aa-93fd-33d79ba5c3f6','49844875-cb8d-43b5-bf35-b8a2f39995bc',NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c','2024-07-20 08:07:35',NULL),
('593f883c-85a8-4d5b-822c-b52acd71471c',NULL,NULL,'0af7ebf7-2dfc-405d-9196-4100da2681f0','dbf6820d-e8cd-407b-a115-ee2686c7226c','2024-11-02 22:03:34',NULL),
('73081e58-3e13-4948-a987-5d14fd8b9667','49844875-cb8d-43b5-bf35-b8a2f39995bc',NULL,NULL,'0af7ebf7-2dfc-405d-9196-4100da2681f0','2024-07-20 08:07:35',NULL),
('899b6bb4-1390-43b8-bddf-07b193437996',NULL,'b542c866-62fe-4db4-b175-ef9a9ca2ac4b','dbf6820d-e8cd-407b-a115-ee2686c7226c',NULL,'2024-11-02 22:03:27',NULL),
('aab06625-14a2-4714-966e-20e1cde29dcb','64c311b6-04a4-4208-b644-07e8ca7f88f4','b542c866-62fe-4db4-b175-ef9a9ca2ac4b',NULL,NULL,'2024-07-20 08:07:42',NULL),
('b8f6e695-86ef-4708-b840-c735cde6005d','64c311b6-04a4-4208-b644-07e8ca7f88f4',NULL,NULL,'0af7ebf7-2dfc-405d-9196-4100da2681f0','2024-07-20 08:07:42',NULL),
('bc4d2588-d609-41a7-9dd1-fa87b587dccd','49844875-cb8d-43b5-bf35-b8a2f39995bc','b542c866-62fe-4db4-b175-ef9a9ca2ac4b',NULL,NULL,'2024-07-20 08:07:35',NULL),
('e5b10d04-386b-468f-be17-e42d4c0762fd','64c311b6-04a4-4208-b644-07e8ca7f88f4',NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c','2024-07-20 08:07:42',NULL),
('ef38a175-280d-4cad-a067-af313f3d4086',NULL,NULL,'dbf6820d-e8cd-407b-a115-ee2686c7226c','0af7ebf7-2dfc-405d-9196-4100da2681f0','2024-11-02 22:03:27',NULL),
('f7d45c00-8a3f-4f18-bba9-0dcde8f3ad44',NULL,'b542c866-62fe-4db4-b175-ef9a9ca2ac4b','9b068da7-2722-4eba-96be-a71521b53647',NULL,'2024-11-02 22:03:18',NULL),
('fbad3149-d998-48bf-bd9c-a5204c970350',NULL,NULL,'9b068da7-2722-4eba-96be-a71521b53647','dbf6820d-e8cd-407b-a115-ee2686c7226c','2024-11-02 22:03:18',NULL);
/*!40000 ALTER TABLE `recommendations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `recycles`
--

DROP TABLE IF EXISTS `recycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recycles` (
  `id` char(36) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recycles`
--

LOCK TABLES `recycles` WRITE;
/*!40000 ALTER TABLE `recycles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `recycles` VALUES
('269683c6-b96f-4420-bd63-b24e8d3b3fb0','<p>Pengolahan Bahan Baku</p>','<p>Menggunakan mesin pencacah</p>','155128-95-1200x800.jpg',2,'2024-11-20 08:43:56',NULL,'2024/11/20/'),
('9a11162a-da51-4b1a-9254-5a4fdb5505f9','<p>Test Title Edit</p>','<p>Test Description Edit</p>','155117-231-1200x800.jpg',1,'2024-11-20 06:47:57',NULL,'2024/11/20/');
/*!40000 ALTER TABLE `recycles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_uuid` char(36) NOT NULL,
  `role_uuid` char(36) NOT NULL,
  KEY `role_has_permissions_permission_uuid_foreign` (`permission_uuid`),
  KEY `role_has_permissions_role_uuid_foreign` (`role_uuid`),
  CONSTRAINT `role_has_permissions_permission_uuid_foreign` FOREIGN KEY (`permission_uuid`) REFERENCES `permissions` (`uuid`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_uuid_foreign` FOREIGN KEY (`role_uuid`) REFERENCES `roles` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `role_has_permissions` VALUES
('a9573036-b2ed-490f-8f7b-4ae8523e6aad','03a7dad9-03b4-49bb-9f2a-6c8496111616'),
('688c8d2d-a6fe-43dd-9dbc-9206fe838982','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('82ca7ffd-8dc8-464a-8b78-9535f4e63d25','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('eabb29d8-fd5b-4307-b8c7-261e0dc38a7e','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('aa4f6b30-a07b-4f01-8397-a24312226d82','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('ea6477e3-43aa-4f67-a84c-fe9f5cf2f1e9','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('19f785d7-0549-4513-be4e-e7ec649e055c','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('10b978a8-9993-41cc-8861-60ab0c375c11','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('891616e5-a50e-475e-9cdd-6b838cb7a0b2','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('9e852074-f83c-4bfe-982a-c010e6cfe116','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('260e4d88-c6f5-4ba5-9c35-10c14e44d993','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('f87ddc89-4d42-4331-98f0-96b7b7370154','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('106a4aaa-0817-4dd6-952e-9d115c2d041c','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('3619e13d-5a7e-4ae3-bcb6-e958b4f7ea85','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('bbb87afd-d26b-4baf-a962-12c18a32b034','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('035b44e5-d940-4b91-8ffa-448a71fc79b9','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('4cb1f391-9227-4469-b2dd-3d02e9223532','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('1ab672d0-b34d-4055-af80-ba5f2a0d2c1e','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('25bfae80-2845-4f3a-baa2-52071a86d33a','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('2632058e-91a5-41d8-8700-fcbd69b0d368','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('f7c206ef-22aa-487d-b9a0-1beff23dce79','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('4a471dcf-a79c-49fb-9119-104571fe2449','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('ec52e091-40db-4eed-8ca1-096484ad845b','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('5b790767-c96c-429d-bd5b-7935b7b16f72','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('d9037368-ef54-4195-9ad5-c0315da4c043','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('1b303e5c-8c89-49e7-8194-d9fd1f3be2e4','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('3fb8c556-4e67-40e1-bc6d-94e678a3de26','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('0b328ab6-10ac-42ca-98e0-1dc4b0ca25d8','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('6685a666-07c1-4fdd-a053-adc13b3f20e4','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('60e4ee86-9c75-4467-b5a4-86b3c29af032','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('eeee2aae-1c4a-4597-b9d4-8bde84fd5ba5','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('991688f5-2133-41ad-bbaf-c6dc32c9db3b','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('5fa73b4a-fef5-4dde-a4ed-c03f81e03f89','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('c89833ec-3d23-4c15-b5b3-0541a630511c','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('1a325f9e-16e2-4bf7-8917-63b66c292d14','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('88715c98-39bb-4ea1-ade1-6c00a200ea52','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('c357285f-85f9-48b5-b454-ef73796d5c52','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('8e6ef636-cb5d-4c95-a00d-1d6520b5e629','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('cfe90f45-ea7c-4507-ba78-fded6e79e55e','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('bc47ee59-b517-46ff-ae23-5750fac878ad','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('5f334e1d-4745-4c9f-a9db-952c3f6e8994','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('18bdd402-10e1-4ada-8135-2e239b2f04b5','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('ba9a9096-b2b1-4271-875c-756890e7c2ef','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('8fad3a46-02bc-42fa-9d63-b5ad531112ca','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('3e7ec7fb-3057-400b-a468-9752bbed1ee3','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('4bb8d246-734c-4f8c-a014-b3b0f0dab5fc','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('0f98dd8e-8818-4826-ac78-3ac00261c79f','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('5175d12b-0e25-4fae-b591-e3df83dcd12d','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('9d297365-86ab-47a1-90ec-8b9e924f36df','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('3011b59e-22b7-4169-b6f9-30cb0ddb0e6f','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('5500486b-c11a-4e07-9a80-b3de14e70dbb','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('f629df58-ef74-4dfb-a46d-71487f903a4a','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('3fabaaeb-e7a7-46ab-b706-540ca0113de6','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('11c360fa-f8c1-480c-92df-ccc49d51577d','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('3f545378-bf7f-4479-9819-badd5f7cea50','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('99c756a2-c496-4eec-8a44-a85a220cba73','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('3692cf82-aaec-464d-8f52-da86d90b378f','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('3a0f5d00-6760-420b-8125-bcd1b8aa2dfb','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('ed47fd59-0548-49da-bd07-f7865ae5ccbe','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('f497e600-18e6-4c98-b614-99ac4aeffc97','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('80929543-7c9c-4c0f-baee-05f0d76aa906','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('5bf89d28-6699-4757-aba9-eadac38a0ec9','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('39fa0b96-1791-4443-b86e-2a37df104d4a','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('bd9d3f2f-feea-4555-89fe-a05eb26fa45e','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('3acf4fbe-653a-40d2-935c-0149e992e8bd','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('6438fd98-2fe9-4d23-855a-872fac7d72e6','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('e6c06cf1-2c96-4724-95d1-9221a0ab5542','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('110db197-6c64-48b9-b3d4-82d2123a5144','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('c0d63250-bc9b-4ee3-8af7-88ca136dbee5','57cdb319-28cb-413f-acd3-3a7cf2d0d004'),
('0b328ab6-10ac-42ca-98e0-1dc4b0ca25d8','f48a0760-2bd7-4b00-9030-674e2b2abb85'),
('6685a666-07c1-4fdd-a053-adc13b3f20e4','f48a0760-2bd7-4b00-9030-674e2b2abb85'),
('60e4ee86-9c75-4467-b5a4-86b3c29af032','f48a0760-2bd7-4b00-9030-674e2b2abb85'),
('eeee2aae-1c4a-4597-b9d4-8bde84fd5ba5','f48a0760-2bd7-4b00-9030-674e2b2abb85'),
('991688f5-2133-41ad-bbaf-c6dc32c9db3b','f48a0760-2bd7-4b00-9030-674e2b2abb85'),
('5fa73b4a-fef5-4dde-a4ed-c03f81e03f89','f48a0760-2bd7-4b00-9030-674e2b2abb85'),
('c89833ec-3d23-4c15-b5b3-0541a630511c','f48a0760-2bd7-4b00-9030-674e2b2abb85');
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `roles` VALUES
('03a7dad9-03b4-49bb-9f2a-6c8496111616','admin','web','2024-04-27 12:38:07','2024-04-27 12:38:07'),
('57cdb319-28cb-413f-acd3-3a7cf2d0d004','user','web','2024-04-27 12:38:07','2024-04-27 12:38:07'),
('f48a0760-2bd7-4b00-9030-674e2b2abb85','sales','web','2024-07-16 08:51:56','2024-07-16 08:51:56');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`),
  CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tags` VALUES
('0bf3194f-517a-4102-b7b6-7044cd0dab2b','Polypropylene','polypropylene','2024-05-05 17:16:14',NULL),
('3d2db04a-6c2a-447a-82d5-046322dbd25e','Nah kan bisa','nah-kan-bisa','2024-04-06 12:43:41','2024-04-06 12:43:41'),
('6b5a1c4f-9c98-4d3c-9707-80d7a1dffc25','edit','edit','2024-04-14 15:57:30','2024-04-14 15:57:30'),
('7dfc38ee-a41a-4abd-ac27-b45ec27f9ac9','Plastik','plastik','2024-04-06 12:27:52',NULL),
('804d269e-eaa5-4370-bbf1-7ba6aa26045f','Polypropylene','polypropylene','2024-05-05 17:16:27',NULL),
('92421597-1777-4be6-9f68-0af8f72c3806','Biji','biji','2024-04-06 12:27:45',NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
('80d61c7b-d147-47f2-8cbc-3ced628c5095','Sales','sales@bijiplastik.com','01281231252',NULL,'$2y$12$yu5CJUWxJq89DDQvM7G0ku1sDuz7FFXg9GufLjRvpO5pgeBWHdz9C',NULL,'2024-07-16 08:53:33','2024-07-16 08:53:33'),
('849b88a0-8989-4caf-b53b-8dc107dbb8a8','User','user@bijiplastik.com','08123912312',NULL,'$2y$12$iNs9BHPulFaPOnWU/8YEg.SdRLRonbcbJPniMpFTnbB9cnup8pjY6',NULL,'2024-04-27 12:41:00','2024-07-16 09:07:45'),
('ae95d36f-e6a3-4519-9c78-b6bd8cceb165','Rio Justicio','riojusticiof@gmail.com','0812391234512','2024-03-25 10:19:24','$2y$12$ZuE.9C95vfl8ct77Ve/noODSQrNXthoFbhndTi4YWrWiJeEe2Nsn2','HU30OQgtj9','2024-03-25 10:19:24','2024-08-09 08:25:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'plasticseeds'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-04-21 14:43:57
