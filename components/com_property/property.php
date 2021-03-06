<?php
/**
 * Joomla! 1.5.7 component `property`
 * @author Keshav Mohta
 * @package Joomla
 * @subpackage `property`
 * @license Copyright (c) 2010 - All Rights Reserved
 *
 */

/**
 * Entry point file for `property` component
 */

// no direct access
defined('_JEXEC') or die('Restricted access');


require_once(JPATH_COMPONENT.DS.'controller.php');

//Include file for the requested controller
if($controller = JRequest::getVar('controller'))
{
    $path = JPATH_COMPONENT.DS.'controllers'.DS.$controller.'.php';
    if (file_exists($path))
	{
        require_once $path;
    }
	else
	{
        $controller = '';
    }
}

 //~ Component Helper
 // jimport('joomla.application.component.helper');


 //~  Load the toolbar helper
 //require_once( JPATH_COMPONENT_ADMINISTRATOR.DS.'helpers'.DS.'toolbar.php' );

 //~ Render the toolbar on the page. rendering it here means that it is displayed on every view of your component.
 // echo AdvertiseHelperToolbar::getToolbar();


//Create Instance of the relevant Controller Class
$classname = 'PropertyController'.ucfirst($controller);
$controller = new $classname();

//Perform the requested task
$controller->execute(JRequest::getCmd('task'));

//Redirect if set by controller
$controller->redirect();

?>

