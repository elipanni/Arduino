-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mag 05, 2018 alle 14:59
-- Versione del server: 5.6.15-log
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `home_sensor`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `aggiornamenti`
--

CREATE TABLE IF NOT EXISTS `aggiornamenti` (
  `CodiceAggiornamento` int(11) NOT NULL AUTO_INCREMENT,
  `Sensore` int(11) NOT NULL,
  `DataOra` datetime NOT NULL,
  `Valore` int(11) NOT NULL COMMENT 'Acceso/spento o valore temperatura',
  PRIMARY KEY (`CodiceAggiornamento`),
  KEY `Sensore` (`Sensore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggiornamento dati dei sensori' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `allarmi`
--

CREATE TABLE IF NOT EXISTS `allarmi` (
  `CodiceAllarme` int(11) NOT NULL AUTO_INCREMENT,
  `Sensore` int(11) NOT NULL,
  `DataOra` datetime NOT NULL,
  PRIMARY KEY (`CodiceAllarme`),
  KEY `Sensore` (`Sensore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `sensori`
--

CREATE TABLE IF NOT EXISTS `sensori` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(30) NOT NULL,
  `Posizione` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Indica tutti i componenti della casa' AUTO_INCREMENT=1 ;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `aggiornamenti`
--
ALTER TABLE `aggiornamenti`
  ADD CONSTRAINT `aggiornamenti_ibfk_1` FOREIGN KEY (`Sensore`) REFERENCES `sensori` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `allarmi`
--
ALTER TABLE `allarmi`
  ADD CONSTRAINT `allarmi_ibfk_1` FOREIGN KEY (`Sensore`) REFERENCES `sensori` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
