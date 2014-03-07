-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2014 at 05:56 PM
-- Server version: 5.1.73
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `irm`
--

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `ID` int(11) unsigned NOT NULL DEFAULT '0',
  `notifyassignedbyemail` tinyint(4) NOT NULL DEFAULT '1',
  `notifynewtrackingbyemail` tinyint(4) NOT NULL DEFAULT '0',
  `newtrackingemail` char(200) NOT NULL DEFAULT 'user@host.com',
  `groups` tinyint(4) NOT NULL DEFAULT '1',
  `usenamesearch` tinyint(4) NOT NULL DEFAULT '1',
  `userupdates` tinyint(4) NOT NULL DEFAULT '1',
  `sendexpire` tinyint(4) NOT NULL DEFAULT '0',
  `showjobsonlogin` tinyint(4) NOT NULL DEFAULT '1',
  `minloglevel` tinyint(4) NOT NULL DEFAULT '5',
  `logo` char(50) NOT NULL DEFAULT 'irm-jr1.jpg',
  `snmp` tinyint(4) NOT NULL DEFAULT '0',
  `snmp_rcommunity` char(50) NOT NULL DEFAULT 'public',
  `snmp_ping` tinyint(4) NOT NULL DEFAULT '0',
  `version` char(50) NOT NULL DEFAULT '1.3.2',
  `build` char(50) NOT NULL DEFAULT '2001041201',
  `knowledgebase` tinyint(4) NOT NULL DEFAULT '1',
  `fasttrack` tinyint(4) NOT NULL DEFAULT '1',
  `anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `anon_faq` tinyint(4) NOT NULL DEFAULT '0',
  `anon_req` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_2` (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`ID`, `notifyassignedbyemail`, `notifynewtrackingbyemail`, `newtrackingemail`, `groups`, `usenamesearch`, `userupdates`, `sendexpire`, `showjobsonlogin`, `minloglevel`, `logo`, `snmp`, `snmp_rcommunity`, `snmp_ping`, `version`, `build`, `knowledgebase`, `fasttrack`, `anonymous`, `anon_faq`, `anon_req`) VALUES
(0, 1, 0, 'user@host.com', 1, 1, 1, 1, 1, 4, 'irm-jr1.jpg', 0, 'public', 0, '1.4.0', '05-01-2005', 1, 1, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
