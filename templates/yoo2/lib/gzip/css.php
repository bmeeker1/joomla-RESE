<?php 
/**
* @package   yoo_symphony Template
* @version   1.5.2 2009-11-05 11:26:17
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2009 YOOtheme GmbH
*/

define('DS', DIRECTORY_SEPARATOR);
define('PATH_ROOT', dirname(dirname(dirname(dirname(dirname(__FILE__))))).DS);

// set header
if (extension_loaded('zlib') && !ini_get('zlib.output_compression')) @ob_start('ob_gzhandler');
header('Content-type: text/css; charset: UTF-8');
header('Expires: '.gmdate('D, d M Y H:i:s', time() + 86400).' GMT');

// include file
if (isset($_GET['id']) && $_GET['id']) {

	$id   = (string) preg_replace('/[^A-Z0-9_\.-]/i', '', $_GET['id']);
	$file = PATH_ROOT.'cache'.DS.'template'.DS.'css-'.$id.'.css';

	if (is_file($file)) {
		include($file);
	}
}

?>