-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Nov 2020 um 13:43
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_dawid_gostek_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_dawid_gostek_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_dawid_gostek_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `addressID` int(11) NOT NULL,
  `city` varchar(30) DEFAULT NULL,
  `postCode` varchar(10) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `housNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`addressID`, `city`, `postCode`, `street`, `housNumber`) VALUES
(1, 'Vienna', '1100', 'Quellenstrasse', 202),
(2, 'Vienna', '1110', 'Enkplatz', 3),
(3, 'Vienna', '1120', 'Etwasgasse', 20),
(4, 'Vienna', '1130', 'Linke Wien Zeile', 57),
(5, 'Vienna', '1040', 'Johan Straus Gasse', 28),
(6, 'Vienna', '1010', 'Stephansplatz', 3),
(7, 'Linz', '4030', 'Wienerstrasse', 5),
(8, 'Linz', '4030', 'Hauptstrasse', 78),
(9, 'Linz', '4030', 'Praterstrasse', 95),
(10, 'Linz', '4030', 'Johanplatz', 11),
(11, 'Linz', '4030', 'Kaisergasse', 25),
(12, 'Linz', '4030', 'Rathausplatz', 10),
(13, 'Salzburg', '5020', 'Hauptstrasse', 15),
(14, 'Salzburg', '5020', 'Kaiserplatz', 18),
(15, 'Salzburg', '5020', 'Salzgasse', 5),
(16, 'Salzburg', '5020', 'Neugasse', 95),
(17, 'Salzburg', '5020', 'Johanesgasse', 48),
(18, 'Salzburg', '5020', 'Hauptplatz', 5),
(19, 'Bregenz', '6900', 'Hauptstrasse', 48),
(20, 'Bregenz', '6900', 'Wienerstrasse', 12),
(21, 'Bregenz', '6900', 'Berggasse', 8),
(22, 'Bregenz', '6900', 'Eichenstrasse', 92),
(23, 'Bregenz', '6900', 'Landstrasse', 50),
(24, 'Bregenz', '6900', 'Hauptstrasse', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(55) DEFAULT NULL,
  `fk_addressID` int(11) DEFAULT NULL,
  `phoneNummber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customerID`, `firstName`, `lastName`, `fk_addressID`, `phoneNummber`) VALUES
(101, 'Monika', 'Bolen', 1, '669-15874692'),
(102, 'Thomas', 'Nein', 2, '669-15546469'),
(103, 'Martin', 'Schmied', 3, '699-15800698'),
(104, 'Natascha', 'Schwarz', 4, '689-15800788'),
(105, 'Thomas', 'Blau', 5, '669-14580698'),
(106, 'Martin', 'Auer', 7, '699-17463698'),
(107, 'Monika', 'Biel', 8, '698-15804825'),
(108, 'Johan', 'Schweiz', 9, '691-15473218'),
(109, 'Ann', 'Köln', 10, '685-15436518'),
(110, 'Michael', 'Klug', 11, '646-15183207'),
(111, 'Natascha', 'Kleid', 13, '689-85671029'),
(112, 'Victoria', 'Nett', 14, '679-61485307'),
(113, 'Walter', 'Neu', 15, '619-15800698'),
(114, 'Barbara', 'Blum', 16, '689-10354782'),
(115, 'Mark', 'Schwarz', 17, '677-12345678'),
(116, 'Klaus', 'Klein', 19, '664-98765432'),
(117, 'Johan', 'Staruss', 20, '655-08241657'),
(118, 'Angelika', 'Swoboda', 21, '684-90731739'),
(119, 'Nina', 'Luft', 22, '647-82463719'),
(120, 'Martin', 'Hoch', 23, '639-15935746');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `empFirstName` varchar(50) DEFAULT NULL,
  `empLastName` varchar(50) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employeeID`, `empFirstName`, `empLastName`, `role`) VALUES
(10, 'Mariam', 'Blume', 'recipient'),
(11, 'Johan', 'Braun', 'deliverer'),
(12, 'Natascha', 'Klaus', 'recipient'),
(13, 'Wiktor', 'Bull', 'deliverer'),
(14, 'Ewelina', 'Bialy', 'recipient'),
(15, 'Teodor', 'Link', 'deliverer'),
(16, 'Conrad', 'Jaki', 'recipient'),
(17, 'Bernard', 'Neu', 'deliverer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail`
--

CREATE TABLE `mail` (
  `mailID` int(11) NOT NULL,
  `fk_senderID` int(11) DEFAULT NULL,
  `fk_recipientID` int(11) DEFAULT NULL,
  `sendDate` date DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `deliverDestination` varchar(10) DEFAULT NULL,
  `fk_pickupPoint` int(11) DEFAULT NULL,
  `fk_dropOffPoint` int(11) DEFAULT NULL,
  `fk_eRecipientID` int(11) DEFAULT NULL,
  `fk_eDeliverID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `mail`
--

INSERT INTO `mail` (`mailID`, `fk_senderID`, `fk_recipientID`, `sendDate`, `deliveryDate`, `deliverDestination`, `fk_pickupPoint`, `fk_dropOffPoint`, `fk_eRecipientID`, `fk_eDeliverID`) VALUES
(10001, 101, 106, '2020-08-20', '2020-08-22', 'Post', 1001, 1002, 10, 13),
(10002, 107, 120, '2020-01-18', '2020-01-22', 'Customer', 1002, 1004, 12, 17),
(10003, 111, 102, '2020-02-25', '2020-03-01', 'Post', 1003, 1001, 14, 11),
(10004, 116, 108, '2020-05-16', '2020-05-19', 'Customer', 1004, 1002, 16, 13),
(10005, 103, 112, '2020-06-18', '2020-06-22', 'Post', 1001, 1003, 10, 15),
(10006, 109, 113, '2020-02-02', '2020-02-05', 'Customer', 1002, 1003, 12, 15),
(10007, 114, 104, '2020-09-14', '2020-09-18', 'Post', 1003, 1001, 14, 11),
(10008, 117, 105, '2020-04-16', '2020-04-19', 'Customer', 1004, 1001, 16, 11),
(10009, 118, 110, '2020-07-14', '2020-07-16', 'Post', 1004, 1002, 16, 13),
(10010, 119, 115, '2020-10-20', '2020-10-25', 'Customer', 1004, 1003, 16, 15),
(10011, 105, 107, '2020-05-08', '2020-05-12', 'Post', 1001, 1002, 10, 13),
(10012, 104, 111, '2020-06-07', '2020-06-10', 'Post', 1001, 1003, 10, 15),
(10013, 103, 118, '2020-02-28', '2020-03-05', 'Customer', 1001, 1004, 10, 17),
(10014, 102, 106, '2020-09-18', '2020-09-24', 'Post', 1001, 1002, 10, 13),
(10015, 101, 112, '2020-01-15', '2020-01-18', 'Post', 1001, 1003, 10, 15),
(10016, 106, 114, '2020-11-01', '2020-11-05', 'Post', 1002, 1003, 12, 15),
(10017, 107, 118, '2020-03-14', '2020-03-18', 'Customer', 1002, 1004, 12, 17),
(10018, 108, 103, '2020-06-16', '2020-06-20', 'Post', 1002, 1001, 12, 11),
(10019, 109, 111, '2020-04-10', '2020-04-15', 'Customer', 1002, 1003, 12, 15),
(10020, 110, 116, '2020-03-12', '2020-03-17', 'Post', 1002, 1004, 12, 17),
(10021, 111, 120, '2020-11-02', '2020-11-06', 'Post', 1003, 1004, 14, 17),
(10022, 112, 104, '2020-07-08', '2020-07-15', 'Customer', 1003, 1001, 14, 11),
(10023, 113, 107, '2020-08-01', '2020-08-06', 'Post', 1003, 1002, 14, 13),
(10024, 114, 118, '2020-03-02', '2020-03-08', 'Post', 1003, 1004, 14, 17),
(10025, 115, 103, '2020-02-03', '2020-02-07', 'Customer', 1003, 1001, 14, 11),
(10026, 116, 109, '2020-01-14', '2020-01-18', 'Post', 1004, 1002, 16, 13),
(10027, 117, 112, '2020-04-16', '2020-04-20', 'Post', 1004, 1003, 16, 15),
(10028, 118, 101, '2020-06-15', '2020-06-22', 'Customer', 1004, 1001, 16, 11),
(10029, 119, 110, '2020-05-31', '2020-06-05', 'Post', 1004, 1002, 16, 13),
(10030, 120, 111, '2020-09-14', '2020-09-20', 'Post', 1004, 1003, 16, 15);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `point`
--

CREATE TABLE `point` (
  `pointID` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `fk_addressID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `point`
--

INSERT INTO `point` (`pointID`, `name`, `fk_addressID`) VALUES
(1001, 'Post Vienna', 6),
(1002, 'Post Linz', 12),
(1003, 'Post Salzburg', 18),
(1004, 'Post Bregenz', 24);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `fk_addressID` (`fk_addressID`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indizes für die Tabelle `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`mailID`),
  ADD KEY `fk_senderID` (`fk_senderID`),
  ADD KEY `fk_recipientID` (`fk_recipientID`),
  ADD KEY `fk_pickupPoint` (`fk_pickupPoint`),
  ADD KEY `fk_dropOffPoint` (`fk_dropOffPoint`),
  ADD KEY `fk_eDeliverID` (`fk_eDeliverID`),
  ADD KEY `fk_eRecipientID` (`fk_eRecipientID`);

--
-- Indizes für die Tabelle `point`
--
ALTER TABLE `point`
  ADD PRIMARY KEY (`pointID`),
  ADD KEY `fk_addressID` (`fk_addressID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `addressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `mail`
--
ALTER TABLE `mail`
  MODIFY `mailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10031;

--
-- AUTO_INCREMENT für Tabelle `point`
--
ALTER TABLE `point`
  MODIFY `pointID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_addressID`) REFERENCES `address` (`addressID`);

--
-- Constraints der Tabelle `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`fk_senderID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`fk_recipientID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `mail_ibfk_3` FOREIGN KEY (`fk_pickupPoint`) REFERENCES `point` (`pointID`),
  ADD CONSTRAINT `mail_ibfk_4` FOREIGN KEY (`fk_dropOffPoint`) REFERENCES `point` (`pointID`),
  ADD CONSTRAINT `mail_ibfk_5` FOREIGN KEY (`fk_eDeliverID`) REFERENCES `employee` (`employeeID`),
  ADD CONSTRAINT `mail_ibfk_6` FOREIGN KEY (`fk_eRecipientID`) REFERENCES `employee` (`employeeID`);

--
-- Constraints der Tabelle `point`
--
ALTER TABLE `point`
  ADD CONSTRAINT `point_ibfk_1` FOREIGN KEY (`fk_addressID`) REFERENCES `address` (`addressID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
