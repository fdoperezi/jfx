SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
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
  `label` varchar(250) DEFAULT '0',
  `coment` varchar(250) DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

DROP TABLE IF EXISTS `balance`;
CREATE TABLE IF NOT EXISTS `balance` (
  `account` varchar(250) DEFAULT 0,  
  `balance` varchar(250) DEFAULT 0,
  `equity` varchar(250) DEFAULT 0,
  `alias` varchar(250) DEFAULT 0,
  `linkmql` varchar(250) DEFAULT 0,  
  `time` bigint(21) NOT NULL DEFAULT '0',
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

DROP TABLE IF EXISTS `usersall`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `alias` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `country` char(2) DEFAULT NULL,
  `town` char(250) DEFAULT NULL,
  `dofb` char(10) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `account` varchar(250) DEFAULT NULL,
  `linkmql` varchar(250) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `about` text,
  `ip` text,
  `time` bigint(21) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `linkmql` (`linkmql`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# UPDATE `db`.`users` SET `account` = '2106574' WHERE `users`.`id` = 1;
# insert into users VALUES('','woow','M','L', md5('pass'),'hello@xxxxxx.com', 'PL','Town','1234567891',0,'0000000',0,0,0,0);
