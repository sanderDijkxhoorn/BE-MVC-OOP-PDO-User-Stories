-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 12 sep 2022 om 08:34
-- Serverversie: 5.7.31
-- PHP-versie: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvcframework`
--
CREATE DATABASE IF NOT EXISTS `mvcframework` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mvcframework`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `capitalCity` varchar(300) NOT NULL,
  `continent` enum('Afrika','Antartica','Azie','Australie/Oceanie','Europa','Noord-Amerika','Zuid-Amerika') NOT NULL,
  `population` int(10) UNSIGNED NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `country`
--

INSERT INTO `country` (`id`, `name`, `capitalCity`, `continent`, `population`, `datetime`) VALUES
(39, 'Chinaa', 'Bejing', 'Australie/Oceanie', 1234000000, NULL),
(58, 'Tanzania', 'Dodoma', 'Afrika', 59730000, NULL),
(47, 'Japan', 'Tokyo', 'Azie', 1230000000, NULL),
(73, 'Senegal', 'Dakar', 'Afrika', 16740001, NULL),
(90, 's', 'qw', 'Europa', 234, NULL),
(62, 'Zwitserland', 'Bern', 'Europa', 4294267295, NULL),
(81, 'Duitsland', 'Berlijn', 'Europa', 60000000, NULL),
(87, 'Nederland', 'Amsterdam', 'Europa', 800000, NULL),
(89, 'Belgie', 'Brussel', 'Antartica', 1230000000, '2022-06-22 07:37:37'),
(91, 'Belgi&euml;', 'Br&uuml;ssel', 'Europa', 3424, NULL),
(92, 'Australi&euml;', 'Canberra', 'Azie', 234, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `countrys`
--

DROP TABLE IF EXISTS `countrys`;
CREATE TABLE IF NOT EXISTS `countrys` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `capitalCity` varchar(300) NOT NULL,
  `continent` enum('Afrika','Antarctica','Azië','Australië/Oceanië','Europa','Noord-Amerika','Zuid-Amerika') NOT NULL,
  `population` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `countrys`
--

INSERT INTO `countrys` (`id`, `name`, `capitalCity`, `continent`, `population`) VALUES
(3, 'Chilies', 'Santiagos', 'Noord-Amerika', 19116203),
(4, 'Canada', 'Ottawa', 'Noord-Amerika', 37742154),
(5, 'Australië', 'Canberra', 'Australië/Oceanië', 25499884),
(6, 'China', 'Beijing', 'Azië', 1439323776),
(16, 'Nederland', 'Amsterdam', 'Europa', 170000000);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fruit`
--

DROP TABLE IF EXISTS `fruit`;
CREATE TABLE IF NOT EXISTS `fruit` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color` varchar(50) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `fruit`
--

INSERT INTO `fruit` (`id`, `name`, `color`, `price`) VALUES
(3, 'Paprikaatje', 'roodbruin', 2.45),
(4, 'Citroen', 'geel', 1.67),
(5, 'Aardbei', 'rood', 2.56),
(6, 'Peer', 'groen', 0.88);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
