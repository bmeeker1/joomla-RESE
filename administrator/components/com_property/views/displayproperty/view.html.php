<?php
	/**
	* @package		Joomla
	* @author Keshav Mohta
	* @subpackage	`property` detail view
	* @license		GNU/GPL, see LICENSE.php
	* @date Sep 15,2010
	*/

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

jimport( 'joomla.application.component.view');

class PropertyViewDisplayproperty extends JView
{
	 function display($tpl = null)
    {
		$property_id = JRequest::getVar('pid', NULL, 'GET');
		JToolBarHelper::title( JText::_( 'View Property' ), 'generic.png' );
		//JRequest::watch($this);
		$propertyController = new PropertyController();
		// Make an object of Main Model class contains Main functions
		$propertyModel =& $propertyController->getModel();
		//JRequest::watch($this);
		$prop_info=$propertyModel->getPropertyDetail($property_id);
		$type=$propertyModel->getNameFromID($prop_info['property_type_id'],'type');
		$province=$propertyModel->getNameFromID($prop_info['property_province_id'],'province');
		$district=$propertyModel->getNameFromID($prop_info['property_district_id'],'district');
		$city=$propertyModel->getNameFromID($prop_info['property_city_id'],'city');
		//JRequest::watch($prop_info);
		$this->assignRef('prop_info', $prop_info);
		$this->assignRef('type', $type);
		$this->assignRef('province', $province);
		$this->assignRef('district', $district);
		$this->assignRef('city', $city);
        parent::display($tpl);
    }

}
?>