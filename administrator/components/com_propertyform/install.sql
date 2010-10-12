DROP TABLE IF EXISTS `#__property_form`;

CREATE TABLE `#__property_form` (
  `id` int(11) NOT NULL auto_increment,
  `trasaction_id` int(11)  NOT NULL,
  `form_id` int(11) NOT NULL,	
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
