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
		$property_id = $_SESSION['prop_id'];
     	$title_text = empty($property_id)? JText::_( 'Add' ) : JText::_( 'Update' );
 		JToolBarHelper::title( JText::_("$title_text Images" ), 'user.png');
		//controller & model intialization
		$base_controller = new PropertyController();
		$base_model=$base_controller->getModel('Property');
		$model =& $this->getModel();
		//$base_model=$this->getModel('Property');
		//JRequest::watch($base_model);
		if(!empty($property_id) )
		{
// 			$image_data=$base_model->getPropertyMoreDetail($property_detail_id);
			//JRequest::watch($image_data);
		}

		//Assigning variable to view object so that it can be retrieve in default.php
		$this->assignRef('property_id',$property_id);
		$this->assignRef('title_text',$title_text);
// 		$this->assignRef('image_data', $image_data);

		parent::display($tpl);
    }
}
?>
