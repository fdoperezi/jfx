-- MySQL dump 10.13  Distrib 5.5.40, for Win64 (x86)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	5.5.40

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

CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db`;

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance` (
  `account` varchar(250) DEFAULT '0',
  `balance` varchar(250) DEFAULT '0',
  `equity` varchar(250) DEFAULT '0',
  `alias` varchar(250) DEFAULT '0',
  `linkmql` varchar(250) DEFAULT '0',
  `time` bigint(21) NOT NULL DEFAULT '0',
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance`
--

LOCK TABLES `balance` WRITE;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
INSERT INTO `balance` VALUES ('21022948','106.77','94.32','woow','http://www.mql5.com/en/signals/72948',1418465013);
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` varchar(250) DEFAULT NULL,
  `symbol` varchar(250) DEFAULT '0',
  `volume` float DEFAULT '0',
  `type` varchar(250) DEFAULT '0',
  `opent` bigint(21) NOT NULL DEFAULT '0',
  `openp` float DEFAULT '0',
  `sl` float DEFAULT '0',
  `tp` float DEFAULT '0',
  `closet` bigint(21) NOT NULL DEFAULT '0',
  `closep` float DEFAULT '0',
  `profit` float DEFAULT '0',
  `time` bigint(21) NOT NULL DEFAULT '0',
  `account` varchar(250) DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('53167528','EURUSD',0.01,'buy',1418396036,1.24403,0,0,0,0,1.42,1418401414,'21022948'),('53138614','GBPJPY',0.01,'buy',1418322436,187.627,0,0,0,0,-9.54,1418401414,'21022948'),('53138562','USDJPY',0.01,'buy',1418322319,119.428,0,0,0,0,-6.58,1418401414,'21022948'),('53176466','GBPJPY',0.01,'buy',1418408533,186.218,185.861,0,0,0,2.34,1418401414,'21022948'),('53119665','USDJPY',0.01,'buy',1418296595,118.359,0,0,1418314056,118.794,3.66,1418401414,'21022948'),('53132916','EURUSD',0.01,'buy',1418314047,1.24058,0,0,1418395217,1.24406,3.48,1418401414,'21022948'),('53161967','GBPUSD',0.01,'buy',1418385860,1.57149,1.57,0,1418407024,1.56999,-1.5,1418401414,'21022948'),('53162016','GBPJPY',0.01,'buy',1418385977,186.133,0,0,1418386213,186.069,-0.54,1418401414,'21022948'),('53165159','GBPJPY',0.01,'buy',1418391985,185.923,0,0,1418395196,186.125,1.71,1418401414,'21022948');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `alias` varchar(250) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `account` varchar(250) DEFAULT '',
  `linkmql` varchar(250) DEFAULT '',
  `mobile` text,
  `allowfrom` text,
  `about` text,
  `ip` text,
  `time` bigint(21) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `linkmql` (`linkmql`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'woow','1a1dc91c907325c69271ddf0c944bc72','hello@breakermind.com','PL','21022948','http://www.mql5.com/en/signals/72948','0','0','0','0',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-13 11:03:35
