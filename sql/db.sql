-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5278
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table books.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) DEFAULT '0' COMMENT 'is record active? 1 yes, 0 no',
  `status` tinyint(4) DEFAULT '0' COMMENT 'is record deleted? 1 yes, 0 no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='stores books details';

-- Dumping data for table books.books: ~4 rows (approximately)
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `isbn`, `title`, `author`, `date_added`, `date_updated`, `active`, `status`) VALUES
	(1, '978-1491918661', 'Learning PHP, MySQL & Javascript: With jQuery, CSS &HTML5', 'Robin Nixon', '2019-04-06 10:39:00', '2019-04-06 10:39:00', 1, 0),
	(2, '978-0596804848', 'Ubuntu: Up and Running: A Power User\'s Desktop Guide', 'Robin Nixon', '2019-04-06 10:40:37', '2019-04-06 10:48:11', 1, 0),
	(3, '978-1118999875', 'Linux Bible', 'Christopher Negus', '2019-04-06 10:48:49', '2019-04-06 10:49:13', 1, 0),
	(4, '978-0596517748', 'Javascript: The Good Parts', 'Douglas Crockford', '2019-04-06 10:49:45', '2019-04-06 10:50:13', 1, 0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- Dumping structure for table books.books_categories
CREATE TABLE IF NOT EXISTS `books_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL COMMENT 'reference, table: books, col: id',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) DEFAULT '0' COMMENT 'is record active? 1 yes, 0 no',
  `status` tinyint(4) DEFAULT '0' COMMENT 'is record deleted? 1 yes, 0 no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='stores books in categories';

-- Dumping data for table books.books_categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `books_categories` DISABLE KEYS */;
INSERT INTO `books_categories` (`id`, `book_id`, `category`, `date_added`, `date_updated`, `active`, `status`) VALUES
	(1, 1, 'PHP', '2019-04-06 10:51:50', '2019-04-06 14:49:13', 1, 0),
	(2, 1, 'Javascript', '2019-04-06 10:52:27', '2019-04-06 10:53:00', 1, 0),
	(3, 2, 'Linux', '2019-04-06 10:52:36', '2019-04-06 10:53:01', 1, 0),
	(4, 3, 'Linux', '2019-04-06 10:52:52', '2019-04-06 10:53:02', 1, 0),
	(5, 4, 'Javascript', '2019-04-06 10:53:21', '2019-04-06 10:53:23', 1, 0);
/*!40000 ALTER TABLE `books_categories` ENABLE KEYS */;

-- Dumping structure for table books.books_price
CREATE TABLE IF NOT EXISTS `books_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL COMMENT 'reference, table: books, col: id',
  `cost` float(5,2) DEFAULT NULL,
  `currency` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '3 character code for country, eg. GBP, USD',
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) DEFAULT '0' COMMENT 'is record active? 1 yes, 0 no',
  `status` tinyint(4) DEFAULT '0' COMMENT 'is record deleted? 1 yes, 0 no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.books_price: ~4 rows (approximately)
/*!40000 ALTER TABLE `books_price` DISABLE KEYS */;
INSERT INTO `books_price` (`id`, `book_id`, `cost`, `currency`, `date_added`, `date_updated`, `active`, `status`) VALUES
	(1, 1, 9.99, 'GBP', '2019-04-06 10:35:10', '2019-04-06 10:39:14', 1, 0),
	(2, 2, 12.99, 'GBP', '2019-04-06 10:44:22', '2019-04-06 10:44:40', 1, 0),
	(3, 3, 19.99, 'GBP', '2019-04-06 10:50:25', '2019-04-06 10:50:44', 1, 0),
	(4, 4, 8.99, 'GBP', '2019-04-06 10:51:06', '2019-04-06 10:51:08', 1, 0);
/*!40000 ALTER TABLE `books_price` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

