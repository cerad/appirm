-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2014 at 05:58 PM
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
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `fullname` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `building` varchar(200) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `access` varchar(32) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  PRIMARY KEY (`name`),
  KEY `type` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `password`, `fullname`, `email`, `building`, `phone`, `access`, `comments`) VALUES
('Admin', 'abcd1234', 'Administrator', 'root@localhost', 'N229/136C', 'Use e-mail', 'admin', ''),
('Guest', 'guest', 'Guest User', '', '', '', 'post-only', ''),
('IRMConnect', 'daedalus-ts', 'Special account', '', '', '', 'post-only', ''),
('Mark', 'abcd1234', 'Mark Moorcroft', 'mark.moorcroft@nasa.gov', 'N234/113', '650-604-4784', 'admin', ''),

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
