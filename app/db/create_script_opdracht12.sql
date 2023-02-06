-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 30 jan 2023 om 05:57
-- Serverversie: 5.7.31
-- PHP-versie: 8.1.10

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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Instructeur1`
--

DROP TABLE IF EXISTS `Instructeur1`;
CREATE TABLE IF NOT EXISTS `Instructeur1` (
  `Id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) NOT NULL,
  `Tussenvoegsel` varchar(12) NOT NULL,
  `Achternaam` varchar(50) NOT NULL,
  `Mobiel` varchar(12) NOT NULL,
  `DatumInDienst` date NOT NULL,
  `AantalSterren` varchar(5) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Instructeur1`
--

INSERT INTO `Instructeur1` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`, `DatumInDienst`, `AantalSterren`) VALUES
(1, 'Li', '', 'Zhan', '06-28493827', '2015-04-17', '***'),
(2, 'Leroy', '', 'Boerhaven', '06-39398734', '2018-06-25', '*'),
(3, 'Yoeri', 'Van', 'Veen', '06-24383291', '2010-05-12', '***'),
(4, 'Bert', 'Van', 'Sali', '06-48293823', '2023-01-10', '****'),
(5, 'Mohammed', 'El', 'Yassidi', '06-34291234', '2010-06-14', '*****');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TypeVoertuig`
--

DROP TABLE IF EXISTS `TypeVoertuig`;
CREATE TABLE IF NOT EXISTS `TypeVoertuig` (
  `Id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TypeVoertuig` varchar(50) NOT NULL,
  `Rijbewijscategorie` varchar(2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `TypeVoertuig`
--

INSERT INTO `TypeVoertuig` (`Id`, `TypeVoertuig`, `Rijbewijscategorie`) VALUES
(1, 'Personenauto', 'B'),
(2, 'Vrachtwagen', 'C'),
(3, 'Bus', 'D'),
(4, 'Bromfiets', 'AM');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Voertuig`
--

DROP TABLE IF EXISTS `Voertuig`;
CREATE TABLE IF NOT EXISTS `Voertuig` (
  `Id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(12) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Bouwjaar` varchar(10) NOT NULL,
  `Brandstof` varchar(10) NOT NULL,
  `TypeVoertuigId` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id` (`TypeVoertuigId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Voertuig`
--

INSERT INTO `Voertuig` (`Id`, `Kenteken`, `Type`, `Bouwjaar`, `Brandstof`, `TypeVoertuigId`) VALUES
(1, 'AU-67-IO', 'Volkswagen', '12-06-2017', 'Diesel', 1),
(2, 'TR-24-OP', 'DAF', '23-05-2019', 'Diesel', 2),
(3, 'TH-78-KL', 'Mercedes', '01-01-2023', 'Benzine', 1),
(4, '90-KL-TR', 'Fiat 500', '12-09-2021', 'Benzine', 1),
(5, '34-TK-LP', 'Scania', '13-03-2015', 'Diesel', 2),
(6, 'YY-OP-78', 'BMW M5', '13-05-2022', 'Diesel', 1),
(7, 'UU-HH-JK', 'M.A.N', '03-12-2017', 'Diesel', 2),
(8, 'ST-FZ-28', 'Citroën', '20-01-2018', 'Elektrisch', 1),
(9, '123-FR-T', 'Piaggio ZIP', '01-02-2021', 'Benzine', 4),
(10, 'DRS-52-P', 'Vespa', '21-03-2022', 'Benzine', 4),
(11, 'STP-12-U', 'Kymco', '02-07-2022', 'Benzine', 4),
(12, '45-SD-23', 'Renault', '01-01-2023', 'Diesel', 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `VoertuigInstructeur`
--

DROP TABLE IF EXISTS `VoertuigInstructeur`;
CREATE TABLE IF NOT EXISTS `VoertuigInstructeur` (
  `Id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `VoertuigId` smallint(5) UNSIGNED NOT NULL,
  `Instructeur1Id` smallint(5) UNSIGNED NOT NULL,
  `DatumToekenning` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_VoertuigInstructeur_VoertuigId_Voertuig_Id` (`VoertuigId`),
  KEY `FK_VoertuigInstructeur_Instructeur1Id_Instructeur1_Id` (`Instructeur1Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `VoertuigInstructeur`
--

INSERT INTO `VoertuigInstructeur` (`Id`, `VoertuigId`, `Instructeur1Id`, `DatumToekenning`) VALUES
(1, 1, 5, '2017-06-18'),
(2, 3, 1, '2021-09-26'),
(3, 9, 1, '2021-09-27'),
(4, 3, 4, '2022-08-01'),
(5, 5, 1, '2019-08-30'),
(6, 10, 5, '2020-02-02');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `Voertuig`
--
ALTER TABLE `Voertuig`
  ADD CONSTRAINT `FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id` FOREIGN KEY (`TypeVoertuigId`) REFERENCES `TypeVoertuig` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `VoertuigInstructeur`
--
ALTER TABLE `VoertuigInstructeur`
  ADD CONSTRAINT `FK_VoertuigInstructeur_Instructeur1Id_Instructeur1_Id` FOREIGN KEY (`Instructeur1Id`) REFERENCES `Instructeur1` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VoertuigInstructeur_VoertuigId_Voertuig_Id` FOREIGN KEY (`VoertuigId`) REFERENCES `Voertuig` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
