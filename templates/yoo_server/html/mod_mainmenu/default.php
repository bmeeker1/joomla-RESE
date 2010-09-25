<?php
/**
* @package   yoo_symphony Template
* @version   1.5.2 2009-11-05 11:26:17
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2009 YOOtheme GmbH
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// include YOOmenu system
require_once(dirname(__FILE__).'/yoomenu.php');

// render YOOmenu
$yoomenu = &YOOMenu::getInstance();
$yoomenu->setParams($params);
$yoomenu->render($params, 'YOOMenuDefaultDecorator');

?>