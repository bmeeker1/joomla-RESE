<?php
/**
 * Joomla! 1.5.7 component advertising
 *
 * @author keshav mohta
 * @package Joomla
 * @subpackage `Raw form ` of add detail of a property
 * @license Copyright (c) 2010 - All Rights Reserved
 *
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport( 'joomla.application.component.view');

class PropertyViewXtrafeatures extends JView
{
   /**
	* Method to display View
	*
	* @access public
	*/
	function display($tpl = null)
	{
		//controller & model intialization
		$base_controller = new PropertyController();
		$base_model=$base_controller->getModel('Property');
		$model =& $this->getModel();
		//JRequest::watch($_SESSION);
		$property_id = $_SESSION['prop_id'];
		if(!empty($property_id))
		{
			$detail_data=$base_model->getPropertyMoreDetail($property_id);
			//JRequest::watch($detail_data);
		}

     	$title_text = empty($detail_data['property_detail_id'])? JText::_( 'Add' ) : JText::_( 'Update' );
 		JToolBarHelper::title( JText::_(" $title_text Property Details" ), 'user.png');
		$measure_units = $base_model->getMeasureUnits();
		//JRequest::watch($measure_units);
		$condition_list = $base_model->getPropertyCondition();
		//JRequest::watch($type_list);

		//Assigning variable to view object so that it can be retrieve in default.php
		$this->assignRef('property_detail_id',$detail_data['property_detail_id']);
		$this->assignRef('property_id',$property_id);
		$this->assignRef('title_text',$title_text);
		$this->assignRef('measure_units', $measure_units);
		$this->assignRef('condition_list', $condition_list);
		$this->assignRef('detail_data', $detail_data);

		parent::display($tpl);
    }
}
?>
