<?php
/**
 * Joomla! 1.5.7 component advertising
 *
 * @author keshav mohta
 * @package Joomla
 * @subpackage `form` of add property
 * @license Copyright (c) 2010 - All Rights Reserved
 *
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport( 'joomla.application.component.view');

class PropertyViewAddproperty extends JView
{
   /**
	* Method to display View
	*
	* @access public
	*/
	function display($tpl = null)
	{
		$province_list =array();
		$district_list =array();
		$city_list =array();

		$property_id = JRequest::getVar('pid', NULL, 'GET');
    	$title_text = empty($property_id)? JText::_( 'Add' ) : JText::_( 'Update' );
		JToolBarHelper::title( JText::_(" $title_text Property" ), 'user.png');
		JToolBarHelper::save();
		if (empty($prop_id))  {
			JToolBarHelper::cancel();
		} else {
			// for existing items the button is renamed `close`
			JToolBarHelper::cancel( 'cancel', 'Close' );
		}
		//controller & model intialization
		$base_controller = new PropertyController();
		$base_model=$base_controller->getModel('Property');
		$model =& $this->getModel();
		//$base_model=$this->getModel('Property');
		//JRequest::watch($base_model);
		if(!empty($property_id) )
		{
			$prop_data=$base_model->getPropertyDetail($property_id);
			$district_list=$base_model->getDistrictList($prop_data['property_province_id']);
			$city_list=$base_model->getCityList($prop_data['property_district_id']);
		}
		//JRequest::watch($prop_data);
		$type_list=$base_model->getPropertyType();
		$province_list=$base_model->getProvinceList();
		//JRequest::watch($district_list);

		//Assigning variable to view object so that it can be retrieve in default.php
		$this->assignRef('property_id',$property_id);
		$this->assignRef('title_text',$title_text);
		$this->assignRef('type_list', $type_list);
		$this->assignRef('province_list', $province_list);
		$this->assignRef('district_list', $district_list);
		$this->assignRef('city_list', $city_list);
		$this->assignRef('prop_data', $prop_data);

		parent::display($tpl);
    }
}
?>
