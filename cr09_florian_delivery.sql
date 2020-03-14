-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Mrz 2020 um 21:42
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_florian_delivery`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `area`
--

CREATE TABLE `area` (
  `id_area` int(11) NOT NULL,
  `fk_postman` int(11) DEFAULT NULL,
  `area_nr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `area`
--

INSERT INTO `area` (`id_area`, `fk_postman`, `area_nr`) VALUES
(1, 2, 407),
(2, 1, 402),
(3, 2, 460),
(4, 4, 370),
(5, 3, 350),
(6, 4, 307);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `basis_center`
--

CREATE TABLE `basis_center` (
  `id_basis_center` int(11) NOT NULL,
  `fk_delivery_basis` int(11) DEFAULT NULL,
  `fk_delivery_center` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `basis_center`
--

INSERT INTO `basis_center` (`id_basis_center`, `fk_delivery_basis`, `fk_delivery_center`) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 2, 2),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery_basis`
--

CREATE TABLE `delivery_basis` (
  `id_delivery_basis` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel_number` int(11) DEFAULT NULL,
  `fk_postbox` int(11) DEFAULT NULL,
  `fk_zip` int(11) DEFAULT NULL,
  `fk_area` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `delivery_basis`
--

INSERT INTO `delivery_basis` (`id_delivery_basis`, `address`, `tel_number`, `fk_postbox`, `fk_zip`, `fk_area`) VALUES
(1, 'hinternhaufen 1', 323465444, 1, 2, 1),
(2, 'tante 1', 2147483647, 2, 4, 3),
(3, 'haupt 1', 678965444, 3, 5, 4),
(4, 'paltz 1', 2147483647, 4, 7, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery_center`
--

CREATE TABLE `delivery_center` (
  `id_delivery_center` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `delivery_center`
--

INSERT INTO `delivery_center` (`id_delivery_center`, `address`, `tel_number`) VALUES
(1, 'fuchshaufen 12', 45673233),
(2, 'scheibenkleister 12', 14785236);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kind_of_objekt`
--

CREATE TABLE `kind_of_objekt` (
  `id_kind_of_objekt` int(11) NOT NULL,
  `fk_letter` int(11) DEFAULT NULL,
  `quantity_letter` int(11) DEFAULT NULL,
  `fk_package` int(11) DEFAULT NULL,
  `quantity_package` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kind_of_objekt`
--

INSERT INTO `kind_of_objekt` (`id_kind_of_objekt`, `fk_letter`, `quantity_letter`, `fk_package`, `quantity_package`) VALUES
(2, 2, 1, NULL, NULL),
(3, NULL, NULL, 3, 1),
(4, 2, 1, NULL, NULL),
(5, 4, 1, 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `letter`
--

CREATE TABLE `letter` (
  `id_letter` int(11) NOT NULL,
  `weight` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `letter`
--

INSERT INTO `letter` (`id_letter`, `weight`) VALUES
(1, 50),
(2, 100),
(3, 150),
(4, 200);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `objekt`
--

CREATE TABLE `objekt` (
  `id_objekt` int(11) NOT NULL,
  `fk_sender` int(11) DEFAULT NULL,
  `fk_recipient` int(11) DEFAULT NULL,
  `fk_kind_of_objekt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `objekt`
--

INSERT INTO `objekt` (`id_objekt`, `fk_sender`, `fk_recipient`, `fk_kind_of_objekt`) VALUES
(5, 2, 4, 2),
(6, 4, 1, 4),
(7, 3, 2, 3),
(8, 2, 3, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `id_package` int(11) NOT NULL,
  `wight` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`id_package`, `wight`) VALUES
(1, 500),
(2, 1000),
(3, 1500),
(4, 2000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pass_control`
--

CREATE TABLE `pass_control` (
  `id_pass_control` int(11) NOT NULL,
  `received_mail` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_delivery_basis` int(11) DEFAULT NULL,
  `fk_objekt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `pass_control`
--

INSERT INTO `pass_control` (`id_pass_control`, `received_mail`, `fk_delivery_basis`, `fk_objekt`) VALUES
(1, '2020-03-14 20:30:57', 1, 5),
(2, '2020-03-14 20:30:57', 2, 8),
(3, '2020-03-14 20:30:57', 3, 6),
(4, '2020-03-14 20:30:57', 4, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `postbox`
--

CREATE TABLE `postbox` (
  `id_postbox` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `postbox`
--

INSERT INTO `postbox` (`id_postbox`, `address`) VALUES
(1, 'rasen 12'),
(2, 'wiese 12'),
(3, 'laub 12'),
(4, 'wald 12');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `postman`
--

CREATE TABLE `postman` (
  `id_postman` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id_postcar` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `postman`
--

INSERT INTO `postman` (`id_postman`, `name`, `id_postcar`) VALUES
(1, 'fritz', 12),
(2, 'manfred', 3),
(3, 'ferdl', 21),
(4, 'fungus', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `id_recipient` int(11) NOT NULL,
  `first_name_recipient` varchar(50) DEFAULT NULL,
  `last_name_recipient` varchar(50) DEFAULT NULL,
  `address_recipient` varchar(100) DEFAULT NULL,
  `fk_zip_recipient` int(11) DEFAULT NULL,
  `fk_area_recipient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`id_recipient`, `first_name_recipient`, `last_name_recipient`, `address_recipient`, `fk_zip_recipient`, `fk_area_recipient`) VALUES
(1, 'mozart', 'fredl', 'salzgasse_12', 3, 1),
(2, 'amadeus', 'özi', 'burggasse_15', 2, 2),
(3, 'fade', 'gschicht', 'dasganze_122', 5, 5),
(4, 'zeug', 'austauschen', 'dodagasse_136', 6, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sender`
--

CREATE TABLE `sender` (
  `id_sender` int(11) NOT NULL,
  `first_name_sender` varchar(50) DEFAULT NULL,
  `last_name_sender` varchar(50) DEFAULT NULL,
  `address_sender` varchar(100) DEFAULT NULL,
  `fk_zip_sender` int(11) DEFAULT NULL,
  `fk_area_sender` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `sender`
--

INSERT INTO `sender` (`id_sender`, `first_name_sender`, `last_name_sender`, `address_sender`, `fk_zip_sender`, `fk_area_sender`) VALUES
(2, 'michael', 'fischer', 'irgendwogasse_12', 7, 4),
(3, 'berta', 'meier', 'wogasse_12', 5, 5),
(4, 'alm', 'öhie', 'berg_12', 2, 1),
(5, 'heidi', 'öhie', 'berg_16', 2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zip`
--

CREATE TABLE `zip` (
  `id_zip` int(11) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip_nr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `zip`
--

INSERT INTO `zip` (`id_zip`, `country`, `zip_nr`) VALUES
(1, 'hintertupfing', 3975),
(2, 'hintertupfing', 3913),
(3, 'hintertupfing', 3924),
(4, 'hintertupfing', 3995),
(5, 'almwiesn', 4075),
(6, 'almwiesn', 4075),
(7, 'almwiesn', 4075);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`),
  ADD KEY `fk_postman` (`fk_postman`);

--
-- Indizes für die Tabelle `basis_center`
--
ALTER TABLE `basis_center`
  ADD PRIMARY KEY (`id_basis_center`),
  ADD KEY `fk_delivery_basis` (`fk_delivery_basis`),
  ADD KEY `fk_delivery_center` (`fk_delivery_center`);

--
-- Indizes für die Tabelle `delivery_basis`
--
ALTER TABLE `delivery_basis`
  ADD PRIMARY KEY (`id_delivery_basis`),
  ADD KEY `fk_postbox` (`fk_postbox`),
  ADD KEY `fk_zip` (`fk_zip`),
  ADD KEY `fk_area` (`fk_area`);

--
-- Indizes für die Tabelle `delivery_center`
--
ALTER TABLE `delivery_center`
  ADD PRIMARY KEY (`id_delivery_center`);

--
-- Indizes für die Tabelle `kind_of_objekt`
--
ALTER TABLE `kind_of_objekt`
  ADD PRIMARY KEY (`id_kind_of_objekt`),
  ADD KEY `fk_letter` (`fk_letter`),
  ADD KEY `fk_package` (`fk_package`);

--
-- Indizes für die Tabelle `letter`
--
ALTER TABLE `letter`
  ADD PRIMARY KEY (`id_letter`);

--
-- Indizes für die Tabelle `objekt`
--
ALTER TABLE `objekt`
  ADD PRIMARY KEY (`id_objekt`),
  ADD KEY `fk_sender` (`fk_sender`),
  ADD KEY `fk_recipient` (`fk_recipient`),
  ADD KEY `fk_kind_of_objekt` (`fk_kind_of_objekt`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id_package`);

--
-- Indizes für die Tabelle `pass_control`
--
ALTER TABLE `pass_control`
  ADD PRIMARY KEY (`id_pass_control`),
  ADD KEY `fk_delivery_basis` (`fk_delivery_basis`),
  ADD KEY `fk_objekt` (`fk_objekt`);

--
-- Indizes für die Tabelle `postbox`
--
ALTER TABLE `postbox`
  ADD PRIMARY KEY (`id_postbox`);

--
-- Indizes für die Tabelle `postman`
--
ALTER TABLE `postman`
  ADD PRIMARY KEY (`id_postman`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`id_recipient`),
  ADD KEY `fk_zip_recipient` (`fk_zip_recipient`),
  ADD KEY `fk_area_recipient` (`fk_area_recipient`);

--
-- Indizes für die Tabelle `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`id_sender`),
  ADD KEY `fk_zip_sender` (`fk_zip_sender`),
  ADD KEY `fk_area_sender` (`fk_area_sender`);

--
-- Indizes für die Tabelle `zip`
--
ALTER TABLE `zip`
  ADD PRIMARY KEY (`id_zip`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `basis_center`
--
ALTER TABLE `basis_center`
  MODIFY `id_basis_center` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `delivery_basis`
--
ALTER TABLE `delivery_basis`
  MODIFY `id_delivery_basis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `delivery_center`
--
ALTER TABLE `delivery_center`
  MODIFY `id_delivery_center` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `kind_of_objekt`
--
ALTER TABLE `kind_of_objekt`
  MODIFY `id_kind_of_objekt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `letter`
--
ALTER TABLE `letter`
  MODIFY `id_letter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `objekt`
--
ALTER TABLE `objekt`
  MODIFY `id_objekt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `id_package` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `pass_control`
--
ALTER TABLE `pass_control`
  MODIFY `id_pass_control` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `postbox`
--
ALTER TABLE `postbox`
  MODIFY `id_postbox` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `postman`
--
ALTER TABLE `postman`
  MODIFY `id_postman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `recipient`
--
ALTER TABLE `recipient`
  MODIFY `id_recipient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `sender`
--
ALTER TABLE `sender`
  MODIFY `id_sender` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `zip`
--
ALTER TABLE `zip`
  MODIFY `id_zip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `area_ibfk_1` FOREIGN KEY (`fk_postman`) REFERENCES `postman` (`id_postman`);

--
-- Constraints der Tabelle `basis_center`
--
ALTER TABLE `basis_center`
  ADD CONSTRAINT `basis_center_ibfk_1` FOREIGN KEY (`fk_delivery_basis`) REFERENCES `delivery_basis` (`id_delivery_basis`),
  ADD CONSTRAINT `basis_center_ibfk_2` FOREIGN KEY (`fk_delivery_center`) REFERENCES `delivery_center` (`id_delivery_center`);

--
-- Constraints der Tabelle `delivery_basis`
--
ALTER TABLE `delivery_basis`
  ADD CONSTRAINT `delivery_basis_ibfk_1` FOREIGN KEY (`fk_postbox`) REFERENCES `postbox` (`id_postbox`),
  ADD CONSTRAINT `delivery_basis_ibfk_2` FOREIGN KEY (`fk_zip`) REFERENCES `zip` (`id_zip`),
  ADD CONSTRAINT `delivery_basis_ibfk_3` FOREIGN KEY (`fk_area`) REFERENCES `area` (`id_area`);

--
-- Constraints der Tabelle `kind_of_objekt`
--
ALTER TABLE `kind_of_objekt`
  ADD CONSTRAINT `kind_of_objekt_ibfk_1` FOREIGN KEY (`fk_letter`) REFERENCES `letter` (`id_letter`),
  ADD CONSTRAINT `kind_of_objekt_ibfk_2` FOREIGN KEY (`fk_package`) REFERENCES `package` (`id_package`);

--
-- Constraints der Tabelle `objekt`
--
ALTER TABLE `objekt`
  ADD CONSTRAINT `objekt_ibfk_1` FOREIGN KEY (`fk_sender`) REFERENCES `sender` (`id_sender`),
  ADD CONSTRAINT `objekt_ibfk_2` FOREIGN KEY (`fk_recipient`) REFERENCES `recipient` (`id_recipient`),
  ADD CONSTRAINT `objekt_ibfk_3` FOREIGN KEY (`fk_kind_of_objekt`) REFERENCES `kind_of_objekt` (`id_kind_of_objekt`);

--
-- Constraints der Tabelle `pass_control`
--
ALTER TABLE `pass_control`
  ADD CONSTRAINT `pass_control_ibfk_1` FOREIGN KEY (`fk_delivery_basis`) REFERENCES `delivery_basis` (`id_delivery_basis`),
  ADD CONSTRAINT `pass_control_ibfk_2` FOREIGN KEY (`fk_objekt`) REFERENCES `objekt` (`id_objekt`);

--
-- Constraints der Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_zip_recipient`) REFERENCES `zip` (`id_zip`),
  ADD CONSTRAINT `recipient_ibfk_2` FOREIGN KEY (`fk_area_recipient`) REFERENCES `area` (`id_area`);

--
-- Constraints der Tabelle `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_zip_sender`) REFERENCES `zip` (`id_zip`),
  ADD CONSTRAINT `sender_ibfk_2` FOREIGN KEY (`fk_area_sender`) REFERENCES `area` (`id_area`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
