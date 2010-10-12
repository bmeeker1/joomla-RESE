<?php



defined('_JEXEC') or die('Restricted access');

jimport( 'joomla.application.component.view');

class PropertyViewPropertyimage  extends JView
{
   /**
	* Method to display View
	*
	* @access public
	*/
	function display($tpl = null)
	{
		JToolBarHelper::title( 'User page', 'generic.png' );
		JToolBarHelper::back();
		//JToolBarHelper::title( JText::_(" User informetion" ), 'user.png');
		
		//0JSubMenuHelper::addEntry(JText::_('Home'),
		//'index.php?option=com_property&view=loginuser');
		//$base_controller = new PropertyController();
		 $propertyModel =& $this->getModel();
			//echo "hi"; jexit();
       	 $property_info=$propertyModel->pronameinfo();
        // $this->assignRef('user_info',$user_info);
		parent::display($tpl);
    }
}
?>
