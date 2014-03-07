-- MySQL dump 10.11
--
-- Host: localhost    Database: irm
-- ------------------------------------------------------
-- Server version	5.0.95

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asset_info`
--

DROP TABLE IF EXISTS `asset_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_info` (
  `asset_info_id` mediumint(8) unsigned NOT NULL auto_increment,
  `table_name` varchar(128) NOT NULL default '',
  `col1` varchar(30) NOT NULL default '',
  `col2` varchar(30) NOT NULL default '',
  `template` enum('no','yes') NOT NULL default 'no',
  `required` varchar(30) NOT NULL default '',
  `defaults` varchar(120) NOT NULL default '',
  `log_max` tinyint(4) NOT NULL default '0',
  `dropfield` varchar(120) NOT NULL default '',
  `sort_default` varchar(20) NOT NULL default '',
  `protect` varchar(120) NOT NULL default '',
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`asset_info_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `computer`
--

DROP TABLE IF EXISTS `computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer` (
  `computer_id` mediumint(7) unsigned NOT NULL auto_increment,
  `NEMS` int(10) unsigned NOT NULL default '0',
  `odin_tag` varchar(30) NOT NULL,
  `serial_number` varchar(100) NOT NULL default '',
  `type` varchar(128) NOT NULL default '',
  `mfg` varchar(128) NOT NULL default '',
  `model` varchar(100) NOT NULL default '',
  `model_number` varchar(30) NOT NULL default '',
  `os` varchar(128) NOT NULL default '',
  `osver` varchar(128) NOT NULL default '',
  `OEM_software` varchar(128) NOT NULL default '',
  `processor` varchar(128) NOT NULL default '',
  `processor_speed` mediumint(7) NOT NULL default '0',
  `cpu_count` varchar(20) NOT NULL default '1',
  `ramtype` varchar(128) NOT NULL default '',
  `ram` varchar(128) NOT NULL default '',
  `hdspace` float NOT NULL default '0',
  `network` varchar(100) NOT NULL default '',
  `hostname` varchar(100) NOT NULL default '',
  `ip` varchar(20) NOT NULL default '',
  `gateway` varchar(20) NOT NULL default '',
  `netmask` varchar(20) NOT NULL default '',
  `Box_Jack` varchar(20) NOT NULL default '',
  `Ethernet_MAC` varchar(35) NOT NULL default '',
  `order_number` varchar(30) NOT NULL default '',
  `purchase_date` varchar(30) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `building` varchar(128) NOT NULL default '',
  `room` varchar(90) NOT NULL default '',
  `owner` varchar(30) NOT NULL default '',
  `user` varchar(30) NOT NULL default '',
  `weight` float NOT NULL default '1',
  `backup` varchar(128) NOT NULL default '',
  `pass_exp` date NOT NULL default '0000-00-00' COMMENT 'Property Pass Expiration Date',
  `outstanding_issues` varchar(128) NOT NULL default 'None',
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`computer_id`),
  UNIQUE KEY `NEMS` (`NEMS`)
) ENGINE=MyISAM AUTO_INCREMENT=1669 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `computer_model`
--

DROP TABLE IF EXISTS `computer_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer_model` (
  `type` varchar(128) NOT NULL default '',
  `model` varchar(128) NOT NULL default '',
  UNIQUE KEY `type` (`type`,`model`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `computer_software`
--

DROP TABLE IF EXISTS `computer_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer_software` (
  `computer_id` mediumint(7) unsigned NOT NULL default '0',
  `software_id` mediumint(7) unsigned NOT NULL default '0',
  PRIMARY KEY  (`computer_id`,`software_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `ID` int(11) unsigned NOT NULL default '0',
  `notifyassignedbyemail` tinyint(4) NOT NULL default '1',
  `notifynewtrackingbyemail` tinyint(4) NOT NULL default '0',
  `newtrackingemail` char(200) NOT NULL default 'user@host.com',
  `groups` tinyint(4) NOT NULL default '1',
  `usenamesearch` tinyint(4) NOT NULL default '1',
  `userupdates` tinyint(4) NOT NULL default '1',
  `sendexpire` tinyint(4) NOT NULL default '0',
  `showjobsonlogin` tinyint(4) NOT NULL default '1',
  `minloglevel` tinyint(4) NOT NULL default '5',
  `logo` char(50) NOT NULL default 'irm-jr1.jpg',
  `snmp` tinyint(4) NOT NULL default '0',
  `snmp_rcommunity` char(50) NOT NULL default 'public',
  `snmp_ping` tinyint(4) NOT NULL default '0',
  `version` char(50) NOT NULL default '1.3.2',
  `build` char(50) NOT NULL default '2001041201',
  `knowledgebase` tinyint(4) NOT NULL default '1',
  `fasttrack` tinyint(4) NOT NULL default '1',
  `anonymous` tinyint(4) NOT NULL default '0',
  `anon_faq` tinyint(4) NOT NULL default '0',
  `anon_req` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID_2` (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` mediumint(17) unsigned NOT NULL auto_increment,
  `UUPIC` text NOT NULL,
  `lastname` varchar(30) NOT NULL default '',
  `firstname` varchar(30) NOT NULL default '',
  `login_name` varchar(64) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `unix_group` varchar(30) NOT NULL,
  `unix_ext_groups` varchar(128) NOT NULL,
  `unix_shell` varchar(30) NOT NULL default 'bash',
  `rmt_access` varchar(128) NOT NULL,
  `building` varchar(128) NOT NULL default '',
  `room` varchar(6) NOT NULL default '',
  `employer` varchar(40) NOT NULL default '',
  `title` varchar(60) NOT NULL default '',
  `position` varchar(60) NOT NULL default '',
  `phone` varchar(30) NOT NULL default '',
  `email` varchar(35) NOT NULL default '',
  `mail_stop` varchar(11) NOT NULL default '',
  `outstanding_issues` varchar(128) NOT NULL default 'None',
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`customer_id`),
  UNIQUE KEY `lastname` (`lastname`)
) ENGINE=MyISAM AUTO_INCREMENT=15584 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_access`
--

DROP TABLE IF EXISTS `dropdown_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_access` (
  `access` char(32) NOT NULL default '',
  PRIMARY KEY  (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_backup`
--

DROP TABLE IF EXISTS `dropdown_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_backup` (
  `backup` char(200) NOT NULL default '',
  PRIMARY KEY  (`backup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_building`
--

DROP TABLE IF EXISTS `dropdown_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_building` (
  `building` char(200) NOT NULL default '',
  PRIMARY KEY  (`building`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_category`
--

DROP TABLE IF EXISTS `dropdown_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_category` (
  `category` varchar(200) NOT NULL default '',
  UNIQUE KEY `groupname` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_display`
--

DROP TABLE IF EXISTS `dropdown_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_display` (
  `display` char(32) NOT NULL default '',
  PRIMARY KEY  (`display`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_ext_type`
--

DROP TABLE IF EXISTS `dropdown_ext_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_ext_type` (
  `ext_type` char(200) NOT NULL default '',
  PRIMARY KEY  (`ext_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_groupname`
--

DROP TABLE IF EXISTS `dropdown_groupname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_groupname` (
  `groupname` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_mfg`
--

DROP TABLE IF EXISTS `dropdown_mfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_mfg` (
  `mfg` char(100) NOT NULL default '',
  PRIMARY KEY  (`mfg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_network`
--

DROP TABLE IF EXISTS `dropdown_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_network` (
  `network` char(200) NOT NULL default '',
  PRIMARY KEY  (`network`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_os`
--

DROP TABLE IF EXISTS `dropdown_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_os` (
  `os` char(100) NOT NULL default '',
  PRIMARY KEY  (`os`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_osver`
--

DROP TABLE IF EXISTS `dropdown_osver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_osver` (
  `osver` char(100) NOT NULL default '',
  PRIMARY KEY  (`osver`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_outstanding_issues`
--

DROP TABLE IF EXISTS `dropdown_outstanding_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_outstanding_issues` (
  `outstanding_issues` char(200) NOT NULL default 'none',
  PRIMARY KEY  (`outstanding_issues`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_priority`
--

DROP TABLE IF EXISTS `dropdown_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_priority` (
  `priority` char(200) NOT NULL default '',
  PRIMARY KEY  (`priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_processor`
--

DROP TABLE IF EXISTS `dropdown_processor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_processor` (
  `processor` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`processor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_ram`
--

DROP TABLE IF EXISTS `dropdown_ram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_ram` (
  `ram` char(200) NOT NULL default '',
  PRIMARY KEY  (`ram`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_ramtype`
--

DROP TABLE IF EXISTS `dropdown_ramtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_ramtype` (
  `ramtype` char(200) NOT NULL default '',
  PRIMARY KEY  (`ramtype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_software_class`
--

DROP TABLE IF EXISTS `dropdown_software_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_software_class` (
  `software_class` char(200) NOT NULL default '',
  PRIMARY KEY  (`software_class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_software_type`
--

DROP TABLE IF EXISTS `dropdown_software_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_software_type` (
  `software_type` char(32) NOT NULL default '',
  PRIMARY KEY  (`software_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropdown_status`
--

DROP TABLE IF EXISTS `dropdown_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_status` (
  `status` char(200) NOT NULL default '',
  PRIMARY KEY  (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `item` int(11) NOT NULL default '0',
  `itemtype` varchar(10) NOT NULL default '',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `service` varchar(20) default NULL,
  `level` tinyint(4) NOT NULL default '0',
  `message` text NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `comp` (`item`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=50329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ext_device`
--

DROP TABLE IF EXISTS `ext_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_device` (
  `ext_device_id` mediumint(7) unsigned NOT NULL auto_increment,
  `NEMS` int(10) NOT NULL default '0',
  `serial_number` varchar(100) NOT NULL default '',
  `ext_type` varchar(100) NOT NULL default '',
  `mfg` varchar(100) NOT NULL default '',
  `ext_model` varchar(100) NOT NULL default '',
  `ramtype` varchar(128) NOT NULL default '',
  `ram` varchar(128) NOT NULL default '',
  `size` varchar(100) NOT NULL default '',
  `network` varchar(100) NOT NULL default '',
  `hostname` varchar(100) NOT NULL default '',
  `ip` varchar(20) NOT NULL default '',
  `mac` varchar(30) NOT NULL default '',
  `order_number` varchar(30) NOT NULL default '',
  `purchase_date` varchar(30) NOT NULL default '',
  `warranty` varchar(100) NOT NULL default '',
  `consm_type` varchar(200) NOT NULL default '',
  `consm_num` varchar(100) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `weight` float NOT NULL default '0',
  `building` varchar(128) NOT NULL default '',
  `room` varchar(30) NOT NULL default '',
  `owner` varchar(90) NOT NULL default '',
  `user` varchar(90) NOT NULL default '',
  `outstanding_issues` varchar(128) NOT NULL default 'None',
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ext_device_id`),
  UNIQUE KEY `NEMS` (`NEMS`)
) ENGINE=MyISAM AUTO_INCREMENT=1490 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fasttracktemplates`
--

DROP TABLE IF EXISTS `fasttracktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fasttracktemplates` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `priority` int(11) default NULL,
  `request` text,
  `response` text,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `followups`
--

DROP TABLE IF EXISTS `followups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followups` (
  `ID` int(11) NOT NULL auto_increment,
  `tracking` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `author` varchar(30) NOT NULL default '',
  `work_hrs` mediumint(9) NOT NULL default '0',
  `contents` text NOT NULL,
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14790 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kbarticles`
--

DROP TABLE IF EXISTS `kbarticles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kbarticles` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `categoryID` int(11) NOT NULL default '0',
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `faq` enum('yes','no') NOT NULL default 'no',
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kbcategories`
--

DROP TABLE IF EXISTS `kbcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kbcategories` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `parentID` int(11) NOT NULL default '0',
  `name` text NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `missed_scan`
--

DROP TABLE IF EXISTS `missed_scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missed_scan` (
  `missed_scan` varchar(16) NOT NULL default '',
  UNIQUE KEY `missed_scan` (`missed_scan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `odin`
--

DROP TABLE IF EXISTS `odin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odin` (
  `odin_id` int(8) unsigned NOT NULL auto_increment,
  `ODIN_Number` int(8) unsigned NOT NULL default '0',
  `serial_number` varchar(100) NOT NULL default '',
  `type` varchar(128) NOT NULL default '',
  `os` varchar(64) NOT NULL default '',
  `hostname` varchar(100) NOT NULL default '',
  `ip` varchar(20) NOT NULL default '',
  `gateway` varchar(20) NOT NULL default '',
  `netmask` varchar(20) NOT NULL default '',
  `Box_Jack` varchar(20) NOT NULL default '',
  `Ethernet_MAC` varchar(30) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `building` varchar(128) NOT NULL default '',
  `room` varchar(90) NOT NULL default '',
  `owner` varchar(30) NOT NULL default '',
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`odin_id`),
  UNIQUE KEY `NEMS` (`ODIN_Number`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prefs`
--

DROP TABLE IF EXISTS `prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prefs` (
  `user` varchar(80) NOT NULL default '',
  `type` enum('no','yes') NOT NULL default 'no',
  `os` enum('no','yes') NOT NULL default 'no',
  `osver` enum('no','yes') NOT NULL default 'no',
  `processor` enum('no','yes') NOT NULL default 'no',
  `processor_speed` enum('no','yes') NOT NULL default 'no',
  `building` enum('no','yes') NOT NULL default 'no',
  `serial` enum('no','yes') NOT NULL default 'no',
  `model` enum('no','yes') NOT NULL default 'no',
  `aorder` enum('no','yes') NOT NULL default 'no',
  `purchdate` enum('no','yes') NOT NULL default 'no',
  `ramtype` enum('no','yes') NOT NULL default 'no',
  `ram` enum('no','yes') NOT NULL default 'no',
  `network` enum('no','yes') NOT NULL default 'no',
  `ip` enum('no','yes') NOT NULL default 'no',
  `mac` enum('no','yes') NOT NULL default 'no',
  `hdspace` enum('no','yes') NOT NULL default 'no',
  `owner` enum('no','yes') NOT NULL default 'no',
  `room` enum('no','yes') NOT NULL default 'no',
  `comments` enum('no','yes') NOT NULL default 'no',
  `date_mod` enum('no','yes') NOT NULL default 'no',
  `advanced_tracking` enum('no','yes') NOT NULL default 'no',
  `tracking_order` enum('no','yes') NOT NULL default 'no',
  PRIMARY KEY  (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `software` (
  `software_id` mediumint(7) unsigned NOT NULL auto_increment,
  `title` varchar(60) NOT NULL default '',
  `description` text NOT NULL,
  `version` varchar(20) NOT NULL default '',
  `serial_number` varchar(60) NOT NULL default '',
  `os` varchar(128) NOT NULL default '',
  `software_class` varchar(128) NOT NULL default '',
  `license_num` mediumint(17) NOT NULL default '0',
  `license_used` mediumint(17) NOT NULL default '0',
  `software_type` varchar(32) NOT NULL default '',
  `display` varchar(32) NOT NULL default '',
  `upgrade_cost` mediumint(7) NOT NULL default '0',
  `purchase_date` varchar(30) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `owner_history` text NOT NULL,
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`software_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1873 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surplus_computer`
--

DROP TABLE IF EXISTS `surplus_computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_computer` (
  `surplus_computer_id` mediumint(7) unsigned NOT NULL auto_increment,
  `computer_id` mediumint(7) unsigned NOT NULL default '0',
  `NEMS` int(10) unsigned NOT NULL default '0',
  `odin_tag` varchar(30) NOT NULL,
  `serial_number` varchar(100) NOT NULL default '',
  `type` varchar(128) NOT NULL default '',
  `mfg` varchar(128) NOT NULL default 'Apple',
  `model` varchar(100) NOT NULL default '',
  `model_number` varchar(30) NOT NULL default '',
  `os` varchar(128) NOT NULL default '',
  `osver` varchar(128) NOT NULL default '',
  `OEM_software` varchar(128) NOT NULL default '',
  `processor` varchar(128) NOT NULL default '',
  `processor_speed` mediumint(7) NOT NULL default '0',
  `cpu_count` varchar(20) NOT NULL default '',
  `ramtype` varchar(128) NOT NULL default '',
  `ram` varchar(128) NOT NULL default '',
  `hdspace` float NOT NULL default '0',
  `network` varchar(100) NOT NULL default '',
  `hostname` varchar(100) NOT NULL default '',
  `ip` varchar(20) NOT NULL default '',
  `gateway` varchar(20) NOT NULL default '',
  `netmask` varchar(20) NOT NULL default '',
  `Box_Jack` varchar(20) NOT NULL default '',
  `Ethernet_MAC` varchar(30) NOT NULL default '',
  `order_number` varchar(30) NOT NULL default '',
  `purchase_date` varchar(30) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `building` varchar(128) NOT NULL default '',
  `room` varchar(90) NOT NULL default '',
  `owner` varchar(30) NOT NULL default '',
  `user` varchar(30) NOT NULL default '',
  `weight` float NOT NULL default '1',
  `backup` varchar(128) NOT NULL default '',
  `pass_exp` date NOT NULL default '0000-00-00' COMMENT 'Property Pass Expiration Date',
  `outstanding_issues` varchar(128) NOT NULL default 'None',
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL default '0000-00-00',
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`surplus_computer_id`),
  UNIQUE KEY `NEMS` (`NEMS`)
) ENGINE=MyISAM AUTO_INCREMENT=382 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surplus_customer`
--

DROP TABLE IF EXISTS `surplus_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_customer` (
  `surplus_customer_id` mediumint(17) unsigned NOT NULL auto_increment,
  `customer_id` mediumint(7) NOT NULL default '0',
  `UUPIC` text NOT NULL,
  `lastname` varchar(30) NOT NULL default '',
  `firstname` varchar(30) NOT NULL default '',
  `login_name` varchar(64) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `unix_group` varchar(30) NOT NULL,
  `unix_ext_groups` varchar(128) NOT NULL,
  `unix_shell` varchar(30) NOT NULL,
  `rmt_access` varchar(128) NOT NULL,
  `building` varchar(128) NOT NULL default '',
  `room` varchar(6) NOT NULL default '',
  `employer` varchar(30) NOT NULL default '',
  `title` varchar(60) NOT NULL default '',
  `position` varchar(60) NOT NULL default '',
  `phone` varchar(30) NOT NULL default '',
  `email` varchar(35) NOT NULL default '',
  `mail_stop` varchar(11) NOT NULL default '',
  `outstanding_issues` varchar(128) NOT NULL default 'None',
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL default '0000-00-00',
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`surplus_customer_id`),
  UNIQUE KEY `lastname` (`lastname`)
) ENGINE=MyISAM AUTO_INCREMENT=15238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surplus_ext_device`
--

DROP TABLE IF EXISTS `surplus_ext_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_ext_device` (
  `surplus_ext_device_id` mediumint(7) unsigned NOT NULL auto_increment,
  `ext_device_id` mediumint(7) unsigned NOT NULL default '0',
  `NEMS` int(10) NOT NULL default '0',
  `serial_number` varchar(100) NOT NULL default '',
  `ext_type` varchar(100) NOT NULL default '',
  `mfg` varchar(100) NOT NULL default '',
  `ext_model` varchar(100) NOT NULL default '',
  `ramtype` varchar(128) NOT NULL default '',
  `ram` varchar(128) NOT NULL default '',
  `size` varchar(100) NOT NULL default '',
  `network` varchar(100) NOT NULL default '',
  `hostname` varchar(100) NOT NULL default '',
  `ip` varchar(20) NOT NULL default '',
  `mac` varchar(30) NOT NULL default '',
  `order_number` varchar(30) NOT NULL default '',
  `purchase_date` varchar(30) NOT NULL default '',
  `warranty` varchar(100) NOT NULL default '',
  `consm_type` varchar(200) NOT NULL default '',
  `consm_num` varchar(100) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `weight` float NOT NULL default '0',
  `building` varchar(128) NOT NULL default '',
  `room` varchar(30) NOT NULL default '',
  `owner` varchar(90) NOT NULL default '',
  `user` varchar(90) NOT NULL default '',
  `outstanding_issues` varchar(128) NOT NULL default 'None',
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL default '0000-00-00',
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`surplus_ext_device_id`),
  UNIQUE KEY `NEMS` (`NEMS`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surplus_odin`
--

DROP TABLE IF EXISTS `surplus_odin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_odin` (
  `surplus_odin_id` int(8) unsigned NOT NULL auto_increment,
  `odin_id` int(8) unsigned NOT NULL default '0',
  `ODIN_Number` int(8) unsigned NOT NULL default '0',
  `serial_number` varchar(100) NOT NULL default '',
  `type` varchar(128) NOT NULL default '',
  `os` varchar(64) NOT NULL default '',
  `hostname` varchar(100) NOT NULL default '',
  `ip` varchar(20) NOT NULL default '',
  `gateway` varchar(20) NOT NULL default '',
  `netmask` varchar(20) NOT NULL default '',
  `Box_Jack` varchar(20) NOT NULL default '',
  `Ethernet_MAC` varchar(30) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `building` varchar(128) NOT NULL default '',
  `room` varchar(90) NOT NULL default '',
  `owner` varchar(30) NOT NULL default '',
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL default '0000-00-00',
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`surplus_odin_id`),
  UNIQUE KEY `NEMS` (`ODIN_Number`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surplus_software`
--

DROP TABLE IF EXISTS `surplus_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_software` (
  `surplus_software_id` mediumint(7) unsigned NOT NULL auto_increment,
  `software_id` mediumint(7) unsigned NOT NULL default '0',
  `title` varchar(60) NOT NULL default '',
  `description` text NOT NULL,
  `version` varchar(20) NOT NULL default '',
  `serial_number` varchar(60) NOT NULL default '',
  `os` varchar(128) NOT NULL default '',
  `software_class` varchar(128) NOT NULL default '',
  `license_num` mediumint(17) NOT NULL default '0',
  `license_used` mediumint(17) NOT NULL default '0',
  `software_type` varchar(32) NOT NULL default '',
  `display` varchar(32) NOT NULL default '',
  `upgrade_cost` mediumint(7) NOT NULL default '0',
  `purchase_date` varchar(30) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `owner_history` text NOT NULL,
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL default '0000-00-00',
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`surplus_software_id`)
) ENGINE=MyISAM AUTO_INCREMENT=572 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking` (
  `ID` int(11) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `closedate` datetime NOT NULL default '0000-00-00 00:00:00',
  `status` varchar(32) NOT NULL default '',
  `author` varchar(30) NOT NULL default '',
  `assign` varchar(30) NOT NULL default '',
  `category` varchar(64) NOT NULL default '',
  `computer_id` int(11) NOT NULL default '0',
  `priority` varchar(32) NOT NULL default '',
  `customer` varchar(30) NOT NULL default '',
  `groupname` varchar(32) NOT NULL default '',
  `uemail` varchar(100) NOT NULL default '',
  `summary` varchar(60) NOT NULL,
  `contents` text NOT NULL,
  `date_mod` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `name` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `fullname` varchar(200) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `building` varchar(200) NOT NULL default '',
  `phone` varchar(100) NOT NULL default '',
  `access` varchar(32) NOT NULL default '',
  `comments` text NOT NULL,
  PRIMARY KEY  (`name`),
  KEY `type` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-16 11:04:51
