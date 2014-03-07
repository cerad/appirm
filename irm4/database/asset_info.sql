-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2014 at 05:55 PM
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
-- Table structure for table `asset_info`
--

CREATE TABLE IF NOT EXISTS `asset_info` (
  `asset_info_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(128) NOT NULL DEFAULT '',
  `col1` varchar(30) NOT NULL DEFAULT '',
  `col2` varchar(30) NOT NULL DEFAULT '',
  `template` enum('no','yes') NOT NULL DEFAULT 'no',
  `required` varchar(30) NOT NULL DEFAULT '',
  `defaults` varchar(120) NOT NULL DEFAULT '',
  `log_max` tinyint(4) NOT NULL DEFAULT '0',
  `dropfield` varchar(120) NOT NULL DEFAULT '',
  `sort_default` varchar(20) NOT NULL DEFAULT '',
  `protect` varchar(120) NOT NULL DEFAULT '',
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`asset_info_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `asset_info`
--

INSERT INTO `asset_info` (`asset_info_id`, `table_name`, `col1`, `col2`, `template`, `required`, `defaults`, `log_max`, `dropfield`, `sort_default`, `protect`, `date_mod`) VALUES
(1, 'computer', 'computer_id', 'NEMS', 'no', 'NEMS,groupname,owner', 'NEMS,owner,groupname,mfg,model', 3, 'NEMS,groupname,owner,building', 'NEMS', 'groupname,os', '2005-06-08 19:04:20'),
(2, 'ext_device', 'ext_device_id', 'NEMS', 'no', 'NEMS,ext_type,groupname,owner', 'NEMS,ext_type,ext_model,groupname,building,owner', 3, 'NEMS,groupname,owner,ext_model', 'NEMS', '', '2005-06-08 17:41:04'),
(3, 'customer', 'customer_id', 'lastname', 'no', 'lastname,groupname,building', 'lastname,firstname,groupname,building,email,phone', 3, 'lastname,groupname,building,room', '', 'NEMS', '2006-03-06 23:54:05'),
(4, 'software', 'software_id', 'title', 'no', 'title,groupname', 'title,version,serial_number,installer_number,groupname', 3, 'title,groupname,comments', 'title', '', '2005-06-08 17:35:40'),
(5, 'tracking', 'ID', 'status', 'no', '', 'date,assign,author,computer_id,contents', 3, 'id,status,assign,groupname', 'ID', '', '2005-12-02 21:33:57'),
(6, 'odin', 'odin_id', 'owner', 'no', 'ODIN_Number,owner,groupname', 'ODIN_Number,owner,groupname,building', 3, 'owner,groupname,building', '', '', '2005-06-27 20:02:18'),
(7, 'surplus_computer', 'surplus_computer_id', 'NEMS', 'no', 'NEMS,groupname,owner', 'NEMS,surplus_id,surplus_date,model', 3, 'NEMS,groupname,owner,building', 'surplus_id', 'groupname, os', '2005-06-16 17:30:01'),
(8, 'surplus_ext_device', 'ext_device_id', 'NEMS', 'no', 'NEMS,ext_type,groupname,owner', 'surplus_id,NEMS,surplus_date', 3, 'NEMS,groupname,owner,ext_model', 'surplus_id', '', '2005-06-09 23:46:11'),
(9, 'surplus_software', 'software_id', 'title', 'no', 'title,groupname', 'title,version,serial_number,installer_number,groupname', 3, 'title,groupname,comments', 'title', '', '2005-06-08 20:53:35'),
(10, 'surplus_customer', 'customer_id', 'lastname', 'no', 'lastname,groupname,building', 'lastname,firstname,groupname,building,email', 3, 'lastname,groupname,building,room', '', '', '2005-06-22 16:10:18');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
