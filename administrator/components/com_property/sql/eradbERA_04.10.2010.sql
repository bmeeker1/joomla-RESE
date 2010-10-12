-- phpMyAdmin SQL Dump
-- version 3.1.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2010 at 07:45 PM
-- Server version: 5.1.30
-- PHP Version: 5.2.8

SET FOREIGN_KEY_CHECKS=0;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eradb`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(90) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'banner',
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `clickurl` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `custombannercode` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jos_banner`
--

INSERT INTO `jos_banner` (`bid`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `imageurl`, `clickurl`, `date`, `showBanner`, `checked_out`, `checked_out_time`, `editor`, `custombannercode`, `catid`, `description`, `sticky`, `ordering`, `publish_up`, `publish_down`, `tags`, `params`) VALUES
(1, 1, 'banner', 'OSM 1', 'osm-1', 0, 43, 0, 'osmbanner1.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(2, 1, 'banner', 'OSM 2', 'osm-2', 0, 49, 0, 'osmbanner2.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(3, 1, '', 'Testing Banner', 'testing-banner', 0, 6, 0, 'erabigimg.png', '', '2010-08-18 13:04:33', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'width=0\nheight=0');

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannerclient`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `contact` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `extrainfo` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_bannerclient`
--

INSERT INTO `jos_bannerclient` (`cid`, `name`, `contact`, `email`, `extrainfo`, `checked_out`, `checked_out_time`, `editor`) VALUES
(1, 'Open Source Matters', 'Administrator', 'admin@opensourcematters.org', '', 0, '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannertrack`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `section` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `image_position` varchar(90) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(2, 0, 'Joomla! Specific Links', '', 'joomla-specific-links', 'clock.jpg', 'com_weblinks', 'left', 'A selection of links that are all related to the Joomla! Project.', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(4, 0, 'Joomla!', '', 'joomla', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(5, 0, 'General', '', 'general', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(6, 0, 'Linux', '', 'linux', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(12, 0, 'Contacts', '', 'contacts', '', 'com_contact_details', 'left', 'Contact Details for this Web site', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(13, 0, 'Joomla', '', 'joomla', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(15, 0, 'Features', '', 'features', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(17, 0, 'Benefits', '', 'benefits', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(18, 0, 'Platforms', '', 'platforms', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(19, 0, 'Other Resources', '', 'other-resources', '', 'com_weblinks', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(29, 0, 'The CMS', '', 'the-cms', 'powered_by.png', '4', 'right', 'Joomla! provides plenty of flexibility when displaying your Web content. Whether you are using Joomla! for a blog site, news or a Web site for a company, you''ll find one or more content styles to showcase your information. You can also change the style of content dynamically depending on your preferences. Joomla! calls how a page is laid out a layout. Use the guide below to understand which layouts are available and how you might use them.', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(34, 0, 'YOOtheme', '', 'yootheme', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(35, 0, 'YOOcarousel', '', 'yoocarousel', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(36, 0, 'YOOscroller', '', 'yooscroller', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--
-- Creation: Sep 10, 2010 at 04:14 PM
-- Last update: Sep 18, 2010 at 03:18 PM
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `admin_menu_alt` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `option` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, '', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=0\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png,jpeg\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=1\nshow_intro=1\nshow_section=0\nlink_section=1\nshow_category=0\nlink_category=1\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\nfilter_groups=29|18|19|20|21|30|23|24\nfilter_type=BL\nfilter_tags=\nfilter_attritbutes=\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(35, 'Joom!Fish', 'option=com_joomfish', 0, 0, 'option=com_joomfish', 'Joom!Fish', 'com_joomfish', 0, 'components/com_joomfish/assets/images/icon-16-joomfish.png', 0, 'noTranslation=2\ndefaultText=\noverwriteGlobalConfig=1\nstorageOfOriginal=md5\nfrontEndPublish=1\nfrontEndPreview=1\nshowPanelNews=1\nshowPanelUnpublished=1\nshowPanelState=1\ncopyparams=1\ntranscaching=0\ncachelife=180\nqacaching=1\nqalogging=0\n', 1),
(36, 'Control Panel', '', 0, 35, 'option=com_joomfish', 'Control Panel', 'com_joomfish', 0, 'components/com_joomfish/assets/images/icon-16-cpanel.png', 0, '', 1),
(37, 'Translation', '', 0, 35, 'option=com_joomfish&task=translate.overview', 'Translation', 'com_joomfish', 1, 'components/com_joomfish/assets/images/icon-16-translation.png', 0, '', 1),
(38, 'Orphan Translations', '', 0, 35, 'option=com_joomfish&task=translate.orphans', 'Orphan Translations', 'com_joomfish', 2, 'components/com_joomfish/assets/images/icon-16-orphan.png', 0, '', 1),
(39, 'Manage Translations', '', 0, 35, 'option=com_joomfish&task=manage.overview', 'Manage Translations', 'com_joomfish', 3, 'components/com_joomfish/assets/images/icon-16-manage.png', 0, '', 1),
(40, 'Statistics', '', 0, 35, 'option=com_joomfish&task=statistics.overview', 'Statistics', 'com_joomfish', 4, 'components/com_joomfish/assets/images/icon-16-statistics.png', 0, '', 1),
(41, '', '', 0, 35, 'option=com_joomfish', '', 'com_joomfish', 5, 'components/com_joomfish/assets/images/icon-10-blank.png', 0, '', 1),
(42, 'Languages', '', 0, 35, 'option=com_joomfish&task=languages.show', 'Languages', 'com_joomfish', 6, 'components/com_joomfish/assets/images/icon-16-language.png', 0, '', 1),
(43, 'Content elements', '', 0, 35, 'option=com_joomfish&task=elements.show', 'Content elements', 'com_joomfish', 7, 'components/com_joomfish/assets/images/icon-16-extension.png', 0, '', 1),
(44, 'Plugins', '', 0, 35, 'option=com_joomfish&task=plugin.show', 'Plugins', 'com_joomfish', 8, 'components/com_joomfish/assets/images/icon-16-plugin.png', 0, '', 1),
(45, '', '', 0, 35, 'option=com_joomfish', '', 'com_joomfish', 9, 'components/com_joomfish/assets/images/icon-10-blank.png', 0, '', 1),
(46, 'Help', '', 0, 35, 'option=com_joomfish&task=help.show', 'Help', 'com_joomfish', 10, 'components/com_joomfish/assets/images/icon-16-help.png', 0, '', 1),
(47, 'Property', 'option=com_property', 0, 0, 'option=com_property', 'Property', 'com_property', 0, 'components/com_property/images/property.png', 0, '', 1),
(48, 'Basic', '', 0, 47, 'option=com_property&view=addproperty', 'Add', 'com_property', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(49, 'Xtra', '', 0, 47, 'option=com_property&view=xtrafeatures', 'Xtra', 'com_property', 1, 'js/ThemeOffice/component.png', 0, '', 1),
(50, 'Photo', '', 0, 47, 'option=com_property&view=addPhoto', 'Photo', 'com_property', 2, 'js/ThemeOffice/component.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_config`
--
-- Creation: Sep 14, 2010 at 03:32 PM
-- Last update: Sep 27, 2010 at 10:29 AM
--

CREATE TABLE IF NOT EXISTS `jos_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `max_comments` int(8) NOT NULL,
  `days_comments` int(8) NOT NULL,
  `max_img_size` int(8) NOT NULL,
  `max_last_comments` int(8) NOT NULL,
  `max_char_comment` int(8) NOT NULL,
  `max_thumb_width` int(4) NOT NULL,
  `max_thumb_height` int(4) NOT NULL,
  `image_store_path` varchar(512) NOT NULL,
  `image_thumb_path` varchar(512) NOT NULL,
  `standard_service_time` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_config`
--

INSERT INTO `jos_config` (`config_id`, `max_comments`, `days_comments`, `max_img_size`, `max_last_comments`, `max_char_comment`, `max_thumb_width`, `max_thumb_height`, `image_store_path`, `image_thumb_path`, `standard_service_time`) VALUES
(1, 3, 3, 30000, 3, 3, 150, 100, 'templates/yoo_symphony/images/site/', 'templates/yoo_symphony/images/site/thumbs/', 90);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `con_position` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `address` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `suburb` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `state` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `country` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `postcode` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `misc` mediumtext CHARACTER SET latin1 COLLATE latin1_general_ci,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `imagepos` varchar(60) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `email_to` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`) VALUES
(1, 'Name 1', 'name-1', 'Position', 'Street', 'Suburb', 'State', 'Country', 'Zip Code', 'Telephone', 'Fax', 'Miscellanous info', 'articles.jpg', 'top', 'email@email.com', 0, 1, 62, '2008-12-15 15:46:45', 1, 'show_name=1\nshow_position=1\nshow_email=1\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=1\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=1\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 12, 0, '', ''),
(2, 'Name 2', 'name-2', '', 'Street Address', 'Town', 'State', 'Country', 'Postal Code', 'Telephone', 'Fax', 'Informations', 'clock.jpg', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=1\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=1\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 12, 0, 'Mobile Phone', 'http://Web URL');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 20, 2010 at 03:34 PM
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `title_alias` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `introtext` mediumtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `fulltext` mediumtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `urls` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `attribs` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `metadesc` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'Welcome to Joomla!', 'welcome-to-joomla', '', '<strong>Joomla! is a free open source framework and content publishing system designed for quickly creating highly interactive multi-language Web sites, online communities, media portals, blogs and eCommerce applications.</strong>\r\n\r\n<p>Joomla! provides an easy-to-use graphical user interface that simplifies the management and publishing of large volumes of content including HTML, documents, and rich media.  Joomla! is used by organisations of all sizes for Public Web sites, Intranets, and Extranets and is supported by a community of thousands of users.</p>\r\n', '\r\nWith a fully documented library of developer resources, Joomla! allows the customisation of every aspect of a Web site including presentation, layout, administration, and the rapid integration with third-party applications.\r\n\r\n<p>Joomla! has a rich heritage and has been crowned CMS king many times over.  Now with more power under the hood, Joomla! is shifting gear and provides developer power while making the user experience all the more friendly.  For those who always wanted increased extensibility, Joomla! 1.5 can make this happen.</p>\r\n\r\n<p>A new framework, ground-up refactoring, and a highly-active development team brings the excitement of ''the next generation CMS'' to your fingertips.  Whether you are a systems architect or a complete ''noob'' Joomla! can take you to the next level of content delivery. ''More than a CMS'' is something we have been playing with as a catchcry because the new Joomla! API has such incredible power and flexibility, you are free to take whatever direction your creative mind takes you and Joomla! can help you get there so much more easily than ever before.</p>\r\n\r\n<p>Thinking Web publishing? Think Joomla!</p>', 0, 4, 0, 29, '2006-10-13 10:00:00', 62, '', '2008-12-16 15:36:38', 62, 0, '0000-00-00 00:00:00', '2006-01-03 01:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 40, 0, 1, '', '', 0, 108, 'robots=\nauthor='),
(5, 'Joomla! License Guidelines', 'joomla-license-guidelines', 'joomla-license-guidelines', '<p>This Web site is powered by <a href="http://www.joomla.org/">Joomla!</a> The software and default templates on which it runs are Copyright 2005-2007 <a href="http://www.opensourcematters.org/">Open Source Matters</a>.  All other content and data, including data entered into this Web site and templates added after installation, are copyrighted by their respective copyright owners.</p>\r\n\r\n<p>If you want to distribute, copy, or modify Joomla!, you are welcome to do so under the terms of the <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html#SEC1">GNU General Public License</a>.  If you are unfamiliar with this license, you might want to read <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html#SEC4">''How To Apply These Terms To Your Program''</a> and the <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html">''GNU General Public License FAQ''</a>.</p>\r\n', '\r\n<p>Joomla! documentation is released under the terms of the <a href="http://creativecommons.org/licenses/by-nc-sa/2.5/" title="Creative Commons ">Creative Commons Attribution-Non-Commercial-Share-Alike License 2.5</a> or by the specific license of their respective copyright owners.</p>\r\n\r\n<p>The Joomla! licence has always been GPL.</p>', 0, 4, 0, 29, '2004-08-20 10:11:07', 62, '', '2008-12-16 15:45:30', 62, 62, '2010-08-13 07:14:36', '2004-08-19 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 5, '', '', 0, 120, 'robots=\nauthor='),
(18, 'Joomla! Features', 'joomla-features', '', '<h4>Joomla! features:</h4>\r\n<ul>\r\n	<li>Completely database driven site engines </li>\r\n	<li>News, products, or services sections fully editable and manageable</li>\r\n	<li>Topics sections can be added to by contributing Authors </li>\r\n	<li>Fully customisable layouts including <em>left</em>, <em>center</em>, and <em>right </em>Menu boxes </li>\r\n	<li>Browser upload of images to your own library for use anywhere in the site </li>\r\n	<li>Dynamic Forum/Poll/Voting booth for on-the-spot results </li>\r\n	<li>Runs on Linux, FreeBSD, MacOSX server, Solaris, and AIX</li>\r\n</ul>\r\n', '\r\n<h4>Extensive Administration:</h4>\r\n<ul>\r\n	<li>Change order of objects including news, FAQs, Articles etc. </li>\r\n	<li>Random Newsflash generator </li>\r\n	<li>Remote Author submission Module for News, Articles, FAQs, and Links </li>\r\n	<li>Object hierarchy - as many Sections, departments, divisions, and pages as you want </li>\r\n	<li>Image library - store all your PNGs, PDFs, DOCs, XLSs, GIFs, and JPEGs online for easy use </li>\r\n	<li>Automatic Path-Finder. Place a picture and let Joomla! fix the link </li>\r\n	<li>News Feed Manager. Choose from over 360 News Feeds from around the world </li>\r\n	<li>E-mail a friend and Print format available for every story and Article </li>\r\n	<li>In-line Text editor similar to any basic word processor software </li>\r\n	<li>User editable look and feel </li>\r\n	<li>Polls/Surveys - Now put a different one on each page </li>\r\n	<li>Custom Page Modules. Download custom page Modules to spice up your site </li>\r\n	<li>Template Manager. Download Templates and implement them in seconds </li>\r\n	<li>Layout preview. See how it looks before going live </li>\r\n	<li>Banner Manager. Make money out of your site</li>\r\n</ul>', 0, 4, 0, 29, '2006-10-08 23:32:45', 62, '', '2008-12-16 15:41:08', 62, 0, '0000-00-00 00:00:00', '2006-10-07 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 15, 0, 3, '', '', 0, 77, 'robots=\nauthor='),
(19, 'Joomla! Overview', 'joomla-overview', '', '<p>If you''re new to Web publishing systems, you''ll find that Joomla! delivers sophisticated solutions to your online needs. It can deliver a robust enterprise-level Web site, empowered by endless extensibility for your bespoke publishing needs. Moreover, it is often the system of choice for small business or home users who want a professional looking site that''s simple to deploy and use. <em>We do content right</em>.<br />\r\n</p>\r\n\r\n<p><strong>So what''s the catch? How much does this system cost?</strong></p>\r\n\r\n<p> Well, there''s good news ... and more good news! Joomla! 1.5 is free, it is released under an Open Source license - the GNU/General Public License v 2.0. Had you invested in a mainstream, commercial alternative, there''d be nothing but moths left in your wallet and to add new functionality would probably mean taking out a second mortgage each time you wanted something adding!</p>\r\n\r\n', '\r\n\r\n<p>Joomla! changes all that ... <br />\r\n	Joomla! is different from the normal models for content management software. For a start, it''s not complicated. Joomla! has been developed for everybody, and anybody can develop it further. It is designed to work (primarily) with other Open Source, free, software such as PHP, MySQL, and Apache. </p>\r\n	\r\n<p>It is easy to install and administer, and is reliable. </p>\r\n\r\n<p>Joomla! doesn''t even require the user or administrator of the system to know HTML to operate it once it''s up and running.</p>\r\n\r\n<p>To get the perfect Web site with all the functionality that you require for your particular application may take additional time and effort, but with the Joomla! Community support that is available and the many Third Party Developers actively creating and releasing new Extensions for the 1.5 platform on an almost daily basis, there is likely to be something out there to meet your needs. Or you could develop your own Extensions and make these available to the rest of the community. </p>', 0, 4, 0, 29, '2006-10-13 07:49:20', 62, '', '2008-12-16 15:47:44', 62, 0, '0000-00-00 00:00:00', '2006-10-07 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 22, 0, 2, '', '', 0, 218, 'robots=\nauthor='),
(20, 'Support and Documentation', 'support-and-documentation', '', '<h3>Support</h3>\r\n\r\n<p>Support for the Joomla! CMS can be found on several places. The best place to start would be the official <a href="http://help.joomla.org/" target="_blank">Help Site</a>. Here you can help yourself to the information that is regularly published and updated as Joomla! develops. There is much more to come too! </p>\r\n<p>Of course you should not forget the Help System of the CMS itself. On the <em>topmenu </em>in the Back-end Control panel you find the Help button which will provide you with lots of explanation on features. </p>\r\n\r\n<p>Another great place would of course be the <a href="http://forum.joomla.org/" target="_blank">Forum</a> . On the Joomla! Forum you can find help and support from Community members as well as from Joomla! Core members and Working Group members. The forum contains a lot of information, FAQ''s, just about anything you are looking for in terms of support.</p>\r\n', '\r\n<p>Two other resources for Support are the <a href="http://dev.joomla.org/" target="_blank">Joomla! Developer Network</a> (JDN) and the <a href="http://extensions.joomla.org/" target="_blank">Joomla! Extensions Directory</a> (JED). The Developer Network for example provides lots of technical information for the experienced Developer as well as those new to Joomla! and development work in general. The JED whilst not a support site in the strictest sense has many of the Extensions that you will need as you develop your own Web site. </p>\r\n\r\n<p>The Joomla! Core members are regularly posting their blog reports about several topics such as programming techniques used in Joomla!, Security, Events and more. You can even subscribe to get notified by e-mail when a new blog post is made! </p>\r\n\r\n<h3>Documentation </h3>\r\n\r\n<p>Joomla! Documentation can of course be found on the <a href="http://help.joomla.org/" target="_blank">Help Site</a>. You can find information such as an Installation Guide, User and Administrator manuals, Frequently Asked Questions and a lot more. The User Documentation Team are the guardians of the documentation relating to the practical use of Joomla!. The Developer Documentation Team are the stalwarts behind detailing how Joomla! works from the ground up and how you can develop your own Extensions and Templates and much more.</p>\r\n\r\n<p>Other than the documentation provided by the Joomla! Documentation Work Groups there are also books written about Joomla! You can find a listing of these books in the <a href="http://help.joomla.org/content/section/44/254/" target="_blank">Joomla! Bookshelf</a> .</p>\r\n\r\n<h1>Want to help? </h1>\r\n\r\n<p>If you want to help in the documentation project for Joomla! then please post your details on the <a href="http://forum.joomla.org/index.php/board,62.0.html" title="The Joomla! User Documentation Forums">User Documentation Forum</a> or the <a href="http://forum.joomla.org/index.php/board,60.0.html" title="The Joomla! Developer Documentation Forum">Developer Documentation Forum</a> </p>\r\n\r\n<p><a class="urlextern" href="http://forum.joomla.org/index.php/board,391.0.html" target="_blank" title="http://forum.joomla.org/index.php/board,59.0.html" onclick="return svchk()"><br />\r\n	</a></p>', 1, 4, 0, 29, '2006-10-09 08:33:57', 62, '', '2008-12-22 19:39:55', 62, 0, '0000-00-00 00:00:00', '2006-10-07 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 16, 0, 7, '', '', 0, 13, 'robots=\nauthor='),
(23, 'Platforms and Open Standards', 'platforms-and-open-standards', '', '<p>Joomla! runs on any platform including Windows, most flavours of Linux, several Unix versions, and the Apple OS/X platform.  Joomla! depends on PHP and the MySQL database to deliver dynamic content. </p>\r\n<p>The minimum requirements are:</p>\r\n<ul>\r\n	<li>Apache 1.x, 2.x and higher</li>\r\n	<li>PHP 4.3 and higher</li>\r\n	<li>MySQL 3.23 and higher</li>\r\n</ul>\r\nIt will also run on alternative server platforms such as Windows IIS - provided they support PHP and MySQL - but these require additional configuration in order for the Joomla! core package to be successful installed and operated.', '', 0, 4, 0, 29, '2006-10-11 04:22:14', 62, '', '2008-12-16 15:34:16', 62, 62, '2010-08-13 07:14:58', '2006-10-10 08:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 6, '', '', 0, 17, 'robots=\nauthor='),
(27, 'The Joomla! Community', 'the-joomla-community', '', '<p><strong>Got a question? </strong>With more than 140,000 members, the online forums at <a href="http://forum.joomla.org/" target="_blank">forum.joomla.org</a> are a great resource for both new and experienced users. Go ahead, ask your toughest questions, the community is waiting to see what you''re going to do with your Joomla! site.</p>\r\n\r\n<p><strong>Do you want to show off your new Joomla! Web site?</strong> Go ahead, we have a section dedicated to that on our forum. </p>\r\n', '\r\n<p><strong>Do you want to join in?</strong></p>\r\n\r\n<p>If you think working with Joomla! is fun, wait until you start working on it. We''re passionate about helping Joomla! Users make the jump to becoming contributing members of the community, so there are many ways you can help Joomla!''s development:</p>\r\n\r\n<ul>\r\n	<li>Submit news about Joomla!. We syndicate all Joomla! related news on our <a href="http://news.joomla.org" title="Joomla! News Portal">news portal</a>. If you have some Joomla! news that you would like to share with the community, please submit your short story, article, announcement or review <a href="http://www.joomla.org/component/option,com_submissions/Itemid,75" title="Submit News">here</a>.</li>\r\n	<li>Report bugs and request features in our <a href="http://joomlacode.org/gf/project/joomla/tracker/" title="Joomla! developement trackers">trackers</a>. Please read <a href="http://dev.joomla.org/content/view/1450/89/">Reporting Bugs</a>, for details on how we like our bug reports served up</li>\r\n	<li>Submit patches for new and/or fixed behaviour. Please read <a href="http://dev.joomla.org/content/view/14/55/">Submitting Patches</a>, for details on how to submit a patch.</li>\r\n	<li>Join the <a href="http://forum.joomla.org/index.php/board,126.0.html" title="Joomla! development forums">developer forums</a> and share your ideas for how to improve Joomla!. We''re always open to suggestions, although we''re likely to be sceptical of large-scale suggestions without some code to back it up.</li>\r\n	<li>Join any of the <a href="http://dev.joomla.org/content/view/13/53/" title="Joomla! working groups">Joomla!  Working Groups</a> and bring your personal expertise to  the Joomla! community. More info about the different working groups can be found <a href="http://dev.joomla.org/content/view/13/53/" title="Joomla! working groups">on the Working Group Roll Call</a>. </li>\r\n</ul>\r\n\r\n<p> That''s all you need to know if you''d like to join the Joomla! development community. </p>', 0, 4, 0, 29, '2006-10-12 16:50:48', 62, '', '2008-12-16 15:44:55', 62, 0, '0000-00-00 00:00:00', '2006-10-11 02:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 13, 0, 4, '', '', 0, 56, 'robots=\nauthor='),
(44, 'Symphony', 'symphony', '', '<p class="dropcap">Slick as slick can be! Our new template creation Symphony is based on the <a href="http://warp.yootheme.com" target="_blank">Warp5 Joomla template framework</a> and is a perfect symbiosis of colors and shapes. Symphony has the look of a very smooth surface.</p>\r\n<blockquote class="inset-right width35" style="margin-top: 0px;">"The new Warp template framework is amazing!"</blockquote>\r\n<p>Its header provides a large presentation area you can use for product images or large headlines and all menus have a stunning three-dimensional depth ... check out the menu items'' cute little bullets! When you use the left and right column, the content area looks like it is hovering above them - a real eye-catcher.</p>\r\n<h2>Beautiful color variations</h2>\r\n<p>Symphony comes with a wide range of color variations and three extra themes we created to be used especially for cooking websites, online roleplay portals and blogs. Make sure to check out the perfectly balanced color combinations!</p>\r\n<h2>YOOtools in Action</h2>\r\n<p>Like its predecessor <a href="http://www.yootheme.com/blog/item/root/mellow-template" target="_blank">Mellow</a>, Symphony also provides fresh looks for YOOtools. The YOOtools style overrides featured in this template include overrides for the <a href="http://tools.yootheme.com/extensions/yoocarousel" target="_blank">YOOcarousel''s</a> buttons and a nice text shadow for the <a href="http://tools.yootheme.com/extensions/yootweet" target="_blank">YOOtweet</a> module. And just like always, the <a href="http://tools.yootheme.com/extensions/yoosearch" target="_blank">YOOsearch</a> got a style matching the rest of the template. Also, the presentation area can be perfectly used to display presentational YOOtools like the <a href="http://tools.yootheme.com/extensions/yooscroller" target="_blank">YOOscroller</a>.</p>\r\n<h2>Small Warp5 Updates</h2>\r\n<p>We improved JS effect of the Down Down Menu for all Internet Explorers and added some new module templates. Also we did some small changes to the headings style in our Reset CSS.</p>\r\n<p>Get Symphony and <a href="http://www.yootheme.com/signup">join the YOOtheme club today</a>.</p>', '', 1, 5, 0, 34, '2009-07-30 13:00:00', 62, '', '2010-09-10 13:33:08', 62, 0, '0000-00-00 00:00:00', '2009-07-30 13:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 136, 0, 3, '', '', 0, 20693, 'robots=\nauthor='),
(45, 'Template', 'template', '', '<h2>Warp5 Framework</h2>\r\n<p>This template is based on the Warp5 framework. Warp5 is a fast and powerful template framework for Joomla that lets you create sophisticated Joomla templates in no time. It provides a hybrid fluid-pixel grid and all the elaborate functionalities that make our templates easy to edit, nice to look at and super fast, in every browser. Visit the <a href="http://warp.yootheme.com" target="_blank">Warp5 website</a> and take a look at all <a href="http://warp.yootheme.com/features" target="_blank">the features...</a></p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="margin-right: 15px; padding-left: 60px; background: transparent url(images/yootheme/icon_menusystem.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Menu System</h3>\r\n			<p>The menu system enhances Joomla''s menu functions to create clearly arranged interfaces even for comprehensive sites. <a href="http://warp.yootheme.com/menu-system" target="_blank">Learn more...</a></p>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="padding-left: 60px; background: transparent url(images/yootheme/icon_modulesystem.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Module System</h3>\r\n			<p>The module system provides a clear grid for Joomla modules and a wide diversity of templates for module variations. <a href="http://warp.yootheme.com/module-system" target="_blank">Learn more...</a></p>\r\n		</div>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Design and Styles</h2>\r\n<p>We included a lot of different module and typography styles. So you can give your site a unique look and it will also ease your work when setting up your content.</p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="margin-right: 15px; padding-left: 60px; background: transparent url(images/yootheme/icon_modulevariations.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Module Variations</h3>\r\n			<p>This template comes with a wide variety of module stylings in many different shapes and colours. Take a look at all the different <a href="index.php?option=com_content&view=article&id=48&Itemid=58">module variations.</a></p>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="padding-left: 60px; background: transparent url(images/yootheme/icon_typography.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Typography</h3>\r\n			<p>This templates delivers you sophisticated typography and various stylings. Take a look at the <a href="index.php?option=com_content&view=article&id=46&Itemid=55">style guide</a> about all possible HTML tag styles.</p>\r\n		</div>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Installation and Customization</h2>\r\n<p>New to YOOtheme? Don''t worry! We provide a lot help to install and cutomize our tempaltes to get you started right away with your web project.</p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="margin-right: 15px; padding-left: 60px; background: transparent url(images/yootheme/icon_installation.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Installation Package</h3>\r\n			<p>We provide a full Joomla installation package with the demo content of the website for this template. So you can take a look at how everything is set up in the Joomla backend.</p>\r\n			<div class="info">Make sure you click "Install Sample Data" during the installation process.</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="padding-left: 60px; background: transparent url(images/yootheme/icon_fireworks.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Sliced Image Source Files</h3>\r\n			<p>The editable fully sliced image source files of this template are available as download. With them you can completely customise your template''s look to match your or your client''s corporate identity.</p>\r\n			<div class="info">Adobe Fireworks CS3 or higher is required to edit the image source files.</div>\r\n		</div>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Compatibility</h2>\r\n\r\n<p>This template is fully compatible with all YOOtheme products like the <a target="_blank" href="http://tools.yootheme.com/">YOOtools</a>, the <a target="_blank" href="http://zoo.yootheme.com/">ZOO</a> and the <a target="_blank" href="http://teamlog.yootheme.com/">Teamlog extension</a>.</p>\r\n\r\n<div class="tip ie6-zoom" style="overflow: hidden;">\r\n	\r\n	<p style="margin: 0px;">All YOOtools extensions are working right out of the box. Take a look at the demo pages and watch the video tutorials.</p>\r\n	\r\n	<div class="float-left width50">\r\n		<ul class="checkbox">\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yooaccordion" title="YOOaccordion">YOOaccordion</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yooaccordion" title="YOOaccordion">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yooaccordion" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoocarousel" title="YOOcarousel">YOOcarousel</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoocarousel" title="YOOcarousel">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoocarousel" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoodrawer" title="YOOdrawer">YOOdrawer</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoodrawer" title="YOOdrawer">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoodrawer" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yooslider" title="YOOslider">YOOslider</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yooslider" title="YOOslider">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yooslider" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yooscroller" title="YOOscroller">YOOscroller</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yooscroller" title="YOOscroller">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yooscroller" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoosearch" title="YOOsearch">YOOsearch</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoosearch" title="YOOsearch">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoosearch" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoogallery" title="YOOgallery">YOOgallery</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoogallery" title="YOOgallery">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoogallery-module" target="_blank">\r\n				<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/></a></li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoomaps" title="YOOmaps">YOOmaps</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoomaps" title="YOOmaps">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoomaps" target="_blank">\r\n				<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n		</ul>\r\n	</div>\r\n	<div class="float-left width50">\r\n		<ul class="checkbox">\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yootweet" title="YOOtweet">YOOtweet</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yootweet" title="YOOtweet">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yootooltip" title="YOOtooltip">YOOtooltip</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yootooltip" title="YOOtooltip">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yootooltip" target="_blank">\r\n				<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a></li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yootoppanel" title="YOOtoppanel">YOOtoppanel</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yootoppanel" title="YOOtoppanel">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tutorials.yootheme.com/index.php?option=com_mtree&task=viewlink&link_id=135&Itemid=2" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yooeffects" title="YOOeffects">YOOeffects</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yooeffects" title="YOOeffects">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yoologin" title="YOOlogin">YOOlogin</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yoologin" title="YOOlogin">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoologin" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yooholidays" title="YOOholidays">YOOholidays</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/free-stuff" title="YOOholidays">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yooiecheck" title="YOOiecheck">YOOiecheck</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yooiecheck" title="YOOiecheck">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yoosnapshots" title="YOOsnapshots">YOOsnapshots</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yoosnapshots" title="YOOsnapshots">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tutorials.yootheme.com/index.php?option=com_mtree&task=viewlink&link_id=133&Itemid=2" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n		</ul>\r\n	</div>\r\n</div>\r\n\r\n<h2>Basic Help</h2>\r\n<p>Learn more about how to install and set up a YOOtheme template and go to the <a href="http://warp.yootheme.com/documentation" target="_blank" title="How to install and set up a YOOtheme template">Warp5 documentation</a>.</p>', '', 1, 5, 0, 34, '2007-12-19 03:00:00', 62, '', '2009-10-27 09:10:38', 62, 0, '0000-00-00 00:00:00', '2007-12-19 03:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 114, 0, 4, '', '', 0, 2009, 'robots=\nauthor='),
(60, 'ZOO', 'zoo', '', '<div style="overflow: hidden; padding: 20px 0px 0px 140px;">\r\n\r\n	<a href="http://zoo.yootheme.com" target="_blank" style="display: block; float: left; margin: 0px 50px 0px 15px;">\r\n		<img width="178" height="200" class="correct-png" src="images/yootheme/yoocarousel/zoo_logo.png" alt="Versatile catalog system with content construction kit for Joomla 1.5" title="Versatile catalog system with content construction kit for Joomla 1.5" />\r\n	</a>\r\n\r\n	<div style="float: left;">\r\n\r\n		<h1 style="font-size: 50px; margin-top: 0px;">ZOO</h1>\r\n		<h2 style="font-size: 20px; font-weight: normal; margin-top: 5px;">Powerful catalog system with CCK</h2>\r\n		\r\n		<ul>\r\n			<li>Unlimited Catalogs and nested Categories.</li>\r\n			<li>Items can be assigned to multiple categories.</li>\r\n			<li>Build custom types with a rich set of elements.</li>\r\n			<li>Each catalog can have its own design and layout.</li>\r\n		</ul>\r\n\r\n		<p>Go to the <a href="http://zoo.yootheme.com" target="_blank">ZOO website</a> and get more informations about it!</p>\r\n	\r\n	</div>\r\n\r\n</div>', '', 1, 5, 0, 35, '2009-10-27 13:44:47', 62, '', '2009-10-29 15:47:53', 62, 62, '2010-08-13 07:14:11', '2009-10-27 13:44:47', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 2, '', '', 0, 3, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(46, 'Typography', 'typography', '', '<div class="note">Typography is a key element in web design. This templates delivers you sophisticated typography and various stylings. The style guide gives you an overview about all possible HTML tag stylings provided by the template. It also helps you to set up the available classes for special stylings.</div>\r\n\r\n<h1>This is an H1 Header</h1>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h2>This is an H2 Header</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h3>This is an H3 Header</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h4>This is an H4 Header</h4>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h5>This is an H5 Header</h5>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h6>This is an H6 Header</h6>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<p class="dropcap"><strong>Dropcap: use &lt;p class="dropcap"&gt;</strong>. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<hr class="dotted" />\r\n\r\n<strong>Horizontal Rule:</strong> &lt;hr&gt; tag with class="dotted"\r\n\r\n<hr class="dotted" />\r\n\r\n<div class="floatbox">\r\n	<div class="float-left width33">\r\n	\r\n		<h4>Inline Styles</h4>\r\n		<p>\r\n			<a href="#">Default &lt;a&gt; tag</a>\r\n			<br /><a href="#" class="icon-folder">&lt;a&gt; with class="icon-folder"</a>\r\n			<br /><a href="#" class="icon-file">&lt;a&gt; with class="icon-file"</a>\r\n			<br /><a href="#" class="icon-download">&lt;a&gt; with class="icon-download"</a>\r\n			<br /><a href="#" class="icon-external">&lt;a&gt; with class="icon-external"</a>\r\n			<br /><a href="#" class="icon-pdf">&lt;a&gt; with class="icon-pdf"</a>\r\n			<br /><br /><em>Default &lt;em&gt;</em>\r\n			<br /><em class="box">&lt;em&gt; with class="box"</em>\r\n			<br /><br /><acronym title="By marking up acronyms you can give useful information to browsers, spell checkers, translation systems and search-engine indexers.">Default &lt;acronym&gt;</acronym>\r\n			<br /><abbr title="By marking up abbreviations you can give useful information to browsers, spell checkers, translation systems and search-engine indexers.">Default &lt;abbr&gt;</abbr>\r\n		\r\n		</p>\r\n	\r\n	</div>\r\n	<div class="float-left width33">\r\n\r\n		<h4>Unordered List Styles</h4>\r\n\r\n		<ul>\r\n			<li>Default &lt;ul&gt; tag</li>\r\n			<li>Lorem ipsum dolor</li>\r\n			<li>Lorem ipsum dolor</li>\r\n		</ul>\r\n\r\n		<ul class="checkbox">\r\n			<li>&lt;ul&gt; with class="checkbox"</li>\r\n		</ul>\r\n		\r\n		<ul class="arrow">\r\n		  <li>&lt;ul&gt; with class="arrow"</li>\r\n		</ul>\r\n		\r\n		<ul class="star">\r\n		  <li>&lt;ul&gt; with class="star"</li>\r\n		</ul>\r\n		\r\n		<ul class="check">\r\n		  <li>&lt;ul&gt; with class="check"</li>\r\n		</ul>\r\n\r\n	</div>\r\n	<div class="float-left width33">\r\n	\r\n		<h4>Ordered List Styles</h4>\r\n\r\n		<ol>\r\n			<li>Default &lt;ol&gt; tag</li>\r\n			<li>Lorem ipsum dolor</li>\r\n			<li>Lorem ipsum dolor</li>\r\n		</ol>\r\n\r\n		<ol class="disc">\r\n		  <li>&lt;ol&gt; tag with class="disc"</li>\r\n		  <li>Item 2</li>\r\n		  <li>Item 3</li>\r\n		  <li>Item 4</li>\r\n		</ol>\r\n\r\n	</div>\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h4>Div and Span Styles</h4>\r\n<div class="note"><strong>&lt;div&gt; or &lt;span&gt; tag with class="note"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="info"><strong>&lt;div&gt; or &lt;span&gt; tag with class="info"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="alert"><strong>&lt;div&gt; or &lt;span&gt; tag with class="alert"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="download"><strong>&lt;div&gt; or &lt;span&gt; tag with class="download"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="tip"><strong>&lt;div&gt; or &lt;span&gt; tag with class="tip"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h4>Blockquote and Q Styles</h4>\r\n<strong>Default &lt;q&gt; tag:</strong> <q>This is a quote!</q>\r\n\r\n<br /><br /><strong>Default &lt;blockquote&gt; tag with block element as child:</strong>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p></blockquote>\r\n\r\n<strong>&lt;blockquote&gt; tag with class="quotation" and an an additional &lt;p&gt; tag.</strong>\r\n<br />(use &lt;blockquote&gt;&lt;p&gt;....&lt;/p&gt;&lt;/blockquote&gt;)\r\n<blockquote class="quotation">\r\n	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n	</p>\r\n</blockquote>\r\n\r\n<hr class="dotted" />\r\n\r\n<h4>Combine Styles</h4>\r\n<div class="floatbox">\r\n\r\n	<p class="dropcap" style="margin-top: 5px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation <span class="info inset-right width25"><strong>Combine Tags</strong> with class "inset-right" or "inset-left". Example: &lt;span class=" info inset-right width25"&gt;.</span> ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n	</p>\r\n	\r\n	<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <q class="blockquote inset-left width25"><strong>Combine Tags</strong> with class "inset-right" or "inset-left". Example: &lt;q class=" blockquote inset-right width25"&gt;.</q> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n	</p>\r\n	\r\n	<p class="dropcap">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <span class="tip inset-right width25"><strong>Possible Width Classes</strong> .width15, .width18, .width20, .width23, .width25, .width33, .width35, .width40, .width45, .width50</span> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n	</p>\r\n	\r\n	<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n	</p>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<div class="floatbox">\r\n	<div class="float-left width50">\r\n		\r\n		<h4>Form Styles</h4>\r\n	\r\n		<form action="#">\r\n		<fieldset style="margin-right: 20px;">\r\n		<legend>Form legend</legend>\r\n		<div><label for="f1">Text input:</label> <input type="text" value="input text" id="f1"/></div>\r\n		<div><label for="f2">Radio input:</label> <input type="radio" id="f2"/></div>\r\n		<div><label for="f3">Checkbox input:</label> <input type="checkbox" id="f3"/></div>\r\n		<div><label for="f4">Select field:</label> <select id="f4"><option>Option 01</option><option>Option 02</option></select></div>\r\n		<div><label for="f5">Textarea:</label><br/><textarea rows="5" cols="30" id="f5">Textarea text</textarea></div>\r\n		<div><label for="f6">Button:</label> <input type="button" value="button text" id="f6"/></div>\r\n		</fieldset>\r\n		</form>\r\n\r\n	</div>\r\n	<div class="float-left width50">\r\n	\r\n		<h4>Preformatted Text Style</h4>\r\n		<pre>\r\npre {\r\n	margin: 10px 0 10px 0px;\r\n	padding: 5px 0 5px 10px;\r\n	border: 1px dotted #aab4be;\r\n	border-left: 20px solid #b4b4b4;\r\n	background: #fafafa;\r\n	font-size: 90%;\r\n	color: #2E8B57;\r\n	font-family: "Courier New", Courier, monospace;\r\n	\r\n	/* Browser specific (not valid) styles */\r\n	/* to make preformatted text wrap */\r\n	 \r\n	white-space: pre-wrap;       /* css-3 */\r\n	white-space: -moz-pre-wrap;  /* Mozilla */\r\n}\r\n		</pre>\r\n			\r\n	</div>\r\n</div>', '', 1, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2009-05-08 14:29:54', 62, 62, '2009-05-08 14:29:54', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 137, 0, 5, '', '', 0, 1921, 'robots=\nauthor='),
(47, 'Module System', 'module-system', '', '<p>The Warp framework provides a flexible module system that handles module types with different templates and styles, letting you display your content anywhere on your site. Of course, the whole 3-column-layout and the fluid module grids are built without using any tables. Almost any column and module layout can be achieved with the Warp framework. Read the following descriptions carefully to learn all about the possibilities offered by the Warp framework.</p>\r\n\r\n<h2>Module Variations</h2>\r\nThis template comes with many different module types. They are completely independent of the background of the container they''re displayed in, no matter if the background is light or dark. For each module you can choose the style and color, displayed badges and header icons and the YOOtools color. To enable the specific styles, color, etc. for a module you have to set the specific module class suffix in the module parameters. The Warp framework will analyze the module class suffixes and pass parameters. For example: style-rounded, color-black, badge-new, icon-download and yootools-black.\r\n<div class="info">Learn more and take a look at all the different module styles of this template at the <a href="index.php?option=com_content&amp;view=article&amp;id=48&amp;Itemid=58">Module Variations Page</a>.</div>\r\n\r\n<h2>Module Positions</h2>\r\n<p>The Warp framework offers nearly unlimited combinations of module positions. The layout is based on two 3 column layouts, one nested into the other. This provides a wide range of column-based layout combinations, so you can achieve any kind of 1-Column, 2-Column or 3 Column layout and many more possible combinations.</p>\r\n\r\n<p>In nearly all module positions you can publish as many modules as possible for your current layout. Surely, you are familiar with this for the vertical module positions like "left" and "right"; but the Warp framework also supports this feature for module positions where the modules are displayed in a horizontal row. The heights of all published modules in a horizontal row get adjusted to match each other.</p>\r\n\r\n<p>All module positions are fully collapsible. If there is no module published in a certain position, this module position will contract and disappear.</p>\r\n\r\n<div class="floatbox">\r\n	<div class="float-left width50" style="text-align: center;">\r\n		<h4>Positions</h4>\r\n		<img style="margin: 0px 0px 10px 0px" src="images/yootheme/modulesystem_positions.png" alt="Module Positions" title="Module Positions" width="270" height="400" />\r\n	</div>\r\n	<div class="float-left width50" style="text-align: center;">\r\n		<h4>Vertical Positions</h4>\r\n		<img class="correct-png" style="margin: 0px 0px 10px 0px" src="images/yootheme/modulesystem_positions_vertical.png" alt="More Details" title="More Details" width="270" height="175" />\r\n		<h4 style="margin-top: 0px;">Horizontal Positions</h4>\r\n		<img class="correct-png" style="margin: 0px 0px 10px 0px" src="images/yootheme/modulesystem_positions_horizontal.png" alt="More Details" title="More Details" width="270" height="190" />\r\n	</div>\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Module Proportions</h2>\r\n\r\n<p>One outstanding feature of the Warp framework is the possibility to choose between different module proportions for each module position. By default, the module proportions are set to equal. This means that all published modules in a horizontal module position have the same width. But you can also set the module proportions to golden ratio for a specif module position on a specific page. To do that, you have to add MODULENAME-PROPORTION to the page class suffix in the menu item parameters.</p>\r\n\r\n<div class="info"><strong>Example:</strong> Publish two modules in the "top" position on your "Home" menu item. The width of each module will be 50% by default. To have the golden ratio proportions go to the menu manager and set the page class suffix to "top-goldenratio" in the parameters of the "Home" menu item. Now the width of the first module will be 65% and of the second module 35% on the page "Home".</div>\r\n\r\n<p>The following figures show the different proportions depending on the numbers of published modules.</p>\r\n\r\n<div class="floatbox">\r\n	<div class="float-left width50" style="text-align: center;">\r\n		<h4>Default</h4>\r\n		<img class="correct-png" style="margin: 0px 0px 10px 0px" src="images/yootheme/modulesystem_proportions_default.png" alt="Equal Proportions" title="Equal Proportions" width="270" height="390" />\r\n	</div>\r\n	<div class="float-left width50" style="text-align: center;">\r\n		<h4>Golden Ratio</h4>\r\n		<img class="correct-png" style="margin: 0px 0px 10px 0px" src="images/yootheme/modulesystem_proportions_goldenratio.png" alt="Golden Ratio Proportions" title="Golden Ratio Proportions" width="270" height="390" />\r\n	</div>\r\n</div>\r\n\r\n<div class="tip">If you want add your own custom proportion or learn more technical details, take a look at this tutorial: <a href="http://warp.yootheme.com/documentation/item/root/add-custom-module-proportions" target="_blank">How to add custom proportions for module positions?</a></div>\r\n\r\n<h2>Header Subtitles</h2>\r\n<p>Module headers can have subtitles to provide a more detailed explanation of the module content. Just use the pipe character twice in the module name. For example "My title || My Subtitle".</p>', '', -2, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2009-07-13 11:02:53', 62, 0, '0000-00-00 00:00:00', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 79, 0, 0, '', '', 0, 787, 'robots=\nauthor='),
(48, 'Dummy Content', 'dummy-content', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 1, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2008-10-02 11:28:25', 62, 0, '0000-00-00 00:00:00', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 6, '', '', 0, 5785, 'robots=\nauthor='),
(56, 'Warp5 Framework', 'warp5-framework', '', '<p>Warp is mainly a CSS/HTML framework for Joomla that provides a toolbox of functionalities using PHP and JavaScript. We created it to provide web developers and designers with a set of tools to take off their shoulders what has to be done for every project over and over again, so they can focus on the unique tasks that come with their specific web development project.</p>\r\n\r\n<p>Below you find all the CSS, PHP and JavaScript features provided by the Warp framework. Also, learn more about the menu system and the module system.</p>\r\n\r\n<div class="note" style="text-align: center;"><a href="#css">CSS &amp; HTML Framework</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#php">PHP Toolbox</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#javascript">JavaScript Toolbox</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="index.php?option=com_content&amp;view=article&amp;id=57&amp;Itemid=153">Menu System</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="index.php?option=com_content&amp;view=article&amp;id=47&amp;Itemid=154">Module System</a></div>\r\n\r\n<h2 id="css">CSS/HTML Framework</h2>\r\n<p>Our CSS/HTML Framework creates a very robust and flexible layout based on web standards. It is easy-to-use, search engine friendly and cross browser compatible.</p>\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" class="listing">\r\n	<thead>\r\n		<tr>\r\n			<th align="left" width="25%">Feature</th>\r\n			<th align="left" width="65%">Description</th>\r\n			<th width="10%"></th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr class="odd">\r\n			<td class="bold">3 Column Layout</td>\r\n			<td>The CSS framework uses two 3-column-layouts, one nested into the other. This provides a wide range of column-based layout combinations.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Search Engine Friendly</td>\r\n			<td>The 3-column-layout is optimized for search engines and comes with a 2-1-3 column ordering. In the markup, the main content comes first before the left and right column.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Tableless Layout</td>\r\n			<td>Of course, the whole 3-column-layout and the fluid module grids are built without using any tables, as it is the standard for any modern CSS/HTML framework.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Joomla Overrides</td>\r\n			<td>The Warp framework comes with overrides for Joomla''s core output to also render the content area with meaningful HTML markup instead of tables.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Modules Types</td>\r\n			<td>The different module types are completely independent of the background of the container they''re displayed in, no matter if the background is light or dark.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Menu Modules</td>\r\n			<td>You can mix the drop down menu with any Joomla module, for example, the login module. The module will drop down and look like it is part of the menu.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">CSS Reset</td>\r\n			<td>A CSS reset removes the inconsistent styling of HTML elements provided by browsers and sets suitable default values. Form styles are also especially improved.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Cross-browser Support</td>\r\n			<td>The framework is designed to be fully compatible with Firefox 3+, Internet Explorer 6+, Safari 3.2+, Opera 9.5+, Chrome 1+, Camino and Konqueror.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Validation</td>\r\n			<td>A basis for our framework to provide cross-browser support is that it validates to XHTML and CSS web standards.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Minimum of IE6/IE7 Hacks</td>\r\n			<td>Our framework reduces the need to fix CSS for the Internet Explorer to an absolute minimum. However, of course it provides the CSS fixes necessary to make your site look good in IE6 and IE7.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Image Sprites</td>\r\n			<td>We take advantage of image sprites to the fullest. Means: We put as many image slices as possible into a single image file to minimize the loading time of your website.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Accessibility</td>\r\n			<td>The layout structure provides good accessibility. And of course the template stays fully functional if JavaScript is disabled.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Template Parameters</td>\r\n			<td>To keep template customizations as easy as possible many important widths can be set in the template configuration. For example, for the main page, all layout columns and for the drop down menu.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Mobile Devices</td>\r\n			<td>Our templates are fully compatible with mobile devices like iPhone and iPod Touch.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">iPhone/iPod Touch Favicon</td>\r\n			<td>They also support the iPhone and iPod Touch favicon which you can find in a template''s root folder.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2 id="php">PHP Toolbox</h2>\r\n<p>Our PHP code base for the Warp framework adds a lot of awesome features that aren''t possible with standard Joomla templates. It takes your template customizations to the next level.</p>\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" class="listing">\r\n	<thead>\r\n		<tr>\r\n			<th align="left" width="25%">Feature</th>\r\n			<th align="left" width="65%">Description</th>\r\n			<th width="10%"></th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr class="odd">\r\n			<td class="bold">Powerful Menu System</td>\r\n			<td>The Warp framework provides a powerful menu system to handle menu types with different templates and styles, letting you create any interface you have in mind.</td>\r\n			<td align="center"><a href="index.php?option=com_content&amp;view=article&amp;id=57&amp;Itemid=153">View</a></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Menu Types</td>\r\n			<td>In addition to our default menu rendering we provide two different menu types: the accordion and drop down menu. Both can be loaded by using the menu class suffix.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Drop Down Menu</td>\r\n			<td>The number of columns in the drop down area can be set individually for each menu item to suit any of your needs.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Flexible Module System</td>\r\n			<td>The flexible module system handles module types with different templates and styles, letting you display your content anywhere on your site.</td>\r\n			<td align="center"><a href="index.php?option=com_content&amp;view=article&amp;id=47&amp;Itemid=154">View</a></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Module Templates</td>\r\n			<td>The Warp framework provides a rich set of module templates to build any kind of module type. This way, every module variation only has the necessary amount of DIV containers.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Module Proportions</td>\r\n			<td>Different proportions can be set for each module position, for example, an equal width ratio for the top position and a golden ratio for the bottom position.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Module Parameters</td>\r\n			<td>The module class suffix allows you to set different module parameters like the style, color, badge, icon and the YOOtools color.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Menu and Module Subtitles</td>\r\n			<td>Menu items and module headers can have subtitles to provide a more detailed explanation on what information a user will find.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Joomla suffixes</td>\r\n			<td>The Warp framework makes full use of Joomla''s page, menu and module suffixes to pass parameters. You can easily create your own parameters.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Single configuration file</td>\r\n			<td>All configurational parameter settings necessary for a template to work can be found in a single configuration file called config.php.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Gzip compression</td>\r\n			<td>A template''s entire CSS and JavaScript can be compressed in a single file. You can also add gzip compression for ultra fast loading.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Ajax-based search results</td>\r\n			<td>The framework provides support to pass Joomla search results to Ajax calls. For example, the <a href="http://tools.yootheme.com/extensions/yoosearch" target="_blank">YOOsearch module</a> uses this feature.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Page colors</td>\r\n			<td>A page color can be set individually for each menu item. That way you can style every page linked to from a menu item independently.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n\r\n	</tbody>\r\n</table>\r\n\r\n<h2 id="javascript">JavaScript Toolbox</h2>\r\n<p>Here is a list of the JavaScript key features provided by the Warp framework. You can customize this template by using a lot of smooth animations and fancy effects.</p>\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" class="listing">\r\n	<thead>\r\n		<tr>\r\n			<th align="left" width="25%">Feature</th>\r\n			<th align="left" width="65%">Description</th>\r\n			<th width="10%"></th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr class="odd">\r\n			<td class="bold">Dropdown Menu</td>\r\n			<td>Moves the drop down area out with a smooth transition. The drop down area also remains visible for some milliseconds when the mouse leaves it unintendedly.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Fancy Menu</td>\r\n			<td>The Fancy Menu is a real eye-catcher. It adds smooth moving or fading background effects to the main menu bar.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Accordion Menu</td>\r\n			<td>A smooth accordion effect can be applied to sub menu when using a menu item "separator". Closed/Opened state and two different sliding modes are supported.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Slider Menu</td>\r\n			<td>When hovering the main menu items, a smooth horizontal sliding effect is added. It is the same effect as the famous <a href="http://tools.yootheme.com/extensions/yooslider" target="_blank">YOOslider.</a></td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Smooth Scroll</td>\r\n			<td>Users are often disoriented when clicking on a link which immediately jumps somewhere else in the same document. This JavaScript smoothly scrolls to the new link rather than jumping there directly.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Match Heights</td>\r\n			<td>We provide an easy-to-use JavaScript to match the height of different HTML elements like the modules on the top and bottom positions.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">Morphing Effects</td>\r\n			<td>With this script you can add transitions between CSS properties to create smooth animations. For example, an animated tab menu can easily be created.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Background Animations</td>\r\n			<td>This script allows you to create a periodical animation between unlimited background-colors.</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="odd">\r\n\r\n			<td class="bold">IE6 Alpha Transparency</td>\r\n			<td>Two IE6 PNG fixes are provided. One to fix inline images by adding the CSS class "correct-png" and one to fix CSS background images. Highlight: background-position and background-repeat are supported!</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">IE6 :hover and :focus</td>\r\n			<td>This script fixes the :hover and :focus quirks of IE6 for any HTML element. A CSS class is applied when the HTML element is "moused over" and removed when "moused out".</td>\r\n			<td align="center"></td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '', -2, 5, 0, 34, '2007-12-19 03:00:00', 62, '', '2009-07-01 17:03:48', 62, 0, '0000-00-00 00:00:00', '2007-12-19 03:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 39, 0, 0, '', '', 0, 313, 'robots=\nauthor='),
(57, 'Menu System', 'menu-system', '', '<img style="margin: 0px 0px 10px 10px; float: right;" src="images/yootheme/menusystem.png" alt="Menu System Overview" title="Menu System Overview" width="270" height="257" />\r\n\r\n<p>The Warp framework provides a powerful menu system to handle menu types with different templates and styles, letting you create any interface you have in mind. Learn more about setting up the menu by reading this <a href="http://tutorials.yootheme.com/index.php?option=com_mtree&amp;task=viewlink&amp;link_id=99&amp;Itemid=2" target="_blank" title="Read how to set up the YOOmenu system">tutorial</a>.</p>\r\n\r\n<h4>Menu Types</h4>\r\n<p>In addition to our default menu rendering we provide two different menu types: the accordion and drop down menu. Both can be loaded by using the menu class suffix. For example, use "dropdown" or "accordion" as the menu class suffix to render the specific menu type.</p>\r\n\r\n<h4>Subtitles</h4>\r\n<p>Menu items can have subtitles to provide a more detailed explanation on what information a user will find. Just use the pipe character twice in your menu item name. For example, "My title || My Subtitle".  Don''t worry about the Joomla search. The pipe characters are removed in the Joomla search results. Read the <a href="http://tutorials.yootheme.com/index.php?option=com_mtree&amp;task=viewlink&amp;link_id=141&amp;Itemid=2" target="_blank" title="See how to set subtitles for the menu items">tutorial</a>.</p>\r\n\r\n<h4>JavaScript Effects</h4>\r\n<p>Most YOOtheme menus come with lots of fancy effects like smooth transitions and fading colors. Take a look at the <a href="index.php?option=com_content&amp;view=article&amp;id=56&amp;Itemid=152#javascript">JavaScript based menus</a> provided by the Warp Framework to learn more.</p>\r\n\r\n<h4>Background Images</h4>\r\n<p>The menu item you set in the Joomla menu administration for each menu item will appear as the item''s background image. It is also possible to load a different image for the same menu item, depending on the menu type. For example, if you have set an image "item1.jpg" for the dropdown menu and you need a smaller image in the sub menu, just place an image called "item1_alt.jpg" in the same folder. <a href="http://tutorials.yootheme.com/index.php?option=com_mtree&amp;task=viewlink&amp;link_id=102&amp;Itemid=2" target="_blank" title="Read how to set a menu item background image">Learn more...</a></p>\r\n\r\n<h4>Page Color</h4>\r\n<p>A page color can be set individually for each menu item. That way, you can style every page linked to from a menu item independently. For example, use "itemcolor-black" as the page class suffix and the CSS class black will appear in the body tag of that page. <a href="http://tutorials.yootheme.com/index.php?option=com_mtree&amp;task=viewlink&amp;link_id=101&amp;Itemid=2" target="_blank" title="Learn how to change the site color for each menu item.">video tutorial</a>.</p>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Drop Down Menu</h2>\r\n<p>Use "dropdown" as the menu class suffix and publish the menu in the "menu" position to load the drop down menu.</p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div style="margin-right: 15px;">\r\n			<h3>Multi columns</h3>\r\n			<p>The number of columns in the drop down area can be set individually for each menu item to suit any of your needs. For example, use "columns-2" in the page class suffix and the drop down menu of this menu item will have two columns. This way you can define different drop down columns for each menu item.</p>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<h3>Flexible drop down width</h3>\r\n		<p>To keep CSS modification as simple as possible, we provide a template parameter for the column width of the drop down menu. You can set the column width in the template configuration.</p>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div style="margin-right: 15px;">\r\n			<h3>JavaScript</h3>\r\n			<p>Moves the drop down area out with a smooth transition. The drop down area also remains visible for some milliseconds when the mouse leaves it unintendedly. And of course, the menu keeps fully functional if JavaScript is disabled.</p>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<h3>Drop Down Module Position</h3>\r\n		<p>You can mix the drop down menu with any Joomla module by publishing it in the "menu" position. The login module, for example. The module will drop down and look like it is part of the menu.</p>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Accordion Menu</h2>\r\n<p>Use "accordion" as the menu class suffix and publish the menu (for example, in the "left" or "right" position) to load the accordion menu.</p>\r\n\r\n<p>A smooth accordion effect can be applied to the sub menu when using a menu item "separator". Closed/Opened state and two different sliding modes are supported. <a href="http://tutorials.yootheme.com/index.php?option=com_mtree&amp;task=viewlink&amp;link_id=108&amp;Itemid=2" target="_blank" title="Get to know how to set up the accordion menu">Learn more</a>.</p>', '', -2, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2009-07-02 09:48:25', 62, 0, '0000-00-00 00:00:00', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 16, 0, 0, '', '', 0, 79, 'robots=\nauthor='),
(58, 'Module Variations', 'module-variations', '', '<p>This template''s module system comes with a wide range of module styles, color variations, badges and icons. Below you can see which module styles come with color variations and with which badges and icons you can combine them.</p>\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" class="listing">\r\n	<thead>\r\n		<tr>\r\n			<th align="left" width="25%">Styles</th>\r\n			<th align="left" width="45%">Colors</th>\r\n			<th align="center" width="30%">Combinable</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr class="odd">\r\n			<td class="bold">rounded</td>\r\n			<td>white, black, templatecolor</td>\r\n			<td align="center">Badges/Icons</td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">rider</td>\r\n			<td>white, templatecolor, templatecolor2</td>\r\n			<td align="center">Badges/Icons</td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">tab, header</td>\r\n			<td>-</td>\r\n			<td align="center">Icons</td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">polaroid, postit</td>\r\n			<td>-</td>\r\n			<td align="center">-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" class="listing">\r\n	<thead>\r\n		<tr>\r\n			<th align="left" width="25%">Extras</th>\r\n			<th align="left" width="75%">Variations</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr class="odd">\r\n			<td class="bold">Badges</td>\r\n			<td>hot, new, top, pick</td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Icons</td>\r\n			<td>download, users, feed, twitter, mail, message, shopping, lock</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '', 1, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2009-10-29 11:48:01', 62, 0, '0000-00-00 00:00:00', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 30, 0, 2, '', '', 0, 1586, 'robots=\nauthor='),
(59, 'ZOO', 'zoo', '', '<p>\r\n<a rel="shadowbox;width=872;height=480" href="http://zoo.yootheme.com/images/stories/videos/zoo_video_tour.flv" style="float: right; display: block; margin-left: 10px;">\r\n<img height="100" width="220" alt="Take the video tour on the ZOO!" title="Take the video tour on the ZOO!" src="images/yootheme/zoo_video_tour.png"/>\r\n</a>The ZOO extension is a very versatile catalog system for Joomla which allows you to create different catalogs for all purposes. It comes with a comprehensive content construction kit (CCK) which gives you the ability to create your very own custom content types.\r\n</p>\r\n\r\n<p class="readmore"><a href="http://zoo.yootheme.com/" class="readmore" target="_blank">Read more...</a></p>\r\n\r\n<h2>Catalog Templates</h2>\r\n\r\n<p>The Pro Edition of the ZOO comes with additional templates for different kinds of catalogs. In this context catalogs can also mean applications: Most common Joomla components are at the bottom catalogs with a specific item type. For example a blog is a catalog with articles and a download archive is a catalog with downloadable items.</p>\r\n\r\n<p>With the ZOO you can achieve the same functionality as of many Joomla extensions and even more. To get you started right away we created additional templates with pre-built types for the ZOO Pro Edition. They are designed for specific puposes like a personal blog or a download archive. All these templates are ready to use. That means, with the ZOO Pro Edition you are only a few clicks away from getting your new catalog online without worrying too much about technical details.</p>\r\n\r\n<p class="readmore"><a href="http://zoo.yootheme.com/catalog-templates" class="readmore" target="_blank">Read more...</a></p>\r\n\r\n<h2>Content Construction Kit</h2>\r\n\r\n<p>One of the ZOO''s key features is a Content Construction Kit (CCK) that gives you the ability to create your very own custom content types. For each custom content type you create you can select the exact elements the type should consist of, like text, images or a file download. In one type you can use any kind of element as often as you want, in any combination. You can also add and remove elements from a custom type at any time, even if you already created items of that type. The elements are completely pluggable and YOOtheme will continually extend the current set of elements.</p>\r\n\r\n<p class="readmore"><a href="http://zoo.yootheme.com/cck" class="readmore" target="_blank">Read more...</a></p>', '', 1, 5, 0, 34, '2009-07-01 18:40:31', 62, '', '2009-07-01 19:32:13', 62, 0, '0000-00-00 00:00:00', '2009-07-01 18:40:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 1, '', '', 0, 74, 'robots=\nauthor='),
(61, 'Warp5', 'warp5', '', '<div style="overflow: hidden; padding: 20px 0px 0px 140px;">\r\n\r\n	<a href="http://warp.yootheme.com" target="_blank" style="display: block; float: left; margin: 0px 50px 0px 15px;">\r\n		<img width="178" height="200" class="correct-png" src="images/yootheme/yoocarousel/warp_logo.png" alt="Warp5 is a fast and powerful template framework to create sophisticated Joomla templates" title="Warp5 is a fast and powerful template framework to create sophisticated Joomla templates" />\r\n	</a>\r\n\r\n	<div style="float: left;">\r\n\r\n		<h1 style="font-size: 50px; margin-top: 0px;">Warp5</h1>\r\n		<h2 style="font-size: 20px; font-weight: normal; margin-top: 5px;">Get this Warp5 based template</h2>\r\n		\r\n		<ul>\r\n			<li>Amazing Menu System with great flexibility</li>\r\n			<li>Any module composition possible, right out of the box!</li>\r\n			<li>Search engine optimizied, 2-1-3 column, CSS framework.</li>\r\n			<li>Ultra Fast Loading, thanks to Gzip and CSS sprites.</li>\r\n		</ul>\r\n\r\n		<p>Go to the <a href="http://warp.yootheme.com" target="_blank">Warp5 website</a> and get more informations about it!</p>\r\n	\r\n	</div>\r\n\r\n</div>', '', 1, 5, 0, 35, '2009-10-27 13:44:47', 62, '', '2009-10-29 15:47:02', 62, 62, '2010-08-13 07:12:59', '2009-10-27 13:44:47', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(62, 'YOOtweet', 'yootweet', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n	<a href="http://tools.yootheme.com/extensions/yootweet" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOtweet" alt="YOOtweet" src="images/yootheme/yooscroller/box_yootweet.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOtweet</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:37:59', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-10-29 13:37:59', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(63, 'YOOgallery', 'yoogallery', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n	<a href="http://tools.yootheme.com/extensions/yoogallery" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOgallery" alt="YOOgallery" src="images/yootheme/yooscroller/box_yoogallery.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOgallery</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:38:18', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-10-29 13:38:18', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(64, 'YOOsearch', 'yoosearch', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n	<a href="http://tools.yootheme.com/extensions/yoosearch" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOsearch" alt="YOOsearch" src="images/yootheme/yooscroller/box_yoosearch.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOsearch</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:38:31', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-10-29 13:38:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(65, 'YOOscroller', 'yooscroller', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n	<a href="http://tools.yootheme.com/extensions/yooscroller" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOscroller" alt="YOOscroller" src="images/yootheme/yooscroller/box_yooscroller.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOscroller</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:38:44', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-10-29 13:38:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(66, 'YOOslider', 'yooslider', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n	<a href="http://tools.yootheme.com/extensions/yooslider" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOslider" alt="YOOslider" src="images/yootheme/yooscroller/box_yooslider.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOslider</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:38:58', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-10-29 13:38:58', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(67, 'YOOcarousel', 'yoocarousel', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n	<a href="http://tools.yootheme.com/extensions/yoocarousel" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOcarousel" alt="YOOcarousel" src="images/yootheme/yooscroller/box_yoocarousel.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOcarousel</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:39:10', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-10-29 13:39:10', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(68, 'YOOmaps', 'yoomaps', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n	<a href="http://tools.yootheme.com/extensions/yoomaps" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOmaps" alt="YOOmaps" src="images/yootheme/yooscroller/box_yoomaps.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOmaps</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:39:22', 62, '', '0000-00-00 00:00:00', 0, 62, '2010-08-13 07:14:24', '2009-10-29 13:39:22', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 0, 'robots=\nauthor='),
(69, 'YOOdrawer', 'yoodrawer', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n	<a href="http://tools.yootheme.com/extensions/yoodrawer" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOdrawer" alt="YOOdrawer" src="images/yootheme/yooscroller/box_yoodrawer.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOdrawer</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:39:34', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-10-29 13:39:34', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 0, 'robots=\nauthor='),
(70, 'YOOaccordion', 'yooaccordion', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n	<a href="http://tools.yootheme.com/extensions/yooaccordion" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOaccordion" alt="YOOaccordion" src="images/yootheme/yooscroller/box_yooaccordion.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOaccordion</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:39:46', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-10-29 13:39:46', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 0, 'robots=\nauthor='),
(71, 'YOOtooltip', 'yootooltip', '', '<div style="width: 200px; height: 200px; text-align:center">\r\n		<a href="http://tools.yootheme.com/extensions/yootooltip" target="_blank">\r\n		<img class="correct-png" style="margin: 10px 0px 0px 0px;" width="175" height="175" title="YOOtooltip" alt="YOOtooltip" src="images/yootheme/yooscroller/box_yootooltip.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -30px; font-weight: bold; font-size: 14px;">YOOtooltip</div>\r\n</div>', '', 1, 5, 0, 36, '2009-10-29 13:39:59', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-10-29 13:39:59', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 10, '', '', 0, 0, 'robots=\nauthor='),
(72, 'Templates', 'templates', '', '<div style="text-align: center;">\r\n\r\n  <h1 style="margin: 5px 0px 5px 0px; text-align: center; font-size: 40px; line-height: 40px;">Powerful Templates</h1>\r\n\r\n  <img width="800" height="180" src="images/yootheme/yoocarousel/templates.png" class="correct-png" alt="Powerful Joomla templates based on the Warp5 template framework!" title="Powerful Joomla templates based on the Warp5 template framework!" />\r\n\r\n</div>', '', 1, 5, 0, 35, '2009-10-27 13:44:47', 62, '', '2009-10-30 11:30:09', 62, 62, '2010-08-13 07:13:22', '2009-10-27 13:44:47', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 18, 0, 1, '', '', 0, 0, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 07:02 PM
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `value` varchar(240) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `__section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_map`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `value` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`section_id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(25, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_dbcache`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_dbcache` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `groupname` varchar(32) NOT NULL DEFAULT '',
  `expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`id`,`groupname`),
  KEY `expire` (`expire`,`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_dbcache`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jf_content`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_jf_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `reference_table` varchar(100) NOT NULL DEFAULT '',
  `reference_field` varchar(100) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `original_value` varchar(255) DEFAULT NULL,
  `original_text` mediumtext NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `combo` (`reference_id`,`reference_field`,`reference_table`),
  KEY `jfContent` (`language_id`,`reference_id`,`reference_table`),
  KEY `jfContentLanguage` (`reference_id`,`reference_field`,`reference_table`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_jf_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_jf_tableinfo`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_jf_tableinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joomlatablename` varchar(100) NOT NULL DEFAULT '',
  `tablepkID` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `jos_jf_tableinfo`
--

INSERT INTO `jos_jf_tableinfo` (`id`, `joomlatablename`, `tablepkID`) VALUES
(15, 'banner', 'bid'),
(16, 'bannerclient', 'cid'),
(17, 'categories', 'id'),
(18, 'contact_details', 'id'),
(19, 'content', 'id'),
(20, 'languages', 'id'),
(21, 'menu', 'id'),
(22, 'modules', 'id'),
(23, 'newsfeeds', 'id'),
(24, 'poll_data', 'id'),
(25, 'polls', 'id'),
(26, 'sections', 'id'),
(27, 'users', 'id'),
(28, 'weblinks', 'id');

-- --------------------------------------------------------

--
-- Table structure for table `jos_languages`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `iso` varchar(20) DEFAULT NULL,
  `code` varchar(20) NOT NULL DEFAULT '',
  `shortcode` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `fallback_code` varchar(20) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_languages`
--

INSERT INTO `jos_languages` (`id`, `name`, `active`, `iso`, `code`, `shortcode`, `image`, `fallback_code`, `params`, `ordering`) VALUES
(1, 'English (United Kingdom)', 1, 'en_GB.utf8, en_GB.UT', 'en-GB', 'en', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 20, 2010 at 03:36 PM
-- Last check: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `link` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `type` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=211 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Joomla || subline possible', 'joomla', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 10, 62, '2009-10-21 17:52:31', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=6\nnum_columns=1\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=Welcome to the Frontpage\nshow_page_title=0\npageclass_sfx=columnwidth-320\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(135, 'mainmenu', 'Category List', 'category-list', 'index.php?option=com_content&view=category&id=29', 'component', 1, 156, 20, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=10\nshow_headings=1\nshow_date=1\ndate_format=\nfilter=1\nfilter_type=title\norderby_sec=\nshow_pagination=1\nshow_pagination_limit=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(136, 'mainmenu', 'Section List', 'section-list', 'index.php?option=com_content&view=section&id=4', 'component', 1, 156, 20, 2, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=1\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(11, 'othermenu', 'Joomla! Home', 'joomla-home', 'http://www.joomla.org', 'url', 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(12, 'othermenu', 'Joomla! Forums', 'joomla-forums', 'http://forum.joomla.org', 'url', 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(13, 'othermenu', 'Joomla! Help', 'joomla-help', 'http://help.joomla.org', 'url', 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(20, 'usermenu', 'Your Details', 'your-details', 'index.php?option=com_user&view=user&task=edit', 'component', 1, 0, 14, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(24, 'usermenu', 'Logout', 'logout', 'index.php?option=com_user&view=login', 'component', 1, 0, 14, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(90, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 0, 89, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(134, 'mainmenu', 'Section Blog', 'section-blog', 'index.php?option=com_content&view=section&layout=blog&id=4', 'component', 1, 156, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=1\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=order\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=1\nlink_section=\nshow_category=1\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(174, 'mainmenu', 'Blog || Personal Blog for Joomla', 'blog-personal-blog-for-joomla', 'index.php?option=com_zoo&view=category&layout=category', 'component', -2, 0, 34, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'catalog_category=2:0\ntemplate=blog_classic\nsub_categories=1\nalpha_index=2\nitem_count=2\ncategory_cols=1\nitem_cols=1\nitems_per_page=5\nitem_order=rdate\nshow_feed_link=1\nfeed_title=\nalternate_feed_link=\npage_title=\nshow_page_title=1\npageclass_sfx=template_width-820\nmenu_image=icon_zoo_blog.png\nsecure=0\n\n', 0, 0, 0),
(148, 'mainmenu', 'Gaming', 'gaming', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=gaming', 'url', 0, 53, 0, 1, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gaming.png\n\n', 0, 0, 0),
(171, 'mainmenu', 'ZOO', 'zoo', 'index.php?option=com_content&view=article&id=59', 'component', 1, 0, 20, 0, 9, 62, '2010-09-20 10:05:02', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(86, 'mainmenu', 'Separator || separator', 'separator', '', 'separator', 0, 0, 0, 0, 11, 62, '2008-07-08 10:39:29', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(87, 'mainmenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 86, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(88, 'mainmenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 86, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(89, 'othermenu', 'Sample Levels', 'deeper-levels-examples', 'index.php?option=com_content&view=article&id=48', 'component', 0, 0, 20, 0, 4, 62, '2007-12-21 16:40:26', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(48, 'mainmenu', 'Web Links', 'web-links', 'index.php?option=com_weblinks&view=categories', 'component', 1, 158, 4, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'image=-1\nimage_align=right\nshow_feed_link=1\nshow_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\ntarget=\nlink_icons=\npage_title=Weblinks\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(49, 'mainmenu', 'News Feeds', 'news-feeds', 'index.php?option=com_newsfeeds&view=categories', 'component', 1, 158, 11, 2, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_limit=1\nshow_comp_description=1\ncomp_description=\nimage=-1\nimage_align=right\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\npage_title=Newsfeeds\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(145, 'mainmenu', 'Category Blog', 'category-blog', 'index.php?option=com_content&view=category&layout=blog&id=29', 'component', 1, 156, 20, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=1\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=order\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=1\nlink_section=\nshow_category=1\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(51, 'usermenu', 'Submit an Article', 'submit-an-article', 'index.php?option=com_content&view=article&layout=form', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, '', 0, 0, 0),
(52, 'usermenu', 'Submit a Web Link', 'submit-a-web-link', 'index.php?option=com_weblinks&view=weblink&layout=form', 'component', 1, 0, 4, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, '', 0, 0, 0),
(53, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(54, 'mainmenu', 'Template', 'template', 'index.php?option=com_content&view=article&id=45', 'component', 1, 0, 20, 0, 7, 62, '2010-09-20 10:04:11', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=columnwidth-320\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(55, 'mainmenu', 'Typography', 'typography', 'index.php?option=com_content&view=article&id=46', 'component', 1, 152, 20, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(56, 'mainmenu', 'Design || Style and Module Guide', 'design-style-and-module-guide', '', 'separator', -2, 0, 0, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(156, 'mainmenu', 'Content || All com_content views', 'content--all-comcontent-views', '', 'separator', 1, 1, 0, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(157, 'mainmenu', 'Contact || All com_contact views', 'contact--all-comcontact-views', '', 'separator', 1, 1, 0, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(158, 'mainmenu', 'Other Components || Remaining component views', 'other-components-remaining-component-views', '', 'separator', 1, 1, 0, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(58, 'mainmenu', 'Module Variations', 'module-variations', 'index.php?option=com_content&view=article&id=58', 'component', 1, 152, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(172, 'mainmenu', 'Product || Product Catalog for Joomla', 'product-product-catalog-for-joomla', 'index.php?option=com_zoo&view=category&layout=category', 'component', -2, 0, 34, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'catalog_category=1:0\ntemplate=product\nsub_categories=1\nalpha_index=2\nitem_count=2\ncategory_cols=4\nitem_cols=2\nitems_per_page=10\nitem_order=alpha\nshow_feed_link=1\nfeed_title=\nalternate_feed_link=\npage_title=\nshow_page_title=1\npageclass_sfx=template_width-820\nmenu_image=icon_zoo_product.png\nsecure=0\n\n', 0, 0, 0),
(173, 'mainmenu', 'Download || Download Archive for Joomla', 'download-download-archive-for-joomla', 'index.php?option=com_zoo&view=category&layout=category', 'component', -2, 0, 34, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'catalog_category=3:0\ntemplate=download\nsub_categories=1\nalpha_index=2\nitem_count=2\ncategory_cols=4\nitem_cols=2\nitems_per_page=15\nitem_order=alpha\nshow_feed_link=1\nfeed_title=\nalternate_feed_link=\npage_title=\nshow_page_title=1\npageclass_sfx=template_width-820\nmenu_image=icon_zoo_download.png\nsecure=0\n\n', 0, 0, 0),
(164, 'mainmenu', 'Beige', 'beige', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=beige', 'url', 0, 53, 0, 1, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_beige.png\n\n', 0, 0, 0),
(165, 'mainmenu', 'Lilac', 'lilac', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=lilac', 'url', 0, 53, 0, 1, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_lilac.png\n\n', 0, 0, 0),
(91, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 0, 89, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(92, 'othermenu', 'Level 3', 'level-3', 'index.php?option=com_content&view=article&id=48', 'component', 0, 91, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(93, 'othermenu', 'Level 4', 'level-4', 'index.php?option=com_content&view=article&id=48', 'component', 0, 92, 20, 3, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(94, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 0, 89, 20, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(95, 'othermenu', 'Accordion A', 'accordion-a', '', 'separator', 1, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(96, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 95, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(97, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 95, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(98, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 95, 20, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(99, 'othermenu', 'Accordion B', 'accordion-b', '', 'separator', 1, 0, 0, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(100, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 99, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(101, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 99, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(107, 'mainmenu', 'Level 2', 'level-2', '', 'separator', 1, 86, 0, 1, 3, 62, '2008-07-10 15:21:21', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(108, 'mainmenu', 'Level 3', 'level-3', 'index.php?option=com_content&view=article&id=48', 'component', 1, 107, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(114, 'mainmenu', 'Cooking', 'cooking', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=cooking', 'url', 0, 53, 0, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_cooking.png\n\n', 0, 0, 0),
(118, 'mainmenu', 'Orange', 'orange', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=orange', 'url', 0, 53, 0, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_orange.png\n\n', 0, 0, 0),
(123, 'footerlinks', 'News', 'news', 'index.php?option=com_content&view=frontpage&Itemid=1', 'url', -2, 0, 0, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(124, 'topmenu', 'Features', 'features', 'index.php?option=com_content&view=article&id=18:joomla-features&catid=29:the-cms&Itemid=145', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(125, 'topmenu', 'About Joomla!', 'about-joomla', 'index.php?option=com_content&view=article&id=1:welcome-to-joomla&catid=29:the-cms&Itemid=145', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(130, 'mainmenu', 'Grey', 'grey', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=default', 'url', 0, 53, 0, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_grey.png\n\n', 0, 0, 0),
(138, 'mainmenu', 'Poll', 'poll', 'index.php?option=com_poll&view=poll&id=14', 'component', 1, 158, 10, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(140, 'mainmenu', 'Contact Category', 'contact-category', 'index.php?option=com_contact&view=category&catid=12', 'component', 1, 157, 7, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=clock.jpg\nimage_align=left\nshow_limit=1\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(141, 'mainmenu', 'Contact Item', 'contact-item', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 157, 7, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_contact_list=1\nshow_category_crumb=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(142, 'mainmenu', 'Login', 'login', 'index.php?option=com_user&view=login', 'component', 1, 158, 14, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_login_title=0\nheader_login=\nlogin=\nlogin_message=1\ndescription_login=1\ndescription_login_text=\nimage_login=\nimage_login_align=right\nshow_logout_title=0\nheader_logout=\nlogout=\nlogout_message=1\ndescription_logout=1\ndescription_logout_text=\nimage_logout=articles.jpg\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(147, 'mainmenu', 'Green', 'green', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=green', 'url', 0, 53, 0, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_green.png\n\n', 0, 0, 0),
(146, 'mainmenu', 'Red', 'red', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=red', 'url', 0, 53, 0, 1, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_red.png\n\n', 0, 0, 0),
(166, 'frontpagemenu', 'YOOtheme', 'yootheme', 'http://www.yootheme.com', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(167, 'frontpagemenu', 'YOOtools', 'yootools', 'http://tools.yootheme.com', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(168, 'frontpagemenu', 'ZOO', 'zoo', 'http://zoo.yootheme.com', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(169, 'frontpagemenu', 'Teamlog', 'teamlog', 'http://teamlog.yootheme.com', 'url', 1, 0, 0, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(170, 'frontpagemenu', 'YOOtorials', 'yootorials', 'http://tutorials.yootheme.com', 'url', 1, 0, 0, 0, 5, 62, '2010-08-23 13:35:44', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(152, 'mainmenu', 'Warp5 || Template Framework', 'warp-slick-template-framework', 'index.php?option=com_content&view=article&id=45&Itemid=54', 'url', 1, 54, 0, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_warp5.png\n\n', 0, 0, 0),
(153, 'mainmenu', 'Menu System', 'menu-system', 'http://warp.yootheme.com/menu-system', 'url', -2, 0, 0, 0, 4, 0, '0000-00-00 00:00:00', 0, 1, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(154, 'mainmenu', 'Module System', 'module-system', 'http://warp.yootheme.com/module-system', 'url', -2, 0, 0, 0, 6, 0, '0000-00-00 00:00:00', 0, 1, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(162, 'mainmenu', 'Blue', 'blue', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=blue', 'url', 0, 53, 0, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_blue.png\n\n', 0, 0, 0),
(161, 'mainmenu', 'Black', 'black', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=black', 'url', 0, 53, 0, 1, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_black.png\n\n', 0, 0, 0),
(178, 'mainmenu', 'Landscape', 'landscape', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=landscape', 'url', 0, 53, 0, 1, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_landscape.png\n\n', 0, 0, 0),
(179, 'mainmenu', 'Brown', 'brown', 'index.php?option=com_content&view=article&id=44&Itemid=53&yt_color=brown', 'url', 0, 53, 0, 1, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_brown.png\n\n', 0, 0, 0),
(180, 'footerlinks', 'india', 'india', 'http://www.india.com', 'url', -2, 0, 0, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(181, 'footerlinks', 'new article', 'new-article', 'index.php?option=com_content&view=article&id=23', 'component', -2, 0, 20, 0, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(182, 'footerlinks', 'catgory', 'category', 'index.php?option=com_weblinks&view=category&id=2', 'component', -2, 0, 4, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_feed_link=1\nshow_comp_description=\ncomp_description=\nshow_link_hits=\nshow_link_description=\nshow_other_cats=\nshow_headings=\ntarget=\nlink_icons=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(183, 'footerlinks', 'Footer', 'footer-links', 'index.php?option=com_content&view=archive', 'url', -2, 0, 0, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(184, 'footerlinks', 'Austria', 'austria', 'javasctipt:void(0)', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(185, 'footerlinks', 'Belgium', 'belgium', '', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(186, 'footerlinks', 'Bulgaria', 'bulgaria', 'javascript:void(0)', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(187, 'footerlinks', 'Cyprus', 'cyprus', 'javascript:void(0)', 'url', 1, 0, 0, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(188, 'footerlinks', 'Greece', 'greece', 'javascript:void(0)', 'url', 1, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(189, 'footerlinks', 'Germany', 'germany', 'javascript:void(0)', 'url', 1, 0, 0, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(190, 'footerlinks', 'Luxemberg', 'luxemberg', 'javascript:void(0)', 'url', 1, 0, 0, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(191, 'footerlinks', 'Netherlands', 'netherlands', 'javascript:void(0)', 'url', 1, 0, 0, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(192, 'footerlinks', 'pourtgal', 'pourtgal', 'javascript:void(0)', 'url', 1, 0, 0, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(193, 'usermenu', 'Luxemberg', 'luxemberg', 'javascript:void(0)', 'url', -2, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(194, 'usermenu', 'Netherlands', 'netherlands', 'javascript:void(0)', 'url', -2, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(195, 'usermenu', 'pourtgal', 'pourtgal', 'javascript:void(0)', 'url', -2, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(196, 'footerlinks', 'Luxemberg', 'luxemberg', 'javascript:void(0)', 'url', 1, 0, 0, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(197, 'footerlinks', 'Netherlands', 'netherlands', 'javascript:void(0)', 'url', 1, 0, 0, 0, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(198, 'footerlinks', 'pourtgal', 'pourtgal', 'javascript:void(0)', 'url', 1, 0, 0, 0, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(199, 'footerlinks', 'Austria', 'austria', 'javasctipt:void(0)', 'url', 1, 0, 0, 0, 13, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(200, 'footerlinks', 'Belgium', 'belgium', '', 'url', 1, 0, 0, 0, 14, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(201, 'footerlinks', 'Bulgaria', 'bulgaria', 'javascript:void(0)', 'url', 1, 0, 0, 0, 15, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(202, 'footerlinks', 'Cyprus', 'cyprus', 'javascript:void(0)', 'url', 1, 0, 0, 0, 16, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(203, 'footerlinks', 'Greece', 'greece', 'javascript:void(0)', 'url', 1, 0, 0, 0, 17, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(204, 'footerlinks', 'Germany', 'germany', 'javascript:void(0)', 'url', -2, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(205, 'footerlinks', 'Luxemberg', 'luxemberg', 'javascript:void(0)', 'url', -2, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(206, 'footerlinks', 'Netherlands', 'netherlands', 'javascript:void(0)', 'url', -2, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(207, 'footerlinks', 'pourtgal', 'pourtgal', 'javascript:void(0)', 'url', 1, 0, 0, 0, 18, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(208, 'footerlinks', 'Luxemberg', 'luxemberg', 'javascript:void(0)', 'url', 1, 0, 0, 0, 19, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(209, 'footerlinks', 'Netherlands', 'netherlands', 'index.php?option=com_content&view=archive', 'url', 1, 0, 0, 0, 20, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(210, 'footerlinks', 'pourtgal', 'pourtgal', 'javascript:void(0)', 'url', 1, 0, 0, 0, 21, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `title` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'usermenu', 'User Menu', 'A Menu for logged in Users'),
(3, 'topmenu', 'Top Menu', 'Top level navigation'),
(4, 'othermenu', 'Other Menu', 'Additional links'),
(5, 'frontpagemenu', 'Frontpage Menu', ''),
(6, 'footerlinks', 'Footer links', 'footer links details');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `cfg_value` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_migration_backlinks`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `url` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `sefurl` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `newurl` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
-- Last check: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `content` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=239 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 0, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=horiz_flat\nstartLevel=0\nendLevel=3\nshowAllChildren=1\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-dropdown\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(16, 'Polls || Vote for your favorite CMS', '', 7, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_poll', 0, 0, 1, 'id=14\nmoduleclass_sfx=icon-users\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(17, 'User Menu', '', 6, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 1, 1, 'menutype=usermenu\nmenu_style=list\nstartLevel=0\nendLevel=5\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(18, 'Login Form || Login to Member Area', '', 8, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, 'cache=0\nmoduleclass_sfx=icon-lock\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n', 1, 0, ''),
(19, 'Latest News', '', 1, 'maintop', 62, '2010-08-17 03:49:40', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=1\nsecid=\ncatid=\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 1, 0, ''),
(20, 'Statistics', '', 11, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 0, 0, 'serverinfo=1\nsiteinfo=1\ncounter=1\nincrease=0\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(21, 'Who''s Online', '', 9, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_whosonline', 0, 0, 1, 'cache=0\nshowmode=0\nmoduleclass_sfx=\n\n', 0, 0, ''),
(22, 'Popular', '', 2, 'maintop', 0, '0000-00-00 00:00:00', 1, 'mod_mostread', 0, 0, 1, 'moduleclass_sfx=\nshow_front=1\ncount=5\ncatid=\nsecid=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(23, 'Archive', '', 12, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_archive', 0, 0, 1, 'count=10\nmoduleclass_sfx=\ncache=1\n\n', 1, 0, ''),
(24, 'Sections', '', 13, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_sections', 0, 0, 1, 'count=5\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 1, 0, ''),
(25, 'Newsflash', '', 1, 'content9', 0, '0000-00-00 00:00:00', 1, 'mod_newsflash', 0, 0, 0, 'catid=49\nlayout=vert\nimage=1\nlink_titles=\nreadmore=1\nitem_title=1\nitems=4\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(26, 'Related Items', '', 14, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_related_items', 0, 0, 1, '', 0, 0, ''),
(198, 'Greece Map', '', 0, 'maptab', 0, '0000-00-00 00:00:00', 1, 'mod_maptab', 0, 0, 0, '', 0, 0, ''),
(199, 'Opn House Events', '', 0, 'openhouse', 0, '0000-00-00 00:00:00', 1, 'mod_openhouse', 0, 0, 0, '', 0, 0, ''),
(28, 'Random Image', '', 5, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_random_image', 0, 0, 1, 'type=jpg\nfolder=\nlink=\nwidth=\nheight=\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(29, 'Top Menu', '', 0, 'toolbarleft', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=topmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=-1\nindent_image2=-1\nindent_image3=-1\nindent_image4=-1\nindent_image5=-1\nindent_image6=-1\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(200, 'Share this', '', 0, 'sharebox', 0, '0000-00-00 00:00:00', 0, 'mod_sharebox', 0, 0, 0, '', 0, 0, ''),
(201, 'Advertise', '', 0, 'advertise', 0, '0000-00-00 00:00:00', 0, 'mod_advertise', 0, 0, 0, '', 0, 0, ''),
(238, 'partner', '', 0, 'partner', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(203, 'News update', '', 0, 'news', 0, '0000-00-00 00:00:00', 0, 'mod_news', 0, 0, 0, '', 0, 0, ''),
(35, 'Breadcrumbs', '', 0, 'breadcrumbs', 0, '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 0, 0, 1, 'showHome=1\nhomeText=Home\nshowLast=1\nseparator=\nmoduleclass_sfx=\ncache=0\n\n', 1, 0, ''),
(197, 'flash banner', '', 0, 'flashbanner', 0, '0000-00-00 00:00:00', 1, 'mod_flashbanner', 0, 0, 0, '', 0, 0, ''),
(42, 'Sub Menu', '', 4, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=1\nendLevel=5\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion images-off\nmoduleclass_sfx=style-menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(177, 'Footer Menu', '', 2, 'footerlinks', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=footerlinks\nmenu_style=horiz_flat\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=-1\nindent_image2=-1\nindent_image3=-1\nindent_image4=-1\nindent_image5=-1\nindent_image6=-1\nspacer=\\|\nend_spacer=\n\n', 0, 0, ''),
(41, 'Welcome to Joomla!', '<div style="padding: 5px"><p>Congratulations on choosing Joomla! as your content management system. We hope you are able to create a successful Web site with our program and maybe you will be able to give something back to the community later.</p><p>To make your start with Joomla! as smooth as possible, we want to give you some pointers to documentation, common questions and help on securing your server. A good place to start is the &quot;<a href="http://forum.joomla.org/index.php/topic,47524.0.html" target="_blank">Absolute Beginners Guide to Joomla!</a>&quot;.</p><p>For your most common questions the best place to start looking for answers is the <a href="http://help.joomla.org/component/option,com_easyfaq/Itemid,268/" target="_blank">Frequently Asked Questions (FAQ)</a> area.  If you are stuck on a particular screen in the Administration area of Joomla! (which is where you are now), then try clicking on the Help toolbar button which you will find on almost all screens.  This will take you to a page about that screen on our <a href="http://help.joomla.org" target="_blank">Help Site</a>.  If you still have questions then take a look on our <a href="http://forum.joomla.org" target="_blank">forum</a> which is most likely the biggest resource on Joomla! there is and you will find almost every question answered at least once, so please try using the search function before asking your question.</p><p>Security is a big concern for us, which is why we would like you to subscribe to the <a href="http://forum.joomla.org/index.php/board,8.0.html" target="_blank">announcement forum</a> (by clicking on the Notify button) to always get the latest information on new releases for Joomla! You should also read the <a href="http://help.joomla.org/component/option,com_easyfaq/task,view/id,167/Itemid,268/" target="_blank">Joomla! Administrator''s Security Checklist</a> and regularly check the <a href="http://forum.joomla.org/index.php/board,267.0.html" target="_blank">security forum</a>.</p><p>We hope you have much fun and success with Joomla! and hope to see you in the forum among the hundreds and thousands of contributors.</p><p>Your Joomla! team.<img alt="Smile" border="0" src="../plugins/editors/tinymce/jscripts/tiny_mce/plugins/emotions/images/smiley-smile.gif" title="Smile" /></p><p>P.S.: To remove this message, delete the &quot;Welcome to Joomla!&quot; Module in the Administrator screen of the Module Manager (on the Extensions menu).  Here is a <a href="index.php?option=com_modules&amp;client=1">quick link</a> to this screen.</p></div>', 1, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 2, 1, 'moduleclass_sfx=\n\n', 1, 1, ''),
(46, 'YOOlogin (Default)', '', 1, 'content1', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_login', 0, 0, 0, 'style=default\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\ntext_mode=input\nlogin_button=icon\nlogout_button=text\nauto_remember=1\nlost_password=1\nlost_username=1\nregistration=1\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(51, 'Dogear', '<div style="position: absolute;	z-index: 20; top: 0px; left: 0px; width: 135px; height: 135px;">\r\n	<a href="http://www.yootheme.com" target="_blank" title="YOOtheme"><img class="correct-png" style="width: 135px; height: 135px;" src="images/yootheme/absolute_yoodogear.png" alt="YOOtheme" /></a>\r\n</div>', 1, 'absolute', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(52, 'Content Top 1', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-tab</em>', 0, 'contenttop', 62, '2010-08-28 09:12:55', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(53, 'Content Top 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-tab</em>', 2, 'contenttop', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(156, 'Validating Code', '<p>This template validates to XHTML and CSS web standards and is designed to be compatible with all modern browsers.</p>\r\n<p>\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_firefox.png" alt="Firefox 3.0+" title="Firefox 3.0+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_ie6.png" alt="Internet Explorer 6" title="Internet Explorer 6" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_ie7.png" alt="Internet Explorer 7+" title="Internet Explorer 7+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_safari.png" alt="Safari 3.1+" title="Safari 3.1+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_opera.png" alt="Opera 9.5+" title="Opera 9.5+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_camino.png" alt="Camino 1.0+" title="Camino 1.0+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_konqueror.png" alt="Konqueror" title="Konqueror" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_chrome.png" alt="Chrome 1.0+" title="Chrome 1.0+" width="20" height="20" />\r\n</p>', 14, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(155, 'Javascript Library', 'All client side effects use the JavaScript framework <a href="http://www.mootools.net" target="_blank">MooTools</a> which offers most reliable functionality and compact size!', 12, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white\n\n', 0, 0, ''),
(56, 'Login || module position', '', 2, 'menu', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_login', 0, 0, 0, 'style=niftyquick\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\ntext_mode=input\nlogin_button=icon\nlogout_button=icon\nauto_remember=1\nlost_password=1\nlost_username=1\nregistration=1\nmoduleclass_sfx=dropdownwidth-350\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(57, 'Content Bottom 1', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-tab</em>', 0, 'contentbottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(58, 'Skyscraper', '<img class="correct-png" src="images/yootheme/banner_skyscraper.png" title="Place your banner here!" alt="Place your banner here!" />', 2, 'banner', 62, '2010-08-28 09:17:31', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(59, 'Content Bottom 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-tab</em>', 2, 'contentbottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(60, 'Badge', '<img class="correct-png" src="images/yootheme/banner_badge.png" title="WEB 2.0 inside!" alt="WEB 2.0 inside!" style="position: absolute; top: 0px; left: 0px;" />', 3, 'banner', 62, '2010-08-28 09:13:08', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(61, 'Bottom 1', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rounded</em> <em class="box">color-templatecolor</em>', 0, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(62, 'Bottom  2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rounded</em> <em class="box">color-templatecolor</em>', 2, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(176, 'ZOO', '<a href="http://zoo.yootheme.com" target="_blank" style="display: block; text-align: center;">\r\n<img class="correct-png" src="images/yootheme/icon_zoo.png" alt="Versatile catalog system with content construcion kit for Joomla 1.5" title="Versatile catalog system with content construcion kit for Joomla 1.5" width="140" height="130" />\r\n</a>\r\n<p>Versatile catalog system with content construcion kit for Joomla 1.5. Get the <a href="http://zoo.yootheme.com" target="_blank">ZOO Extension</a>.</p>', 10, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(63, 'Bottom  3', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rounded</em> <em class="box">color-templatecolor</em>', 3, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(64, 'Bottom  4', 'Lorem ipsum dolor sit amet sed tempor. Used Module Class Suffix: <em class="box">style-rounded</em> <em class="box">color-templatecolor</em>', 4, 'bottom', 62, '2010-08-28 09:12:48', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(68, 'Left 1', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rider</em> <em class="box">color-white</em> <em class="box">icon-twitter</em></p>', 9, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white icon-mail\n\n', 0, 0, ''),
(180, 'Polaroid', 'Lorem ipsum dolor sit amet consect adipisic elit. Used Module Class Suffix: style-polaroid', 0, 'mainbottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-polaroid\n\n', 0, 0, ''),
(181, 'Post It', 'Lorem ipsum dolor sit amet consect adipisic elit. Used Module Class Suffix: style-postit', 0, 'mainbottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-postit\n\n', 0, 0, ''),
(182, 'Left 2', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rider</em> <em class="box">color-templatecolor2</em> <em class="box">icon-mail</em></p>', 10, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white icon-twitter\n\n', 0, 0, ''),
(89, 'Top Block || Sub Title', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.</p>\r\n<p><em class="box"><br /></em></p>', 0, 'topblock', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(72, 'Logo', '<a href="index.php" title="Home" class="logo-icon correct-png"></a>', 0, 'logo', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(211, 'Red div', '', 0, 'topblock', 0, '0000-00-00 00:00:00', 1, 'mod_reddiv', 0, 0, 0, '', 0, 0, ''),
(196, 'Property Search', '', 0, 'propsearch', 0, '0000-00-00 00:00:00', 1, 'mod_propsearch', 0, 0, 0, 'mycalendar=19-08-2010\nmytimezone=-10\nmodule_style=Some text\nmyeditor=none\n\n', 0, 0, ''),
(73, 'Right 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rider</em> <em class="box">color-templatecolor</em> <em class="box">icon-shopping</em>', 4, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-templatecolor icon-shopping\n\n', 0, 0, ''),
(75, 'Top 1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do. Used Module Class Suffix: <em class="box">style-rounded</em> <em class="box">badge-hot</em></p>', 0, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rounded badge-hot\n\n', 0, 0, ''),
(76, 'Top 2', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rounded</em> <em class="box">badge-new</em></p>', 2, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rounded badge-new\n\n', 0, 0, ''),
(77, 'Top 3', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rounded</em> <em class="box">badge-pick</em></p>', 3, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rounded badge-pick\n\n', 0, 0, ''),
(78, 'Top 4', '<p>Lorem ipsum dolor sit amet sed tempor. Used Module Class Suffix: <em class="box">style-rounded</em> <em class="box">badge-top</em></p>', 4, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rounded badge-top\n\n', 0, 0, ''),
(121, 'Bottom (YOOtools)', '<p><img src="images/stories/powered_by.png" border="0" /></p>', 5, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(214, 'position advertise', '<p><img src="images/stories/join our team.jpg" border="0" alt="join our team" title="join our team" /></p>\r\n<p> </p>', 0, 'advertise', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(122, 'Warp5 Documentation', 'This template is based on the fast and powerful Warp5 framework. We provide a comprehensive documentation how everything work.\r\n\r\n<p class="readmore"><a class="readmore" href="http://warp.yootheme.com/documentation" target="_blank">Take a look...</a></p>', 6, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=badge-new style-rider color-templatecolor2\n\n', 0, 0, ''),
(123, 'Module System', 'The module system provides a clear grid for Joomla modules and a wide diversity of templates for module variations.\r\n\r\n<p class="readmore"><a class="readmore" href="http://warp.yootheme.com/module-system" target="_blank">Read more...</a></p>', 8, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(230, 'right two', '<p>this is right menu</p>\r\n<p><img src="images/stories/food/coffee.jpg" border="0" /></p>', 15, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white icon-twitter\n\n', 0, 0, ''),
(231, 'right three', '<p>this is right menu in third position</p>\r\n<p><img src="images/stories/icon_warp5.png" border="0" width="68" height="64" /></p>', 16, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white icon-twitter\n\n', 0, 0, ''),
(83, 'Main Top 1', 'Lorem ipsum dolor sit amet, consectetur. Used Module Class Suffix: <em class="box">style-black</em> <em class="box">icon-lock</em>', 3, 'maintop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-black icon-lock\n\n', 0, 0, ''),
(158, 'Bottom (YOOtorials)', '<a href="http://tutorials.yootheme.com" target="_blank"><img class="correct-png" src="images/yootheme/bottom_yootorials.png" border="0" alt="Visit the YOOtorials website!" title="Visit the YOOtorials website!" width="145" height="33" /> </a>', 6, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(87, 'Other Menu', '', 2, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=othermenu\nmenu_style=list\nstartLevel=0\nendLevel=5\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion\nmoduleclass_sfx=style-menu color-black\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(84, 'Main Top 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Used Module Class Suffix: <em class="box">style-black</em> <em class="box">icon-download</em>', 4, 'maintop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-black icon-download\n\n', 0, 0, ''),
(85, 'Main Bottom 1', 'Lorem ipsum dolor sit amet, consectetur. Used Module Class Suffix: <em class="box">style-header</em> <em class="box">icon-message</em>', 0, 'mainbottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-header icon-message\n\n', 0, 0, ''),
(194, 'YOOscroller', '', 0, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_scroller', 0, 0, 0, 'catid=36\nstyle=blank-h\nmodule_width=860\nmodule_height=215\nslide_size=215\nslide_interval=4000\nautoplay=1\norder=o_asc\nreadmore=0\nitems=10\nmoduleclass_sfx=-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(86, 'Main Bottom 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Used Module Class Suffix: <em class="box">style-header</em> <em class="box">icon-users</em>', 2, 'mainbottom', 62, '2010-08-17 03:49:58', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-header icon-users\n\n', 0, 0, ''),
(117, 'YOOcarousel (Frontpage)', '', 0, 'top', 62, '2010-08-18 09:59:43', 0, 'mod_yoo_carousel', 0, 0, 0, 'catid=35\nstyle=slideshow\nmodule_width=880\nmodule_height=225\ntab_width=200\nautoplay=on\nslide_interval=10000\ntransition_duration=300\ntransition_effect=crossfade\ncontrol_panel=none\nrotate_action=mouseover\nrotate_duration=300\nrotate_effect=crossfade\nbuttons=1\norder=o_asc\nreadmore=0\nitems=10\nmoduleclass_sfx=-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(91, 'Bottom Block', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Used Module Class Suffix: <em class="box">style-rounded</em> <em class="box">color-black</em>', 0, 'bottomblock', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rounded color-black\n\n', 0, 0, ''),
(175, 'Teamlog', '<a href="http://teamlog.yootheme.com" target="_blank" style="display: block; text-align: center;">\r\n<img class="correct-png" src="images/yootheme/icon_teamlog.png" alt="Web based Time Tracking Solution for Joomla! 1.5 focused on simplicity" title="Web based Time Tracking Solution for Joomla! 1.5 focused on simplicity" width="140" height="150" />\r\n</a>\r\n<p>Web based Time Tracking Solution for Joomla! 1.5 focused on simplicity. Get the <a href="http://teamlog.yootheme.com" target="_blank">Teamlog extension</a> for free.</p>', 11, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-templatecolor2\n\n', 0, 0, ''),
(125, 'YOOsearch', '', 2, 'search', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_search', 0, 0, 0, 'style=default\nbox_width=400\nchar_limit=130\nres_limit=6\ncat_limit=6\ncategories={cat\\ntitle=[YOOtheme]\\nimage=[yootheme/yoosearch/yootheme.png]\\nurl=[http://www.yootheme.com]\\nkeywords=[yootheme, template, templates, themes, theme]\\n}The YOOtheme template club for Joomla 1.0 and 1.5 offers stylish templates with professional Web 2.0 features.{/cat}\\n\\n{cat\\ntitle=[YOOtools]\\nimage=[yootheme/yoosearch/yootools.png]\\nurl=[http://www.yootools.com]\\nkeywords=[yootheme, yootools, features, feature, yoospotlight, yooreflection, yoolightbox, yoocarousel, yooaccordion, yooslider, yoodrawer, yooscroller, yoomaps, yoosearch, yooeffects, yootoppanel, yoologin, yootooltip, yoosnapshots, spotlight, reflection, lightbox, carousel, accordion, slider, drawer, scroller, maps, search, effects, toppanel, login, tooltip, snapshots]}The YOOtools are new YOOtheme extensions for Joomla 1.0 and 1.5. Exclusive YOOtheme modules, compontent and plugins!{/cat}\\n\\n{cat\\ntitle=[Typography]\\nurl=[index.php?option=com_content&view=article&id=46&Itemid=55]\\nimage=[yootheme/yoosearch/typography.png]\\nkeywords=[typography, joomla, style, stylings, HTML, tag]\\n}Take a look at the typography, the style guide and learn all about the possible HTML tag stylings of this YOOtheme templates.{/cat}\\n\\n{cat\\ntitle=[Layout]\\nimage=[yootheme/yoosearch/layout.png]\\nurl=[index.php?option=com_content&view=article&id=47&Itemid=56]\\nkeywords=[layout, joomla, module, position, positions, variation, variations]\\n}Take a look at the layout options and all possible module positions and variations of this YOOtheme template.{/cat}\\n\\n{cat\\ntitle=[Joomla]\\nimage=[yootheme/yoosearch/joomla.png]\\nurl=[index.php?option=com_content&view=frontpage&Itemid=1]\\nkeywords=[joomla]\\n}Take a look at how this YOOtheme template styles the Joomla core articles, components and modules.{/cat}\nmoduleclass_sfx=-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(118, 'Bottom (YOOtheme)', '<center>\r\n<a href="http://www.yootheme.com" target="_blank">\r\n  <img class="correct-png" style="margin-top: 15px;" src="images/yootheme/bottom_yootheme.png" alt="Visit the YOOtheme website!" title="Visit the YOOtheme website!" width="150" height="33" />\r\n</a>\r\n</center>', 7, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(124, 'Menu System', 'The menu system enhances Joomla''s menu functions to create clearly arranged interfaces even for comprehensive sites.\r\n\r\n<p class="readmore"><a class="readmore" href="http://warp.yootheme.com/menu-system" target="_blank">Read more...</a></p>', 7, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white\n\n', 0, 0, ''),
(134, 'YOOiecheck', '', 2, 'absolute', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_iecheck', 0, 0, 0, 'message=You are using Internet Explorer 6. Please upgrade your browser to increase safety and your browsing experience. Choose one of the following links to download a modern browser:\nfirefox=1\nsafari=1\nopera=1\nie=1\nmoduleclass_sfx=-blank\n\n', 0, 0, ''),
(151, 'Fireworks Files', '<div style="overflow: hidden;">\r\n<img height="40" width="42" align="right" src="/YOOtheme/Templates/Next/Website/images/yootheme/top_fireworks.png" alt="Fully sliced Fireworks .png files" title="Fully sliced Fireworks .png files" style="margin-left: 10px;" class="correct-png"/>Fully sliced Fireworks PNGs for customizations.\r\n</div>', 6, 'maintop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(150, 'YOOtools', '<div style="overflow: hidden">\r\n<img class="correct-png" style="margin-left: 10px;" width="55" height="42" align="right" title="Native version for Joomla 1.5" alt="Native version for Joomla 1.5" src="images/yootheme/top_yootools.png" />This template is fully compatible with all <a href="http://www.yootools.com" target="_blank">YOOtools</a>\r\n</div>', 7, 'maintop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(178, 'Feeds', '<a class="twitter" title="Follow us on Twitter" href="http://twitter.com/yootheme" target="_blank"><img height="25" width="25" alt="Follow us on Twitter" src="images/yootheme/toolbar_twitter.png" class="correct-png" /></a>\r\n<a class="rss" title="Subscribe to our RSS feed" href="http://www.yootheme.com/rss" target="_blank"><img height="25" width="25" alt="Subscribe to our RSS feed" src="images/yootheme/toolbar_feed.png" class="correct-png" /></a>', 0, 'toolbarright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(168, 'Latest YOOtheme Tweet', '', 0, 'headerright', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_tweet', 0, 0, 0, 'style=single\nfrom_user=yootheme\nto_user=\nref_user=\nhashtag=\nword=\nimage=0\nauthor=0\ndate=0\nimage_size=42\nnum_tweets=5\nmoduleclass_sfx=style-\ncache=0\ncache_time=15\n\n', 0, 0, ''),
(183, 'Frontpage Menu', '', 1, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=frontpagemenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion\nmoduleclass_sfx=style-menu header-templatecolor\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(170, 'Content Left', '', 0, 'contentleft', 62, '2010-08-20 11:40:44', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(171, 'Right 1', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rider</em> <em class="box">color-templatecolor</em> <em class="box">icon-lock</em>', 3, 'right', 62, '2010-08-28 07:36:48', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-templatecolor icon-lock\n\n', 0, 0, ''),
(179, 'Inner Sub Menu', '', 2, 'contentright', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=1\nendLevel=5\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion images-off\nmoduleclass_sfx=style-menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(192, 'Warp5 Template Framework', '<div style="overflow: hidden; padding-top: 20px;">\r\n\r\n	<a href="http://warp.yootheme.com" target="_blank" style="display: block; float: left; margin: 0px 30px 0px 15px;">\r\n		<img width="200" height="225" class="correct-png" src="images/yootheme/home_warp_logo.png" alt="Warp5 is a fast and powerful template framework to create sophisticated Joomla templates" title="Warp5 is a fast and powerful template framework to create sophisticated Joomla templates" />\r\n	</a>\r\n\r\n	<div style="float: left;">\r\n\r\n		<h1 style="font-size: 50px; margin-top: 0px;">5 Reasons</h1>\r\n		<h2 style="font-size: 20px; font-weight: normal; margin-top: 5px;">to get this Warp5 based template</h2>\r\n		\r\n		<ul>\r\n			<li>Amazing Menu System with great flexibility</li>\r\n			<li>Any module composition possible, right out of the box!</li>\r\n			<li>Search engine optimizied, 2-1-3 column, CSS framework.</li>\r\n			<li>Ultra Fast Loading, thanks to Gzip and CSS sprites.</li>\r\n			<li>Works in all modern browsers, even IE6! </li>\r\n		</ul>\r\n\r\n		<p>Go to the <a href="http://warp.yootheme.com" target="_blank">Warp5 website</a> and get more informations about it!</p>\r\n	\r\n	</div>\r\n\r\n</div>', 0, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(186, 'YOOtweet', 'Show users what you''re up to! The YOOtweet module is the neatest way to display your Twitter entries directly on your website.\r\n<a target="_blank" title="New YOOtweet module!" href="http://tools.yootheme.com/extensions/yootweet" style="display: block; text-align: center;">\r\n<img height="107" width="104" alt="New YOOtweet module!" title="New YOOtweet module!" class="correct-png" src="images/yootheme/home_yootweet.png"/>\r\n</a>\r\nFor more details take a look at the <a target="_blank" href="http://tools.yootheme.com/extensions/yootweet">YOOtweet page...</a>', 1, 'contentright', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rounded\n\n', 0, 0, ''),
(190, 'ZOO Not Included', '<div class="alert">The displayed content is part of the ZOO Pro Edition and only shown for demonstration purpose. The ZOO Pro Edition is NOT included when purchasing this template. However you can purchase the ZOO Pro Edition at <a href="http://zoo.yootheme.com" target="_blank">http://zoo.yootheme.com</a>.</div>', 0, 'topblock', 62, '2010-08-17 11:16:47', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-rounded\n\n', 0, 0, ''),
(191, 'Right 3', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-rider</em> <em class="box">color-templatecolor</em> <em class="box">icon-download</em>', 5, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-templatecolor icon-download\n\n', 0, 0, ''),
(195, 'Color Variations', '<div style="overflow: hidden; margin: 10px 0px 10px 3px; height: 100px;">\r\n	<a style="display: block; float: left; margin-right: 10px;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=grey" title="Show Grey Color Variation"><img style="float: left;" src="images/yootheme/home_bg_grey.jpg" width="145" height="100" alt="Show Grey Color Variation"/></a>\r\n	<a style="display: block; float: left; margin-right: 10px;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=red" title="Show Red Color Variation"><img style="float: left;" src="images/yootheme/home_bg_red.jpg" width="145" height="100" alt="Show Red Color Variation"/></a>\r\n	<a style="display: block; float: left; margin-right: 10px;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=green" title="Show Green Color Variation"><img style="float: left;" src="images/yootheme/home_bg_green.jpg" width="145" height="100" alt="Show Green Color Variation"/></a>\r\n	<a style="display: block; float: left;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=blue" title="Show Blue Color Variation"><img style="float: left;" src="images/yootheme/home_bg_blue.jpg" width="145" height="100" alt="Show Blue Color Variation"/></a>\r\n</div>\r\n\r\n<div style="overflow: hidden; margin: 0px 0px 10px 3px; height: 100px;">\r\n	<a style="display: block; float: left; margin-right: 10px;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=beige" title="Show Beige Color Variation"><img style="float: left;" src="images/yootheme/home_bg_beige.jpg" width="145" height="100" alt="Show Beige Color Variation"/></a>\r\n	<a style="display: block; float: left; margin-right: 10px;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=brown" title="Show Brown Color Variation"><img style="float: left;" src="images/yootheme/home_bg_brown.jpg" width="145" height="100" alt="Show Brown Color Variation"/></a>\r\n	<a style="display: block; float: left; margin-right: 10px;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=black" title="Show Black Color Variation"><img style="float: left;" src="images/yootheme/home_bg_black.jpg" width="145" height="100" alt="Show Black Color Variation"/></a>\r\n	<a style="display: block; float: left;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=orange" title="Show Orange Color Variation"><img style="float: left;" src="images/yootheme/home_bg_orange.jpg" width="145" height="100" alt="Show Orange Color Variation"/></a>\r\n</div>\r\n\r\n<div style="overflow: hidden; margin: 0px 0px 0px 3px; height: 100px;">\r\n	<a style="display: block; float: left; margin-right: 10px;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=lilac" title="Show Lilac Color Variation"><img style="float: left;" src="images/yootheme/home_bg_lilac.jpg" width="145" height="100" alt="Show Lilac Color Variation"/></a>\r\n	<a style="display: block; float: left; margin-right: 10px;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=landscape" title="Show Landscape Color Variation"><img style="float: left;" src="images/yootheme/home_bg_landscape.jpg" width="145" height="100" alt="Show Landscape Color Variation"/></a>\r\n	<a style="display: block; float: left; margin-right: 10px;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=cooking" title="Show Cooking Color Variation"><img style="float: left;" src="images/yootheme/home_bg_cooking.jpg" width="145" height="100" alt="Show Cooking Color Variation"/></a>\r\n	<a style="display: block; float: left;" href="index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=53&amp;yt_color=gaming" title="Show Gaming Color Variation"><img style="float: left;" src="images/yootheme/home_bg_gaming.jpg" width="145" height="100" alt="Show Gaming Color Variation"/></a>\r\n</div>', 3, 'mainbottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rounded color-templatecolor\n\n', 0, 0, ''),
(204, 'Latest Property', '', 0, 'latestprop', 0, '0000-00-00 00:00:00', 0, 'mod_latestprop', 0, 0, 0, '', 0, 0, ''),
(205, 'Member footer', '', 0, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_footmem', 0, 0, 0, '', 0, 0, ''),
(206, 'world footer', '', 0, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_footworld', 0, 0, 0, '', 0, 0, ''),
(207, 'Europe footer', '', 0, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_footeurope', 0, 0, 0, '', 0, 0, ''),
(208, 'Footer USA', '', 0, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_footusa', 0, 0, 0, '', 0, 0, ''),
(209, 'Footer CRA', '', 0, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_footcra', 0, 0, 0, '', 0, 0, ''),
(228, 'custom left', '<p>hi this is custom left panel</p>\r\n<p><img src="images/stories/key.jpg" border="0" /></p>', 3, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white icon-twitter\n\n', 0, 0, ''),
(212, 'Banner', '', 0, 'latestprop', 0, '0000-00-00 00:00:00', 0, 'mod_banners', 0, 0, 0, 'target=1\ncount=1\ncid=1\ncatid=13\ntag_search=0\nordering=0\nheader_text=\nfooter_text=\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(216, 'sell rent property', '<p><img src="images/stories/selling.jpg" border="0" title="sell property" /><img src="images/stories/renting.jpg" border="0" title="rent property" /></p>\r\n<p> </p>', 0, 'latestprop', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(235, 'news ', '<p>Here you''ll receive  latest property news</p>', 0, 'news', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(217, 'Custom data', '<p>here u can write anything u want</p>\r\n<p>Use tabs. They''re one of those neat built-in FireFox features I was talking about (OK, OK. Every decent browser has them now). Keep all your Joomla! 1.5 development and admin views in one window. Each tab within a FireFox window is accessible via Ctrl (or Cmnd on Mac) +1, Ctrl (Cmnd) +2, and similar keystrokes. It makes for a much cleaner work space, especially as we''ll already be in constant Alt+Tab flip mode. Flipping to the wrong browser windows gets annoying and slows you down. You''ll quickly get into the habit of using "Alt+Tab, Ctrl+1" (or Ctrl+2, Ctrl+3, and so on) to jump right to your Joomla! 1.5 template view or administration page, or even your original html mockup, and so on.</p>', 0, 'customdata', 62, '2010-08-28 09:13:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(234, 'latest property position', '', 0, 'latestprop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(218, 'Position open house', '<p><img src="images/stories/openhouse.png" border="0" alt="open house" title="open house" /></p>\r\n<p> </p>\r\n<p>Information about properties on show in your area.ERA Open House dates and times as well property details can be found by clicking here</p>', 0, 'openhouse', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(236, 'login', '', 0, 'headerright', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_login', 0, 0, 1, 'style=default\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\ntext_mode=input\nlogin_button=icon\nlogout_button=text\nauto_remember=1\nlost_password=1\nlost_username=1\nregistration=1\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(227, 'share with', '', 0, 'sharebox', 0, '0000-00-00 00:00:00', 1, 'mod_sharebox', 0, 0, 0, '', 0, 0, ''),
(220, 'Language Selection', '', -1, 'user4', 0, '0000-00-00 00:00:00', 1, 'mod_jflanguageselection', 0, 0, 0, '', 0, 0, ''),
(221, 'Direct Translation', '', 0, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_translate', 0, 2, 0, '', 0, 1, ''),
(223, 'sharebox', '', 0, 'sharebox', 0, '0000-00-00 00:00:00', 1, 'mod_JoomlaShareThis', 0, 0, 0, 'moduleclass_sfx=\ncustom_text=ShareThis\nsharethis_show_web_tab=1\nsharethis_show_post_tab=1\nsharethis_show_email_tab=1\nsharethis_publisher_id=\nsharethis_style=1\nsharethis_popup=0\nsharethis_embeds=1\nsharethis_headerbg=#000099\nsharethis_inactivebg=#CCCCCC\nsharethis_inactivefg=#000000\nsharethis_linkfg=#000099\nsharethis_choose_services=default\nsharethis_services_list=reddit,digg,facebook,myspace,delicious,stumbleupon,technorati,google_bmarks,yahoo_bmarks,yahoo_myweb,windows_live,propeller,friendfeed,newsvine,xanga,mixx,blinklist,furl,magnolia,mister_wong,n4g,blogmarks,faves,current,simpy,slashdot,meneame,yigg,oknotizie,fresqui,diigo,care2,funp,kirtsy,hugg,sphinn\n\n', 0, 0, ''),
(229, 'custom right', '<p>this is right menu</p>\r\n<p><img src="images/stories/pastarchives.jpg" border="0" /></p>', 13, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white icon-twitter\n\n', 0, 0, ''),
(232, 'custom left part 2', '<p>handle with care</p>\r\n<p><img src="images/stories/dialog-warning.png" border="0" /></p>', 1, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white icon-twitter\n\n', 0, 0, ''),
(233, 'custom left three', '<p>Schedule of  Indian cricket team<img src="images/stories/gnome-fs-loading-icon.png" border="0" /></p>\r\n<p> </p>', 2, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-rider color-white icon-twitter\n\n', 0, 0, ''),
(237, 'ERA Login', '', 0, 'ERAlogin', 62, '2010-08-30 11:47:23', 1, 'mod_login', 0, 0, 0, 'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=166\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(16, 1),
(16, 48),
(16, 49),
(16, 134),
(16, 135),
(16, 136),
(16, 138),
(16, 140),
(16, 141),
(16, 142),
(16, 145),
(16, 156),
(16, 157),
(16, 158),
(17, 1),
(18, 1),
(18, 48),
(18, 49),
(18, 134),
(18, 135),
(18, 136),
(18, 138),
(18, 140),
(18, 141),
(18, 142),
(18, 145),
(18, 156),
(18, 157),
(18, 158),
(19, 1),
(21, 53),
(22, 1),
(25, 0),
(29, 0),
(35, 1),
(35, 20),
(35, 24),
(35, 48),
(35, 49),
(35, 51),
(35, 52),
(35, 53),
(35, 54),
(35, 55),
(35, 58),
(35, 95),
(35, 96),
(35, 97),
(35, 98),
(35, 99),
(35, 100),
(35, 101),
(35, 124),
(35, 125),
(35, 134),
(35, 135),
(35, 136),
(35, 138),
(35, 140),
(35, 141),
(35, 145),
(35, 152),
(35, 156),
(35, 157),
(35, 158),
(35, 166),
(35, 167),
(35, 168),
(35, 169),
(35, 170),
(35, 171),
(35, 184),
(35, 185),
(35, 186),
(35, 187),
(35, 188),
(35, 189),
(35, 190),
(35, 191),
(35, 192),
(35, 196),
(35, 197),
(35, 198),
(35, 199),
(35, 200),
(35, 201),
(35, 202),
(35, 203),
(35, 207),
(35, 208),
(35, 209),
(35, 210),
(39, 43),
(39, 44),
(39, 45),
(39, 46),
(39, 47),
(40, 0),
(42, 1),
(42, 48),
(42, 49),
(42, 58),
(42, 134),
(42, 135),
(42, 136),
(42, 138),
(42, 140),
(42, 141),
(42, 142),
(42, 145),
(42, 156),
(42, 157),
(42, 158),
(46, 0),
(51, 0),
(52, 58),
(53, 58),
(56, 0),
(57, 58),
(58, 58),
(59, 58),
(60, 1),
(60, 20),
(60, 24),
(60, 48),
(60, 49),
(60, 51),
(60, 52),
(60, 53),
(60, 54),
(60, 55),
(60, 56),
(60, 95),
(60, 96),
(60, 97),
(60, 98),
(60, 99),
(60, 100),
(60, 101),
(61, 58),
(62, 58),
(63, 58),
(64, 58),
(68, 54),
(68, 55),
(68, 58),
(68, 152),
(72, 0),
(73, 58),
(75, 53),
(75, 58),
(76, 53),
(76, 58),
(77, 53),
(77, 58),
(78, 53),
(78, 58),
(83, 58),
(84, 58),
(85, 58),
(86, 58),
(87, 53),
(87, 95),
(87, 96),
(87, 97),
(87, 98),
(87, 99),
(87, 100),
(87, 101),
(89, 58),
(91, 58),
(117, 53),
(118, 1),
(118, 20),
(118, 24),
(118, 48),
(118, 49),
(118, 51),
(118, 52),
(118, 53),
(118, 54),
(118, 55),
(118, 56),
(118, 95),
(118, 96),
(118, 97),
(118, 98),
(118, 99),
(118, 100),
(118, 101),
(118, 134),
(118, 135),
(118, 136),
(118, 138),
(118, 140),
(118, 141),
(118, 142),
(118, 145),
(118, 152),
(118, 153),
(118, 154),
(118, 171),
(118, 172),
(118, 173),
(118, 174),
(121, 1),
(121, 20),
(121, 24),
(121, 48),
(121, 49),
(121, 51),
(121, 52),
(121, 53),
(121, 54),
(121, 55),
(121, 95),
(121, 96),
(121, 97),
(121, 98),
(121, 99),
(121, 100),
(121, 101),
(121, 134),
(121, 135),
(121, 136),
(121, 138),
(121, 140),
(121, 141),
(121, 142),
(121, 145),
(121, 152),
(121, 171),
(122, 53),
(123, 53),
(124, 53),
(125, 0),
(134, 0),
(150, 53),
(151, 53),
(155, 54),
(155, 152),
(156, 54),
(156, 152),
(158, 1),
(158, 20),
(158, 24),
(158, 48),
(158, 49),
(158, 51),
(158, 52),
(158, 53),
(158, 54),
(158, 55),
(158, 95),
(158, 96),
(158, 97),
(158, 98),
(158, 99),
(158, 100),
(158, 101),
(158, 134),
(158, 135),
(158, 136),
(158, 138),
(158, 140),
(158, 141),
(158, 142),
(158, 145),
(158, 152),
(158, 171),
(168, 53),
(168, 114),
(168, 118),
(168, 130),
(168, 146),
(168, 147),
(168, 148),
(168, 161),
(168, 162),
(168, 164),
(168, 165),
(170, 58),
(171, 58),
(175, 54),
(175, 152),
(175, 171),
(176, 54),
(176, 152),
(176, 171),
(177, 53),
(178, 0),
(179, 53),
(180, 58),
(181, 58),
(182, 55),
(182, 58),
(182, 152),
(183, 53),
(183, 114),
(183, 118),
(183, 130),
(183, 146),
(183, 147),
(183, 148),
(183, 161),
(183, 162),
(183, 164),
(183, 165),
(186, 53),
(186, 114),
(186, 118),
(186, 130),
(186, 146),
(186, 147),
(186, 148),
(186, 161),
(186, 162),
(186, 164),
(186, 165),
(190, 172),
(190, 173),
(190, 174),
(191, 58),
(192, 53),
(192, 114),
(192, 118),
(192, 130),
(192, 146),
(192, 147),
(192, 148),
(192, 161),
(192, 162),
(192, 164),
(192, 165),
(194, 54),
(194, 152),
(195, 53),
(196, 53),
(197, 53),
(198, 53),
(199, 53),
(200, 53),
(201, 53),
(203, 53),
(204, 53),
(205, 53),
(206, 53),
(207, 53),
(208, 53),
(209, 53),
(211, 53),
(212, 0),
(214, 53),
(216, 53),
(217, 53),
(218, 53),
(220, 0),
(223, 53),
(227, 53),
(228, 53),
(229, 53),
(230, 53),
(231, 53),
(232, 53),
(233, 53),
(234, 53),
(235, 53),
(236, 0),
(237, 53),
(238, 53);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `link` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `filename` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_newsfeeds`
--

INSERT INTO `jos_newsfeeds` (`catid`, `id`, `name`, `alias`, `link`, `filename`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`, `rtl`) VALUES
(4, 1, 'Joomla! - Official News', 'joomla-official-news', 'http://www.joomla.org/index.php?option=com_rss_xtd&feed=RSS2.0&type=com_frontpage&Itemid=1', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 8, 0),
(4, 2, 'Joomla! - Community News', 'joomla-community-news', 'http://www.joomla.org/index.php?option=com_rss_xtd&feed=RSS2.0&type=com_content&task=blogcategory&id=0&Itemid=33', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 9, 0),
(6, 3, 'Linux Today', 'linux-today', 'http://linuxtoday.com/backend/my-netscape.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(5, 4, 'Business News', 'business-news', 'http://headlines.internet.com/internetnews/bus-news/news.rss', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(5, 5, 'Web Developer News', 'web-developer-news', 'http://headlines.internet.com/internetnews/wd-news/news.rss', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 3, 0),
(6, 6, 'Linux Central:New Products', 'linux-central-news-products', 'http://linuxcentral.com/backend/lcnew.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 4, 0),
(6, 7, 'Linux Central:Best Selling', 'linux-central-best-selling', 'http://linuxcentral.com/backend/lcbestns.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 5, 0),
(6, 8, 'Linux Central:Daily Specials', 'linux-central-daily-specials', 'http://linuxcentral.com/backend/lcspecialns.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_plugins`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 24, 2010 at 02:01 PM
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `element` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `folder` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE 2.0', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'theme=advanced\ncleanup=1\ncleanup_startup=0\nautosave=0\ncompressed=0\nrelative_urls=1\ntext_direction=ltr\nlang_mode=0\nlang_code=en\ninvalid_elements=applet\ncontent_css=1\ncontent_css_custom=\nnewlines=0\ntoolbar=top\nhr=1\nsmilies=1\ntable=1\nstyle=1\nlayer=1\nxhtmlxtras=0\ntemplate=0\ndirectionality=1\nfullscreen=1\nhtml_height=550\nhtml_width=750\npreview=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 62, '2010-08-18 11:49:45', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 62, '2010-09-24 08:31:07', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'YOOeffects', 'yoo_effects', 'system', 0, 0, 1, 0, 0, 62, '2008-03-27 22:08:03', 'lightbox=1\nreflection=1\nspotlight=1\ngzip=1\n'),
(37, 'System - Jfdatabase', 'jfdatabase', 'system', 0, -100, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(38, 'System - Jfrouter', 'jfrouter', 'system', 0, -101, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(39, 'Content - Jfalternative', 'jfalternative', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(40, 'Search - Jfcategories', 'jfcategories', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(41, 'Search - Jfcontacts', 'jfcontacts', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(42, 'Search - Jfcontent', 'jfcontent', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(43, 'Search - Jfnewsfeeds', 'jfnewsfeeds', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(44, 'Search - Jfsections', 'jfsections', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(45, 'Search - Jfweblinks', 'jfweblinks', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(46, 'Joomfish - Missing_translation', 'missing_translation', 'joomfish', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `jos_polls`
--

INSERT INTO `jos_polls` (`id`, `title`, `alias`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(14, 'Joomla! is used for?', 'joomla-is-used-for', 11, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_data`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `jos_poll_data`
--

INSERT INTO `jos_poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(1, 14, 'Community Sites', 2),
(2, 14, 'Public Brand Sites', 3),
(3, 14, 'eCommerce', 1),
(4, 14, 'Blogs', 0),
(5, 14, 'Intranets', 0),
(6, 14, 'Photo and Media Sites', 2),
(7, 14, 'All of the Above!', 3),
(8, 14, '', 0),
(9, 14, '', 0),
(10, 14, '', 0),
(11, 14, '', 0),
(12, 14, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_date`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `jos_poll_date`
--

INSERT INTO `jos_poll_date` (`id`, `date`, `vote_id`, `poll_id`) VALUES
(1, '2006-10-09 13:01:58', 1, 14),
(2, '2006-10-10 15:19:43', 7, 14),
(3, '2006-10-11 11:08:16', 7, 14),
(4, '2006-10-11 15:02:26', 2, 14),
(5, '2006-10-11 15:43:03', 7, 14),
(6, '2006-10-11 15:43:38', 7, 14),
(7, '2006-10-12 00:51:13', 2, 14),
(8, '2007-05-10 19:12:29', 3, 14),
(9, '2007-05-14 14:18:00', 6, 14),
(10, '2007-06-10 15:20:29', 6, 14),
(11, '2007-07-03 12:37:53', 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_menu`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_property`
--
-- Creation: Oct 04, 2010 at 05:11 PM
--

CREATE TABLE IF NOT EXISTS `jos_property` (
  `property_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `property_name` varchar(250) NOT NULL COMMENT 'short description of property',
  `property_type_id` int(10) unsigned zerofill NOT NULL,
  `property_country` enum('Cyprus','Greece') NOT NULL DEFAULT 'Cyprus',
  `property_province_id` int(10) unsigned zerofill NOT NULL,
  `property_district_id` int(10) unsigned zerofill NOT NULL,
  `property_city_id` int(10) unsigned zerofill NOT NULL,
  `property_address_line1` varchar(250) NOT NULL,
  `property_address_line2` varchar(250) NOT NULL,
  `property_zip` varchar(8) DEFAULT NULL,
  `property_price` varchar(10) NOT NULL,
  `vat_included` enum('t','f') NOT NULL DEFAULT 'f',
  `property_description` text NOT NULL,
  `generated_reference_no` varchar(15) NOT NULL COMMENT 'system generated number',
  `property_views` int(10) unsigned zerofill NOT NULL COMMENT 'how many times property viewd',
  `property_added_by` int(10) unsigned zerofill NOT NULL COMMENT 'user id of person',
  `property_added_date` datetime NOT NULL,
  `property_updated_by` int(10) unsigned zerofill DEFAULT NULL COMMENT 'user id of proprty update person',
  `porperty_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `property_status` enum('a','i') NOT NULL DEFAULT 'a',
  PRIMARY KEY (`property_id`),
  KEY `property_type_id` (`property_type_id`),
  KEY `property_district_id` (`property_city_id`),
  KEY `property_province_id` (`property_province_id`),
  KEY `property_added_by` (`property_added_by`),
  KEY `property_updated_by` (`property_updated_by`),
  KEY `property_views` (`property_views`),
  KEY `property_country` (`property_country`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='contains basic information of a property' AUTO_INCREMENT=110 ;

--
-- Dumping data for table `jos_property`
--

INSERT INTO `jos_property` (`property_id`, `property_name`, `property_type_id`, `property_country`, `property_province_id`, `property_district_id`, `property_city_id`, `property_address_line1`, `property_address_line2`, `property_zip`, `property_price`, `vat_included`, `property_description`, `generated_reference_no`, `property_views`, `property_added_by`, `property_added_date`, `property_updated_by`, `porperty_last_update`, `property_status`) VALUES
(0000000001, 'test property', 0000000013, 'Cyprus', 0000000006, 0000000020, 0000000043, 'koregaon park', 'Pune', '5555454', '30000', 'f', '<h2>Commercial IT Park</h2><br><font face="Arial Black">this is Commercial park description</font><br><br>', '', 0000000000, 0000000062, '2010-09-29 10:29:59', 0000000062, '2010-10-04 11:33:07', 'a'),
(0000000063, 'final proprty test', 0000000013, 'Greece', 0000000009, 0000000008, 0000000034, 'address line one', '', '0', '3578', 'f', '<font size="6">Hiiiiiiiiiiiiiiiiiiiiiiii<br><span style="background-color: rgb(255, 0, 0);">this is description</span><br><br></font>', '', 0000000000, 0000000062, '2010-09-29 19:36:56', NULL, '2010-09-29 19:36:56', 'a'),
(0000000106, 'hi', 0000000001, 'Cyprus', 0000000046, 0000000038, 0000000024, 'adres line one', 'adrs line two', '14785231', '9876.95', 'f', 'Property short Description<br>', '', 0000000000, 0000000062, '2010-10-04 16:44:14', NULL, '2010-10-04 16:44:14', 'a'),
(0000000109, 'Delhi CWG updated', 0000000001, 'Cyprus', 0000000042, 0000000032, 0000000012, 'address line one', 'address line two updated', '334803', '8596', 'f', '<h1>Now i can update<span style="background-color: rgb(255, 102, 0);"> description</span></h1><br>', '', 0000000000, 0000000062, '2010-10-04 16:59:41', 0000000062, '2010-10-04 17:45:57', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `jos_property_city`
--
-- Creation: Sep 13, 2010 at 06:24 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_city` (
  `city_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `city_name` varchar(30) NOT NULL,
  `district_id` int(10) unsigned zerofill NOT NULL,
  `city_status` enum('a','i') NOT NULL DEFAULT 'a',
  `city_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_name` (`city_name`,`district_id`),
  KEY `district_id` (`district_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- RELATIONS FOR TABLE `jos_property_city`:
--   `district_id`
--       `jos_property_district` -> `district_id`
--

--
-- Dumping data for table `jos_property_city`
--

INSERT INTO `jos_property_city` (`city_id`, `city_name`, `district_id`, `city_status`, `city_updated`) VALUES
(0000000001, 'South Pasadena', 0000000029, 'a', '2010-09-13 18:20:22'),
(0000000002, 'Chino', 0000000009, 'a', '2010-09-13 18:20:22'),
(0000000003, 'New Kensington', 0000000022, 'a', '2010-09-13 18:20:22'),
(0000000004, 'Plainfield', 0000000038, 'a', '2010-09-13 18:20:22'),
(0000000005, 'Naperville', 0000000026, 'a', '2010-09-13 18:20:22'),
(0000000006, 'Coos Bay', 0000000019, 'a', '2010-09-13 18:20:22'),
(0000000007, 'Rutland', 0000000029, 'a', '2010-09-13 18:20:22'),
(0000000008, 'Albany', 0000000039, 'a', '2010-09-13 18:22:53'),
(0000000009, 'La Palma', 0000000003, 'a', '2010-09-13 18:20:22'),
(0000000010, 'Irvine', 0000000021, 'a', '2010-09-13 18:20:22'),
(0000000011, 'Lander', 0000000022, 'a', '2010-09-13 18:20:22'),
(0000000012, 'Ann Arbor', 0000000032, 'a', '2010-09-13 18:20:22'),
(0000000013, 'Atwater', 0000000021, 'a', '2010-09-13 18:20:22'),
(0000000014, 'West Hollywood', 0000000023, 'a', '2010-09-13 18:20:22'),
(0000000015, 'Peru', 0000000012, 'a', '2010-09-13 18:20:22'),
(0000000016, 'Hannibal', 0000000022, 'a', '2010-09-13 18:20:22'),
(0000000017, 'Aberdeen', 0000000022, 'a', '2010-09-13 18:20:22'),
(0000000018, 'Rocky Mount', 0000000025, 'a', '2010-09-13 18:20:22'),
(0000000019, 'Benton Harbor', 0000000019, 'a', '2010-09-13 18:20:22'),
(0000000020, 'Merced', 0000000028, 'a', '2010-09-13 18:20:22'),
(0000000021, 'Broken Arrow', 0000000034, 'a', '2010-09-13 18:22:36'),
(0000000022, 'Carrollton', 0000000036, 'a', '2010-09-13 18:20:22'),
(0000000023, 'La Palma', 0000000006, 'a', '2010-09-13 18:20:22'),
(0000000024, 'Ocean City', 0000000038, 'a', '2010-09-13 18:20:22'),
(0000000025, 'Cortland', 0000000003, 'a', '2010-09-13 18:20:22'),
(0000000026, 'Johnstown', 0000000028, 'a', '2010-09-13 18:20:22'),
(0000000027, 'Muskogee', 0000000019, 'a', '2010-09-13 18:20:22'),
(0000000028, 'La Palma', 0000000026, 'a', '2010-09-13 18:20:22'),
(0000000029, 'West Sacramento', 0000000017, 'a', '2010-09-13 18:20:22'),
(0000000030, 'Corpus Christi', 0000000027, 'a', '2010-09-13 18:20:22'),
(0000000031, 'Pine Bluff', 0000000023, 'a', '2010-09-13 18:20:22'),
(0000000032, 'Corinth', 0000000029, 'a', '2010-09-13 18:20:22'),
(0000000033, 'Bowie', 0000000039, 'a', '2010-09-13 18:20:22'),
(0000000034, 'Gainesville', 0000000008, 'a', '2010-09-13 18:20:22'),
(0000000035, 'Jackson', 0000000035, 'a', '2010-09-13 18:20:22'),
(0000000036, 'Stafford', 0000000022, 'a', '2010-09-13 18:20:22'),
(0000000037, 'New Kensington', 0000000040, 'a', '2010-09-13 18:20:22'),
(0000000038, 'International Falls', 0000000004, 'a', '2010-09-13 18:20:22'),
(0000000039, 'Cedar Rapids', 0000000003, 'a', '2010-09-13 18:20:22'),
(0000000040, 'Albuquerque', 0000000014, 'a', '2010-09-13 18:20:22'),
(0000000041, 'Cape Coral', 0000000018, 'a', '2010-09-13 18:20:22'),
(0000000042, 'Apple Valley', 0000000036, 'a', '2010-09-13 18:22:36'),
(0000000043, 'Trenton', 0000000020, 'a', '2010-09-13 18:20:22'),
(0000000044, 'Hastings', 0000000035, 'a', '2010-09-13 18:20:22'),
(0000000045, 'Union City', 0000000023, 'a', '2010-09-13 18:20:22'),
(0000000046, 'Lowell', 0000000025, 'a', '2010-09-13 18:20:22'),
(0000000047, 'Carson City', 0000000029, 'a', '2010-09-13 18:20:22'),
(0000000048, 'Frederiksted', 0000000010, 'a', '2010-09-13 18:20:22'),
(0000000049, 'Oswego', 0000000026, 'a', '2010-09-13 18:20:22'),
(0000000050, 'Isle of Palms', 0000000004, 'a', '2010-09-13 18:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `jos_property_condition`
--
-- Creation: Sep 16, 2010 at 06:57 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_condition` (
  `condition_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(20) NOT NULL,
  `condition_status` enum('a','i') NOT NULL DEFAULT 'a' COMMENT 'a: active , i: inactive',
  `condition_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`condition_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='property condition table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_property_condition`
--

INSERT INTO `jos_property_condition` (`condition_id`, `condition_name`, `condition_status`, `condition_updated`) VALUES
(0000000001, 'New', 'a', '2010-09-16 19:05:24'),
(0000000002, 'Resale', 'a', '2010-09-16 19:05:24'),
(0000000003, 'Rebuilt', 'a', '2010-09-16 19:05:24'),
(0000000004, 'Development', 'a', '2010-09-16 19:05:24'),
(0000000005, 'Vacant field', 'a', '2010-09-16 19:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `jos_property_contact`
--
-- Creation: Oct 04, 2010 at 07:31 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_contact` (
  `contact_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned zerofill NOT NULL,
  `contact_office_name` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `alternate_number` varchar(15) NOT NULL,
  `contact_person` varchar(50) NOT NULL,
  `contact_address` varchar(250) NOT NULL,
  `display_address` enum('t','f') NOT NULL DEFAULT 't',
  `contact_email` varchar(70) NOT NULL DEFAULT '',
  `contact_added_by` int(10) unsigned zerofill NOT NULL,
  `contact_added_date` datetime NOT NULL,
  `contact_updated_by` int(10) unsigned zerofill DEFAULT NULL,
  `contact_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contact_id`),
  KEY `property_id` (`property_id`),
  KEY `contact_added_by` (`contact_added_by`),
  KEY `contact_updated_by` (`contact_updated_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_property_contact`
--

INSERT INTO `jos_property_contact` (`contact_id`, `property_id`, `contact_office_name`, `contact_number`, `alternate_number`, `contact_person`, `contact_address`, `display_address`, `contact_email`, `contact_added_by`, `contact_added_date`, `contact_updated_by`, `contact_updated`) VALUES
(0000000001, 0000000109, 'my office', '(545) 545-4545', '(545) 454-5454', 'keshav mohta', '"Agile technosys"\nPune, Maharashtra', 't', 'nomail@mail.com', 0000000062, '2010-10-04 17:01:08', 0000000062, '2010-10-04 19:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `jos_property_custom_field`
--
-- Creation: Sep 17, 2010 at 07:43 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_custom_field` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(30) NOT NULL,
  `field_type` int(10) unsigned zerofill NOT NULL,
  `field_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `field_status` enum('a','i') NOT NULL DEFAULT 'a',
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `feature_name` (`field_name`),
  KEY `feature_type` (`field_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Table containing all new features added from bckend ' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_property_custom_field`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_property_detail`
--
-- Creation: Oct 04, 2010 at 07:13 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_detail` (
  `property_detail_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned zerofill NOT NULL COMMENT 'reference to jos_property ->property_id',
  `total_bedroom` int(11) unsigned NOT NULL,
  `total_bathroom` int(11) unsigned NOT NULL,
  `total_kitchen` int(10) unsigned NOT NULL,
  `total_covered_area` float unsigned NOT NULL,
  `total_covered_veranda` float unsigned DEFAULT NULL,
  `swiming_pool` enum('y','n','o','p','c') NOT NULL DEFAULT 'n' COMMENT 'y:yes;n:no;o:optional;p:personal;c:communal',
  `property_condition_id` int(10) unsigned zerofill NOT NULL,
  `property_full_description` text NOT NULL,
  `built_year` year(4) NOT NULL,
  `video_link` text NOT NULL,
  `sea_distance` float unsigned NOT NULL COMMENT 'in Kilometer',
  `airport_distance` float unsigned NOT NULL COMMENT 'in Kilometer',
  `railway_distance` float unsigned NOT NULL,
  `highway_distance` float unsigned NOT NULL,
  `added_date` datetime NOT NULL,
  `added_by` int(10) unsigned zerofill NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`property_detail_id`),
  KEY `property_id` (`property_id`),
  KEY `total_bedroom` (`total_bedroom`),
  KEY `total_bathroom` (`total_bathroom`),
  KEY `updated_by` (`updated_by`),
  KEY `added_by` (`added_by`),
  KEY `total_kitchens` (`total_kitchen`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='contains detaild information of specific property' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jos_property_detail`
--

INSERT INTO `jos_property_detail` (`property_detail_id`, `property_id`, `total_bedroom`, `total_bathroom`, `total_kitchen`, `total_covered_area`, `total_covered_veranda`, `swiming_pool`, `property_condition_id`, `property_full_description`, `built_year`, `video_link`, `sea_distance`, `airport_distance`, `railway_distance`, `highway_distance`, `added_date`, `added_by`, `last_update`, `updated_by`) VALUES
(0000000008, 0000000109, 2, 3, 4, 1234.56, 45.67, 'n', 0000000005, 'This is Long Description<br><br>Very     <font style="background-color: rgb(255, 0, 0);" color="#ffffff">                                           <span style="background-color: rgb(255, 255, 255);">   </span>     <span style="background-color: rgb(255, 255, 255);">    </span><font color="#ff0000"><span style="background-color: rgb(255, 255, 255);"><span style="background-color: rgb(255, 255, 255);"></span>         Longgggggggggggggggggggg</span></font></font><br>', 0000, 'http://', 2.5, 0, 0, 0, '2010-10-04 17:00:01', 0000000062, '2010-10-04 19:38:32', 0000000062);

-- --------------------------------------------------------

--
-- Table structure for table `jos_property_district`
--
-- Creation: Sep 13, 2010 at 06:25 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_district` (
  `district_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned zerofill NOT NULL,
  `district_name` varchar(30) NOT NULL,
  `district_status` enum('a','i') NOT NULL DEFAULT 'a',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`,`province_id`),
  KEY `province_id` (`province_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- RELATIONS FOR TABLE `jos_property_district`:
--   `province_id`
--       `jos_property_province` -> `province_id`
--

--
-- Dumping data for table `jos_property_district`
--

INSERT INTO `jos_property_district` (`district_id`, `province_id`, `district_name`, `district_status`, `last_updated`) VALUES
(0000000001, 0000000018, 'New Brunswick', 'a', '2010-09-13 18:14:19'),
(0000000002, 0000000015, 'Nova Scotia', 'a', '2010-09-13 18:14:19'),
(0000000003, 0000000012, 'Northwest Territories', 'a', '2010-09-13 18:14:19'),
(0000000004, 0000000008, 'Nova Scotia', 'a', '2010-09-13 18:14:19'),
(0000000005, 0000000010, 'Manitoba', 'a', '2010-09-13 18:14:19'),
(0000000006, 0000000018, 'Ontario', 'a', '2010-09-13 18:14:19'),
(0000000007, 0000000005, 'Alberta', 'a', '2010-09-13 18:14:19'),
(0000000008, 0000000009, 'Ontario', 'a', '2010-09-13 18:14:19'),
(0000000009, 0000000020, 'New Brunswick', 'a', '2010-09-13 18:14:19'),
(0000000010, 0000000012, 'Saskatchewan', 'a', '2010-09-13 18:14:19'),
(0000000011, 0000000013, 'Prince Edward Island', 'a', '2010-09-13 18:14:19'),
(0000000012, 0000000004, 'Nunavut', 'a', '2010-09-13 18:14:19'),
(0000000013, 0000000008, 'New Brunswick', 'a', '2010-09-13 18:14:19'),
(0000000014, 0000000004, 'Saskatchewan', 'a', '2010-09-13 18:14:19'),
(0000000015, 0000000012, 'New Brunswick', 'a', '2010-09-13 18:14:19'),
(0000000016, 0000000015, 'Quebec', 'a', '2010-09-13 18:14:19'),
(0000000017, 0000000015, 'Ontario', 'a', '2010-09-13 18:14:19'),
(0000000018, 0000000002, 'Saskatchewan', 'a', '2010-09-13 18:14:19'),
(0000000019, 0000000013, 'New Brunswick', 'a', '2010-09-13 18:14:19'),
(0000000020, 0000000006, 'New Brunswick', 'a', '2010-09-13 18:14:19'),
(0000000021, 0000000005, 'Quebec', 'a', '2010-09-13 18:14:19'),
(0000000022, 0000000013, 'Nova Scotia', 'a', '2010-09-13 18:14:19'),
(0000000023, 0000000010, 'Ontario', 'a', '2010-09-13 18:14:19'),
(0000000024, 0000000017, 'Alberta', 'a', '2010-09-13 18:14:19'),
(0000000025, 0000000007, 'Manitoba', 'a', '2010-09-13 18:14:19'),
(0000000026, 0000000011, 'Quebec', 'a', '2010-09-13 18:14:19'),
(0000000027, 0000000017, 'Nova Scotia', 'a', '2010-09-13 18:14:19'),
(0000000028, 0000000017, 'New Brunswick', 'a', '2010-09-13 18:14:19'),
(0000000029, 0000000001, 'New Brunswick', 'a', '2010-09-13 18:14:19'),
(0000000032, 0000000042, 'Colorado', 'a', '2010-09-13 18:15:34'),
(0000000033, 0000000046, 'Louisiana', 'a', '2010-09-13 18:15:34'),
(0000000034, 0000000045, 'Maine', 'a', '2010-09-13 18:15:34'),
(0000000035, 0000000043, 'Kansas', 'a', '2010-09-13 18:15:34'),
(0000000036, 0000000045, 'North Dakota', 'a', '2010-09-13 18:15:34'),
(0000000037, 0000000046, 'Montana', 'a', '2010-09-13 18:15:34'),
(0000000038, 0000000046, 'Maryland', 'a', '2010-09-13 18:15:34'),
(0000000039, 0000000040, 'Georgia', 'a', '2010-09-13 18:15:34'),
(0000000040, 0000000044, 'Wyoming', 'a', '2010-09-13 18:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `jos_property_field_html`
--
-- Creation: Sep 17, 2010 at 07:52 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_field_html` (
  `field_html_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `field_html_type` varchar(20) NOT NULL,
  `field_html_code` varchar(255) NOT NULL,
  `field_default_value` varchar(50) DEFAULT '',
  `field_reqired` enum('t','f') NOT NULL DEFAULT 'f',
  PRIMARY KEY (`field_html_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_property_field_html`
--

INSERT INTO `jos_property_field_html` (`field_html_id`, `field_html_type`, `field_html_code`, `field_default_value`, `field_reqired`) VALUES
(0000000001, 'text', '<input type="text" name="#" id="#">', NULL, 'f'),
(0000000002, 'radio', '<input type="radio" name="#" id="#">', NULL, 'f'),
(0000000003, 'checkbox', '<input type="checkbox" name="#" id="#">', NULL, ''),
(0000000004, 'selectbox', '<select name="#" id="#"></select>', '', 'f'),
(0000000005, 'option', '<option value="#">#</option>', NULL, 'f'),
(0000000006, 'textarea', '<textarea name="#" id="#"></textarea>', NULL, 'f'),
(0000000007, 'button', '<input type="button" name="#" id="#" value="#"/>', '', 'f');

-- --------------------------------------------------------

--
-- Table structure for table `jos_property_image`
--
-- Creation: Sep 27, 2010 at 02:59 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_image` (
  `image_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned zerofill NOT NULL,
  `image_title` varchar(100) NOT NULL,
  `image_path` text NOT NULL,
  `thumb_path` text NOT NULL,
  `image_size` int(10) unsigned NOT NULL COMMENT 'orignal image size',
  `image_type` varchar(50) NOT NULL,
  `added_by` int(10) unsigned zerofill NOT NULL COMMENT 'id of the user who uploading image',
  `added_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL COMMENT 'user id',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `property_id` (`property_id`),
  KEY `image_updated_by` (`updated_by`),
  KEY `added_by` (`added_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='information of all images of a property' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jos_property_image`
--

INSERT INTO `jos_property_image` (`image_id`, `property_id`, `image_title`, `image_path`, `thumb_path`, `image_size`, `image_type`, `added_by`, `added_date`, `updated_by`, `last_update`) VALUES
(0000000001, 0000000000, 'fisrt image', 'templates/yoo_symphony/images/site/ad-19_1285769410.jpg', 'templates/yoo_symphony/images/site/thumbs/ad-19_1285769410.jpg', 42949, 'image/jpeg', 0000000062, '2010-09-29 19:40:10', NULL, '2010-09-29 19:40:10'),
(0000000002, 0000000000, 'test image', 'templates/yoo_symphony/images/site/herb_robbing_sheep-1280x1024_1286177734.jpg', 'templates/yoo_symphony/images/site/thumbs/herb_robbing_sheep-1280x1024_1286177734.jpg', 259998, 'image/jpeg', 0000000062, '2010-10-04 13:05:34', NULL, '2010-10-04 13:05:34'),
(0000000003, 0000000000, 'First image', 'templates/yoo_symphony/images/site/2308_thelonesomedune_1440x900_1286191996.jpg', 'templates/yoo_symphony/images/site/thumbs/2308_thelonesomedune_1440x900_1286191996.jpg', 781236, 'image/jpeg', 0000000062, '2010-10-04 17:03:17', NULL, '2010-10-04 17:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `jos_property_province`
--
-- Creation: Sep 13, 2010 at 06:08 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_province` (
  `province_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `province_name` varchar(30) NOT NULL,
  `province_status` enum('a','i') NOT NULL DEFAULT 'a',
  `province_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`province_id`),
  UNIQUE KEY `province_name` (`province_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `jos_property_province`
--

INSERT INTO `jos_property_province` (`province_id`, `province_name`, `province_status`, `province_updated`) VALUES
(0000000001, 'Ohio', 'a', '2010-09-13 18:08:21'),
(0000000002, 'MD', 'a', '2010-09-13 18:08:21'),
(0000000003, 'KY', 'a', '2010-09-13 18:08:21'),
(0000000004, 'ID', 'a', '2010-09-13 18:08:21'),
(0000000005, 'VT', 'a', '2010-09-13 18:08:21'),
(0000000006, 'Mississippi', 'a', '2010-09-13 18:08:21'),
(0000000007, 'Maryland', 'a', '2010-09-13 18:08:21'),
(0000000008, 'RI', 'a', '2010-09-13 18:08:21'),
(0000000009, 'Arkansas', 'a', '2010-09-13 18:08:21'),
(0000000010, 'CO', 'a', '2010-09-13 18:08:21'),
(0000000011, 'NM', 'a', '2010-09-13 18:08:21'),
(0000000012, 'Georgia', 'a', '2010-09-13 18:08:21'),
(0000000013, 'MO', 'a', '2010-09-13 18:08:21'),
(0000000014, 'Delaware', 'a', '2010-09-13 18:08:21'),
(0000000015, 'Montana', 'a', '2010-09-13 18:08:21'),
(0000000016, 'Virginia', 'a', '2010-09-13 18:08:21'),
(0000000017, 'MS', 'a', '2010-09-13 18:08:21'),
(0000000018, 'Hawaii', 'a', '2010-09-13 18:08:21'),
(0000000019, 'Alabama', 'a', '2010-09-13 18:08:21'),
(0000000020, 'PA', 'a', '2010-09-13 18:08:21'),
(0000000039, 'Texas', 'a', '2010-09-13 18:08:55'),
(0000000040, 'District of Columbia', 'a', '2010-09-13 18:08:55'),
(0000000041, 'Arizona', 'a', '2010-09-13 18:08:55'),
(0000000042, 'Kentucky', 'a', '2010-09-13 18:08:55'),
(0000000043, 'West Virginia', 'a', '2010-09-13 18:08:55'),
(0000000044, 'Oklahoma', 'a', '2010-09-13 18:08:55'),
(0000000045, 'MT', 'a', '2010-09-13 18:08:55'),
(0000000046, 'AK', 'a', '2010-09-13 18:08:55'),
(0000000047, 'Pennsylvania', 'a', '2010-09-13 18:08:55'),
(0000000048, 'WV', 'a', '2010-09-13 18:08:55'),
(0000000049, 'Vermont', 'a', '2010-09-13 18:08:55'),
(0000000050, 'Minnesota', 'a', '2010-09-13 18:08:55'),
(0000000051, 'DE', 'a', '2010-09-13 18:08:55'),
(0000000052, 'LA', 'a', '2010-09-13 18:08:55'),
(0000000053, 'TN', 'a', '2010-09-13 18:08:55'),
(0000000054, 'North Dakota', 'a', '2010-09-13 18:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `jos_property_type`
--
-- Creation: Sep 14, 2010 at 02:44 PM
--

CREATE TABLE IF NOT EXISTS `jos_property_type` (
  `type_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `type_status` enum('a','i') NOT NULL DEFAULT 'a',
  `type_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='type of property ( apratment , house, flat, farms... etc)' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `jos_property_type`
--

INSERT INTO `jos_property_type` (`type_id`, `type_name`, `type_status`, `type_updated`) VALUES
(0000000001, 'Apartment', 'a', '2010-09-14 14:45:28'),
(0000000002, 'Detached house', 'a', '2010-09-14 14:45:28'),
(0000000003, 'Semi Detached', 'a', '2010-09-14 14:45:28'),
(0000000004, 'Town house', 'a', '2010-09-14 14:45:28'),
(0000000005, 'Flat', 'a', '2010-09-14 14:45:28'),
(0000000006, 'Residential', 'a', '2010-09-14 14:45:28'),
(0000000007, 'Row House', 'a', '2010-09-14 14:45:28'),
(0000000008, 'Duplex', 'a', '2010-09-14 14:45:28'),
(0000000009, 'Simplex', 'a', '2010-09-14 14:45:28'),
(0000000010, 'Vacant land', 'a', '2010-09-14 14:45:28'),
(0000000011, 'Guest house', 'a', '2010-09-14 14:45:28'),
(0000000012, 'Farms', 'a', '2010-09-14 14:45:28'),
(0000000013, 'Commercial', 'a', '2010-09-14 14:45:28'),
(0000000014, 'Factory', 'a', '2010-09-14 14:45:28'),
(0000000015, 'Security estate', 'a', '2010-09-14 14:45:28'),
(0000000016, 'Golf Estate', 'a', '2010-09-14 14:45:28'),
(0000000017, 'Country estate', 'a', '2010-09-14 14:45:28'),
(0000000018, 'Cottage', 'a', '2010-09-14 14:45:28'),
(0000000019, 'Development land', 'a', '2010-09-14 14:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `image` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `scope` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `image_position` varchar(90) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(4, 'Joomla!', '', 'joomla', 'clock.jpg', 'content', 'right', '<p>As with previous releases, Joomla! provides a unified and easy-to-use framework for delivering content for Web sites of all kinds. To support the changing nature of the Internet and emerging Web technologies, Joomla! required substantial restructuring of its core functionality and we also used this effort to simplify many challenges within the current user interface. Joomla! 1.5 has many new features.</p>', 1, 0, '0000-00-00 00:00:00', 1, 0, 21, ''),
(5, 'YOOtheme', '', 'yootheme', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 2, 0, 23, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Oct 04, 2010 at 07:43 PM
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `time` varchar(14) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `session_id` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext CHARACTER SET latin1 COLLATE latin1_general_ci,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('admin', '1286201601', 'a909a4dc806d5557daf7b4261372ba49', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:238;s:19:"session.timer.start";i:1286188340;s:18:"session.timer.last";i:1286201598;s:17:"session.timer.now";i:1286201601;s:22:"session.client.browser";s:101:"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.13) Gecko/20100914 Firefox/3.5.13 AutoPager/0.6.1.24";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:2:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:25:"m.amit@agiletechnosys.com";s:8:"password";s:65:"e6b34d20f49bb461f1dd48f7fa9cb405:X6PDBux8WB6URDSkBh0Ueykcy824RvO2";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2010-08-12 18:30:44";s:13:"lastvisitDate";s:19:"2010-10-04 09:49:28";s:10:"activation";s:0:"";s:6:"params";s:0:"";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:65:"/opt/lampp/htdocs/erareal/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"cd23bf101bb75420c0a8eb3adb77643f";}prop_id|s:10:"0000000109";');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('yoo_symphony', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Oct 04, 2010 at 04:02 PM
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `username` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `usertype` varchar(75) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`(255)),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'm.amit@agiletechnosys.com', 'e6b34d20f49bb461f1dd48f7fa9cb405:X6PDBux8WB6URDSkBh0Ueykcy824RvO2', 'Super Administrator', 0, 1, 25, '2010-08-12 18:30:44', '2010-10-04 10:32:22', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--
-- Creation: Sep 10, 2010 at 01:47 PM
-- Last update: Sep 10, 2010 at 01:47 PM
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `url` varchar(250) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_weblinks`
--

INSERT INTO `jos_weblinks` (`id`, `catid`, `sid`, `title`, `alias`, `url`, `description`, `date`, `hits`, `published`, `checked_out`, `checked_out_time`, `ordering`, `archived`, `approved`, `params`) VALUES
(1, 2, 0, 'Joomla!', 'joomla', 'http://www.joomla.org', 'Home of Joomla!', '2005-02-14 15:19:02', 3, 1, 0, '0000-00-00 00:00:00', 1, 0, 1, 'target=0'),
(2, 2, 0, 'php.net', 'php', 'http://www.php.net', 'The language that Joomla! is developed in', '2004-07-07 11:33:24', 6, 1, 0, '0000-00-00 00:00:00', 3, 0, 1, ''),
(3, 2, 0, 'MySQL', 'mysql', 'http://www.mysql.com', 'The database that Joomla! uses', '2004-07-07 10:18:31', 1, 1, 0, '0000-00-00 00:00:00', 5, 0, 1, ''),
(4, 2, 0, 'OpenSourceMatters', 'opensourcematters', 'http://www.opensourcematters.org', 'Home of OSM', '2005-02-14 15:19:02', 11, 1, 0, '0000-00-00 00:00:00', 2, 0, 1, 'target=0'),
(5, 2, 0, 'Joomla! - Forums', 'joomla-forums', 'http://forum.joomla.org', 'Joomla! Forums', '2005-02-14 15:19:02', 4, 1, 0, '0000-00-00 00:00:00', 4, 0, 1, 'target=0'),
(6, 2, 0, 'Ohloh Tracking of Joomla!', 'ohloh-tracking-of-joomla', 'http://www.ohloh.net/projects/20', 'Objective reports from Ohloh about Joomla''s development activity. Joomla! has some star developers with serious kudos.', '2007-07-19 09:28:31', 1, 1, 0, '0000-00-00 00:00:00', 6, 0, 1, 'target=0\n\n');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jos_property_city`
--
ALTER TABLE `jos_property_city`
  ADD CONSTRAINT `jos_property_city_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `jos_property_district` (`district_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jos_property_district`
--
ALTER TABLE `jos_property_district`
  ADD CONSTRAINT `jos_property_district_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `jos_property_province` (`province_id`) ON DELETE CASCADE ON UPDATE CASCADE;

SET FOREIGN_KEY_CHECKS=1;
