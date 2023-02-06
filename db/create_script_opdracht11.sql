USE `mvcframework`;

DROP TABLE IF EXISTS VoertuigInstructeur;
DROP TABLE IF EXISTS Voertuig;
DROP TABLE IF EXISTS TypeVoertuig;
DROP TABLE IF EXISTS Instructeur1;


CREATE TABLE TypeVoertuig
(
     Id                 SMALLINT    UNSIGNED    NOT NULL    AUTO_INCREMENT
    ,TypeVoertuig       VARCHAR(50)             NOT NULL
    ,Rijbewijscategorie VARCHAR(2)              NOT NULL

    ,CONSTRAINT PK_TypeVoertuig_Id PRIMARY KEY TypeVoertuig(Id)
)ENGINE=InnoDB;

INSERT INTO TypeVoertuig
(
     Id 
    ,TypeVoertuig
    ,Rijbewijscategorie
)
VALUES
 (1,	'Personenauto', 'B')
,(2,	'Vrachtwagen',	'C')
,(3,	'Bus',	        'D')
,(4,	'Bromfiets',	'AM');


-- DROP TABLE IF EXISTS Voertuig;

CREATE TABLE Voertuig
(
     Id                 SMALLINT       UNSIGNED     NOT NULL    AUTO_INCREMENT
    ,Kenteken           VARCHAR(12)                 NOT NULL    
    ,Type               VARCHAR(50)                 NOT NULL
    ,Bouwjaar	        VARCHAR(10)                 NOT NULL
    ,Brandstof	        VARCHAR(10)                 NOT NULL
    ,TypeVoertuigId     SMALLINT        UNSIGNED    NOT NULL

    ,CONSTRAINT PK_Voertuig_Id PRIMARY KEY (Id)
    ,CONSTRAINT FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id FOREIGN KEY (TypeVoertuigId) REFERENCES TypeVoertuig(Id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO Voertuig 
(
     Kenteken    
    ,Type 
    ,Bouwjaar
    ,Brandstof
    ,TypeVoertuigId 
)
VALUES
 ('AU-67-IO',	'Volkswagen',   '12-06-2017', 'Diesel', 1)
,('TR-24-OP',	'DAF',  '23-05-2019',	'Diesel',	2)
,('TH-78-KL',	'Mercedes',	'01-01-2023',	'Benzine',	1)
,('90-KL-TR',	'Fiat 500',	'12-09-2021',	'Benzine',	1)
,('34-TK-LP',	'Scania',	'13-03-2015',	'Diesel',	2)
,('YY-OP-78',	'BMW M5',	'13-05-2022',	'Diesel',	1)
,('UU-HH-JK',	'M.A.N',	'03-12-2017',	'Diesel',	2)
,('ST-FZ-28',	'Citroën',	'20-01-2018',	'Elektrisch',	1)
,('123-FR-T',	'Piaggio ZIP',  '01-02-2021',	'Benzine',	4)
,('DRS-52-P',	'Vespa',	'21-03-2022',	'Benzine',	4)
,('STP-12-U',	'Kymco',	'02-07-2022',	'Benzine',	4)
,('45-SD-23',	'Renault',	'01-01-2023',	'Diesel',	3);


-- DROP TABLE IF EXISTS VoertuigInstructeur;
-- DROP TABLE IF EXISTS Instructeur1;

CREATE TABLE Instructeur1
(
     Id             SMALLINT    UNSIGNED    NOT NULL    AUTO_INCREMENT
    ,Voornaam       VARCHAR(50)             NOT NULL
    ,Tussenvoegsel  VARCHAR(12)             NOT NULL
    ,Achternaam     VARCHAR(50)             NOT NULL
    ,Mobiel         VARCHAR(12)             NOT NULL
    ,DatumInDienst  DATE                    NOT NULL
    ,AantalSterren  VARCHAR(5)              NOT NULL

    ,CONSTRAINT PK_Instructeur1_Id PRIMARY KEY Instructeur1(Id)
)ENGINE=InnoDB;

INSERT INTO Instructeur1
(
     Voornaam
    ,Tussenvoegsel
    ,Achternaam
    ,Mobiel
    ,DatumInDienst
    ,AantalSterren
)
VALUES
 ('Li',	'',	'Zhan',	'06-28493827',	'2015-04-17',	'***')
, ('Leroy',	'',	'Boerhaven',	'06-39398734',	'2018-06-25',	'*')
,('Yoeri',	'Van',	'Veen',	'06-24383291',	'2010-05-12',	'***')
,('Bert',	'Van', 	'Sali',	'06-48293823',	'2023-01-10',	'****')
,('Mohammed',	'El',	'Yassidi',	'06-34291234',	'2010-06-14',	'*****');





CREATE TABLE VoertuigInstructeur
( 
     Id                 SMALLINT     UNSIGNED       NOT NULL        AUTO_INCREMENT
    ,VoertuigId         SMALLINT    UNSIGNED        NOT NULL
    ,Instructeur1Id      SMALLINT    UNSIGNED        NOT NULL
    ,DatumToekenning    DATE

    ,CONSTRAINT PK_VoertuigInstructeur_Id PRIMARY KEY VoertuigInstructeur(Id)
    ,CONSTRAINT FK_VoertuigInstructeur_VoertuigId_Voertuig_Id FOREIGN KEY (VoertuigId) REFERENCES Voertuig(Id) ON DELETE CASCADE ON UPDATE CASCADE
    ,CONSTRAINT FK_VoertuigInstructeur_Instructeur1Id_Instructeur1_Id FOREIGN KEY (Instructeur1Id) REFERENCES Instructeur1(Id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

INSERT INTO VoertuigInstructeur
(
     VoertuigId
    ,Instructeur1Id
    ,DatumToekenning
)
VALUES
 (1,	5,	'2017-06-18')
,(3,	1,	'2021-09-26')
,(9,	1,	'2021-09-27')
,(3,	4,	'2022-08-01')
,(5,	1,	'2019-08-30')
,(10,	5,	'2020-02-02');


