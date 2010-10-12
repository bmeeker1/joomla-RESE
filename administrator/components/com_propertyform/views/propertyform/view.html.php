<?php
/**
 * Hello View for Hello World Component
 * 
 * @package    Joomla.Tutorials
 * @subpackage Components
 * @link http://docs.joomla.org/Developing_a_Model-View-Controller_Component_-_Part_4
 * @license		GNU/GPL
 */

// No direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * Hello View
 *
 * @package    Joomla.Tutorials
 * @subpackage Components
 */
class PropertyformsViewPropertyform extends JView
{
	/**
	 * display method of Hello view
	 * @return void
	 **/
	function display($tpl = null)
	{
		//get the hello
		$db =& JFactory::getDBO();
		$stmt = "SELECT * FROM #__property_transaction";
		$db->setQuery($stmt);
      $arr_trans = $db->loadObjectList();

		$qry = "SELECT * FROM #__jforms_forms";
		$db->setQuery($qry);
      $arr_forms = $db->loadObjectList();

		$propertyform		=& $this->get('Data');
		$isNew		= ($propertyform->id < 1);

		$text = $isNew ? JText::_( 'New' ) : JText::_( 'Edit' );
		JToolBarHelper::title(   JText::_( 'Propertyform' ).': <small><small>[ ' . $text.' ]</small></small>' );
		JToolBarHelper::save();
		if ($isNew)  {
			JToolBarHelper::cancel();
		} else {
			// for existing items the button is renamed `close`
			JToolBarHelper::cancel( 'cancel', 'Close' );
		}

		$this->assignRef('propertyform',		$propertyform);
		$this->assignRef('arr_trans',		$arr_trans);
		$this->assignRef('arr_forms',		$arr_forms);

		parent::display($tpl);
	}
}