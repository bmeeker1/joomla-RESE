<?php 
	/**
	* Real Module Entry Point
	* @package		Joomla	
	* @subpackage	Modules
	* @author		Keshav mohta
	* @link http://dev.joomla.org/component/option,com_jd-wiki/Itemid,31/id,tutorials:modules/
	* @license        GNU/GPL, see LICENSE.php
	* mod_helloworld is free software. This version may have been modified pursuant
 	* to the GNU General Public License, and as distributed it includes or
 	* is derivative of works licensed under the GNU General Public License or
	* other free or open source software licenses.	
	* @date Aug 6, 2010
	*/
 
// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
 
// Include the syndicate functions only once
require_once( dirname(__FILE__).DS.'helper.php' );
 
$map = modMaptabHelper::getMap( $params );
require( JModuleHelper::getLayoutPath( 'mod_maptab' ) );

	


?>
