-- MySQL dump 10.13  Distrib 5.5.32, for Win32 (x86)
--
-- Host: localhost    Database: irm
-- ------------------------------------------------------
-- Server version	5.5.32

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_info`
--

LOCK TABLES `asset_info` WRITE;
/*!40000 ALTER TABLE `asset_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer`
--

DROP TABLE IF EXISTS `computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer` (
  `computer_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `NEMS` int(10) unsigned NOT NULL DEFAULT '0',
  `odin_tag` varchar(30) NOT NULL,
  `serial_number` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(128) NOT NULL DEFAULT '',
  `mfg` varchar(128) NOT NULL DEFAULT '',
  `model` varchar(100) NOT NULL DEFAULT '',
  `model_number` varchar(30) NOT NULL DEFAULT '',
  `os` varchar(128) NOT NULL DEFAULT '',
  `osver` varchar(128) NOT NULL DEFAULT '',
  `OEM_software` varchar(128) NOT NULL DEFAULT '',
  `processor` varchar(128) NOT NULL DEFAULT '',
  `processor_speed` mediumint(7) NOT NULL DEFAULT '0',
  `cpu_count` varchar(20) NOT NULL DEFAULT '1',
  `ramtype` varchar(128) NOT NULL DEFAULT '',
  `ram` varchar(128) NOT NULL DEFAULT '',
  `hdspace` float NOT NULL DEFAULT '0',
  `network` varchar(100) NOT NULL DEFAULT '',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `gateway` varchar(20) NOT NULL DEFAULT '',
  `netmask` varchar(20) NOT NULL DEFAULT '',
  `Box_Jack` varchar(20) NOT NULL DEFAULT '',
  `Ethernet_MAC` varchar(35) NOT NULL DEFAULT '',
  `order_number` varchar(30) NOT NULL DEFAULT '',
  `purchase_date` varchar(30) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `building` varchar(128) NOT NULL DEFAULT '',
  `room` varchar(90) NOT NULL DEFAULT '',
  `owner` varchar(30) NOT NULL DEFAULT '',
  `user` varchar(30) NOT NULL DEFAULT '',
  `weight` float NOT NULL DEFAULT '1',
  `backup` varchar(128) NOT NULL DEFAULT '',
  `pass_exp` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Property Pass Expiration Date',
  `outstanding_issues` varchar(128) NOT NULL DEFAULT 'None',
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`computer_id`),
  UNIQUE KEY `NEMS` (`NEMS`)
) ENGINE=MyISAM AUTO_INCREMENT=1669 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer`
--

LOCK TABLES `computer` WRITE;
/*!40000 ALTER TABLE `computer` DISABLE KEYS */;
/*!40000 ALTER TABLE `computer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer_model`
--

DROP TABLE IF EXISTS `computer_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer_model` (
  `type` varchar(128) NOT NULL DEFAULT '',
  `model` varchar(128) NOT NULL DEFAULT '',
  UNIQUE KEY `type` (`type`,`model`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_model`
--

LOCK TABLES `computer_model` WRITE;
/*!40000 ALTER TABLE `computer_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `computer_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer_software`
--

DROP TABLE IF EXISTS `computer_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer_software` (
  `computer_id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `software_id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`computer_id`,`software_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_software`
--

LOCK TABLES `computer_software` WRITE;
/*!40000 ALTER TABLE `computer_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `computer_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` mediumint(17) unsigned NOT NULL AUTO_INCREMENT,
  `UUPIC` text NOT NULL,
  `lastname` varchar(30) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `login_name` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `unix_group` varchar(30) NOT NULL,
  `unix_ext_groups` varchar(128) NOT NULL,
  `unix_shell` varchar(30) NOT NULL DEFAULT 'bash',
  `rmt_access` varchar(128) NOT NULL,
  `building` varchar(128) NOT NULL DEFAULT '',
  `room` varchar(6) NOT NULL DEFAULT '',
  `employer` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(60) NOT NULL DEFAULT '',
  `position` varchar(60) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(35) NOT NULL DEFAULT '',
  `mail_stop` varchar(11) NOT NULL DEFAULT '',
  `outstanding_issues` varchar(128) NOT NULL DEFAULT 'None',
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `lastname` (`lastname`)
) ENGINE=MyISAM AUTO_INCREMENT=15584 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_access`
--

DROP TABLE IF EXISTS `dropdown_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_access` (
  `access` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_access`
--

LOCK TABLES `dropdown_access` WRITE;
/*!40000 ALTER TABLE `dropdown_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_backup`
--

DROP TABLE IF EXISTS `dropdown_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_backup` (
  `backup` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`backup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_backup`
--

LOCK TABLES `dropdown_backup` WRITE;
/*!40000 ALTER TABLE `dropdown_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_building`
--

DROP TABLE IF EXISTS `dropdown_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_building` (
  `building` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`building`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_building`
--

LOCK TABLES `dropdown_building` WRITE;
/*!40000 ALTER TABLE `dropdown_building` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_category`
--

DROP TABLE IF EXISTS `dropdown_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_category` (
  `category` varchar(200) NOT NULL DEFAULT '',
  UNIQUE KEY `groupname` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_category`
--

LOCK TABLES `dropdown_category` WRITE;
/*!40000 ALTER TABLE `dropdown_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_display`
--

DROP TABLE IF EXISTS `dropdown_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_display` (
  `display` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`display`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_display`
--

LOCK TABLES `dropdown_display` WRITE;
/*!40000 ALTER TABLE `dropdown_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_ext_type`
--

DROP TABLE IF EXISTS `dropdown_ext_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_ext_type` (
  `ext_type` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`ext_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_ext_type`
--

LOCK TABLES `dropdown_ext_type` WRITE;
/*!40000 ALTER TABLE `dropdown_ext_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_ext_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_groupname`
--

DROP TABLE IF EXISTS `dropdown_groupname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_groupname` (
  `groupname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_groupname`
--

LOCK TABLES `dropdown_groupname` WRITE;
/*!40000 ALTER TABLE `dropdown_groupname` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_groupname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_mfg`
--

DROP TABLE IF EXISTS `dropdown_mfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_mfg` (
  `mfg` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`mfg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_mfg`
--

LOCK TABLES `dropdown_mfg` WRITE;
/*!40000 ALTER TABLE `dropdown_mfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_mfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_network`
--

DROP TABLE IF EXISTS `dropdown_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_network` (
  `network` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`network`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_network`
--

LOCK TABLES `dropdown_network` WRITE;
/*!40000 ALTER TABLE `dropdown_network` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_os`
--

DROP TABLE IF EXISTS `dropdown_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_os` (
  `os` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`os`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_os`
--

LOCK TABLES `dropdown_os` WRITE;
/*!40000 ALTER TABLE `dropdown_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_osver`
--

DROP TABLE IF EXISTS `dropdown_osver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_osver` (
  `osver` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`osver`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_osver`
--

LOCK TABLES `dropdown_osver` WRITE;
/*!40000 ALTER TABLE `dropdown_osver` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_osver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_outstanding_issues`
--

DROP TABLE IF EXISTS `dropdown_outstanding_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_outstanding_issues` (
  `outstanding_issues` char(200) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`outstanding_issues`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_outstanding_issues`
--

LOCK TABLES `dropdown_outstanding_issues` WRITE;
/*!40000 ALTER TABLE `dropdown_outstanding_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_outstanding_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_priority`
--

DROP TABLE IF EXISTS `dropdown_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_priority` (
  `priority` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_priority`
--

LOCK TABLES `dropdown_priority` WRITE;
/*!40000 ALTER TABLE `dropdown_priority` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_processor`
--

DROP TABLE IF EXISTS `dropdown_processor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_processor` (
  `processor` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`processor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_processor`
--

LOCK TABLES `dropdown_processor` WRITE;
/*!40000 ALTER TABLE `dropdown_processor` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_processor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_ram`
--

DROP TABLE IF EXISTS `dropdown_ram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_ram` (
  `ram` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`ram`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_ram`
--

LOCK TABLES `dropdown_ram` WRITE;
/*!40000 ALTER TABLE `dropdown_ram` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_ram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_ramtype`
--

DROP TABLE IF EXISTS `dropdown_ramtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_ramtype` (
  `ramtype` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`ramtype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_ramtype`
--

LOCK TABLES `dropdown_ramtype` WRITE;
/*!40000 ALTER TABLE `dropdown_ramtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_ramtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_software_class`
--

DROP TABLE IF EXISTS `dropdown_software_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_software_class` (
  `software_class` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`software_class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_software_class`
--

LOCK TABLES `dropdown_software_class` WRITE;
/*!40000 ALTER TABLE `dropdown_software_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_software_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_software_type`
--

DROP TABLE IF EXISTS `dropdown_software_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_software_type` (
  `software_type` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`software_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_software_type`
--

LOCK TABLES `dropdown_software_type` WRITE;
/*!40000 ALTER TABLE `dropdown_software_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_software_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropdown_status`
--

DROP TABLE IF EXISTS `dropdown_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropdown_status` (
  `status` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropdown_status`
--

LOCK TABLES `dropdown_status` WRITE;
/*!40000 ALTER TABLE `dropdown_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `dropdown_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(10) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `service` varchar(20) DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `comp` (`item`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=50329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_device`
--

DROP TABLE IF EXISTS `ext_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_device` (
  `ext_device_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `NEMS` int(10) NOT NULL DEFAULT '0',
  `serial_number` varchar(100) NOT NULL DEFAULT '',
  `ext_type` varchar(100) NOT NULL DEFAULT '',
  `mfg` varchar(100) NOT NULL DEFAULT '',
  `ext_model` varchar(100) NOT NULL DEFAULT '',
  `ramtype` varchar(128) NOT NULL DEFAULT '',
  `ram` varchar(128) NOT NULL DEFAULT '',
  `size` varchar(100) NOT NULL DEFAULT '',
  `network` varchar(100) NOT NULL DEFAULT '',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `mac` varchar(30) NOT NULL DEFAULT '',
  `order_number` varchar(30) NOT NULL DEFAULT '',
  `purchase_date` varchar(30) NOT NULL DEFAULT '',
  `warranty` varchar(100) NOT NULL DEFAULT '',
  `consm_type` varchar(200) NOT NULL DEFAULT '',
  `consm_num` varchar(100) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `weight` float NOT NULL DEFAULT '0',
  `building` varchar(128) NOT NULL DEFAULT '',
  `room` varchar(30) NOT NULL DEFAULT '',
  `owner` varchar(90) NOT NULL DEFAULT '',
  `user` varchar(90) NOT NULL DEFAULT '',
  `outstanding_issues` varchar(128) NOT NULL DEFAULT 'None',
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ext_device_id`),
  UNIQUE KEY `NEMS` (`NEMS`)
) ENGINE=MyISAM AUTO_INCREMENT=1490 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_device`
--

LOCK TABLES `ext_device` WRITE;
/*!40000 ALTER TABLE `ext_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fasttracktemplates`
--

DROP TABLE IF EXISTS `fasttracktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fasttracktemplates` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `request` text,
  `response` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasttracktemplates`
--

LOCK TABLES `fasttracktemplates` WRITE;
/*!40000 ALTER TABLE `fasttracktemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `fasttracktemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followups`
--

DROP TABLE IF EXISTS `followups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tracking` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `author` varchar(30) NOT NULL DEFAULT '',
  `work_hrs` mediumint(9) NOT NULL DEFAULT '0',
  `contents` text NOT NULL,
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14790 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followups`
--

LOCK TABLES `followups` WRITE;
/*!40000 ALTER TABLE `followups` DISABLE KEYS */;
/*!40000 ALTER TABLE `followups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kbarticles`
--

DROP TABLE IF EXISTS `kbarticles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kbarticles` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) NOT NULL DEFAULT '0',
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `faq` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kbarticles`
--

LOCK TABLES `kbarticles` WRITE;
/*!40000 ALTER TABLE `kbarticles` DISABLE KEYS */;
INSERT INTO `kbarticles` VALUES (21,4,'Create a drag and drop interface to shell scripts','If you wish to run a Unix command on each file you drop on the Applescript you can do the following:\r\n\r\non open filelist\r\n  repeat with i in filelist\r\n    do shell script \"my_command \" & POSIX path of i\r\n  end repeat\r\nend open\r\n\r\nA nice feature of OSX is that you can associate any application with a kind of file. First save your script using Script Editor as an application. Then select a file of the type you wish to associate with your script. Select \"Get Info.\" Select the \"Open with\" pane and then select your Applescript application. Click the \"Change All\" button. Now every file of that extension will open up with your Applescript.\r\n\r\nThis is very nice for running some shell command on the file for filtering it before opening it with another file. For instance, you can use the following script to open PostScript files in Acrobat. It works by using ps2pdf (available as part of Fink) to first convert the file to a temporary PDF file. You can obviously make this a little more robust if you open multiple PostScript files at the same time.\r\n\r\non open input_file\r\n  do shell script \"export PATH=\\\"$PATH\\\":/sw/bin;ps2pdf \\\"\" & \r\n  POSIX path of input_file & \"\\\" ~/.psview.tmp.pdf; open ~/.psview.tmp.pdf\"\r\nend open\r\n\r\nThe \"do shell script\" command is shown on two lines; enter it as one line with a space after the \"&\". ','yes'),(3,4,'Force Mozilla, Chimera and Netscape 6+ to use the Apple provided javascript plug-in under OSX?','Open the package contents of the application by right clicking (control-clicking), and remove the Contents/MacOS/Plug-ins/MRJPluginCarbon.plugin, and restart the application.',''),(7,13,'Clogged inkjet nozzle problems.','Check these links:\r\n\r\nhttp://www.inkjetmall.com/store/ts/clogging.htm\r\n\r\nhttp://www.weeno.com/art/0899/140.shtml','yes'),(12,4,'How do I add items to the File:Library menu in the OSX Terminal.app such as preconfigured login shells and the like (OSX.2 tip)?','Save your *.term files in ~/Library/Application Support/Terminal. The Library folder will be present if you click on the \"Home\" icon in the Finder.\r\n\r\n1. Configure using \"Terminal:Window Settings...\"\r\n\r\n- Almost all values can be changed using this pane but remember to use \"Save As..\" or the default screen values will be set. Values can be set dynamically, great for color.\r\n\r\n- Doing a \"File:Save As..\" will actually save your settings as a \"Filename.term\". Saving to the location listed above will cause the saved *.term to be displayed in the \"File:Library\" menu.\r\n\r\n2. Configure using \"Terminal:Preferences\"\r\n\r\n- This will allow you to set a default *.term startup file that starts every time Terminal is started. You can also specify a command to run every time a new Terminal window is opened.\r\n\r\n3. Configure using PropertyListEditor\r\n\r\n- Neither of the above configure methods will allow you add/change startup command(s) for individual saved *.term\'s.\r\n\r\n- To add startup commands, open the *.term file with the PropertyListEditor (/Developer/Applications) and edit the ExecutionString.\r\nNote: If you do not have the development software installed you can directly edit the *.term file as it is a XML text file with a text editor like BBEdit.\r\n\r\n\r\n- The “ExecutionString” can be any UNIX command(s) even a script.\r\n\r\nA nice trick is to chain UNIX commands together.\r\n\r\n- clear; ssh –l “user name” “remote machine name” ; exit\r\n\r\n- This clears the new screen, ssh connects to a remote machine and when you logout of the remote it closes the window.','yes'),(19,4,'Force Mozilla to open external pages in the same tab','  user_pref(\"browser.always_reuse_window\", true);\r\n\r\nI added that line to my Mozilla:user.js file (in the same directory as the prefs.js file, ~/Library -> Mozilla -> Profiles -> Username -> [random].slt), restarted Mozilla and voila! External requests now load in the active tab. Mozilla doesn\'t create a new tab but hey, at least it doesn\'t create a new window!',''),(16,8,'Create a customized mount point system in OSX','see: http://www.macosxhints.com/article.php?story=20021011053443661',''),(18,4,'Enable \"Pipelining\" in Mozilla or Chimera to speed up your browser.','You can enable HTTP/1.1 pipelining in chimera by adding the following lines to your ~/Library -> Application Support -> Chimera -> profiles -> default -> [random].slt -> prefs.js (actually user.js is probably better) file:\r\n\r\n  user_pref(\"network.http.pipelining\", true);\r\n  user_pref(\"network.http.proxy.pipelining\", true);\r\n\r\nPipelining speeds up browsing a lot.','yes'),(20,4,'Change the default email application that opens when you click on a mailto: link in Mozilla 1.x under OSX?','Edit \"~/Library/Mozilla/profiles/user/oddname/user.js\" and add the line...\r\nuser_pref(\"network.protocol-handler.external.mailto\", true);',''),(25,4,'How do I purge my PC of the Mac related files that are impacting my backup (finder.dat).','Download and install this utility that will search and destroy them.\r\n\r\n<a href=\"http://dactyl.arc.nasa.gov/mac_file_delete.exe\" target=\"_blank\">http://dactyl.arc.nasa.gov/mac_file_delete.exe</a>','no'),(26,10,'Mac OS X: How to Start Up in Safe ModeArticle \r\nApple KB ID: 107393','To start up into Safe Mode (to Safe Boot), do this:\r\n\r\n      1. Be sure the computer is shut down.\r\n      2. Press the power button.\r\n      3. Immediately after you hear the startup tone, press and hold the Shift key.\r\n      Note: The Shift key should be held as soon as possible after the startup tone but not before.\r\n4. Release the Shift key when you see the screen the gray Apple and progress indicator (looks like a spinning gear).\r\n\r\n\r\nDuring the startup, you will see \"Safe Boot\" on the Mac OS X startup screen (Figure 1). To leave Safe Mode, restart the computer normally, without holding any keys during startup. ',''),(33,8,'What are the command line arguments for Norton LiveUpdate?','What switches are available when calling LiveUpdate from a cron job or applescript?\r\n\r\n    * This will make LiveUpdate exit after running: -liveupdateautoquit YES\r\n    * Make LiveUpdate quiet except for an icon in the dock: -liveupdatequiet YES\r\n    * Prompt you with a Yes / No about running LiveUpdate (used by the Installer): -liveupdateoninstall YES\r\n    * The switch to do an update. LUal is the code for all products and virus defs: -update LUal\r\n\r\nExample for use in a cron job or shell script (enter as one line, no added spaces):\r\n\r\n % /Applications/Norton\\ Solutions/LiveUpdate.app/Contents/\r\n   MacOS/LiveUpdate -liveupdateautoquit YES  -update LUal\r\n\r\nExample so that the TV set update window won\'t appear (again, one line, no space after the \"/\" but add one after \"YES\"):\r\n\r\n % /Applications/Norton\\ Solutions/LiveUpdate.app/Contents/\r\n   MacOS/LiveUpdate -liveupdateautoquit YES  -liveupdatequiet YES -update LUal',''),(29,8,'Super clean OS install method for Powerbooks','   1. Back up all your data\r\n   2. Shut down system\r\n   3. Remove power and the battery\r\n   4. Remove keyboard and reset PMU -- there is a small button in the top right hand side under the keyboard in an oval shaped hole. Push the button.\r\n   5. Plug power in\r\n   6. Reboot into Open Firmware (hold down Command-Option-O-F when you turn on your machine)\r\n   7. In Open Firmwarre, type reset-nvram (you should get an OK in response)\r\n   8. In Open Firmware, type in reset-all (your machine should reboot, have your Jaguar DVD/CD ready)\r\n   9. Insert Jaguar DVD/CD and hold down the \'C\' key to boot from the DVD/CD\r\n  10. Do a fresh install of OS X, and choose to \'Erase Disk\'\r\n  11. Update to 10.2.3 (I used the Combo installer)',''),(31,4,'How can I simulate a built-in X11 server so I don\'t need to launch X11 every time I open an X11 application?','   1. Turn off X11\'s Quit Warning Dialog Box. Type defaults write com.apple.x11 no_quit_alert true in a Terminal.\r\n\r\n   2. Make X11 run without dock icon or menu bar. If you have the OS X Developer Tools installed:\r\n\r\n         -- Control-click on X11.app in the Finder and select \"Show Package Contents\"\r\n         -- Open Contents and open \"Info.plist\" in Property List Editor.\r\n         -- Open root and click \"New Sibling\" with Property \"LSUIElement\" and String \"1\" as the value.\r\n         -- Save and quit.\r\n\r\n   3. (Optional) If you don\'t have a .xinitrc file, get one. Type cp /etc/X11/xinit/xinitrc ~/.xinitrc to copy an existing one.\r\n\r\n   4. (Optional) Modify the .xinitrc file to lose startup programs. Type pico ~/.xinitrc in Terminal. Go down to where it says start some nice programs and put a # in front of xterm & (Result: # xterm &).\r\n\r\n   5. Enable Terminal to open X11 apps. Type cat >> ~/.login and hit return in Terminal. Then type setenv DISPLAY :0 and hit return, then hit Control-D.\r\n\r\n   6. Add X11 to the user\'s Startup Items, or implement a login hook to do so (see previous hint).\r\n\r\n   7. Log out and log in, then try running an X11 program from Terminal.',''),(34,4,'Why can\'t I save changes to the global template in MS Word such as fonts and toolbars.','1) Log in as user.\r\n2) Create a folder in your User/Documents location. For convenience, you might name it \"User Templates\" or somesuch.\r\n3) Start Word.\r\n4) Open the \"Preferences\" from the \"Word\" menu, and select \"File Locations\" in the list on the left of the Preferences dialog.\r\n5) Select the \"User Templates\" setting and click Modify.\r\n6) Choose the \"User Templates\" folder you have just created.\r\n7) Select the \"Workgroup Templates\" setting and click Modify.\r\n8) Choose the original Templates folder in the \"Microsoft Office X\" folder in your \"Applications\" folder.\r\n9) Quit Word. If it asks if you want to save the Normal Template, click \"Don\'t Save.\"\r\n10) Remove the Normal Template file from the Applications:Microsoft Office X:Templates folder. This is rather important, since as long as the original Normal template still exists in the Microsoft Office:Templates folder, Word will continue to use the original.\r\n11) Next time the user runs Word if \"prompt to save Normal template\" is checked it should prompt to save the global template in the local directory upon quitting.\r\n12) Repeat steps 1 to 9 for each user.','yes'),(37,4,'Eudora SSL Cert Expiration','[1] log in as admin\r\n[2] change the system time to an old date and time\r\n       -- if today is 10/11/06 4:10pm\r\n     change to\r\n       --02/08/06 and 3:00pm\r\n[3] reboot\r\n[4] change the date and time back to the correct settings (check www.time.gov)\r\n[5] reboot\r\n[6] the eudora problem should be gone.',''),(40,4,'How to reach the secret preferences panel in Retrospect for Windows','Enter Ctl-Alt-P twice',''),(41,13,'Fault 37,006.42:32764\r\n','Printer Phaser 8500 would not initialize; the power led would turn red.\r\n\r\n[1] Changed the black ink.\r\n[2] Powered up and an error came up: Fault 37,006.42:32764\r\n[3] Took to print room to connect printer by itself to a power outlet, error persisted. The problem manifests itself when the printer is connected to a power strip where other devices are plugged in. Also the printer could be connected to a faulty surge suppressor.\r\n[4] Unplugged and let it cool down\r\n[5] Plugged the printer by itself to a power source. Printer is OK now, after cooling down.\r\n\r\nGot to this link and search Fault 37,006.42:32764\r\nhttp://www.support.xerox.com/\r\n\r\n',''),(43,14,'Adding a dropdown field','All you need to do is:\r\n\r\n1. Create a new field in a table.\r\n2. create a new table named \\\\\\\"dropdown_XXX, where XXX exactly matches new\r\nfield name from above, that contains 1 field named as in point 1.\r\n\r\nYour Done.\r\n   \r\n\r\nExample:\r\n1. Add \\\\\\\"outstanding_issues\\\\\\\" to computers, customers etc\r\n2. Create a new table named: \\\\\\\"dropdown_outstanding_issues\\\\\\\"\r\nWhich has 1 field named \\\\\\\"outstanding_issues\\\\\\\"',''),(44,10,'How do you get the Mathematica install information and License usage on the ash license server?','ssh to ash from redwood as tsadmin\r\nswitch user as mathlm7 and the same password as tsadmin\r\nWhen you become mathlm7 user, your environment has a directory Wolfram under that home dir\r\nRun the monitorlm executable script to monitor the license for Mathematica\r\nAfter I ran that license script, I found out the Systems Admin page for installation.\r\n\r\nhttp://reference.wolfram.com/mathematica/tutorial/InstallingMathematica.html\r\n\r\n[tsadmin@ash ~]$ su - mathlm7\r\nPassword: \r\n[mathlm7@ash ~]$ pwd\r\n/sdc1/Mathlm\r\n[mathlm7@ash ~]$ ps -ef|grep mathlm\r\nroot     25383     1  0 Apr18 ?        00:00:00 /sdc1/Mathlm/Wolfram/mathlm -logfile /tmp/mathlm.log -loglevel 4 -pwfile /sdc1/Mathlm/Wolfram/mathpass\r\nroot     28386 28358  0 15:49 pts/2    00:00:00 su - mathlm7\r\nmathlm7  28387 28386  0 15:49 pts/2    00:00:00 -tcsh\r\nmathlm7  28408 28387  0 15:49 pts/2    00:00:00 ps -ef\r\nmathlm7  28409 28387  0 15:49 pts/2    00:00:00 grep mathlm\r\n[mathlm7@ash ~]$ /sdc1/Mathlm/Wolfram/monitorlm \r\n\r\nOnline help is available at\r\nhttp://reference.wolfram.com/network\r\n\r\nMathLM Version: 7.0 \r\nMathLM Server: ash \r\nDate: Tuesday, April 19 2011 22:50:00  \r\n\r\n\r\n\r\nLicense Usage Summary: \r\n\r\n                        License Total   Total\r\nProgram                 Class   in Use  Authorized \r\n--------------------------------------------------\r\nMathematica             A            0           2 \r\nMathKernel              A            0           2\r\n\r\n\r\n\r\nSub Mathematica         A            0           8 \r\nSub MathKernel          A            0           8\r\n\r\n\r\n\r\n   \r\nLicenses in Use: \r\n\r\n                             License \r\nProgram              Version Class   Username      Hostname            Duration\r\n--------------------------------------------------\r\n\r\n[mathlm7@ash ~]$ /sdc1/Mathlm/Wolfram/mathlm -logfile mathlm7log1.txt\r\nash - mathlm7 [19/Apr/2011:22:51:05] \\\\\\\"MathLM 7.0 executable launched\\\\\\\" \\\\\\\"/sdc1/Mathlm/Wolfram/mathlm\\\\\\\" -\r\nash - mathlm7 [19/Apr/2011:22:51:05] \\\\\\\"Logging verbosity level specified\\\\\\\" \\\\\\\"3\\\\\\\" -\r\n\r\nOnline help is available at\r\nhttp://reference.wolfram.com/network\r\n\r\n[mathlm7@ash ~]$ /sdc1/Mathlm/Wolfram/monitorlm\r\n\r\nOnline help is available at\r\nhttp://reference.wolfram.com/network\r\n\r\nMathLM Version: 7.0 \r\nMathLM Server: ash \r\nDate: Tuesday, April 19 2011 22:51:27  \r\n\r\n\r\n\r\nLicense Usage Summary: \r\n\r\n                        License Total   Total\r\nProgram                 Class   in Use  Authorized \r\n--------------------------------------------------\r\nMathematica             A            0           2 \r\nMathKernel              A            0           2\r\n\r\n\r\n\r\nSub Mathematica         A            0           8 \r\nSub MathKernel          A            0           8\r\n','yes'),(45,4,'How do I install TeX in OSX without admin rights?','Start with this:\r\n\r\nhttps://github.com/mxcl/homebrew\r\n\r\nFollow the installation instructions and install in ~/.homebrew\r\n\r\nYou will be adding $HOME/.homebrew/bin to your PATH\r\n\r\nYou will install ghostscript with “brew install ghostscript”\r\n\r\nThen go here for the TeX installation:\r\n\r\nhttp://www.tug.org/texlive/acquire-netinstall.html\r\n\r\nI used ~/bin as my installation path and added “$HOME/bin/texlive/2010/bin/universal-darwin/“ to my path.\r\n\r\nI downloaded texmaker and TeXShop and dropped them in ~/bin/texlive. Neither needs admin or an installer.\r\n\r\nhttp://pages.uoregon.edu/koch/texshop/\r\nhttp://www.xm1math.net/texmaker/\r\n\r\nThen all you have to do is update the paths in the preferences for each program. You probably can’t use “~/“. I believe you need the full path.\r\n',''),(48,4,'SAS Installation Data file for JMP: Order 638115 for JMP 9.0(Tech Sup # 70093125) on Microsoft Windows Workstation 32-bit',' 1 Save your SAS installation data file (SID file). We recommend you save your SID file (the attached   JMP900_638115_70093125_Win_Wrkstn.txt file) to the following location: My Documents\\\\\\\\SAS Installation Data\\\\\\\\  JMP900_638115_70093125_Win_Wrkstn.txt   \r\n<br>  \r\n 2 Start your JMP Software. Double-click your desktop icon or use your Start menu.   \r\n<br>\r\n 3 Apply your SID file. If your JMP license is past your expiration date, the first screen you see at JMP launch is a message that your JMP license is expired. \r\nClick Open License. \r\nAt the prompt, navigate to where you saved the SID file in Step 1. \r\nClick Open. \r\nEnter an Administrator Name and Department if you desire. \r\nClick OK. <br>\r\n If your JMP license has not expired, you must start the renewal process manually. \r\nFrom the File menu, select New > Script to open a script window. <br>\r\nEnter this line:  renew license(); \r\nFrom the Edit menu, select Run Script. \r\nIn the resulting Renew Your JMP License window, click Open License. <br> \r\nAt the prompt, navigate to where you saved the SID file in Step 1. \r\nClick Open. <br>\r\nEnter an Administrator Name and Department if you desire. <br>\r\nClick OK. ','yes'),(49,10,'How to activate license pack for Material Studio?','1. Change the HW address to the required one on the license file\r\n2. Login to Poplar by using GUI\r\n3. Use the \\\\\\\'lp_admin\\\\\\\' tool to activate the license file','yes'),(55,17,'Requesting CSA / Elevated Privileges Through IdMax','0. Go to the IdMax website:\r\nhttps://launchpad.nasa.gov\r\n\r\n1. Login and Click the \"Access Management\" link.\r\n\r\n2. Click the \"Request or Modify Application Account\" link.\r\n\r\n3. In the \"Find NAMS Resource\" search box, input each item from the following list and click search.\r\n\r\n3.1 Complete whatever instructions or questions (that may or may not appear on the following screens).\r\n\r\n            THE LIST\r\n\r\nAGCY0012 Basic Active Directory Account\r\nAGCY0021 NASA Public Key Infrastructure (PKI)\r\nAGCY0025 Active Directory Resource Management Account\r\nAGCY0030 Active Directory Object Management Rights\r\nAgency RSA SecurID Token\r\nARC Code TS IT Resources\r\nARC Elevated Privileges for non-ODIN Systems\r\nARC Foundstone\r\nARC VPN Access\r\nARC-Kace Patch Management Server\r\nARC0101 DNS Host Database\r\nNomad Exchange Mailbox',''),(51,17,'Regarding Ticket #6525: Recovering from I/O and Media Errors','Recovering from I/O and Media Errors\r\nSource: http://tips.dataexpedition.com/hdrecovery.html\r\n\r\nINTRODUCTION\r\n\r\nThere you are, computing along, when suddenly your application freezes.  Other applications seem to be working, until you try to access a file, then they freeze too.  Eventually something coughs up the dreaded \"I/O Error\" or \"Media Error\".  Precious files are now beyond your reach, maybe your whole drive.  Rebooting might help for a while, or it doesn\'t help at all.  What do you do?\r\n\r\nThis article is about how to recover from I/O and media errors occurring on a magnetic hard disk drive.  It does not apply to CDs, DVDs, SSDs, or flash drives.  With modern hard drives, you can often rehabilitate the device, recovering your data and sometimes even restoring the drive to full working health.  There are also things you can do which will destroy your data and the hardware, so pay attention.\r\n\r\nWHAT NOT TO DO\r\n\r\nNever use filesystem recovery software to \"fix\" your drive if you suspect a hardware problem.  Doing so will most likely destroy your data and may render the hardware unrecoverable.\r\n\r\nThere are a number of file system repair utilities out there, but they are designed strictly to fix software related data corruption issues.  If the hardware is failing, not only will these programs not help, but having them muck around with your data while the hardware is unstable will almost certainly make the situation much worse.\r\n\r\nMost utilities claim to be able to detect and diagnose hardware problems through the use of a technology standard called S.M.A.R.T.  Nearly all modern drives support this standard which is supposed to monitor and report errors.  In my experience, it simply does not work.  I have never seen a drive report a S.M.A.R.T. condition other than \"healthy\", including drives that were so fried the platter wasn\'t even spinning.\r\n\r\nSo do NOT believe any software that claims your hardware is fine.  If you are seeing \"I/O\" or \"Media\" errors, then you have a hardware problem.\r\n\r\nSYMPTOMS TO LOOK FOR\r\n\r\nThere are four types of failures to look for: motor failure, media failure, cable failure, and low power.\r\n\r\nAll four may result in applications or the system freezing for a while during drive access, or a failure to boot.  Cable and power problems can also cause the drive to unmount unexpectedly.  Applications may report \"I/O\" or \"Media\" errors.  If you are experiencing freezes, check your system or console logs for such errors.  In Mac OS X, you can run\r\n/Applications/Utilities/Console.app\r\n\r\nor type\r\ntail -f /var/log/system.log\r\n\r\nin the terminal.  Other unix systems may log such information to /var/adm/messages or similar locations.  \r\n\r\nHere\'s an example:\r\n\r\nAug 30 13:48:13 localhost kernel[0]: disk4s3: I/O error.\r\n\r\nYou may also hear a loud clacking noise from the drive: much louder and harsher than the usual clicking you may hear when files are being accessed.  That clacking is the drive head being thrown back to its stop as the hardware controller tries to reset its position relative to the media tracks.  This used to be the best indication of problems, but many modern drives are too quiet to hear this noise distinctly.\r\n\r\nNot covered here is a head crash.  That\'s where the drive heads physically contact the media.  The result is a truly horrific screeching sound accompanied by a complete inability to access the device.  This is extremely rare in modern hardware and is unrecoverable by normal means.  Unless you are willing to pay a hardware recovery service a ton of money, all you can do about a head crash is hope you have a solid backup.\r\n\r\nMOTOR FAILURE\r\n\r\nA motor failure is the most serious condition (after a head crash).  Either the motor that spins the disks or the motor that moves the read/write head is no longer working properly and it will only get worse.\r\n\r\nSpindle motor failure causes the drive to not start spinning during boot-up.  It results in the drive being completely inaccessible.  This may be related to a failure of the spindle ball-bearings (if your drive isn\'t one of the new liquid-bearing types), in which case it may be preceded by a loud whining noise.  Repeated startup attempts may get it going, at which point it will probably behave normally until you restart.  But repeated attempts will also further damage the motor, so if you do get it going do not shut it off.  Disable any \"energy saving\" settings that might spin it down, and proceed to the \"What to Do\" section below.\r\n\r\nHead motor failure causes sporadic problems accessing all files, not just specific ones.  It is most often heat related, so the drive may work fine when you first turn on your computer, but then begin seizing up as the system warms with use.  For a head motor failure, you will need to cool the drive which may include shutting it down for a while.  So its important to distinguish between a spindle motor and head motor failure.\r\n\r\nIf a motor is failing, then the hardware is doomed.  Your goal is to get as much data off as you can before it dies completely.\r\n\r\nMEDIA FAILURE\r\n\r\nMedia failure is the most common condition.  In fact, even a working drive experiences media failures all the time.  Modern drive controllers watch for media blocks that are having problems and simply avoid using them in the future.  This fact is the key to recovery, as I\'ll explain later.\r\n\r\nMedia failures are characterized by problems only occurring when certain files are read or only when files are being written.  They are usually (but not always) independent of how long the system has been running.  They most commonly occur with files that have not been accessed in months or years.\r\n\r\nIt is possible to completely recover from most media failures, it just takes time and patience.  It is also possible to prevent most media failures, as I\'ll explain later.\r\n\r\nCABLE FAILURE\r\n\r\nProblems with data or power cables are tricky.  There may be nothing wrong with your data (yet), but they can lead to data corruption and can exhibit the symptoms of other problems.  The big danger with a cabling issue is that data being written to your drive can become corrupted, resulting in escalating software problems that could eventually wipe out your drive.\r\n\r\nIf the drive has been working up until now and you have not made any recent cabling adjustments, then cable failure is unlikely.  On the other hand, if you just installed the drive, changed ports, or moved a cable, then that should be your first suspect.\r\n\r\nLOW POWER\r\n\r\nProblems with the power supply can cause any of the above symptoms.  Sudden umounting of the drive is the most common symptom, especially for USB or Firewire bus powered devices.  But low power can also cause more subtle symptoms like I/O errors or head clicking.  Low power issues are most common when running on bus power, but they can also occur with wall power if the power supply is failing or if the power cable is damaged.  Even internal drives can experience power problems if the system power supply is failing or internal power cables are damaged.\r\n\r\nWHAT TO DO\r\n\r\nYour next steps depend on the type of hardware failure diagnosed above.  But since that diagnosis may not be perfect, you should read through all of the steps below.\r\n\r\nIf it is an external drive, make sure it is connected to wall power.  If you are using a laptop, make sure it is running on wall power as well.\r\n\r\nIf you are having problems with your boot drive, boot off of another drive if you can.  Macintosh systems with firewire can be placed into \"Target Disk Mode\" by booting up with the \"T\" key held down.  (If you have a wireless keyboard, you may need to borrow a USB one for boot keys to work.)  \r\n\r\nThis turns the whole system into an external firewire drive that can be accessed from another computer.  Otherwise consider moving the drive to an external enclosure so you can access it from another system.  Booting off a failing drive is very risky for motor and cable failures.  Booting off a drive experiencing media failures is not as bad, but still best avoided.\r\n\r\nIf you are dealing with a motor failure, then you have only a limited number of minutes of runtime or a limited number of reboots before the drive fails completely.  So you have to act carefully and efficiently.  Media and cable failures are less time sensitive.\r\n\r\nIf your system is mostly operational and you have a fairly recent backup, then try to read off your most critical data as quickly as possible.  If you already have software to control your cooling fan speeds, turn them up to maximum.  But if the system is becoming unstable, shut it down and leave it off for at least half an hour to let things cool down.\r\n\r\nLOW POWER\r\n\r\nRegardless of what the problem may be, both the computer and drive should be powered by a stable wall-socket before you do anything else.  If an external drive only misbehaves when its powered by USB or Firewire then you can be pretty sure that its power needs are not being met.  That could mean that the drive itself is needing more power than it should, which in turn could indicate that the drive motor is is failing.  It could also indicate problems with the computer\'s power supply, USB or Firewire ports, or just a software glitch.\r\n\r\nWall power supplies can also fail over time.  The easiest way to test this is to substitute a known good power supply.  That can be tricky if you don\'t happen to have a spare.  If you do have a spare that was purchased at the same time, it may be hard to know whether or not it is also failing.  Substituting power supplies from a different model drive is dangerous: you must make sure that the cables not only match the plug but that the pins and voltages are exactly right.  If you have a volt meter and a steady hand, test the voltage of the power supplies to make sure it matches the values printed on the power supply.  A low reading indicates a failing power supply.\r\n\r\nInternal drives are unlikely to have power problems unless you\'ve recently moved the power cables around or are experiencing other power issues with the system.  If you have a volt meter and can find the pin voltage specifications, you can test the power leads to each drive.\r\n\r\nCABLE FAILURE\r\n\r\nIf you are dealing with an external drive or have recently done work on or near an internal drive, check all the data and power cables that you might have touched or moved.  Make sure they are plugged in securely and not obviously damaged.  Swap out USB, firewire, or eSATA cables and try other ports if you can.  Internal ribbon cables should not be messed with if they are original and the drive has been working up until now: you are more likely to cause damage than to find it.\r\n\r\nDon\'t forget to check your external power supply cables as well.  For external drives, try swapping out the power brick if you have another one of the exact same kind.  Power supply failures can sometimes mimic cable or other failure modes.  For USB or Firewire bus powered drives, switch them to wall power or plug them directly into the computer (not through a hub).\r\n\r\nMOTOR FAILURE\r\n\r\nIf the drive is having trouble spinning up, you may need to let it cool for an hour or more.  Spinning up places the most stress on the drive motor and requires the most power.  So your goal is to get it going and keep it going long enough to make full backup.  Disable any energy saving settings that might cause it to spin down.  Plan ahead: have a backup plan with enough space ready to go.\r\n\r\nCooling can be critical for a motor failure.  If you have or can very quickly obtain software for controlling system fan speed, turn the fans up to maximum.  For a laptop or external hard drive, get a cold pack and place it under the drive enclosure or under the location in the laptop where the hard drive is installed.  Change it frequently.  \r\n\r\nI once recovered data from a failing laptop by placing moist towels under it while the backup ran and blowing canned air into the vent slots next to the drive.  I could tell when the towels needed changing because the backup would slow down and I/O errors would start showing up in the system log!\r\n\r\nObviously you want to be very careful with any water near your system, and avoid it if you can.  Also take care than any canned air does not spray liquid into your system, as that can damage components.  For a desktop system, note that opening the case can actually make it run hotter so close the case while the system is running.\r\n\r\nYour choice of backup software is critical at this point.  As discussed in my article on the subject, some software will abort the entire backup if it encounters any problems reading from the drive.  Make sure to use software that can keep going in the face of errors.  Save any error logs so that you can go back and try again on any files that were skipped due to errors.  Since the clock is ticking toward complete failure, make sure to copy off your most important files first.  Then go back and do a full system backup if you can.\r\n\r\nWith aggressive cooling and rapid backup action, you should be able to get all your data off before the drive motors fail completely.\r\n\r\nMEDIA FAILURE\r\n\r\nMedia failure is actually the most common hard drive problem these days.  Media failures can be caused by imperfections in the magnetic surface of the drive platters, or simply by the signal fading over time.\r\n\r\nThe key to recovery is the block reallocation algorithm of your drive\'s hardware controller.  When the drive reads a block, it checks the data against an forward error correction (FEC) checksum.  If the data is corrupted, it attempts to use FEC to recover the block.  This triggers the drive\'s reallocation algorithm.\r\n\r\nThe drive will try many times to access the problem block.  If it succeeds, it will quietly mark that block as \"bad\" and rewrite the data to another location on the disk (called a \"spare block\").  From that point on, any attempt to access the bad block will instead be redirected to the good one.  Thus the bad block is \"repaired\" and the data saved!\r\n\r\nIf the drive fails to read the data after some number of tries, it will give up and pass an \"I/O\" or \"media\" error back up to the operating system.  But that does not mean the data isn\'t there, just that the signal is weak.  Repeated tries may yet acquire the data and allow the block to be reallocated.\r\n\r\nThe first step to dealing with media failure is to treat it like a head motor failure.  Cool the drive and backup what you can as described above.  Save the rehabilitation for after you\'ve secured all your other data.\r\n\r\nTry to isolate exactly which files are causing the error.  If you can find a specific file that always causes a hardware error, try reading it repeatedly.  The simplest is to just use the command:\r\ncat filename > /dev/null\r\n\r\nYou may need to repeat the read attempt ten times or more, but eventually the data should be read successfully.  At that point the block reallocation will fix the file and it should cause no more errors, or at least any new errors will occur further along in the file.  Monitoring your system log or console output may reveal specific block numbers, allowing you to see your progress.\r\n\r\nIf a file is particularly stubborn, you may want to simply quarantine it yourself.  Create a directory for \"BadBlocks\" on the same filesystem and move (do not copy) the file into there.  Then remove all access permissions.  You\'ve effectively marked all the blocks in the file as \"bad\" and prevented them from being used in the future.\r\n\r\nOccasionally, you may experience media failures while writing.  This is usually not associated with any particular file.  Some writes will fail with media errors, while others may succeed, depending on where the system happens to try to place the data.  Recovering from write errors is much like recovering from read errors: repeatedly write data to the drive until there are no more errors.  \r\n\r\nThe simplest method is to use a command like:\r\n\r\ncat /dev/zero >> zerofile\r\n\r\nThis will attempt to fill up all the free space on your drive with a file full of null bytes.  Keep repeating the process until there are no more media errors, only a disk full error.  Note the double \'>\' character: this appends data to the file so you don\'t have to start over every time.\r\n\r\nWith enough persistence and patience, you will likely be able to eliminate all the media errors and recover most if not all of your data.  You can probably continue using your hard drive, just make sure to follow the prevention measures below.\r\n\r\nPREVENTION\r\n\r\nThe steps described above for recovering from failure can also prevent those failures from occurring in the first place.\r\n\r\nPOWER MANAGEMENT\r\n\r\nFor long term use of external drives, wall power is usually the best choice.  Bus power should only be used as a temporary convenience, such as when traveling with a laptop.\r\n\r\nCABLE CARE\r\n\r\nHandle your cables with care: do not over bend them, always grip the plug and not the cable when inserting or removing, and replace any cable that looks worn or frayed.  Remember that internal ribbon cables are not designed to be frequently moved, so handle them with extra care and consider replacing them if you\'ve had to move them more than a few times.\r\n\r\nHEAT MANAGEMENT\r\n\r\nMost hardware failures are caused by excessive heat.  For desktop towers, you should periodically open them (while off!) and use canned air to blow out accumulated dust.  For laptop and compact systems (like iMacs), install fan control software to turn up the cooling fans a little.  This is especially important if you play video games, as this tends to stress components to (and sometimes beyond) their capacities.  \r\n\r\nRunning Windows under Boot Camp on a Mac seems to cause particularly bad heat problems.  If a fan ever fails, have it repaired immediately.\r\n\r\nUSE IT OR LOSE IT\r\n\r\nThe magnetic media of a hard drive is not permanent.  As soon as data is written, it begins to fade.  Eventually, the signal will become too weak to read, resulting in media errors even if the physical media is perfect.  This can occur in as little as a few months, though usually it takes a few years.\r\n\r\nThe best way to protect your data from media failures is to occasionally read it.  For example, by making a backup!  That\'s right, the simple act of reading a file to backup it up makes it much less likely that you\'ll ever need to use that backup.\r\n\r\nBut beware: if you perform incremental backups, such as with Time Machine, then files which have not changed will not be reread by the backup software.  Only a full, fresh backup will get every file on your disk.  \r\n\r\nIf there are a few files that you do not normally change or backup, make sure to occasionally read them in some manner so that the drive\'s reallocation algorithm can find and correct any problems before they become severe.  A simple way to read a big file is to use a command like:\r\n\r\ncat bigfile > /dev/null\r\n\r\nIf you have hard drives or files that you are storing offline, be sure to exercise them at least twice per year.  This includes your backups themselves!!\r\n\r\nSummary\r\n\r\nA hardware failure in a disk drive is a scary thing: your precious data is at risk.  Cool it, back up critical files, backup the whole thing, then try to rehabilitate.\r\n\r\nAnd keep making those backups!',''),(52,17,'Regarding Ticket #6526: How to Run [fan] Diagnostics on Dell Latitude ','More information can be found at this URL: \r\nhttp://support.dell.com/support/edocs/systems/late6510/en/SM/bios.htm#enter\r\n\r\nThe Boot menu lists all the valid boot devices for your computer. \r\n\r\nUse the Boot menu to:\r\n\r\n* Run diagnostics on your computer\r\n* Enter system setup\r\n* Change the boot sequence without changing the boot sequence permanently in the system setup.\r\n\r\nTo access the Boot menu:\r\n\r\n1. Turn on (or restart) your computer.\r\n\r\n2. When the blue DELLâ„¢ logo is displayed, press <F12> immediately.\r\n\r\n[System Logs]\r\n\r\n    [Option]	                 \r\n    [Description]\r\n\r\n[BIOS Events]	\r\n[Allows you to view and clear BIOS POST events. It includes the date and time of the event as well as the LED code.]\r\n\r\n[DellDiag Events]	\r\n[Allows you to view the diagnostic results from Dell Diagnostics and PSA. It includes the time and date, the diagnostic and version which was run and the resulting code.]\r\n\r\n[Thermal Events]	\r\n[Allows you to view and clear thermal events. It includes the date and time as well as the name of the event.]\r\n\r\n[Power Events]	\r\n[Allows you to view and clear power events. It includes the date and time of the event as well as the power state and reason.]\r\n\r\n[BIOS Progress Events]	\r\n[Allows you to view and clear BIOS Progress events. It includes the date and time of the event as well as the power state.]',''),(54,17,'Regarding Ticket #6532: Spotlight Broken','0. Spot light needs to be re-indexed\r\n1. Normal User logs out\r\n2. aa-admin logs in\r\n3. sudo mdutil -E /\r\n4. aa-admin logs out\r\n5. Normal User logs back in\r\n6. Normal User presses Command+SpaceBar and it will show the re-index in progress and estimated time to complete.',''),(53,17,'Regarding Ticket #6525: Public Mac - LiveUpdate Causes Log Out to Hang','0.0 Helpful URL:\r\nhttp://apple.stackexchange.com/questions/52366/software-update-hangs-on-os-x-snow-leopard-how-can-i-fix-it\r\n \r\n1.0 Work Around:\r\n\r\nUse force quit to quit all instances of LiveUpdate before logging out.\r\n\r\n** Press Command-Option-ESC **\r\n\r\nOR\r\n\r\n** Nagivate the \"apple menu\" to Force Quit ... **\r\n\r\n** Hold the shift-key to select multiple application instances [LiveUpdate, and/or Other Apps] instances **\r\n\r\nLogout will then happen in less than 5-seconds.\r\n',''),(57,17,'How to Move a System Hard Drive to a Different System?','Case Study: Moving Dactyl to a new server.\r\n\r\n0.0 Remove the system hard drive from the server and install it in the new server.\r\n0.1 In the case of Dactyl, there was only one drive. \r\n\r\n1.0 Get the operating systems installation DVD or CD.\r\n1.1 Dactyl used CentOS 5.8, so the CentOS 5.8 disk 1 was used\r\n1.2 The OS / installation disk must be bootable.\r\n\r\n2.0  Boot the Installation disk and press DEL to enter the BIOS and make sure all those settings are correct.\r\n2.1 The hard drives should be AHCPI not IDE\r\n2.2 Try loading the optimized defaults and go back to edit the hard drives to use AHCPI.\r\n2.3 Make sure the DVD drive is first in the boot order.\r\n2.4 Save the BIOS configuration and let it reboot\r\n\r\n3.0 When the OS DVD boot menu appears, at the bottom of the screen it will say \"boot:\" \r\n     - without the quotation marks.  \r\n3.1 Input the words \"linux rescue\" at the prompt.\r\n      - without the quotation marks\r\n3.2 In the following screens, select the language option, keyboard type, network startup (select no), and click \"Continue\" when asked whether to mount root rw, ro, \r\n[ Continue | Read-Only | Skip ] \r\n\r\n4.0 There will be some graphical windows and eventually there will be instructions to input the \"chroot\" command.\r\n4.1 sh-3.2# Input: \"chroot /mnt/sysimage\"\r\n\r\n5.0 cd /boot/grub\r\n5.1 less grub.conf\r\n5.2 make note of the kernel being used. For example:\r\n5.2.1 title CentOS (2.6.18-238.el5)\r\n5.2.2 kernel /vmlinuz-2.6.18-238.el5\r\n5.2.3 initrd /initrd-2.6.18-238.el5.img\r\n\r\n6.0 cd ..\r\n6.1 [root@asm100 boot]# pwd\r\n      /boot\r\n6.2 ls -l\r\n-rw-r--r-- 1 root root 2094652 Jan 13  2011 vmlinuz-2.6.18-238.el5\r\n-rw-r--r-- 1 root root 2117180 Jul 10 06:18 vmlinuz-2.6.18-308.11.1.el5\r\n-rw-r--r-- 1 root root 2117564 Aug 21 14:40 vmlinuz-2.6.18-308.13.1.el5\r\n-rw-r--r-- 1 root root 2117980 Oct  2 19:37 vmlinuz-2.6.18-308.16.1.el5\r\n\r\n# The interesting thing with the above ls -l, is that it shows many newer kernels than the one that GRUB is using.\r\n\r\n6.3 We are going to use the same kernel that GRUB is using (several kernels older than what is available).\r\n6.3.1 The OS is using the present GRUB file and will not let you edit and save any changes.\r\n6.4 Input the following and press enter:\r\n/sbin/mkinitrd /boot/initrd-2.6.18-238.el5.img 2.6.18-238.el5\r\n6.5 Input the word \"exit\" (without the quotes) twice and the system will reboot.\r\n6.5.1 Be sure to remove the BOOT CDROM/DVD\r\n\r\n7.0 The network configuration file needs to be edited so that it can use the new system\'s MAC address (aka HWADDR).\r\n7.1 Put the BOOT CDROM/DVD back in and reboot the system.\r\n/etc/sysconfig/network-scripts\r\n/etc/sysconfig\r\n\r\n\r\n\r\n',''),(58,13,'Can\'t add printers because aaACCOUNT is not in Print Admin group.','1) launch console\r\n2) sudo dscl . -append /Groups/lpadmin GroupMembership aaACCOUNT \r\n3) add printer',''),(59,13,'What is UN and PW for administer of the printer accounts?','UN: tsadmin\r\nPW: as229 or D@edalus008!',''),(60,8,'Can I add an AD account on a Mac without the user present so ARD access can be enabled?','I located a command line (SSH or local) method for forcing the ACES Macs to add accounts without requiring the person to be present to log in. Once done ARD can be activated for that user.\r\n\r\nhttp://derflounder.wordpress.com/2011/08/12/creating-ad-or-od-mobile-users-from-the-command-line/\r\n\r\nsudo /System/Library/CoreServices/ManagedClient.app/Contents/Resources/createmobileaccount -n username\r\n\r\nIt spits out errors but it seems to work anyway.\r\n\r\nAnd ARD:\r\n\r\nsudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users username -privs -all -restart -agent -menu','');
/*!40000 ALTER TABLE `kbarticles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kbcategories`
--

DROP TABLE IF EXISTS `kbcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kbcategories` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentID` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kbcategories`
--

LOCK TABLES `kbcategories` WRITE;
/*!40000 ALTER TABLE `kbcategories` DISABLE KEYS */;
INSERT INTO `kbcategories` VALUES (1,0,'IRM'),(2,1,'Computers'),(3,1,'Networking'),(4,1,'Software'),(5,1,'Tracking'),(6,1,'Reports'),(7,1,'Request Help'),(8,1,'Setup'),(9,1,'Preferences'),(10,1,'Knowledge Base'),(11,1,'FAQ'),(12,1,'Logout'),(13,1,'Printing'),(14,1,'Daedalus'),(17,1,'2012');
/*!40000 ALTER TABLE `kbcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missed_scan`
--

DROP TABLE IF EXISTS `missed_scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missed_scan` (
  `missed_scan` varchar(16) NOT NULL DEFAULT '',
  UNIQUE KEY `missed_scan` (`missed_scan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missed_scan`
--

LOCK TABLES `missed_scan` WRITE;
/*!40000 ALTER TABLE `missed_scan` DISABLE KEYS */;
/*!40000 ALTER TABLE `missed_scan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odin`
--

DROP TABLE IF EXISTS `odin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odin` (
  `odin_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `ODIN_Number` int(8) unsigned NOT NULL DEFAULT '0',
  `serial_number` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(128) NOT NULL DEFAULT '',
  `os` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `gateway` varchar(20) NOT NULL DEFAULT '',
  `netmask` varchar(20) NOT NULL DEFAULT '',
  `Box_Jack` varchar(20) NOT NULL DEFAULT '',
  `Ethernet_MAC` varchar(30) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `building` varchar(128) NOT NULL DEFAULT '',
  `room` varchar(90) NOT NULL DEFAULT '',
  `owner` varchar(30) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`odin_id`),
  UNIQUE KEY `NEMS` (`ODIN_Number`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odin`
--

LOCK TABLES `odin` WRITE;
/*!40000 ALTER TABLE `odin` DISABLE KEYS */;
/*!40000 ALTER TABLE `odin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefs`
--

DROP TABLE IF EXISTS `prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prefs` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefs`
--

LOCK TABLES `prefs` WRITE;
/*!40000 ALTER TABLE `prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `software` (
  `software_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `version` varchar(20) NOT NULL DEFAULT '',
  `serial_number` varchar(60) NOT NULL DEFAULT '',
  `os` varchar(128) NOT NULL DEFAULT '',
  `software_class` varchar(128) NOT NULL DEFAULT '',
  `license_num` mediumint(17) NOT NULL DEFAULT '0',
  `license_used` mediumint(17) NOT NULL DEFAULT '0',
  `software_type` varchar(32) NOT NULL DEFAULT '',
  `display` varchar(32) NOT NULL DEFAULT '',
  `upgrade_cost` mediumint(7) NOT NULL DEFAULT '0',
  `purchase_date` varchar(30) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `owner_history` text NOT NULL,
  `comments` text NOT NULL,
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`software_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1873 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `software`
--

LOCK TABLES `software` WRITE;
/*!40000 ALTER TABLE `software` DISABLE KEYS */;
/*!40000 ALTER TABLE `software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surplus_computer`
--

DROP TABLE IF EXISTS `surplus_computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_computer` (
  `surplus_computer_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `computer_id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `NEMS` int(10) unsigned NOT NULL DEFAULT '0',
  `odin_tag` varchar(30) NOT NULL,
  `serial_number` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(128) NOT NULL DEFAULT '',
  `mfg` varchar(128) NOT NULL DEFAULT 'Apple',
  `model` varchar(100) NOT NULL DEFAULT '',
  `model_number` varchar(30) NOT NULL DEFAULT '',
  `os` varchar(128) NOT NULL DEFAULT '',
  `osver` varchar(128) NOT NULL DEFAULT '',
  `OEM_software` varchar(128) NOT NULL DEFAULT '',
  `processor` varchar(128) NOT NULL DEFAULT '',
  `processor_speed` mediumint(7) NOT NULL DEFAULT '0',
  `cpu_count` varchar(20) NOT NULL DEFAULT '',
  `ramtype` varchar(128) NOT NULL DEFAULT '',
  `ram` varchar(128) NOT NULL DEFAULT '',
  `hdspace` float NOT NULL DEFAULT '0',
  `network` varchar(100) NOT NULL DEFAULT '',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `gateway` varchar(20) NOT NULL DEFAULT '',
  `netmask` varchar(20) NOT NULL DEFAULT '',
  `Box_Jack` varchar(20) NOT NULL DEFAULT '',
  `Ethernet_MAC` varchar(30) NOT NULL DEFAULT '',
  `order_number` varchar(30) NOT NULL DEFAULT '',
  `purchase_date` varchar(30) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `building` varchar(128) NOT NULL DEFAULT '',
  `room` varchar(90) NOT NULL DEFAULT '',
  `owner` varchar(30) NOT NULL DEFAULT '',
  `user` varchar(30) NOT NULL DEFAULT '',
  `weight` float NOT NULL DEFAULT '1',
  `backup` varchar(128) NOT NULL DEFAULT '',
  `pass_exp` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Property Pass Expiration Date',
  `outstanding_issues` varchar(128) NOT NULL DEFAULT 'None',
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL DEFAULT '0000-00-00',
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`surplus_computer_id`),
  UNIQUE KEY `NEMS` (`NEMS`)
) ENGINE=MyISAM AUTO_INCREMENT=382 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surplus_computer`
--

LOCK TABLES `surplus_computer` WRITE;
/*!40000 ALTER TABLE `surplus_computer` DISABLE KEYS */;
/*!40000 ALTER TABLE `surplus_computer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surplus_customer`
--

DROP TABLE IF EXISTS `surplus_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_customer` (
  `surplus_customer_id` mediumint(17) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` mediumint(7) NOT NULL DEFAULT '0',
  `UUPIC` text NOT NULL,
  `lastname` varchar(30) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `login_name` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `unix_group` varchar(30) NOT NULL,
  `unix_ext_groups` varchar(128) NOT NULL,
  `unix_shell` varchar(30) NOT NULL,
  `rmt_access` varchar(128) NOT NULL,
  `building` varchar(128) NOT NULL DEFAULT '',
  `room` varchar(6) NOT NULL DEFAULT '',
  `employer` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(60) NOT NULL DEFAULT '',
  `position` varchar(60) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(35) NOT NULL DEFAULT '',
  `mail_stop` varchar(11) NOT NULL DEFAULT '',
  `outstanding_issues` varchar(128) NOT NULL DEFAULT 'None',
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL DEFAULT '0000-00-00',
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`surplus_customer_id`),
  UNIQUE KEY `lastname` (`lastname`)
) ENGINE=MyISAM AUTO_INCREMENT=15238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surplus_customer`
--

LOCK TABLES `surplus_customer` WRITE;
/*!40000 ALTER TABLE `surplus_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `surplus_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surplus_ext_device`
--

DROP TABLE IF EXISTS `surplus_ext_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_ext_device` (
  `surplus_ext_device_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `ext_device_id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `NEMS` int(10) NOT NULL DEFAULT '0',
  `serial_number` varchar(100) NOT NULL DEFAULT '',
  `ext_type` varchar(100) NOT NULL DEFAULT '',
  `mfg` varchar(100) NOT NULL DEFAULT '',
  `ext_model` varchar(100) NOT NULL DEFAULT '',
  `ramtype` varchar(128) NOT NULL DEFAULT '',
  `ram` varchar(128) NOT NULL DEFAULT '',
  `size` varchar(100) NOT NULL DEFAULT '',
  `network` varchar(100) NOT NULL DEFAULT '',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `mac` varchar(30) NOT NULL DEFAULT '',
  `order_number` varchar(30) NOT NULL DEFAULT '',
  `purchase_date` varchar(30) NOT NULL DEFAULT '',
  `warranty` varchar(100) NOT NULL DEFAULT '',
  `consm_type` varchar(200) NOT NULL DEFAULT '',
  `consm_num` varchar(100) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `weight` float NOT NULL DEFAULT '0',
  `building` varchar(128) NOT NULL DEFAULT '',
  `room` varchar(30) NOT NULL DEFAULT '',
  `owner` varchar(90) NOT NULL DEFAULT '',
  `user` varchar(90) NOT NULL DEFAULT '',
  `outstanding_issues` varchar(128) NOT NULL DEFAULT 'None',
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL DEFAULT '0000-00-00',
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`surplus_ext_device_id`),
  UNIQUE KEY `NEMS` (`NEMS`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surplus_ext_device`
--

LOCK TABLES `surplus_ext_device` WRITE;
/*!40000 ALTER TABLE `surplus_ext_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `surplus_ext_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surplus_odin`
--

DROP TABLE IF EXISTS `surplus_odin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_odin` (
  `surplus_odin_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `odin_id` int(8) unsigned NOT NULL DEFAULT '0',
  `ODIN_Number` int(8) unsigned NOT NULL DEFAULT '0',
  `serial_number` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(128) NOT NULL DEFAULT '',
  `os` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `gateway` varchar(20) NOT NULL DEFAULT '',
  `netmask` varchar(20) NOT NULL DEFAULT '',
  `Box_Jack` varchar(20) NOT NULL DEFAULT '',
  `Ethernet_MAC` varchar(30) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `building` varchar(128) NOT NULL DEFAULT '',
  `room` varchar(90) NOT NULL DEFAULT '',
  `owner` varchar(30) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL DEFAULT '0000-00-00',
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`surplus_odin_id`),
  UNIQUE KEY `NEMS` (`ODIN_Number`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surplus_odin`
--

LOCK TABLES `surplus_odin` WRITE;
/*!40000 ALTER TABLE `surplus_odin` DISABLE KEYS */;
/*!40000 ALTER TABLE `surplus_odin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surplus_software`
--

DROP TABLE IF EXISTS `surplus_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surplus_software` (
  `surplus_software_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `software_id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `version` varchar(20) NOT NULL DEFAULT '',
  `serial_number` varchar(60) NOT NULL DEFAULT '',
  `os` varchar(128) NOT NULL DEFAULT '',
  `software_class` varchar(128) NOT NULL DEFAULT '',
  `license_num` mediumint(17) NOT NULL DEFAULT '0',
  `license_used` mediumint(17) NOT NULL DEFAULT '0',
  `software_type` varchar(32) NOT NULL DEFAULT '',
  `display` varchar(32) NOT NULL DEFAULT '',
  `upgrade_cost` mediumint(7) NOT NULL DEFAULT '0',
  `purchase_date` varchar(30) NOT NULL DEFAULT '',
  `groupname` varchar(128) NOT NULL DEFAULT '',
  `owner_history` text NOT NULL,
  `comments` text NOT NULL,
  `surplus_date` date NOT NULL DEFAULT '0000-00-00',
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`surplus_software_id`)
) ENGINE=MyISAM AUTO_INCREMENT=572 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surplus_software`
--

LOCK TABLES `surplus_software` WRITE;
/*!40000 ALTER TABLE `surplus_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `surplus_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(32) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `assign` varchar(30) NOT NULL DEFAULT '',
  `category` varchar(64) NOT NULL DEFAULT '',
  `computer_id` int(11) NOT NULL DEFAULT '0',
  `priority` varchar(32) NOT NULL DEFAULT '',
  `customer` varchar(30) NOT NULL DEFAULT '',
  `groupname` varchar(32) NOT NULL DEFAULT '',
  `uemail` varchar(100) NOT NULL DEFAULT '',
  `summary` varchar(60) NOT NULL,
  `contents` text NOT NULL,
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Admin','21232f297a57a5a743894a0e4a801fc3','Administrator Guy','root@localhost','Admin Place (in front of the computer)','Use e-mail','admin',''),('Guest','084e0343a0486ff05530df6c705c8bb4','Guest User','email','','','post-only',''),('Normal','fea087517c26fadd409bd4b9dc642555','Normal User','user@localhost','','','normal',''),('Tech','d9f9133fb120cd6096870bc2b496805b','Technician User','tech@localhost','','','tech',''),('IRMConnect','5b167eda5db4f8e9a814a68d7e943c34','Special account','email','','','post-only','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-28 10:47:33
