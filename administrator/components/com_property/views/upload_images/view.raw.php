<?php
/**
 * Joomla! 1.5.7 component advertising
 *
 * @author keshav mohta
 * @package Joomla
 * @subpackage `Raw form ` to upload images of a property
 * @license Copyright (c) 2010 - All Rights Reserved
 *
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport( 'joomla.application.component.view');

class PropertyViewUpload_images extends JView
{
   /**
	* Method to display View
	*
	* @access public
	*/
	function display($tpl = null)
	{
		$property_id = JRequest::getVar('pid', NULL, 'GET');
     	$title_text = empty($property_id)? JText::_( 'Add' ) : JText::_( 'Update' );
 		JToolBarHelper::title( JText::_(" $title_text Images" ), 'user.png');
// 		JToolBarHelper::save();
// 		if (empty($prop_id))  {
// 			JToolBarHelper::cancel();
// 		} else {
// 			// for existing items the button is renamed `close`
// 			JToolBarHelper::cancel( 'cancel', 'Close' );
// 		}
		//controller & model intialization
		$base_controller = new PropertyController();
		$base_model=$base_controller->getModel('Property');
		$model =& $this->getModel();
		//$base_model=$this->getModel('Property');
		//JRequest::watch($base_model);
		if(!empty($property_id) )
		{
// 			$detail_data=$base_model->getPropertyMoreDetail($property_detail_id);
// 			$district_list=$base_model->getDistrictList($prop_data['property_province_id']);
// 			$city_list=$base_model->getCityList($prop_data['property_district_id']);
			//JRequest::watch($detail_data);
		}

		//JRequest::watch($type_list);

		//Assigning variable to view object so that it can be retrieve in default.php
		$this->assignRef('property_id',$property_id);
		$this->assignRef('title_text',$title_text);
// 		$this->assignRef('district_list', $district_list);
// 		$this->assignRef('city_list', $city_list);
// 		$this->assignRef('detail_data', $detail_data);

		parent::display($tpl);
    }
}
?>
