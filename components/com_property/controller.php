<?php
/**
 * Joomla! 1.5.7 component `property`
 *
 * @author Keshav Mohta
 * @package Joomla
 * @subpackage `property` controller
 * @license Copyright (c) 2010 - All Rights Reserved Agile technosys, Pune
 * @date Sep 10, 2010
 */


// no direct access
defined('_JEXEC') or die('Restricted access');

jimport('joomla.application.component.controller');

/* Advertise Default Controller Class */

class PropertyController extends JController
{
	 function display()
    {
		 JRequest::setVar('view','property'); // force it to be the polls view
		 parent::display();
    }

}
?>