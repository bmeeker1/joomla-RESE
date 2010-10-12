<?php
/**
 * Hello World table class
 * 
 * @package    Joomla.Tutorials
 * @subpackage Components
 * @link http://docs.joomla.org/Developing_a_Model-View-Controller_Component_-_Part_4
 * @license		GNU/GPL
 */

// No direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

/**
 * Hello Table class
 *
 * @package    Joomla.Tutorials
 * @subpackage Components
 */
class TableTab extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = null;

	/**
	 * @var string
	 */
	var $transaction_id = null;

	var $tab_name = null;
	
	var $tab_description = null;
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 */
	function TableTab(& $db) {
		parent::__construct('#__property_tab', 'id', $db);
	}
}