-- --------------------------------------------------------
-- מארח:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL גירסא:               12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for information
DROP DATABASE IF EXISTS `nchub`;
CREATE DATABASE IF NOT EXISTS `nchub` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `nchub`;

-- Dumping structure for table nchub.ak4y_fishing
DROP TABLE IF EXISTS `ak4y_fishing`;
CREATE TABLE IF NOT EXISTS `ak4y_fishing` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nchub.ak4y_fishing: ~0 rows (approximately)

-- Dumping structure for table nchub.apartments
DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nchub.apartments: ~0 rows (approximately)

-- Dumping structure for table nchub.bank_accounts
DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','Buisness','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `buisness` (`buisness`),
  KEY `buisnessid` (`buisnessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nchub.bank_accounts: ~0 rows (approximately)

-- Dumping structure for table nchub.bank_accounts_new
DROP TABLE IF EXISTS `bank_accounts_new`;
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nchub.bank_accounts_new: ~0 rows (approximately)

-- Dumping structure for table nchub.bank_statements
DROP TABLE IF EXISTS `bank_statements`;
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nchub.bank_statements: ~0 rows (approximately)

-- Dumping structure for table nchub.bans
DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nchub.bans: ~0 rows (approximately)

-- Dumping structure for table nchub.bees
DROP TABLE IF EXISTS `bees`;
CREATE TABLE IF NOT EXISTS `bees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext DEFAULT NULL,
  `beequeen` int(11) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Dumping data for table nchub.bees: ~0 rows (approximately)

-- Dumping structure for table nchub.bills
DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `bill_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `sender_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sender_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sender_citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recipient_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recipient_citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nchub.bills: ~0 rows (approximately)

-- Dumping structure for table nchub.bossmenu
DROP TABLE IF EXISTS `bossmenu`;
CREATE TABLE IF NOT EXISTS `bossmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7944 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nchub.bossmenu: ~21 rows (approximately)
REPLACE INTO `bossmenu` (`id`, `job_name`, `amount`) VALUES
	(1, 'police', 0),
	(2, 'ambulance', 8000),
	(3, 'realestate', 0),
	(4, 'tuner', 0),
	(5, 'burgershot', 0),
	(6, 'mechanic', 0),
	(7, 'vanilla', 0),
	(8, 'whitewidow', 0),
	(9, 'pizzathis', 0),
	(10, 'catcafe', 0),
	(11, 'tequila', 0),
	(12, 'taco', 0),
	(13, 'drugdealer', 0),
	(41, 'pawn', 0),
	(377, 'casino', 0),
	(405, 'judge', 0),
	(608, 'beanmachine', 0),
	(1481, 'unemployed', 0),
	(1906, 'coolbeans', 0),
	(2931, 'redline', 0),
	(5095, 'yellowjack', 0);

-- Dumping structure for table nchub.character_current
DROP TABLE IF EXISTS `character_current`;
CREATE TABLE IF NOT EXISTS `character_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` longtext DEFAULT NULL,
  `model` longtext NOT NULL DEFAULT '',
  `drawables` longtext NOT NULL DEFAULT '',
  `props` longtext NOT NULL DEFAULT '',
  `drawtextures` longtext NOT NULL DEFAULT '',
  `proptextures` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nchub.character_current: ~0 rows (approximately)

-- Dumping structure for table nchub.character_face
DROP TABLE IF EXISTS `character_face`;
CREATE TABLE IF NOT EXISTS `character_face` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `hairColor` varchar(255) DEFAULT NULL,
  `headBlend` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headBlend`)),
  `headOverlay` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headOverlay`)),
  `headStructure` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headStructure`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nchub.character_face: ~0 rows (approximately)

-- Dumping structure for table nchub.character_outfits
DROP TABLE IF EXISTS `character_outfits`;
CREATE TABLE IF NOT EXISTS `character_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` longtext DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slot` varchar(11) NOT NULL DEFAULT '',
  `model` longtext DEFAULT NULL,
  `drawables` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL,
  `drawtextures` longtext DEFAULT NULL,
  `proptextures` longtext DEFAULT NULL,
  `hairColor` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nchub.character_outfits: ~0 rows (approximately)

-- Dumping structure for table nchub.communityservice
DROP TABLE IF EXISTS `communityservice`;
CREATE TABLE IF NOT EXISTS `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nchub.communityservice: ~0 rows (approximately)

-- Dumping structure for table nchub.configs
DROP TABLE IF EXISTS `configs`;
CREATE TABLE IF NOT EXISTS `configs` (
  `name` varchar(20) NOT NULL,
  `config` text DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nchub.configs: ~1 rows (approximately)
REPLACE INTO `configs` (`name`, `config`) VALUES
	('keylabs', '{"washer2":0,"worth4":0,"worth3":0,"washer3":0,"worth2":0,"washer4":0,"methlab":9184,"methlab2":12205,"worth1":0,"washer1":0,"weedlab":9845,"cokelab":4729}');

-- Dumping structure for table nchub.cryptominers
DROP TABLE IF EXISTS `cryptominers`;
CREATE TABLE IF NOT EXISTS `cryptominers` (
  `citizenid` varchar(50) NOT NULL,
  `card` varchar(50) NOT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nchub.cryptominers: ~0 rows (approximately)

-- Dumping structure for table nchub.crypto_transactions
DROP TABLE IF EXISTS `crypto_transactions`;
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nchub.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table nchub.dealers
DROP TABLE IF EXISTS `dealers`;
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nchub.dealers: ~0 rows (approximately)

-- Dumping structure for table nchub.fine_types
DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nchub.fine_types: ~90 rows (approximately)
REPLACE INTO `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`) VALUES
	(1, 'Murder', 3000, 0, 15),
	(2, 'Involuntary Manslaughter', 1000, 0, 5),
	(3, 'Vehicular Manslaughter', 750, 0, 5),
	(4, 'Attempted Murder on LEO', 2000, 0, 10),
	(5, 'Attempted Murder', 1500, 0, 50),
	(6, 'Assault w/ Deadly Weapon on LEO', 1500, 0, 45),
	(7, 'Assault w/ Deadly Weapon', 1000, 0, 30),
	(8, 'Assault on LEO', 750, 0, 15),
	(9, 'Assault', 1000, 0, 10),
	(10, 'Kidnapping of an LEO', 1000, 0, 20),
	(11, 'Kidnapping / Hostage Taking', 750, 0, 20),
	(12, 'Bank Robbery', 3000, 0, 50),
	(13, 'Armored Truck Robbery', 2000, 0, 20),
	(14, 'Jewelery Store Robbery ', 3000, 0, 20),
	(15, 'Store Robbery', 2000, 0, 15),
	(16, 'House Robbery', 1000, 0, 10),
	(17, 'Corruption', 10000, 0, 650),
	(18, 'Felony Driving Under the Influence', 500, 0, 10),
	(19, 'Grand Theft Auto', 500, 0, 5),
	(20, 'Evading Arrest', 500, 0, 10),
	(21, 'Driving Under the Influence', 500, 0, 5),
	(22, 'Hit and Run', 500, 0, 5),
	(23, 'Operating a Motor Vehicle without a License', 500, 0, 10),
	(24, 'Criminal Speeding', 300, 0, 10),
	(25, 'Excessive Speeding 4', 250, 0, 0),
	(26, 'Excessive Speeding 3', 200, 0, 0),
	(27, 'Excessive Speeding 2', 150, 0, 0),
	(28, 'Excessive Speeding', 100, 0, 0),
	(29, 'Operating an Unregisted Motor Vehicle', 250, 0, 5),
	(30, 'Reckless Endangerment', 250, 0, 5),
	(31, 'Careless Driving', 250, 0, 0),
	(32, 'Operating a Non-Street Legal Vehicle', 200, 0, 5),
	(33, 'Failure to Stop', 250, 0, 0),
	(34, 'Obstructing Traffic', 150, 0, 0),
	(35, 'Illegal Lane Change', 100, 0, 0),
	(36, 'Failure to Yield to an Emergency Vehicle', 150, 0, 0),
	(37, 'Illegal Parking', 100, 0, 0),
	(38, 'Excessive Vehicle Noise', 100, 0, 0),
	(39, 'Driving without Proper Use of Headlights', 100, 0, 0),
	(40, 'Illegal U-Turn', 100, 0, 0),
	(41, 'Drug Manufacturing/Cultivation', 1500, 0, 20),
	(42, 'Possession of Schedule 1 Drug', 2500, 0, 15),
	(43, 'Possession of Schedule 2 Drug', 3000, 0, 20),
	(44, 'Sale/Distribution of Schedule 1 Drug', 3500, 0, 20),
	(45, 'Sale/Distribution of Schedule 2 Drug', 4000, 0, 20),
	(46, 'Drug Trafficking', 3000, 0, 20),
	(47, 'Weapons Caching of Class 2s', 3500, 0, 20),
	(48, 'Weapons Caching of Class 1s', 3000, 0, 40),
	(49, 'Weapons Trafficking of Class 2s', 3000, 0, 20),
	(50, 'Weapons Trafficking of Class 1s', 3500, 0, 20),
	(51, 'Possession of a Class 2 Firearm', 2500, 0, 20),
	(52, 'Possession of a Class 1 Firearm', 1500, 0, 15),
	(53, 'Brandishing a Firearm', 1000, 0, 5),
	(54, 'Unlawful discharge of a firearm', 1500, 0, 10),
	(55, 'Perjury', 1000, 0, 60),
	(56, 'Arson', 500, 0, 30),
	(57, 'False Impersonation of a Government Official', 2000, 0, 25),
	(58, 'Possession of Dirty Money', 2000, 0, 25),
	(59, 'Possession of Stolen Goods', 1000, 0, 15),
	(60, 'Unlawful Solicitation', 1500, 0, 20),
	(61, 'Larceny', 150, 0, 20),
	(62, 'Felony Attempted Commision of an Offence/Crime', 1500, 0, 20),
	(63, 'Tampering With Evidence', 20000, 0, 20),
	(64, 'Illegal Gambling', 2000, 0, 20),
	(65, 'Bribery', 2000, 0, 20),
	(66, 'Stalking', 1500, 0, 20),
	(67, 'Organizing an illegal event', 3500, 0, 15),
	(68, 'Participating in an illegal event', 2500, 0, 5),
	(69, 'Criminal Mischief', 1000, 0, 15),
	(70, 'Prostitution', 2500, 0, 15),
	(71, 'Failure to Identify', 1500, 0, 15),
	(72, 'Obstruction of Justice', 25000, 0, 15),
	(73, 'Resisting Arrest', 1000, 0, 10),
	(74, 'Disturbing the Peace', 1000, 0, 10),
	(75, 'Threat to do Bodily Harm', 1000, 0, 10),
	(76, 'Terroristic Threat', 5000, 0, 10),
	(77, 'Damage to Government Property', 500, 0, 10),
	(78, 'Contempt of Court', 25000, 0, 10),
	(79, 'Failure to Obey a Lawful Order', 500, 0, 10),
	(80, 'False Report', 240, 0, 10),
	(81, 'Trespassing', 1000, 0, 10),
	(82, 'Loitering', 250, 0, 0),
	(83, 'Public Intoxication', 1000, 0, 0),
	(84, 'Indecent Exposure', 500, 0, 0),
	(85, 'Verbal Harassment ', 500, 0, 0),
	(86, 'Aiding and Abetting', 500, 0, 0),
	(87, 'Incident Report', 0, 0, 0),
	(88, 'Written Citation', 0, 0, 0),
	(89, 'Stealing PD Stuffs', 25000, 0, 20),
	(90, 'Verbal Warning', 0, 0, 0);

-- Dumping structure for table nchub.fuel_stations
DROP TABLE IF EXISTS `fuel_stations`;
CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `location` int(11) NOT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nchub.fuel_stations: ~27 rows (approximately)
REPLACE INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES
	(1, 0, '0', 50000, 16, 0, 'Davis Avenue Ron'),
	(2, 0, '0', 50000, 16, 0, 'Grove Street LTD'),
	(3, 0, '0', 50000, 16, 0, 'Dutch London Xero'),
	(4, 0, '0', 50000, 16, 0, 'Little Seoul LTD'),
	(5, 0, '0', 50000, 16, 0, 'Strawberry Ave Xero'),
	(6, 0, '0', 50000, 16, 0, 'Popular Street Ron'),
	(7, 0, '0', 50000, 16, 0, 'Capital Blvd Ron'),
	(8, 0, '0', 50000, 16, 0, 'Mirror Park LTD'),
	(9, 0, '0', 50000, 16, 0, 'Clinton Ave Globe Oil'),
	(10, 0, '0', 50000, 16, 0, 'North Rockford Ron'),
	(11, 1, '0', 50000, 16, 0, 'Great Ocean Xero'),
	(12, 0, '0', 50000, 16, 0, 'Paleto Blvd Xero'),
	(13, 0, '0', 50000, 16, 0, 'Paleto Ron'),
	(14, 0, '0', 50000, 16, 0, 'Paleto Globe Oil'),
	(15, 0, '0', 50000, 16, 0, 'Grapeseed LTD'),
	(16, 0, '0', 50000, 16, 0, 'Sandy Shores Xero'),
	(17, 0, '0', 50000, 16, 0, 'Sandy Shores Globe Oil'),
	(18, 0, '0', 50000, 16, 0, 'Senora Freeway Xero'),
	(19, 0, '0', 50000, 16, 0, 'Harmony Globe Oil'),
	(20, 0, '0', 50000, 16, 0, 'Route 68 Globe Oil'),
	(21, 0, '0', 50000, 16, 0, 'Route 68 Workshop Globe O'),
	(22, 0, '0', 50000, 16, 0, 'Route 68 Xero'),
	(23, 0, '0', 50000, 16, 0, 'Route 68 Ron'),
	(24, 0, '0', 50000, 16, 0, 'Rex\'s Diner Globe Oil'),
	(25, 0, '0', 50000, 16, 0, 'Palmino Freeway Ron'),
	(26, 0, '0', 50000, 16, 0, 'North Rockford LTD'),
	(27, 0, '0', 50000, 16, 0, 'Alta Street Globe Oil');