-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.35-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table micimpact.channel
CREATE TABLE IF NOT EXISTS `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `introduce` varchar(500) DEFAULT NULL,
  `likes` int(11) DEFAULT '0',
  `favorite` int(11) DEFAULT '0',
  `is_show` int(1) DEFAULT '1',
  `is_liked` int(1) DEFAULT '0',
  `is_favorited` int(1) DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '0: channel user / 1:channel admin',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cards_recent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_channel_users` (`user_id`),
  KEY `FK_o3gbltcer4tv7yyygw20m2m62` (`cards_recent_id`),
  CONSTRAINT `FK_channel_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_o3gbltcer4tv7yyygw20m2m62` FOREIGN KEY (`cards_recent_id`) REFERENCES `cards` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.channel: ~5 rows (approximately)
DELETE FROM `channel`;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` (`id`, `user_id`, `title`, `introduce`, `likes`, `favorite`, `is_show`, `is_liked`, `is_favorited`, `type`, `created_at`, `cards_recent_id`) VALUES
	(87, 158, 'title', 'introduce', 0, 0, 1, 0, 0, 0, '2016-04-04 17:31:58', 36),
	(88, 158, 'title', 'introduce', 0, 0, 1, 0, 0, 0, '2016-04-04 17:31:58', 36),
	(90, 148, 'title 2', 'introduce 2', 0, 0, 1, 0, 0, 0, '2016-04-04 17:31:58', 86),
	(91, 148, 'title 2', 'introduce 2', 0, 0, 1, 0, 0, 0, '2016-04-04 17:31:58', 86),
	(92, 148, 'delete', 'delete', 0, 0, 1, 0, 0, 0, '2016-04-04 17:31:58', 43);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;


-- Dumping structure for table micimpact.point
CREATE TABLE IF NOT EXISTS `point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `login_times` int(11) DEFAULT '0',
  `comment_times` int(11) DEFAULT '0',
  `share_times` int(11) DEFAULT '0',
  `see_content_times` int(11) DEFAULT '0',
  `creatAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Dumping data for table micimpact.point: ~0 rows (approximately)
DELETE FROM `point`;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
