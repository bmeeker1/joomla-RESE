<?php
/**
 * Hello Controller for Hello World Component
 * 
 * @package    Joomla.Tutorials
 * @subpackage Components
 * @link http://docs.joomla.org/Developing_a_Model-View-Controller_Component_-_Part_4
 * @license		GNU/GPL
 */

// No direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

/**
 * Hello Hello Controller
 *
 * @package    Joomla.Tutorials
 * @subpackage Components
 */
class PropertyformsControllerPropertyform extends PropertyformsController
{
	/**
	 * constructor (registers additional tasks to methods)
	 * @return void
	 */
	function __construct()
	{
		parent::__construct();

		// Register Extra tasks
		$this->registerTask( 'add'  , 	'edit' );
	}

	/**
	 * display the edit form
	 * @return void
	 */
	function edit()
	{
		JRequest::setVar( 'view', 'propertyform' );
		JRequest::setVar( 'layout', 'form'  );
		JRequest::setVar('hidemainmenu', 1);

		parent::display();
	}

	/**
	 * save a record (and redirect to main page)
	 * @return void
	 */
	function save()
	{
		$model = $this->getModel('propertyform');

		if ($model->store($post)) {
			$msg = JText::_( 'Propertyform Saved!' );
		} else {
			$msg = JText::_( 'Error Saving Propertyform' );
		}

		// Check the table in so it can be edited.... we are done with it anyway
		$link = 'index.php?option=com_propertyform';
		$this->setRedirect($link, $msg);
	}

	/**
	 * remove record(s)
	 * @return void
	 */
	function remove()
	{
		$model = $this->getModel('propertyform');
		if(!$model->delete()) {
			$msg = JText::_( 'Error: One or More Propertyform Could not be Deleted' );
		} else {
			$msg = JText::_( 'Propertyform(s) Deleted' );
		}

		$this->setRedirect( 'index.php?option=com_propertyform', $msg );
	}

	/**
	 * cancel editing a record
	 * @return void
	 */
	function cancel()
	{
		$msg = JText::_( 'Operation Cancelled' );
		$this->setRedirect( 'index.php?option=com_propertyform', $msg );
	}
}