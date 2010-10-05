<?php
/**
 * Joomla! 1.5.7 component `property`
 *
 * @code by Keshav Mohta
 * @package Joomla
 * @date Sep 13, 2010
 * @subpackage root model of `property`
 * @license Copyright (c) 2010 - All Rights Reserved
 *
 */
/**
 * This Model contains common functions which is being used
 * by other models and views.
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport('joomla.application.component.model');

class PropertyModelProperty extends JModel
{
	public function __construct()
   	{
		parent::__construct();
		$this->db =& JFactory::getDBO();
		$this->user =& JFactory::getUser();
//         global $mainframe, $option;
//
//         // Get pagination request variables
//         $limit = $mainframe->getUserStateFromRequest('global.list.limit', 'limit', $mainframe->getCfg('list_limit'), 'int');
//         $limitstart = JRequest::getVar('limitstart', 0, '', 'int');
//
//         // In case limit has been changed, adjust it
//         $limitstart = ($limit != 0 ? (floor($limitstart / $limit) * $limit) : 0);
//
//         $this->setState('limit', $limit);
//         $this->setState('limitstart', $limitstart);
  	}

	/**
	* MAGIC Function __toString  allows a class to decide how it will react when it is converted to a string.
	* @ref http://php.net/manual/en/language.oop5.magic.php#language.oop5.magic.tostring
	* @access public
	* @code keshav mohta
	* @return inormation of class name and file location
	*/

	public function __toString()
	{
		$statement = "<br/>This is <b>".__CLASS__."</b> Class.<br/>Defined in <i>".__FILE__."</i>";
		return $statement;
 	}

	/**
	* Function to retrive only spcific information of a property according to display on property listing table
	* @access public
	* @code keshav mohta
	* @return Associative array containing specific information that we needed
	*/

	public function getPropertyInfo ()
	{
		$sql= "SELECT p.property_id,p.property_name,p.property_country,t.type_name,pr.province_name,d.district_name,c.city_name
			   FROM #__property p
			   INNER JOIN #__property_type t ON t.type_id=p.property_type_id
			   INNER JOIN #__property_province pr ON pr.province_id=p.property_province_id
			   INNER JOIN #__property_district d ON d.district_id=p.property_district_id
			   INNER JOIN #__property_city c ON c.city_id=p.property_city_id
		WHERE p.property_status='a' " ;
		$this->db->setQuery($sql);
		$arr_info=$this->db->loadAssocList();
		return $arr_info;
	}

	/**
	* Function to retrive complete information of a property of given property id
	* @access public
	* @code keshav mohta
	* @param int pid property id
	* @return Associative single array containing complete information of a property
	*/

	public function getPropertyDetail ($pid = null)
	{
		$sql= "SELECT * FROM #__property WHERE property_id=".mysql_real_escape_string($pid) ;
		$this->db->setQuery($sql);
		$arr_detail=$this->db->loadAssoc(); // see the function here
		return $arr_detail;
	}


	/**
	* Function to retrive detaild features information of a property of given property id
	* @access public
	* @code keshav mohta
	* @param int pid property id
	* @return Associative single array containing complete property details
	*/

	public function getPropertyMoreDetail ($pid=null)
	{
		$sql= "SELECT * FROM #__property_detail WHERE property_id=".mysql_real_escape_string($pid) ;
		$this->db->setQuery($sql);
		$arr_moreDetail=$this->db->loadAssoc(); // see the function here
		return $arr_moreDetail;
	}

	/**
	* Function to retrive contact details of a property of given property id
	* @access public
	* @code keshav mohta
	* @param int pid property id
	* @return Associative single array containing complete property details
	*/

	public function getPropertyContactDetail($pid=null)
	{
		$sql= "SELECT * FROM #__property_contact WHERE property_id=".mysql_real_escape_string($pid) ;
		$this->db->setQuery($sql);
		$arr_contactDetail=$this->db->loadAssoc(); // see the function here
		return $arr_contactDetail;
	}

	/**
	* Function to retrive all image details of a given property id
	* @access public
	* @code keshav mohta
	* @param int pid property id
	* @return Associative multiple array containing complete image details
	*/

	public function getPropertyImageDetails($pid=null)
	{
		$sql= "SELECT * FROM #__property_image WHERE property_id=".mysql_real_escape_string($pid) ;
		$this->db->setQuery($sql);
		$arr_imageDetail=$this->db->loadAssocList(); // see the function here
		return $arr_imageDetail;
	}



	/**
	* Function to retrive all type of a property
	* @access public
	* @code keshav mohta
	* @return Associative array containing type id & type name
	*/


	public function getPropertyType()
	{
		$qry = "SELECT type_id, type_name FROM #__property_type WHERE type_status='a' ORDER BY type_name ";
		$this->db->setQuery($qry);
		$arr_type=$this->db->loadAssocList();
		return $arr_type;
	}

	/**
	* Function to retrive all conditions described in db
	* @access public
	* @code keshav mohta
	* @return Associative array containing condition id & condition name
	*/

	public function getPropertyCondition()
	{
		$qry = "SELECT condition_id, condition_name FROM #__property_condition WHERE condition_status='a' ";
		$this->db->setQuery($qry);
		$arr_condition=$this->db->loadAssocList();
		return $arr_condition;
	}

	/**
	* Function to retrive attribute name from table where attribute id id given
	* @access public
	* @code keshav mohta
	* @param int id id of that attribute
	* @param string attribute attribute name & table name accesed by this variable
	* @return string that attribute name
	*/

	public function getNameFromID($id=null,$attribute='')
	{
		$qry = "SELECT {$attribute}_name FROM #__property_{$attribute} WHERE {$attribute}_id=".mysql_real_escape_string($id);
		$this->db->setQuery($qry);
		$attr_name=$this->db->loadResult();
		return $attr_name;
	}


	/**
	* Function to retrive list of all province
	* @access public
	* @code keshav mohta
	* @return Associative array containing province id & province name
	*/

	public function getProvinceList()
	{
		$qry = "SELECT province_id, province_name FROM #__property_province WHERE province_status='a' ORDER BY province_name ";
		$this->db->setQuery($qry);
		$arr_provnc=$this->db->loadAssocList();
		return $arr_provnc;
	}

	/**
	* Function to retrive list of all district list of given province
	* @access public
	* @code keshav mohta
	* @param int pid province id
	* @return Associative array containing district id & district name
	*/

	public function getDistrictList($pid=null)
	{
		$qry  = " SELECT district_id, district_name FROM #__property_district WHERE district_status='a'";
		$qry .= empty($pid) ? "" : " AND province_id=".mysql_real_escape_string($pid);
		$qry .= " ORDER BY district_name ";
		//echo $qry;
		$this->db->setQuery($qry);
		$arr_district=$this->db->loadAssocList();
		return $arr_district;
	}

	/**
	* Function to retrive list of all city list of given district
	* @access public
	* @code keshav mohta
	* @param int did district id
	* @return Associative array containing city id & city name
	*/

	public function getCityList($did=null)
	{
		$qry  = " SELECT city_id, city_name FROM #__property_city WHERE city_status='a' ";
		$qry .= empty($did) ? "" : " AND district_id=".mysql_real_escape_string($did);
		$qry .= " ORDER BY city_name ";
		$this->db->setQuery($qry);
		$arr_district=$this->db->loadAssocList();
		return $arr_district;
	}

}
?>