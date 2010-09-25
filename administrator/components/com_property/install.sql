-- phpMyAdmin SQL Dump
-- version 3.1.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Athor: Keshav Mohta
-- Generation Time: Sep 10, 2010 at 01:27 PM
-- Server version: 5.1.30
-- PHP Version: 5.2.8
--
-- custom tables used to create property component in joomla
--

SET FOREIGN_KEY_CHECKS=0;

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `eradb`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_property`
--
-- Creation: Sep 08, 2010 at 07:12 PM
--
CREATE TABLE IF NOT EXISTS `#__property` (
  `property_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `property_name` varchar(250) NOT NULL COMMENT 'short description of property',
  `property_type_id` int(10) unsigned zerofill NOT NULL,
  `property_province_id` int(10) unsigned zerofill NOT NULL,
  `property_district_id` int(10) unsigned zerofill NOT NULL,
  `property_city_id` int(10) unsigned zerofill NOT NULL,
  `property_address_line1` varchar(250) NOT NULL,
  `property_address_line2` varchar(250) NOT NULL,
  `property_zip` varchar(8) NOT NULL,
  `property_price` varchar(10) NOT NULL,
  `property_description` text NOT NULL,
  `contact_person` varchar(50) NOT NULL COMMENT 'contact person name',
  `contact_number` bigint(15) NOT NULL,
  `contact_address` text NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `property_image_id` int(10) unsigned zerofill NOT NULL COMMENT 'image id of property',
  `generated_reference_no` varchar(15) NOT NULL COMMENT 'system generated number',
  `property_views` int(10) unsigned zerofill NOT NULL COMMENT 'how many times property viewd',
  `property_added_by` int(10) unsigned zerofill NOT NULL COMMENT 'id of contcat person',
  `property_added_date` datetime NOT NULL,
  `porperty_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `property_status` enum('t','f') NOT NULL DEFAULT 't',
  PRIMARY KEY (`property_id`),
  KEY `property_type_id` (`property_type_id`),
  KEY `property_district_id` (`property_city_id`),
  KEY `property_image_id` (`property_image_id`),
  KEY `property_province_id` (`property_province_id`),
  KEY `property_contact_id` (`contact_person`),
  KEY `property_added_by` (`property_added_by`),
  KEY `property_district_id_2` (`property_district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains basic information of a property' AUTO_INCREMENT=1 ;


--
-- Dumping data for table `jos_property`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_property_detail`
--
-- Creation: Sep 08, 2010 at 07:00 PM
--

CREATE TABLE IF NOT EXISTS `#__property_detail` (
  `property_detail_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned zerofill NOT NULL COMMENT 'reference to #__property-->property_id',
  `total_bedroom` int(11) NOT NULL,
  `total_bathroom` int(11) NOT NULL,
  `total_covered_area` int(11) NOT NULL COMMENT 'in meter square',
  `total covered_verandas` int(11) NOT NULL COMMENT 'in meter square',
  `communal_pool` enum('t','f') NOT NULL DEFAULT 'f',
  `personal_pool` enum('t','f') NOT NULL DEFAULT 'f',
  `parking_type` enum('open','carport') NOT NULL,
  `parking_id` int(10) unsigned zerofill NOT NULL COMMENT 'parking specification id',
  `property_condition` enum('new','resale','rebuilt','vacant field') NOT NULL DEFAULT 'new',
  `property_extra_features` text NOT NULL,
  `built_year` year(4) NOT NULL,
  `pets_allowed` enum('t','f') NOT NULL DEFAULT 't',
  `sea_distance` int(11) NOT NULL COMMENT 'in meters',
  `airport_distance` int(11) NOT NULL COMMENT 'in meters',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`property_detail_id`),
  KEY `property_id` (`property_id`),
  KEY `total_bedroom` (`total_bedroom`),
  KEY `total_bathroom` (`total_bathroom`),
  KEY `parking_id` (`parking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains detailed information of specific property' AUTO_INCREMENT=1;

--
-- Dumping data for table `jos_property_detail`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_property_image`
--
-- Creation: Sep 08, 2010 at 07:08 PM
--


CREATE TABLE IF NOT EXISTS `#__property_image` (
  `propery_image_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned zerofill NOT NULL,
  `property_image_path` tinytext NOT NULL,
  `image_add_date` datetime NOT NULL,
  `image_updated_by` int(11) NOT NULL COMMENT 'user id',
  `image_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`propery_image_id`),
  KEY `property_id` (`property_id`),
  KEY `image_updated_by` (`image_updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='information of all images of a property' AUTO_INCREMENT=1;

--
-- Dumping data for table `jos_property_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_property_type`
--
-- Creation: Sep 08, 2010 at 06:30 PM
--
CREATE TABLE IF NOT EXISTS `#__property_type` (
  `type_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `type_status` enum('t','f') NOT NULL DEFAULT 't',
  `type_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='type detail of property' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `jos_property_type`
--

INSERT INTO `#__property_type` (`type_id`, `type_name`, `type_status`, `type_updated`) VALUES
(0000000001, 'Apartment', 't', '2010-09-13 15:29:30'),
(0000000002, 'Detached house', 't', '2010-09-13 15:29:30'),
(0000000003, 'Semi Detached', 't', '2010-09-13 15:30:13'),
(0000000004, 'Town house', 't', '2010-09-13 15:30:13'),
(0000000005, 'Flat', 't', '2010-09-13 15:30:49'),
(0000000006, 'Residential', 't', '2010-09-13 15:30:49'),
(0000000007, 'Row House', 't', '2010-09-13 15:31:20'),
(0000000008, 'Duplex', 't', '2010-09-13 15:31:20'),
(0000000009, 'Simplex', 't', '2010-09-13 15:31:42'),
(0000000010, 'Vacant land', 't', '2010-09-13 15:31:42'),
(0000000011, 'Guest house', 't', '2010-09-13 15:32:30'),
(0000000012, 'Farms', 't', '2010-09-13 15:32:30'),
(0000000013, 'Commercial', 't', '2010-09-13 15:33:12'),
(0000000014, 'Factory', 't', '2010-09-13 15:33:12'),
(0000000015, 'Security estate', 't', '2010-09-13 15:35:03'),
(0000000016, 'Golf Estate', 't', '2010-09-13 15:35:03'),
(0000000017, 'Country estate', 't', '2010-09-13 15:35:03'),
(0000000018, 'Cottage', 't', '2010-09-13 15:35:03'),
(0000000019, 'Development land', 't', '2010-09-13 15:35:03');


-- -------------------------------------------------------------

--
-- Table structure for table `jos_property_province`
--

CREATE TABLE IF NOT EXISTS `#__property_province` (
  `province_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `province_name` varchar(30) NOT NULL,
  `province_status` enum('a','i') NOT NULL DEFAULT 'a',
  `province_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`province_id`),
  UNIQUE KEY `province_name` (`province_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- ---------------------------------------------------------------
--
-- Table structure for table `jos_property_district`
--

CREATE TABLE IF NOT EXISTS `#__property_district` (
  `district_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned zerofill NOT NULL,
  `district_name` varchar(30) NOT NULL,
  `district_status` enum('a','i') NOT NULL DEFAULT 'a',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`,`province_id`),
  KEY `province_id` (`province_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- ---------------------------------------------------------------

--
-- Table structure for table `jos_property_city`
--

CREATE TABLE IF NOT EXISTS `#__property_city` (
  `city_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `city_name` varchar(30) NOT NULL,
  `district_id` int(10) unsigned zerofill NOT NULL,
  `city_status` enum('a','i') NOT NULL DEFAULT 'a',
  `city_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_name` (`city_name`,`district_id`),
  KEY `district_id` (`district_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
-- ---------------------------------------------------------------

-- -------------------------------------------------------------

SET FOREIGN_KEY_CHECKS=1;

