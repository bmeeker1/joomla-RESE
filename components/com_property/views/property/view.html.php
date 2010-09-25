<?php
	/**
	* @package		Joomla
	* @author Keshav Mohta
	* @subpackage	`property`
	* @license		GNU/GPL, see LICENSE.php
	* @date Sep 10,2010
	*/

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

jimport( 'joomla.application.component.view');

/**
 * HTML View class for the `Property` component
 */
class PropertyViewProperty extends JView
{
	 function display($tpl = null)
    {
        $greeting = "Welcome to Real estate search engine component";
        $this->assignRef( 'greeting', $greeting );

        parent::display($tpl);
    }

}
?>