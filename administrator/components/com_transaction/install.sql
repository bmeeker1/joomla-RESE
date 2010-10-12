DROP TABLE IF EXISTS `#__property_transaction`;

CREATE TABLE `#__property_transaction` (
  `id` int(11) NOT NULL auto_increment,
  `transaction_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

INSERT INTO `#__property_transaction` (`transaction_name`) VALUES ('Homes for Sale');
