USE `mvcframework`;


CREATE TABLE IF NOT EXISTS `Leerling1` (
    `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Naam` varchar(50) NOT NULL,
    `Woonplaats` varchar(100) NOT NULL,
    `Postcode` varchar(6) NOT NULL,
    `Straat` varchar(100) NOT NULL,
    PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `Instructeur` (
    `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Email` varchar(50) NOT NULL,
    `Naam` varchar(100) NOT NULL,
    PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `Les` (
    `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Datum` datetime,
    `LeerlingId` int(10) UNSIGNED NOT NULL,
    `InstructeurId` int(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`Id`)
    FOREIGN KEY (`LeerlingID`) REFERENCES `Leerling1` (`Id`),
    FOREIGN KEY (`InstructeurID`) REFERENCES `Instructeur` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `AnnuleerLes` (
    `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `LesId` int(10) UNSIGNED NOT NULL,
    `Reden` varchar(100) NOT NULL,
    PRIMARY KEY (`Id`),
    FOREIGN KEY (`LesID`) REFERENCES `Les` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2343 DEFAULT CHARSET=latin1;

INSERT INTO `Leerling1` (`Id`, `Naam`, `Woonplaats`, `Postcode`, `Straat`) VALUES
(3, 'Konijn', 'Utrecht', '3590UV', 'Laan 45'),
(4, 'Slavink', 'Nieuwegein', '3678II', 'Overweg 7'),
(6, 'Otto', 'Houten', '3822AS', 'Groenlo 44');

INSERT INTO `Instructeur` (`Id`, `Email`, `Naam`) VALUES
(3, 'groen@mail.nl', 'Groen'),
(4, 'konijn@google.com', 'Konijn'),
(6, 'frasi@google.sp', 'Frasi');

INSERT INTO `Les` (`Datum`, `LeerlingId`, `InstructeurId`)  VALUES 
('2022-05-20 12:00:00', 3, 3),
('2022-05-20 09:00:00', 6, 6),
('2022-05-21 16:00:00', 4, 4),
('2022-05-21 12:00:00', 6, 6),
('2022-05-22 13:00:00', 3, 3),
('2022-05-28 18:00:00', 4, 4),
('2022-06-01 19:00:00', 3, 4),
('2022-06-12 21:00:00', 3, 3),
('2022-06-22 16:00:00', 3, 3),
('2022-06-24 12:00:00', 4, 4),
('2022-06-24 10:00:00', 3, 3),
('2022-06-28 14:00:00', 3, 6);

INSERT INTO `AnnuleerLes` (`LesId`, `Reden`) VALUES
(45, 'Groen'),
(50, 'Konijn'),
(52, 'Frasi');

-- DROP TABLE IF EXISTS `AnnuleerLes`;
-- DROP TABLE IF EXISTS `Les`;
-- DROP TABLE IF EXISTS `Instructeur`;
-- DROP TABLE IF EXISTS `Leerling1`;
