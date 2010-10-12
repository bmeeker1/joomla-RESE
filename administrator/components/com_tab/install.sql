DROP TABLE IF EXISTS `#__property_tab`;

CREATE TABLE `#__property_tab` (
  `id` int(11) NOT NULL auto_increment,
  `transaction_id` int(11),
  `tab_name` varchar(20) NOT NULL,
   `tab_description` text,
  PRIMARY KEY  (`id`)
)


