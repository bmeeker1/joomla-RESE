<?php
/**
 * Joomla! 1.5 component advertising
 *
 * @author Himanshu
 * @package Joomla
 * @subpackage advertise
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport( 'joomla.application.component.view');

/**
 * HTML View class for the advertising component
 */
class PropertyformViewAjaxdata extends JView 
{
   /**
	* Default display function
	*/	
	function display($tpl = null) 
	{
		//$cmd =& JFactory::getDBO();
		$formController = new propertyform();
		$formModel = $formController->getModel();
		
		$traID=jRequest::getVar('traID','','GET');
		$data = $formModel->getTabList($traID);
		//jRequest::watch($formModel);
		//$subcategory_list=$advertiseModel->getSubcategoryList($categoryID);
		
// 		$stmt  = "SELECT id,tab_name FROM #__property_tab WHERE transaction_id=".$traID;
// 	
// 		$arr_tabs = $cmd->setQuery($stmt);
// 		$tab_list = $cmd->loadAssocList($arr_tabs);
		$this->assignRef('data', $data);
	

		parent::display($tpl);
   }
}
?>
