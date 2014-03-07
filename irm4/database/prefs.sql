-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2014 at 05:57 PM
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
-- Table structure for table `prefs`
--

CREATE TABLE IF NOT EXISTS `prefs` (
  `user` varchar(80) NOT NULL DEFAULT '',
  `type` enum('no','yes') NOT NULL DEFAULT 'no',
  `os` enum('no','yes') NOT NULL DEFAULT 'no',
  `osver` enum('no','yes') NOT NULL DEFAULT 'no',
  `processor` enum('no','yes') NOT NULL DEFAULT 'no',
  `processor_speed` enum('no','yes') NOT NULL DEFAULT 'no',
  `building` enum('no','yes') NOT NULL DEFAULT 'no',
  `serial` enum('no','yes') NOT NULL DEFAULT 'no',
  `model` enum('no','yes') NOT NULL DEFAULT 'no',
  `aorder` enum('no','yes') NOT NULL DEFAULT 'no',
  `purchdate` enum('no','yes') NOT NULL DEFAULT 'no',
  `ramtype` enum('no','yes') NOT NULL DEFAULT 'no',
  `ram` enum('no','yes') NOT NULL DEFAULT 'no',
  `network` enum('no','yes') NOT NULL DEFAULT 'no',
  `ip` enum('no','yes') NOT NULL DEFAULT 'no',
  `mac` enum('no','yes') NOT NULL DEFAULT 'no',
  `hdspace` enum('no','yes') NOT NULL DEFAULT 'no',
  `owner` enum('no','yes') NOT NULL DEFAULT 'no',
  `room` enum('no','yes') NOT NULL DEFAULT 'no',
  `comments` enum('no','yes') NOT NULL DEFAULT 'no',
  `date_mod` enum('no','yes') NOT NULL DEFAULT 'no',
  `advanced_tracking` enum('no','yes') NOT NULL DEFAULT 'no',
  `tracking_order` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prefs`
--

INSERT INTO `prefs` (`user`, `type`, `os`, `osver`, `processor`, `processor_speed`, `building`, `serial`, `model`, `aorder`, `purchdate`, `ramtype`, `ram`, `network`, `ip`, `mac`, `hdspace`, `owner`, `room`, `comments`, `date_mod`, `advanced_tracking`, `tracking_order`) VALUES
('Admin', 'yes', '', '', '', '', 'yes', '', 'yes', 'yes', 'yes', '', '', '', '', '', '', 'yes', 'yes', '', '', 'yes', ''),
('Mark', '', '', '', '', '', '', '', 'no', '', 'no', '', '', '', '', '', '', '', '', '', '', 'yes', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
