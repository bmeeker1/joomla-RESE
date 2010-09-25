<?php
 /**
 * @package	`property` controller
 * @author Keshav Mohta
 * @date Sep 10, 2010
 * @license	GNU/GPL
*/

/**
 * Property Controller for property Component
 * This will be called if the controller is set to "property"
 */

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die();

class PropertyControllerProperty extends PropertyController
{
	public function __construct()
	{
		parent::__construct();
		$this->db =& JFactory::getDBO();
		$this->user =& JFactory::getUser();
	}

	public function __toString()
	{
		$statement = "<br/>This is <b>".__CLASS__."</b> Class.<br/>Defined in <i>".__FILE__."</i>";
		return $statement;
 	}

	public function storeProperty()
	{
		// perform token check (prevent spoofing)
		$token	= JUtility::getToken();
		if(!JRequest::getInt($token, 0, 'POST'))
		{
			JError::raiseError(403, JText::_('REQUESTFORBIDDEN'));
		}
		//Get the model to use the function
		$propertyModel = $this->getModel('addproperty');
		$do  = (intval($_POST['property_id']) !== 0) ? "UPDATED " : "ADDED ";
// 		$msg = ($propertyModel->save()) ? " Property $do successfully" : "Ooops! Error (-_-)";
		if($propertyModel->save())
		{
			$msg = " Property $do successfully";
			$link = JRoute::_('index.php?option=com_property&view=xtrafeatures&format=raw');
		}
		else
		{
			$msg = "Kindly have a look on form,Something may be wrong (-_-)";
			$link = JRoute::_('index.php?option=com_property&view=addproperty');
		}
// 		$link = JRoute::_('index.php?option=com_property');
		$link = str_replace("&amp;", "&", $link);
		//Redirect
		$this->setRedirect($link, $msg);
	}

	public function storeContact()
	{
		// perform token check (prevent spoofing)
		$token	= JUtility::getToken();
		if(!JRequest::getInt($token, 0, 'POST'))
		{
			JError::raiseError(403, JText::_('REQUESTFORBIDDEN'));
		}
		//Get the model to use the function
		$propertyModel = $this->getModel('addproperty');
		$do  = (intval($_POST['property_contact_id']) !== 0) ? "UPDATED " : "ADDED ";
// 		$msg = ($propertyModel->save()) ? " Property $do successfully" : "Ooops! Error (-_-)";
		if($propertyModel->storeContact())
		{
			$msg = " Contact $do successfully";
			$link = JRoute::_('index.php?option=com_property&view=upload_images&format=raw');
		}
		else
		{
			$msg = "Something may be wrong (-_-)";
			$link = JRoute::_('index.php?option=com_property&view=conact_detail&format=raw');
		}
// 		$link = JRoute::_('index.php?option=com_property');
		$link = str_replace("&amp;", "&", $link);
		//Redirect
		$this->setRedirect($link, $msg);
	}


	public function storeDetails()
	{
		// perform token check (prevent spoofing)
		$token	= JUtility::getToken();
		if(!JRequest::getInt($token, 0, 'POST'))
		{
			JError::raiseError(403, JText::_('REQUESTFORBIDDEN'));
		}
		//Get the model to use the function
		$propertyModel = $this->getModel('addproperty');
		$do  = (intval($_POST['property_detail_id']) !== 0) ? "UPDATED " : "ADDED ";
		if($propertyModel->storeDetails())
		{
			$msg = " Property Details $do successfully";
			$link = JRoute::_('index.php?option=com_property&view=contact_detail&format=raw');
		}
		else
		{
			$msg = "Kindly have a look on form,Something may be wrong on Details(-_-)";
			$link = JRoute::_('index.php?option=com_property');
		}
		$link = str_replace("&amp;", "&", $link);
		//Redirect
		$this->setRedirect($link, $msg);
	}

	public function deleteProperty()
	{
		//JRequest::watch(func_get_args());
		$pid=JRequest::getVar('pid','','GET');
		$qry  = " DELETE FROM #__property WHERE property_id=".mysql_real_escape_string($pid);
		$this->db->setQuery($qry);
		$msg = $this->db->query() ? " Property DELETED successfully" : "Ooops! Error (-_-)";
		$link = JRoute::_('index.php?option=com_property');
		$this->setRedirect($link, $msg);
	}


}

?>
