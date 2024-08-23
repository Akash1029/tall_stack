-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for renatocostantini
CREATE DATABASE IF NOT EXISTS `renatocostantini` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `renatocostantini`;

-- Dumping structure for table renatocostantini.active_tasks
CREATE TABLE IF NOT EXISTS `active_tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `consultant_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `result` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `executed` tinyint(1) NOT NULL DEFAULT '0',
  `notify_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_date` datetime NOT NULL,
  `belongs_to` bigint unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `active_tasks_task_id_foreign` (`task_id`),
  KEY `active_tasks_client_id_foreign` (`client_id`),
  KEY `active_tasks_consultant_id_foreign` (`consultant_id`),
  KEY `active_tasks_belongs_to_foreign` (`belongs_to`),
  CONSTRAINT `active_tasks_belongs_to_foreign` FOREIGN KEY (`belongs_to`) REFERENCES `active_tasks` (`id`),
  CONSTRAINT `active_tasks_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `active_tasks_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `active_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.active_tasks: ~6 rows (approximately)
DELETE FROM `active_tasks`;
INSERT INTO `active_tasks` (`id`, `task_id`, `client_id`, `consultant_id`, `description`, `result`, `executed`, `notify_deleted`, `expiry_date`, `belongs_to`, `order`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 1, 'TEST', '', 0, 0, '1970-01-01 00:00:00', NULL, 0, '2023-11-06 17:37:50', '2023-11-06 17:37:50'),
	(2, 3, 3, 1, 'TEST', '', 0, 0, '1970-01-01 00:00:00', NULL, 0, '2023-11-06 17:39:22', '2023-11-06 17:39:22'),
	(3, 3, 2, 1, 'TEST', '', 0, 0, '1970-01-01 00:00:00', NULL, 0, '2023-11-20 17:19:10', '2023-11-20 17:19:10'),
	(4, 3, 3, 1, 'TEST', '', 0, 0, '1970-01-01 00:00:00', NULL, 0, '2024-01-26 06:52:03', '2024-01-26 06:52:03'),
	(5, 1, 5, 1, 'TEST', '', 0, 0, '1970-01-01 00:00:00', NULL, 0, '2024-01-26 06:52:53', '2024-01-26 06:52:53'),
	(6, 3, 3, 1, 'TEST', '', 0, 0, '1970-01-01 00:00:00', NULL, 0, '2024-01-30 20:49:47', '2024-01-30 20:49:47');

-- Dumping structure for table renatocostantini.appointments
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `allDay` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.appointments: ~5 rows (approximately)
DELETE FROM `appointments`;
INSERT INTO `appointments` (`id`, `user_id`, `client_id`, `title`, `start`, `end`, `allDay`, `description`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 'hdawiu', '2023-11-08 00:00:00', '2023-11-09 00:00:00', 1, NULL, '2023-11-06 17:45:01', '2023-11-06 17:45:01'),
	(2, 2, 0, 'test', '2023-11-27 00:00:00', '2023-11-28 00:00:00', 1, 'sfdasfdf', '2023-12-25 07:38:05', '2023-12-25 07:38:05'),
	(3, 2, 0, 'test', '2023-12-05 00:00:00', '2023-12-06 00:00:00', 1, 'test', '2023-12-25 08:28:16', '2023-12-25 08:28:16'),
	(5, 2, 0, 'test', '2023-12-06 00:00:00', '2023-12-07 00:00:00', 1, 'test', '2023-12-25 08:36:13', '2023-12-25 08:36:13'),
	(6, 3, 0, 'sds', '2024-01-09 00:00:00', '2024-01-10 00:00:00', 1, 'dsdsd', '2024-01-06 05:04:13', '2024-01-06 05:04:13');

-- Dumping structure for table renatocostantini.certificates
CREATE TABLE IF NOT EXISTS `certificates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_client_id_foreign` (`client_id`),
  CONSTRAINT `certificates_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.certificates: ~2 rows (approximately)
DELETE FROM `certificates`;
INSERT INTO `certificates` (`id`, `client_id`, `release_date`, `expiry`, `created_at`, `updated_at`) VALUES
	(1, NULL, '2023-11-06', '2023-12-31', '2023-11-06 17:37:50', '2023-11-06 17:37:50'),
	(2, NULL, '2015-08-20', '2024-12-31', '2024-01-26 06:52:53', '2024-01-26 06:52:53');

-- Dumping structure for table renatocostantini.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `fis_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partita_iva` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourceBis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cap` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fidelity_points` int NOT NULL DEFAULT '0',
  `parent_id` bigint unsigned DEFAULT NULL,
  `consultant_id` bigint unsigned DEFAULT NULL,
  `insurance_id` bigint unsigned DEFAULT NULL,
  `certificate_id` bigint unsigned DEFAULT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_status_id` bigint unsigned DEFAULT NULL,
  `extra_info_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_fis_code_unique` (`fis_code`),
  KEY `clients_consultant_id_foreign` (`consultant_id`),
  CONSTRAINT `clients_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.clients: ~5 rows (approximately)
DELETE FROM `clients`;
INSERT INTO `clients` (`id`, `name`, `surname`, `birth_place`, `birth_date`, `fis_code`, `partita_iva`, `source`, `sourceBis`, `email`, `phone`, `street`, `gender`, `work`, `city`, `cap`, `prov`, `fidelity_points`, `parent_id`, `consultant_id`, `insurance_id`, `certificate_id`, `profile_pic`, `customer_status_id`, `extra_info_id`, `created_at`, `updated_at`) VALUES
	(1, 'Incidunt at minim o', 'Aliqua Magni sit as', 'Commodo nostrum volu', '2022-08-18', 'Voluptate fugiat rep', NULL, 'Genitore', NULL, 'Necessitatibus lauda', 'Enim reiciendis id d', 'Sunt voluptas volup', NULL, NULL, 'Quasi facilis dolore', 'Dolor ut quidem dele', 'RM', 0, NULL, NULL, NULL, NULL, 'http://localhost/default-user-avatar.jpg', 1, NULL, '2023-07-04 09:02:17', '2023-07-04 09:02:17'),
	(2, 'Portia Mack', 'Sosa', 'Molestias odio ipsum', '2004-11-29', 'Natus enim ad qui te', 'Voluptate exercitati', '5', '1', 'kihis@mailinator.com', '+1 (519) 527-7235', 'Eos quas amet null', 'm', 'Unde irure explicabo', 'Architecto assumenda', 'Labore eu ad reicien', 'PD', 6, 1, 1, NULL, NULL, 'http://localhost/default-user-avatar.jpg', 1, NULL, '2023-07-04 09:02:17', '2023-07-04 09:02:17'),
	(3, 'Marco', 'Mastro', 'Moncalieri', '1988-07-17', 'MSTMRC88L17F335T', NULL, '1', '1', 'marcomastro@me.com', '3929101010', 'Corso Valentino 149', 'm', 'studente-universita', 'Casale Monferrato', '15033', 'AL', 3, NULL, 1, 1, 1, 'https://renatocostantini.lucabox.it/storage/profile_pics/6549246e54fca.jpg', NULL, 1, '2023-11-06 17:37:50', '2023-11-06 17:37:50'),
	(4, 'Dolorem labore itaqu', 'Minima quidem totam', 'Nulla dolor vero ver', '1998-03-25', 'Dolorem sed sunt id', NULL, 'Genitore', NULL, 'bykapajexa@mailinator.com', '+1 (799) 188-3456', 'Id nostrud officia t', NULL, NULL, 'Ex nisi minim atque', 'Quo officiis sit qu', 'RM', 0, NULL, NULL, NULL, NULL, 'https://renatocostantini.lucabox.it/default-user-avatar.jpg', 1, NULL, '2024-01-26 06:52:53', '2024-01-26 06:52:53'),
	(5, 'Luca Bosso', 'Alston', 'Aspernatur ad illo d', '2010-05-30', 'LSTJ J10G30undefinedundefined', NULL, '4', '2', 'luca@obly.it', '3345805178', 'Via Roma 55', 'f', 'designer', 'San Giorgio Monferrato', '15020', 'AL', 32, 4, 1, 2, 2, 'https://renatocostantini.lucabox.it/default-user-avatar.jpg', 1, 2, '2024-01-26 06:52:53', '2024-01-26 06:52:53');

-- Dumping structure for table renatocostantini.customer_statuses
CREATE TABLE IF NOT EXISTS `customer_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_statuses_client_id_foreign` (`client_id`),
  CONSTRAINT `customer_statuses_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.customer_statuses: ~3 rows (approximately)
DELETE FROM `customer_statuses`;
INSERT INTO `customer_statuses` (`id`, `client_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Non iscritto', NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, NULL, 'Proposta effettuata', NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, NULL, 'Iscritto', NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.expenses
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `payment_type` bigint unsigned NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `is_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.expenses: ~0 rows (approximately)
DELETE FROM `expenses`;

-- Dumping structure for table renatocostantini.extrainfo
CREATE TABLE IF NOT EXISTS `extrainfo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `numero_documento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ente_rilascio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_rilascio` date NOT NULL,
  `data_scadenza` date NOT NULL,
  `has_exp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `where_exp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `problems` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_problems` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motivation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achievement_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectives` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extrainfo_numero_documento_unique` (`numero_documento`),
  KEY `extrainfo_client_id_foreign` (`client_id`),
  CONSTRAINT `extrainfo_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.extrainfo: ~2 rows (approximately)
DELETE FROM `extrainfo`;
INSERT INTO `extrainfo` (`id`, `client_id`, `numero_documento`, `ente_rilascio`, `doc_type`, `data_rilascio`, `data_scadenza`, `has_exp`, `where_exp`, `problems`, `other_problems`, `motivation`, `achievement_time`, `objectives`, `created_at`, `updated_at`) VALUES
	(1, 3, 'fadsadfsffdas', 'Comune di residenza', NULL, '1988-07-17', '0008-08-17', NULL, NULL, '[]', NULL, '""', NULL, '[]', '2023-11-06 17:37:50', '2023-11-06 17:37:50'),
	(2, 5, 'Incidunt officia es', 'Comune di residenza', 'Carta di indentità', '2008-12-11', '2010-01-14', 'y', 'Cum voluptate amet', '["Postura","Perdita peso","Ernia","Diabete","Stress","Problemi cardiaci"]', 'Mollit fugiat sit q', '"3"', 'Dai 2 ai 4 mesi', '["Definizione","Benessere generale","Recupero infortunio","Aumento massa muscolare","Conoscenza degli sport individuali","Dimagrire"]', '2024-01-26 06:52:53', '2024-01-26 06:52:53');

-- Dumping structure for table renatocostantini.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table renatocostantini.gifts
CREATE TABLE IF NOT EXISTS `gifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gifter_id` bigint unsigned NOT NULL,
  `gifted_id` bigint unsigned DEFAULT NULL,
  `sub_id` bigint unsigned NOT NULL,
  `sub_type_id` bigint unsigned NOT NULL,
  `months` int NOT NULL,
  `redeemed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gifts_gifter_id_foreign` (`gifter_id`),
  KEY `gifts_gifted_id_foreign` (`gifted_id`),
  KEY `gifts_sub_id_foreign` (`sub_id`),
  KEY `gifts_sub_type_id_foreign` (`sub_type_id`),
  CONSTRAINT `gifts_gifted_id_foreign` FOREIGN KEY (`gifted_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gifts_gifter_id_foreign` FOREIGN KEY (`gifter_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gifts_sub_id_foreign` FOREIGN KEY (`sub_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gifts_sub_type_id_foreign` FOREIGN KEY (`sub_type_id`) REFERENCES `subscription_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.gifts: ~0 rows (approximately)
DELETE FROM `gifts`;
INSERT INTO `gifts` (`id`, `gifter_id`, `gifted_id`, `sub_id`, `sub_type_id`, `months`, `redeemed`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 3, 2, 5, 8, 12, 1, NULL, '2024-01-30 20:50:42', '2024-01-30 20:54:49');

-- Dumping structure for table renatocostantini.inscriptions
CREATE TABLE IF NOT EXISTS `inscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `sub_id` bigint unsigned NOT NULL,
  `receipts_id` bigint unsigned NOT NULL,
  `expiry` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inscriptions_client_id_foreign` (`client_id`),
  KEY `inscriptions_sub_id_foreign` (`sub_id`),
  CONSTRAINT `inscriptions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `inscriptions_sub_id_foreign` FOREIGN KEY (`sub_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.inscriptions: ~0 rows (approximately)
DELETE FROM `inscriptions`;

-- Dumping structure for table renatocostantini.installments
CREATE TABLE IF NOT EXISTS `installments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `installment_type_id` bigint unsigned NOT NULL,
  `sub_types_id` bigint unsigned DEFAULT NULL,
  `payday` int NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `percentage` decimal(9,2) DEFAULT NULL,
  `is_inscription` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installments_installment_type_id_foreign` (`installment_type_id`),
  KEY `installments_sub_types_id_foreign` (`sub_types_id`),
  CONSTRAINT `installments_installment_type_id_foreign` FOREIGN KEY (`installment_type_id`) REFERENCES `installment_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installments_sub_types_id_foreign` FOREIGN KEY (`sub_types_id`) REFERENCES `subscription_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.installments: ~52 rows (approximately)
DELETE FROM `installments`;
INSERT INTO `installments` (`id`, `installment_type_id`, `sub_types_id`, `payday`, `price`, `percentage`, `is_inscription`, `created_at`, `updated_at`) VALUES
	(1, 4, 1, 0, 39.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 4, 2, 0, 79.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 4, 3, 0, 30.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(4, 4, 4, 0, 95.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(5, 4, 5, 0, 60.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(6, 4, 6, 0, 225.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(7, 1, 7, 30, 148.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(8, 2, 7, 60, 148.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(9, 3, 7, 75, 148.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(10, 1, 8, 30, 241.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(11, 2, 8, 60, 241.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(12, 3, 8, 75, 241.66, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(13, 4, 9, 0, 75.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(14, 4, 10, 0, 275.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(15, 1, 11, 30, 181.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(16, 2, 11, 60, 181.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(17, 3, 11, 75, 181.66, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(18, 1, 12, 30, 298.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(19, 2, 12, 60, 298.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(20, 3, 12, 75, 298.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(21, 4, 13, 0, 85.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(22, 4, 14, 0, 315.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(23, 1, 15, 30, 211.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(24, 2, 15, 60, 211.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(25, 3, 15, 75, 211.66, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(26, 1, 16, 30, 331.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(27, 2, 16, 60, 331.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(28, 3, 16, 75, 331.66, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(29, 4, 17, 0, 65.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(30, 4, 18, 0, 245.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(31, 1, 19, 30, 181.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(32, 2, 19, 60, 181.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(33, 3, 19, 75, 181.66, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(34, 1, 20, 30, 298.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(35, 2, 20, 60, 298.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(36, 3, 20, 75, 298.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(37, 4, 21, 0, 55.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(38, 4, 22, 0, 195.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(39, 1, 23, 30, 148.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(40, 2, 23, 60, 148.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(41, 3, 23, 75, 148.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(42, 1, 24, 30, 241.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(43, 2, 24, 60, 241.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(44, 3, 24, 75, 241.66, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(45, 4, 25, 0, 65.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(46, 4, 26, 0, 245.00, 100.00, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(47, 1, 27, 30, 181.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(48, 2, 27, 60, 181.67, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(49, 3, 27, 75, 181.66, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(50, 1, 28, 30, 298.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(51, 2, 28, 60, 298.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(52, 3, 28, 75, 298.33, 33.33, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.installment_types
CREATE TABLE IF NOT EXISTS `installment_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_limit` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` decimal(9,2) DEFAULT NULL,
  `inscription_price` decimal(9,2) DEFAULT NULL,
  `is_inscription` tinyint(1) NOT NULL DEFAULT '0',
  `is_solution_unique` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.installment_types: ~5 rows (approximately)
DELETE FROM `installment_types`;
INSERT INTO `installment_types` (`id`, `name`, `payment_limit`, `description`, `discount`, `inscription_price`, `is_inscription`, `is_solution_unique`, `created_at`, `updated_at`) VALUES
	(1, 'Prima', 30, '', NULL, NULL, 0, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'Seconda', 60, '', NULL, NULL, 0, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'Terza', 75, '', 30.00, NULL, 0, 1, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(4, 'Unica', 0, '', NULL, NULL, 0, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(5, 'Iscrizione', 0, '', 0.00, 10.00, 1, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.insurances
CREATE TABLE IF NOT EXISTS `insurances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned DEFAULT NULL,
  `scadenza_assicurazione` date DEFAULT NULL,
  `inizio_assicurazione` date DEFAULT NULL,
  `plus` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `insurances_client_id_foreign` (`client_id`),
  CONSTRAINT `insurances_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.insurances: ~2 rows (approximately)
DELETE FROM `insurances`;
INSERT INTO `insurances` (`id`, `client_id`, `scadenza_assicurazione`, `inizio_assicurazione`, `plus`, `created_at`, `updated_at`) VALUES
	(1, 3, '2024-12-31', '2023-11-06', 0, '2023-11-06 17:37:50', '2023-11-06 17:37:50'),
	(2, 5, '1978-12-31', '1977-09-09', 0, '2024-01-26 06:52:53', '2024-01-26 06:52:53');

-- Dumping structure for table renatocostantini.leads
CREATE TABLE IF NOT EXISTS `leads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_date` date NOT NULL,
  `schedule_time` time NOT NULL,
  `schedule_place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_user_id_foreign` (`user_id`),
  CONSTRAINT `leads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.leads: ~0 rows (approximately)
DELETE FROM `leads`;

-- Dumping structure for table renatocostantini.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.migrations: ~41 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_04_06_091013_create_clients_table', 1),
	(6, '2023_04_06_140212_create_insurances_table', 1),
	(7, '2023_04_06_140430_create_certificates_table', 1),
	(8, '2023_04_25_163714_create_extrainfo_table', 1),
	(9, '2023_05_03_083810_create_payment_types_table', 1),
	(10, '2023_05_04_124123_create_subscriptions_table', 1),
	(11, '2023_05_04_124124_create_receipts_table', 1),
	(12, '2023_05_11_110002_create_sources_table', 1),
	(13, '2023_05_15_132519_create_tasks_table', 1),
	(14, '2023_05_15_132525_create_active_tasks_table', 1),
	(15, '2023_05_19_104531_create_permission_tables', 1),
	(16, '2023_05_19_150523_create_sub_sources_table', 1),
	(17, '2023_05_23_165149_create_subscription_types_table', 1),
	(18, '2023_05_25_113358_create_leads_table', 1),
	(19, '2023_06_01_104933_create_customer_statuses_table', 1),
	(20, '2023_06_08_133440_create_installment_types_table', 1),
	(21, '2023_06_08_133457_create_installments_table', 1),
	(22, '2023_06_08_141416_create_subscription_super_names_table', 1),
	(23, '2023_06_08_141417_create_subscription_super_types_table', 1),
	(24, '2023_06_26_153736_create_suspension_fees_table', 1),
	(25, '2023_06_26_153737_create_suspensions_table', 1),
	(26, '2023_06_30_142116_create_gifts_table', 1),
	(27, '2023_07_04_134039_create_inscriptions_table', 1),
	(28, '2023_07_04_150459_create_referrals_table', 1),
	(29, '2023_07_06_093211_create_products_table', 1),
	(30, '2023_07_06_093258_create_products_warehouses_table', 1),
	(31, '2023_07_13_113733_create_appointments_table', 1),
	(32, '2023_08_09_142519_create_gadget_per_sub_type_table', 1),
	(33, '2023_09_14_105003_create_setting_variables_table', 1),
	(34, '2023_09_14_170707_create_registers_table', 1),
	(35, '2023_09_19_020119_create_query_bookmarks_table', 1),
	(36, '2023_09_21_114350_create_workers_table', 1),
	(37, '2023_09_21_114536_create_workers_wages_table', 1),
	(38, '2023_09_21_114546_create_workers_documents_table', 1),
	(39, '2023_09_21_115638_create_workers_jobs_table', 1),
	(40, '2023_09_28_140512_create_expenses_table', 1),
	(41, '2023_10_09_154550_create_task_triggers_table', 1);

-- Dumping structure for table renatocostantini.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;

-- Dumping structure for table renatocostantini.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.model_has_roles: ~7 rows (approximately)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(1, 'App\\Models\\User', 2),
	(1, 'App\\Models\\User', 3),
	(2, 'App\\Models\\User', 4),
	(3, 'App\\Models\\User', 5),
	(3, 'App\\Models\\User', 6),
	(3, 'App\\Models\\User', 7);

-- Dumping structure for table renatocostantini.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table renatocostantini.payment_types
CREATE TABLE IF NOT EXISTS `payment_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.payment_types: ~6 rows (approximately)
DELETE FROM `payment_types`;
INSERT INTO `payment_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
	(1, 'Carta', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'Contanti', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'Omaggio', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(4, 'Pagodil', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(5, 'Bonifico', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(6, 'Assegno', '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.permissions: ~14 rows (approximately)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'view_settings', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'add_user', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'edit_user', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(4, 'basic_view', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(5, 'add_sub', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(6, 'edit_sub_pays', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(7, 'add_pay', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(8, 'edit_pay', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(9, 'add_custom_task', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(10, 'edit_custom_task', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(11, 'view_warehouse', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(12, 'edit_product', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(13, 'stock_product', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(14, 'view_all_calendar_events', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table renatocostantini.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ean_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_price` decimal(12,2) unsigned NOT NULL,
  `fixed_price` decimal(12,2) unsigned DEFAULT NULL,
  `markup` decimal(5,2) unsigned DEFAULT NULL,
  `price` decimal(12,2) GENERATED ALWAYS AS ((case when (`fixed_price` is not null) then `fixed_price` when (`markup` is not null) then (`original_price` + ((`markup` / 100) * `original_price`)) else `original_price` end)) VIRTUAL,
  `alertLowStockSent` tinyint(1) NOT NULL DEFAULT '0',
  `alertLimit` int NOT NULL DEFAULT '10',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.products: ~2 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `ean_code`, `description`, `image`, `original_price`, `fixed_price`, `markup`, `alertLowStockSent`, `alertLimit`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Jocelyn James', 'Maxime aliqua Aliqu', 'Ex illo saepe simili', NULL, 163.00, NULL, NULL, 0, 10, '2023-10-31 11:27:40', '2023-10-31 11:27:40', NULL),
	(2, 'borraccia', 'sdfdsf', 'dsfsdf', NULL, 50.00, NULL, 20.00, 0, 10, '2024-01-30 19:58:23', '2024-01-30 19:58:23', NULL);

-- Dumping structure for table renatocostantini.products_warehouses
CREATE TABLE IF NOT EXISTS `products_warehouses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quantity` bigint NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `sub_id` bigint unsigned DEFAULT NULL,
  `applied_discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_warehouses_product_id_foreign` (`product_id`),
  KEY `products_warehouses_user_id_foreign` (`user_id`),
  KEY `products_warehouses_client_id_foreign` (`client_id`),
  KEY `products_warehouses_sub_id_foreign` (`sub_id`),
  CONSTRAINT `products_warehouses_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `products_warehouses_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `products_warehouses_sub_id_foreign` FOREIGN KEY (`sub_id`) REFERENCES `subscriptions` (`id`),
  CONSTRAINT `products_warehouses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.products_warehouses: ~0 rows (approximately)
DELETE FROM `products_warehouses`;

-- Dumping structure for table renatocostantini.query_bookmarks
CREATE TABLE IF NOT EXISTS `query_bookmarks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `query` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `query_bookmarks_chk_1` CHECK (json_valid(`query`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.query_bookmarks: ~0 rows (approximately)
DELETE FROM `query_bookmarks`;

-- Dumping structure for table renatocostantini.receipts
CREATE TABLE IF NOT EXISTS `receipts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `insurance_id` bigint unsigned DEFAULT NULL,
  `counselor_id` bigint unsigned DEFAULT NULL,
  `sale_date` date NOT NULL,
  `sale_complete_date` date DEFAULT NULL,
  `sale_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL,
  `iva` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(9,2) NOT NULL,
  `paid` decimal(9,2) DEFAULT NULL,
  `change` decimal(9,2) DEFAULT NULL,
  `sale_is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `url_to_bill` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipts_url_to_bill_unique` (`url_to_bill`),
  KEY `receipts_client_id_foreign` (`client_id`),
  KEY `receipts_subscription_id_foreign` (`subscription_id`),
  KEY `receipts_counselor_id_foreign` (`counselor_id`),
  KEY `receipts_payment_type_id_foreign` (`payment_type_id`),
  CONSTRAINT `receipts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `receipts_counselor_id_foreign` FOREIGN KEY (`counselor_id`) REFERENCES `users` (`id`),
  CONSTRAINT `receipts_payment_type_id_foreign` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`),
  CONSTRAINT `receipts_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.receipts: ~12 rows (approximately)
DELETE FROM `receipts`;
INSERT INTO `receipts` (`id`, `subscription_id`, `client_id`, `insurance_id`, `counselor_id`, `sale_date`, `sale_complete_date`, `sale_type`, `payment_type_id`, `amount`, `iva`, `total`, `paid`, `change`, `sale_is_paid`, `url_to_bill`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 3, 1, NULL, '2023-11-06', NULL, 'Cauzione Tessera', NULL, 5.00, '22', 5.00, NULL, NULL, 0, NULL, NULL, '2023-11-06 17:37:50', '2023-11-06 17:37:50'),
	(2, NULL, 3, 1, NULL, '2023-11-06', NULL, 'Tesseramento', NULL, 15.00, '22', 15.00, NULL, NULL, 0, NULL, NULL, '2023-11-06 17:37:50', '2023-11-06 17:37:50'),
	(3, 1, 3, NULL, 1, '2023-11-06', '2023-11-06', '4', 2, 22.00, '0', 22.00, 0.00, 0.00, 1, NULL, NULL, '2023-11-06 17:40:15', '2023-11-06 17:40:15'),
	(4, 3, 3, NULL, NULL, '2024-01-26', NULL, 'Unica', NULL, 9.00, '0', 9.00, NULL, NULL, 0, NULL, NULL, '2024-01-26 06:52:03', '2024-01-26 06:52:03'),
	(5, NULL, 5, 2, NULL, '2024-01-26', NULL, 'Cauzione Tessera', NULL, 5.00, '22', 5.00, NULL, NULL, 0, NULL, NULL, '2024-01-26 06:52:53', '2024-01-26 06:52:53'),
	(6, NULL, 5, 2, NULL, '2024-01-26', NULL, 'Tesseramento', NULL, 15.00, '22', 15.00, NULL, NULL, 0, NULL, NULL, '2024-01-26 06:52:53', '2024-01-26 06:52:53'),
	(7, 5, 3, NULL, NULL, '2024-02-29', NULL, 'Prima', NULL, 231.64, '0', 231.64, NULL, NULL, 0, NULL, NULL, '2024-01-30 20:49:47', '2024-01-30 20:49:47'),
	(8, 5, 3, NULL, NULL, '2024-03-30', NULL, 'Seconda', NULL, 231.64, '0', 231.64, NULL, NULL, 0, NULL, NULL, '2024-01-30 20:49:47', '2024-01-30 20:49:47'),
	(9, 5, 3, NULL, NULL, '2024-04-14', NULL, 'Terza', NULL, 231.64, '0', 231.64, NULL, NULL, 0, NULL, NULL, '2024-01-30 20:49:47', '2024-01-30 20:49:47'),
	(10, 6, 2, NULL, NULL, '2024-02-29', NULL, 'Prima', 3, 0.00, '0', 0.00, NULL, NULL, 1, NULL, NULL, '2024-01-30 20:54:49', '2024-01-30 20:54:49'),
	(11, 6, 2, NULL, NULL, '2024-03-30', NULL, 'Seconda', 3, 0.00, '0', 0.00, NULL, NULL, 1, NULL, NULL, '2024-01-30 20:54:49', '2024-01-30 20:54:49'),
	(12, 6, 2, NULL, NULL, '2024-04-14', NULL, 'Terza', 3, 0.00, '0', 0.00, NULL, NULL, 1, NULL, NULL, '2024-01-30 20:54:49', '2024-01-30 20:54:49');

-- Dumping structure for table renatocostantini.referrals
CREATE TABLE IF NOT EXISTS `referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `referrer_id` bigint unsigned NOT NULL,
  `referred_id` bigint unsigned NOT NULL,
  `days` int NOT NULL,
  `expiry` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referrals_referrer_id_foreign` (`referrer_id`),
  KEY `referrals_referred_id_foreign` (`referred_id`),
  CONSTRAINT `referrals_referred_id_foreign` FOREIGN KEY (`referred_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `referrals_referrer_id_foreign` FOREIGN KEY (`referrer_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.referrals: ~0 rows (approximately)
DELETE FROM `referrals`;

-- Dumping structure for table renatocostantini.registers
CREATE TABLE IF NOT EXISTS `registers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint unsigned NOT NULL,
  `is_last_day_closure` tinyint(1) NOT NULL DEFAULT '0',
  `total_at_closure` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.registers: ~0 rows (approximately)
DELETE FROM `registers`;
INSERT INTO `registers` (`id`, `consultant_id`, `is_last_day_closure`, `total_at_closure`, `created_at`, `updated_at`) VALUES
	(1, 1, 0, 0.00, '2023-11-06 17:48:20', '2023-11-06 17:48:20');

-- Dumping structure for table renatocostantini.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.roles: ~3 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'superadmin', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'admin', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'user', 'web', '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.role_has_permissions: ~27 rows (approximately)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(2, 2),
	(3, 2),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(12, 2),
	(13, 2),
	(4, 3);

-- Dumping structure for table renatocostantini.setting_variables
CREATE TABLE IF NOT EXISTS `setting_variables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.setting_variables: ~0 rows (approximately)
DELETE FROM `setting_variables`;

-- Dumping structure for table renatocostantini.sources
CREATE TABLE IF NOT EXISTS `sources` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `source_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.sources: ~5 rows (approximately)
DELETE FROM `sources`;
INSERT INTO `sources` (`id`, `source_name`, `created_at`, `updated_at`) VALUES
	(1, 'Ex Utente', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'Web', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'Utente Curioso', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(4, 'Referral', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(5, 'Promo', '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.subscriptions
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(9,2) NOT NULL,
  `total` decimal(9,2) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `discount` int DEFAULT NULL,
  `refounded` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `gifted` tinyint(1) NOT NULL DEFAULT '0',
  `giftedMonths` int NOT NULL DEFAULT '0',
  `super_type_id` bigint unsigned DEFAULT NULL,
  `integrated_from` bigint unsigned DEFAULT NULL,
  `referral_used` tinyint(1) NOT NULL DEFAULT '0',
  `referral_month_added` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_client_id_foreign` (`client_id`),
  KEY `subscriptions_consultant_id_foreign` (`consultant_id`),
  CONSTRAINT `subscriptions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.subscriptions: ~6 rows (approximately)
DELETE FROM `subscriptions`;
INSERT INTO `subscriptions` (`id`, `consultant_id`, `client_id`, `type`, `description`, `price`, `total`, `start`, `end`, `status`, `discount`, `refounded`, `active`, `gifted`, `giftedMonths`, `super_type_id`, `integrated_from`, `referral_used`, `referral_month_added`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, '9', NULL, 97.00, 97.00, '2023-11-06', '2023-12-06', 0, 0, 0, 1, 0, 0, 4, NULL, 0, 0, '2024-01-30 13:13:41', '2023-11-06 17:39:22', '2024-01-30 13:13:41'),
	(2, 1, 2, '6', NULL, 225.00, 172.50, '2023-11-20', '2024-03-19', 0, 10, 0, 1, 0, 0, 3, NULL, 0, 0, NULL, '2023-11-20 17:19:10', '2024-01-20 15:39:53'),
	(3, 1, 3, '1', NULL, 39.00, 9.00, '2024-01-26', '2024-02-25', 0, 0, 1, 1, 0, 0, 1, NULL, 0, 0, NULL, '2024-01-26 06:52:03', '2024-01-30 20:41:54'),
	(4, 1, 3, '1', NULL, -58.00, -58.00, '2023-11-06', '2023-11-06', 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, NULL, '2024-01-30 13:13:41', '2024-01-30 13:13:41'),
	(5, 1, 3, '8', NULL, 725.00, 695.00, '2024-01-30', '2025-01-29', 0, 0, 0, 1, 0, 12, 3, NULL, 0, 0, NULL, '2024-01-30 20:49:47', '2024-01-30 20:50:42'),
	(6, 1, 2, '8', 'Omaggio', 0.00, 0.00, '2024-01-30', '2025-01-30', 1, 0, 0, 1, 1, 0, 8, NULL, 0, 0, NULL, '2024-01-30 20:54:49', '2024-01-30 20:54:49');

-- Dumping structure for table renatocostantini.subscription_super_names
CREATE TABLE IF NOT EXISTS `subscription_super_names` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.subscription_super_names: ~8 rows (approximately)
DELETE FROM `subscription_super_names`;
INSERT INTO `subscription_super_names` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'START TRAINING', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'FLOW ACTIVITY', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'ACTY BASE', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(4, 'ACTY MEDIUM', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(5, 'ACTY STRONG', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(6, 'PIÙ PER SOLO KARATE', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(7, 'SPDC(karate,prep,judo UNDER 14)', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(8, '2 SPDC UNDER 14', '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.subscription_super_types
CREATE TABLE IF NOT EXISTS `subscription_super_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sub_sup_name_id` bigint unsigned DEFAULT NULL,
  `sub_type_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscription_super_types_sub_sup_name_id_foreign` (`sub_sup_name_id`),
  KEY `subscription_super_types_sub_type_id_foreign` (`sub_type_id`),
  CONSTRAINT `subscription_super_types_sub_sup_name_id_foreign` FOREIGN KEY (`sub_sup_name_id`) REFERENCES `subscription_super_names` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscription_super_types_sub_type_id_foreign` FOREIGN KEY (`sub_type_id`) REFERENCES `subscription_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.subscription_super_types: ~28 rows (approximately)
DELETE FROM `subscription_super_types`;
INSERT INTO `subscription_super_types` (`id`, `sub_sup_name_id`, `sub_type_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 1, 2, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 2, 3, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(4, 2, 4, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(5, 3, 5, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(6, 3, 6, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(7, 3, 7, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(8, 3, 8, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(9, 4, 9, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(10, 4, 10, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(11, 4, 11, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(12, 4, 12, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(13, 5, 13, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(14, 5, 14, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(15, 5, 15, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(16, 5, 16, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(17, 6, 17, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(18, 6, 18, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(19, 6, 19, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(20, 6, 20, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(21, 7, 21, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(22, 7, 22, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(23, 7, 23, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(24, 7, 24, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(25, 8, 25, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(26, 8, 26, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(27, 8, 27, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(28, 8, 28, '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.subscription_types
CREATE TABLE IF NOT EXISTS `subscription_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `discount` int DEFAULT NULL,
  `refound_time` int DEFAULT NULL,
  `duration` int NOT NULL,
  `personal` bigint NOT NULL DEFAULT '1',
  `gift` int DEFAULT NULL,
  `referral` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.subscription_types: ~28 rows (approximately)
DELETE FROM `subscription_types`;
INSERT INTO `subscription_types` (`id`, `type`, `price`, `discount`, `refound_time`, `duration`, `personal`, `gift`, `referral`, `created_at`, `updated_at`) VALUES
	(1, '[START TRAINING]1 mese', 39.00, 0, 10, 30, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, '[START TRAINING]4 mesi', 79.00, 0, 10, 120, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, '[FLOW ACTIVITY]1 mese', 30.00, 0, NULL, 30, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(4, '[FLOW ACTIVITY]4 mesi', 95.00, 0, NULL, 120, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(5, '[ACTY BASE]1 mese', 60.00, 0, NULL, 30, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(6, '[ACTY BASE]4 mesi', 225.00, 0, NULL, 120, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(7, '[ACTY BASE]6 mesi + 6 omaggio + 1 mese referral', 445.00, 0, NULL, 365, 1, 6, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(8, '[ACTY BASE]12 mesi + 12 omaggio + 1 mese  referral', 725.00, 0, NULL, 730, 1, 12, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(9, '[ACTY MEDIUM]1 mese', 75.00, 0, NULL, 30, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(10, '[ACTY MEDIUM]4 mesi', 275.00, 0, NULL, 120, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(11, '[ACTY MEDIUM]6 mesi + 6 omaggio + 1 mese referral', 545.00, 0, NULL, 365, 1, 6, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(12, '[ACTY MEDIUM]12 mesi + 12 omaggio + 1 mese  referral', 895.00, 0, NULL, 730, 1, 12, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(13, '[ACTY STRONG]1 mese', 85.00, 0, NULL, 30, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(14, '[ACTY STRONG]4 mesi', 315.00, 0, NULL, 120, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(15, '[ACTY STRONG]6 mesi + 6 omaggio + 1 mese referral', 635.00, 0, NULL, 365, 1, 6, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(16, '[ACTY STRONG]12 mesi + 12 omaggio + 1 mese  referral', 995.00, 0, NULL, 730, 1, 12, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(17, '[PIÙ PER SOLO KARATE]1 mese', 65.00, 0, NULL, 30, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(18, '[PIÙ PER SOLO KARATE]4 mesi', 245.00, 0, NULL, 120, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(19, '[PIÙ PER SOLO KARATE]6 mesi + 6 omaggio + 1 mese referral', 545.00, 0, NULL, 365, 1, 6, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(20, '[PIÙ PER SOLO KARATE]12 mesi + 12 omaggio + 1 mese  referral', 895.00, 0, NULL, 730, 1, 12, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(21, '[SPDC(karate,prep,judo UNDER 14)]1 mese', 55.00, 0, NULL, 30, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(22, '[SPDC(karate,prep,judo UNDER 14)]4 mesi', 195.00, 0, NULL, 120, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(23, '[SPDC(karate,prep,judo UNDER 14)]6 mesi + 6 omaggio + 1 mese referral', 445.00, 0, NULL, 365, 1, 6, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(24, '[SPDC(karate,prep,judo UNDER 14)]12 mesi + 12 omaggio + 1 mese  referral', 725.00, 0, NULL, 730, 1, 12, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(25, '[2 SPDC UNDER 14]1 mese', 65.00, 0, NULL, 30, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(26, '[2 SPDC UNDER 14]4 mesi', 245.00, 0, NULL, 120, 1, NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(27, '[2 SPDC UNDER 14]6 mesi + 6 omaggio + 1 mese referral', 545.00, 0, NULL, 365, 1, 6, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(28, '[2 SPDC UNDER 14]12 mesi + 12 omaggio + 1 mese  referral', 895.00, 0, NULL, 730, 1, 12, 30, '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.sub_sources
CREATE TABLE IF NOT EXISTS `sub_sources` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sub_source_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.sub_sources: ~3 rows (approximately)
DELETE FROM `sub_sources`;
INSERT INTO `sub_sources` (`id`, `sub_source_name`, `created_at`, `updated_at`) VALUES
	(1, 'Sotto fonte 1', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'Sotto fonte 2', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'Sotto fonte 3', '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.sub_types_gadgets
CREATE TABLE IF NOT EXISTS `sub_types_gadgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sub_type` bigint unsigned NOT NULL,
  `gadget_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.sub_types_gadgets: ~0 rows (approximately)
DELETE FROM `sub_types_gadgets`;
INSERT INTO `sub_types_gadgets` (`id`, `sub_type`, `gadget_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL);

-- Dumping structure for table renatocostantini.suspensions
CREATE TABLE IF NOT EXISTS `suspensions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` bigint unsigned NOT NULL,
  `pay_id` bigint unsigned NOT NULL,
  `fee_type_id` bigint unsigned NOT NULL,
  `suspension_start` date NOT NULL,
  `suspension_end` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suspensions_sub_id_foreign` (`sub_id`),
  KEY `suspensions_pay_id_foreign` (`pay_id`),
  KEY `suspensions_fee_type_id_foreign` (`fee_type_id`),
  CONSTRAINT `suspensions_fee_type_id_foreign` FOREIGN KEY (`fee_type_id`) REFERENCES `suspension_fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `suspensions_pay_id_foreign` FOREIGN KEY (`pay_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `suspensions_sub_id_foreign` FOREIGN KEY (`sub_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.suspensions: ~0 rows (approximately)
DELETE FROM `suspensions`;

-- Dumping structure for table renatocostantini.suspension_fees
CREATE TABLE IF NOT EXISTS `suspension_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.suspension_fees: ~2 rows (approximately)
DELETE FROM `suspension_fees`;
INSERT INTO `suspension_fees` (`id`, `type`, `amount`, `created_at`, `updated_at`) VALUES
	(1, 'Base', 1.00, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'Personal', 3.00, '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_description` longtext COLLATE utf8mb4_unicode_ci,
  `event` bigint unsigned DEFAULT NULL,
  `behavior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `expiry_range` int NOT NULL,
  `belongs_to` bigint unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_belongs_to_foreign` (`belongs_to`),
  CONSTRAINT `tasks_belongs_to_foreign` FOREIGN KEY (`belongs_to`) REFERENCES `tasks` (`id`),
  CONSTRAINT `tasks_chk_1` CHECK (json_valid(`behavior`))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.tasks: ~3 rows (approximately)
DELETE FROM `tasks`;
INSERT INTO `tasks` (`id`, `task_name`, `task_description`, `event`, `behavior`, `expiry_range`, `belongs_to`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Promemoria nuova anagrafica', 'TEST', 1, '{"conditions": "some condition"}', 7, NULL, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'Promemoria nuova anagrafica con referral', 'TEST', 2, '{"conditions": "some condition"}', 7, NULL, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'Aggiunta abbonamento cliente', 'TEST', 3, '{"conditions": "some condition"}', 7, NULL, 0, '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.task_triggers
CREATE TABLE IF NOT EXISTS `task_triggers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.task_triggers: ~3 rows (approximately)
DELETE FROM `task_triggers`;
INSERT INTO `task_triggers` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Creazione anagrafica', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'Creazione anagrafica: aggiunta referral', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'Aggiunta abbonamento a cliente', '2023-10-13 10:43:29', '2023-10-13 10:43:29');

-- Dumping structure for table renatocostantini.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.users: ~7 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile_pic`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Renato', 'renato@superadmin.com', NULL, '$2y$10$.6xYKtXtciCxHEGKMquMfOp19G1DFFLEZehmm35eF3gise5OVcCGy', NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(2, 'test', 'meboyaj547@v2ssr.com', NULL, '$2y$10$zseQoxfZrDXTu2/RE8/M9uVXcOovFUGE/Vq05xu.LummlbZ6N.KGy', NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(3, 'test2', 'redeyi5974@estudys.com', NULL, '$2y$10$Z8vzX9AtanT0pjEUQM3nH.AoVw8Jf2MmpGYuOenDWv6GTUqv7JI/K', NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(4, 'Admin', 'lucabox@admin.com', NULL, '$2y$10$WWuhBhwRBjKmZ2B984D9IezT23yNePDerMBcVVHoloz4znNhfi.ra', NULL, NULL, '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(5, 'utente1', 'ANpQNuSIHH@gmail.com', '2023-10-13 10:43:29', '$2y$10$TTKFIMQZ5lB1hoctJO7ZLefMmQBVPhOrBKjqAbyQFfy84pUHwXX0K', NULL, 'zVc2JQMqj5', '2023-10-13 10:43:29', '2023-10-13 10:43:29'),
	(6, 'utente2', 'hwWyVvOHkI@gmail.com', '2023-10-13 10:43:29', '$2y$10$bTFnoRW3YB0ftEw7Be3tEuYGz/i5rXvXGGlBRnoUZkrNc/6TinKPO', NULL, 'GA2K4vhGit', '2023-10-13 10:43:29', '2023-10-13 10:43:30'),
	(7, 'utente3', 'MvpSaNGd5I@gmail.com', '2023-10-13 10:43:29', '$2y$10$5v7xF.ZLrclK8OtRbFlbOOVum1uhQUVSdFRGMZc.pPosJuAk22Q.C', NULL, '8AdLzm6lgW', '2023-10-13 10:43:29', '2023-10-13 10:43:30');

-- Dumping structure for table renatocostantini.workers
CREATE TABLE IF NOT EXISTS `workers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.workers: ~0 rows (approximately)
DELETE FROM `workers`;
INSERT INTO `workers` (`id`, `name`, `surname`, `created_at`, `updated_at`) VALUES
	(1, 'Rahim Reed', 'Kennedy Jenkins', '2023-12-27 07:07:11', '2023-12-27 07:07:11');

-- Dumping structure for table renatocostantini.workers_documents
CREATE TABLE IF NOT EXISTS `workers_documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `worker_id` bigint unsigned DEFAULT NULL,
  `document_info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ente_rilascio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `doc_pic_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workers_documents_worker_id_foreign` (`worker_id`),
  CONSTRAINT `workers_documents_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.workers_documents: ~0 rows (approximately)
DELETE FROM `workers_documents`;
INSERT INTO `workers_documents` (`id`, `worker_id`, `document_info`, `ente_rilascio`, `doc_type`, `expiry`, `doc_pic_path`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Voluptatum incidunt', 'Comune di residenza', 'Passaporto', '1988-03-25', 'https://renatocostantini.lucabox.it/default-user-avatar.jpg', '2023-12-27 07:07:11', '2023-12-27 07:07:11');

-- Dumping structure for table renatocostantini.workers_jobs
CREATE TABLE IF NOT EXISTS `workers_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `worker_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `cost` decimal(9,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workers_jobs_worker_id_foreign` (`worker_id`),
  CONSTRAINT `workers_jobs_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.workers_jobs: ~0 rows (approximately)
DELETE FROM `workers_jobs`;
INSERT INTO `workers_jobs` (`id`, `worker_id`, `name`, `start`, `end`, `cost`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Qui tempor aspernatu', '1985-02-09 00:00:00', '2013-09-01 00:00:00', 71.00, NULL, '2023-12-27 07:07:11', '2023-12-27 07:07:11');

-- Dumping structure for table renatocostantini.workers_wages
CREATE TABLE IF NOT EXISTS `workers_wages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `worker_id` bigint unsigned DEFAULT NULL,
  `wage` decimal(9,2) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workers_wages_worker_id_foreign` (`worker_id`),
  CONSTRAINT `workers_wages_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table renatocostantini.workers_wages: ~0 rows (approximately)
DELETE FROM `workers_wages`;
INSERT INTO `workers_wages` (`id`, `worker_id`, `wage`, `start`, `end`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 69.00, '1981-03-24', NULL, NULL, '2023-12-27 07:07:11', '2023-12-27 07:07:11');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
