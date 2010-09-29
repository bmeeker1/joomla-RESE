<?php
/**
 * Joomla! 1.5.7 component advertising
 *
 * @author keshav mohta
 * @package Joomla
 * @subpackage `contact form` of a property
 * @license Copyright (c) 2010 - All Rights Reserved
 *
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport( 'joomla.application.component.view');

class PropertyViewContact_detail extends JView
{
   /**
	* Method to display View
	*
	* @access public
	*/
	function display($tpl = null)
	{

		$property_contact_id = JRequest::getVar('pcid', NULL, 'GET');
    	$title_text = empty($property_contact_id)? JText::_( 'Add' ) : JText::_( 'Update' );
		JToolBarHelper::title( JText::_(" $title_text Contact Detail" ), 'user.png');
		//controller & model intialization
		$base_controller = new PropertyController();
		$base_model=$base_controller->getModel('Property');
		$model =& $this->getModel();
		if(!empty($property_contact_id) )
		{
			//$contact_data=$base_model->getPropertyContactDetail($property_contact_id);
			//$district_list=$base_model->getDistrictList($prop_data['property_province_id']);
			//$city_list=$base_model->getCityList($prop_data['property_district_id']);
			//JRequest::watch($contact_data);
		}

		//Assigning variable to view object so that it can be retrieve in default.php
		$this->assignRef('property_contact_id',$property_contact_id);
		$this->assignRef('title_text',$title_text);
		//$this->assignRef('contact_data', $contact_data);

		parent::display($tpl);
    }
}
?>
