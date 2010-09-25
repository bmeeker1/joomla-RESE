<?php
/**
 * Joomla! 1.5 component advertising
 *
 * @author Keshav mohta
 * @package Joomla
 * @subpackage ajax data for advertise form
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport( 'joomla.application.component.view');

/**
 * HTML View class for the advertising component
 */
class PropertyViewAjaxdata extends JView
{
   /**
	* Default display function
	*/
	function display($tpl = null)
	{
		$propertyController = new PropertyController();
		// Make an object of Main Model class contains Main functions
		$propertyModel =$propertyController->getModel('property');
		$ajaxtype = JRequest::getVar('ajaxtype','','GET');
		switch ($ajaxtype) {

				case 'province' :
									$provID=JRequest::getVar('provID');
									$district_list=$propertyModel->getDistrictList($provID);
									$this->assignRef('district_list', $district_list);
									break;
				case 'district' :
									$distID=JRequest::getVar('distID');
									$city_list=$propertyModel->getCityList($distID);
									$this->assignRef('city_list', $city_list);
									break;
				default :
							echo "Providing ID is undefined";
							break;
		}

		parent::display($tpl);
	}
}
?>
