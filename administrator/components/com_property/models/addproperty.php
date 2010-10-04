<?php
/**
 * Joomla! 1.5.7 component advertise
 *
 * @author Keshav mohta
 * @package Joomla
 * @subpackage advertise
 * @license Copyright (c) 2010 - All Rights Reserved
 *
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport('joomla.application.component.model');

class PropertyModelAddproperty extends JModel
{
   /**
	* Constructor
	*/
	public function __construct()
	{
		parent::__construct();
		//Selecting Database
		$this->db =& JFactory::getDBO();
		$this->user =& JFactory::getUser();
	}
	public function __toString() {
		$statement = "this is<b>".__CLASS__."</b> Class.<br/>Defined in <i>".__FILE__."</i>";
		return $statement;
 	}
	public function cancel()
	{
		$msg = JText::_( 'Operation Cancelled' );
		$this->setRedirect( 'index.php?option=com_property', $msg );
	}

	/**
	* function to store ( Insert or Update ) basic detail of a property
	* @access public
	* @code keshav mohta
	* @return true on succesfll insertion/updation
	*/

	public function save()
	{
		try
		{
			$post_data = JRequest::get('POST');
			// here DESCRIPRION  field should be same as user write using tinymce
			$post_data['description'] = JRequest::getVar('property_description', '', 'POST', 'string', JREQUEST_ALLOWRAW);
			//JRequest::watch($post_data,1,0);
			$sql  = (intval($post_data['property_id']) !== 0) ? "UPDATE " : "INSERT INTO ";
			$sql .= " #__property SET
												property_name='%s',
												property_type_id=%d,
												property_country='%s',
												property_province_id=%d,
												property_district_id=%d,
												property_city_id=%d,
												property_address_line1='%s',
												property_address_line2='%s',
												property_zip='%s',
												property_price='%s',
												property_description='%s',";
			$sql .= (intval($post_data['property_id']) !== 0) ? " property_updated_by=%d WHERE property_id=%d "
															: " property_added_by=%d,property_added_date=NOW() ";
			$property_value = array ( addslashes($post_data['propTitle']), $post_data['prop_type_id'],$post_data['prop_country'],
			$post_data['prop_province_id'], $post_data['prop_district_id'], $post_data['prop_city_id'], addslashes($post_data['address1']),
			addslashes($post_data['address2']), $post_data['zip'], $post_data['price'], $post_data['description'],$this->user->id,
			$post_data['property_id'] );
			print vsprintf( $sql,$property_value ) ;
			$this->db->setQuery(vsprintf($sql,$property_value));
			$this->db->query();
			if($this->db->getAffectedRows())
			{
				//retrive recently inserted/updated property id from database
				$insert_id = empty($post_data['property_id']) ? $this->db->insertid() : $post_data['property_id'];
				$return_array=array('true',$insert_id);
			}
			return $return_array;
		}
		catch(Exception $e){
				//who cares!
		}
	}

	/**
	* function to store ( Insert or Update )  all details/features of a property
	* @access public
	* @code keshav mohta
	* @return true on succesfll insertion/updation
	*/

	public function storeDetails()
	{
		try
		{
			$post_data = JRequest::get('POST');
			// here DESCRIPRION  field should be same as user write using tinymce
			$post_data['detail'] = JRequest::getVar('more_detail', '', 'POST', 'string', JREQUEST_ALLOWRAW);
			//JRequest::watch($post_data,1,0);
			$sql  = (intval($post_data['detail_id']) !== 0) ? "UPDATE " : "INSERT INTO ";
			$sql .= " #__property_detail SET
												property_id=%d,
												total_bedroom=%d,
												total_bathroom=%d,
												total_kitchen=%d,
												total_covered_area=%01.3f,
												total_covered_veranda=%01.3f,
												swiming_pool='%s',
												property_condition_id=%d,
												property_full_description='%s',
												built_year='%s',
												video_link='%s',
												sea_distance=%01.2f,
												airport_distance=%01.2f,
												railway_distance=%01.2f,
												highway_distance=%01.2f, ";
			$sql .= (intval($post_data['detail_id']) !== 0) ? " updated_by=%d WHERE property_detail_id=%d "
															: " added_by=%d,added_date=NOW() ";
			$detail_value = array ( $post_data['property_id'], $post_data['bedroom'], $post_data['bathroom'], $post_data['kitchen'],
            $post_data['cover_area'], $post_data['cover_veranda'], $post_data['swiming_pool'], $post_data['p_cond'], addslashes($post_data['detail']),
			$post_data['built_year'], addslashes($post_data['video_link']), $post_data['sea_d'], $post_data['air_d'], $post_data['stn_d'],
			$post_data['hiw_d'],$this->user->id, $post_data['detail_id'] );

  			print vsprintf( $sql,$detail_value ) ;

			$this->db->setQuery(vsprintf($sql,$detail_value));
			return $this->db->query();
		}
		catch(Exception $e){
				//who cares!
		}

	}

	/**
	* function to store ( Insert or Update ) contact detail of a property
	* @access public
	* @code keshav mohta
	* @return true on succesfll insertion/updation
	*/

	public function storeContact()
	{
		try
		{
			$post_data = JRequest::get('POST');
			// here DESCRIPRION  field should be same as user write using tinymce
			JRequest::watch($post_data,1,0);
			$sql  = (intval($post_data['contact_id']) !== 0) ? "UPDATE " : "INSERT INTO ";
			$sql .= " #__property_contact SET
												property_id=%d,
												contact_office_name='%s',
												contact_number='%s',
												alternate_number='%s',
												contact_person='%s',
												contact_address='%s',
												display_address='%s',
												contact_email='%s',";
			$sql .= (intval($post_data['contact_id']) !== 0) ? " contact_updated_by=%d WHERE contact_id=%d "
															: " contact_added_by=%d,contact_added_date=NOW() ";
			$contact_value = array(($post_data['property_id']), addslashes($post_data['contact_office']),$post_data['contact_number'],
			$post_data['alt_number'], addslashes($post_data['contact_person']), addslashes($post_data['contact_address']), $post_data['show_address'],
			$post_data['contact_email'],$this->user->id,$post_data['contact_id'] );
			// print vsprintf( $sql,$contact_value ) ; jexit();
			$this->db->setQuery(vsprintf($sql,$contact_value));
			return $this->db->query();
		}
		catch(Exception $e){
				//who cares!
		}
	}

	/**
	* function to rearrange $_FILES array
	* Origianl $_FILES Array
	Array
	(
    [prop_image] => Array
        (
            [name] => Array
                (
                    [0] => first_image,jpg
                    [1] => second_image.jpg
                )

            [type] => Array
                (
                    [0] => image/jpeg
                    [1] => image/png
                )

            [tmp_name] => Array
                (
                    [0] => /Applications/XAMPP/tmp/php/phpIPmbBR
                    [1] => /Applications/XAMPP/tmp/php/phpsAUsX1
                )

            [error] => Array
                (
                    [0] => 0
                    [1] => 0
                )

            [size] => Array
                (
                    [0] => 12392
                    [1] => 678
                )
        )
	)

	after this function it will changes into

	(
    	[prop_image] => Array
		(
			[0]=>Array
				(
					[name] => first_image,jpg
					[type] => image/jpeg
					[tmp_name] => /Applications/XAMPP/tmp/php/phpIPmbBR
					[error] => 0
					[size] => 12392
				)

			[1] => Array
			(
				[name] => second_image.png
				[type] => image/png
				[tmp_name] => /Applications/XAMPP/tmp/php/phpsAUsX1
				[error] => 0
				[size] => 678
			)
		)
	)

	* @access public
	* @code keshav mohta
	*/

	function fix_files_superglobal()
	{
		function rearrange($group)
			{
				foreach($group as $property => $arr)
				{
					foreach($arr as $item => $value)
					{
						$result[$item][$property] = $value;
					}
				}
			return $result;
			}
    	$_FILES = array_map('rearrange', $_FILES);
	}


	/**
	* function to store ( Insert or Update )  all images of a property into databse as well as their thumbs also
	* @access public
	* @code keshav mohta
	*/

	public function storePropertyImages()
	{
		try
		{
			$post_data = JRequest::get('POST');
			//JRequest::watch($post_data);
			//JRequest::watch($_FILES);
			//JRequest::watch($_FILES['property_image'],1,0);
			$this->fix_files_superglobal();
			JRequest::watch($_FILES);
			//Insert all images related to the ad
			foreach ($_FILES['property_image'] as $key => &$value)
			{
				if ( ($value['error'] == 0) && ($value['size'] > 0) )
				{
					$imageResized = $this->imageResize($value);
					JRequest::watch($imageResized,1,0);
					//Delete data from the database if edit property and status is 'pending for approval'
					if ($post_data['image_id'] && $postdata['property_id'] )
					{
						echo "<br/>".__LINE__." Inside nested if";

						$query = "SELECT image_path FROM #__property_image  WHERE image_id = %d ";

						echo "<br/>".__LINE__." Image Qry";
						print sprintf($query, $imgid);

						$this->db->setQuery(sprintf($query, $pid));
						$image_path = $this->db->loadResult(); // return image  path
						//JRequest::watch($arr_image_id);
						foreach ($arr_image_id as &$imgkey)
						{
							if( is_file(JPATH_SITE.DS.$image_path) )
							{
								@unlink(JPATH_SITE.DS.$image_path);
							}
							$delqry = "DELETE FROM #__property_image WHERE image_id =%d";

							echo "<br/>".__LINE__." Old Image delete Qry";
							print sprintf($delqry, $imgid);

							$this->db->setQuery(sprintf($delqry, $imgid));
							echo "<br/>".__LINE__." Old Image Deleted:".$this->db->query();
							echo  "<br/>".__LINE__." Affected Rows:".$this->db->getAffectedRows();

						/** NOTE: on deleteing image FROM images table , record referenceing that image id
						* in table_imagead  will be deleted automatically due to foreign key constraints */
// 							$imgadqry = "DELETE FROM #__{$suffix}imagead WHERE image_id=%d";
// 							$this->db->setQuery(vsprintf($imgadqry, $imgkey['image_id']));
// 							echo "<br/>".__LINE__."ImageAD Deleted:".$this->db->query();

						}
					}

					$image_query  = (intval($_POST['property_id']) !== 0) ? "UPDATE " : "INSERT INTO ";
					$image_query .= " #__property_image SET
															property_id=%d,
															image_title='%s',
															image_path='%s',
															thumb_path ='%s',
															image_size =%d,
															image_type= '%s',";
					$image_query .= (intval($_POST['property_id']) !== 0) ? " updated_by=%d WHERE image_id=%d "
					        									  		  : " added_by=%d,added_date=NOW() ";
					$image_detail = array ($post_data['property_id'], $post_data['image_title'][$key], $imageResized['image_path'],
					$imageResized['thumb_path'], $value['size'], $value['type'],$this->user->id, $post_data['image_id']);
					print vsprintf( $image_query,$image_detail ) ;
					$this->db->setQuery(vsprintf($image_query,$image_detail));
					$this->db->query();
				}
			}
				return true;
		}
		catch(Exception $e){
				return 0;
		}

	}

	/**
	* Function to save origianl image and thumbail image on destination folder
	* @code keshav mohta
	* return array containing image title,path of original image,  path of thumb image .
	*/
	public function imageResize($image)
	{
		try
		{
			$dimension = array();
			$paths =array();
			//Modifying filename  and make unique by appending timestamp
			$old_title = $image['name']; var_dump($old_title);
  			$imageinfo = pathinfo($old_title);
 			JRequest::watch($imageinfo);
			$rename = preg_replace('/\W/',' ', $imageinfo['filename']); // all Non word (\W === [^0-9a-zA-z_] ) character changed into ' '
			var_dump($rename);
			$rename = trim($rename); var_dump($rename);
			$rename = strtolower($rename); 	var_dump($rename);
			$rename=substr($rename,0,200);	var_dump($rename);
			$rename = preg_replace('/\s+/','-', $rename); 	//var_dump($rename); // now all spaces are changed into '-'
			$new_title= $rename."_".time().".".$imageinfo['extension']; // finally append timestamp in filename and add extension
			var_dump($new_title);
			//Fetch width and height from the _config table
			$query = 'SELECT
							max_thumb_width AS width,
							max_thumb_height AS height,
							image_store_path AS path,
							image_thumb_path AS thumb_path
					  FROM #__config';
			$this->db->setQuery($query);

			// Store image standards in dimenstion array
			$dimension = $this->db->loadAssoc();
			$thumb_height = $dimension['height'] ? $dimension['height'] : 150;
			$thumb_width = $dimension['width'] ? $dimension['width'] : 100;
			$allowed_types = array( 'image/pjpeg','image/gif','image/png','image/jpeg');

			if ( in_array($image['type'], $allowed_types ) )
			{
				if (!copy($image['tmp_name'], JPATH_SITE . DS . $dimension['path'] . $new_title))
				{
 				    die("failed to copy" .  $image['tmp_name'] . "...\n");
				}

				//name of saved image width full path
				$image_save = JPATH_SITE . DS .$dimension['path'] . $new_title;
				//get the height & width of original image saved
				list($width, $height) = getimagesize($image_save);
				//let's create thumb image
				$thumb_image= imagecreatetruecolor($thumb_width, $thumb_height);

				switch ($image['type']) {

						case "image/png" :// alight different action when image is png( to remain transparency)
											$black = imagecolorallocate($thumb_image, 0, 0, 0);
											// Make the background transparent
											imagecolortransparent($thumb_image, $black);
											$tmpimage = imagecreatefrompng($image_save);
											// $thumb_image is now developed as a 150*100 width image
											imagecopyresampled($thumb_image, $tmpimage, 0, 0, 0, 0, $thumb_width, $thumb_height, $width, $height);
											$thumbname = $new_title;
											//filename remain same but path of thumbnail is different
											$location = JPATH_SITE . DS . $dimension['thumb_path'] . $thumbname;
											// Save the image
											imagepng($thumb_image,$location,0,100); // NOTE=>4 arguments
											// free up the memory
											imagedestroy($thumb_image);
											break;
						case "image/gif" :
											$tmpimage = imagecreatefromgif($image_save);
											imagecopyresampled($thumb_image, $tmpimage, 0, 0, 0, 0, $thumb_width, $thumb_height, $width, $height);
											$thumbname = $new_title;
											$location = JPATH_SITE . DS . $dimension['thumb_path'] . $thumbname;
											imagegif($thumb_image, $location);// NOTE=>2 arguments
											imagedestroy($thumb_image);
											break;
						case ($image['type']=="image/jpeg" || $image['type']=="image/pjpeg"):
											$tmpimage = imagecreatefromjpeg($image_save);
											imagecopyresampled($thumb_image, $tmpimage, 0, 0, 0, 0, $thumb_width, $thumb_height, $width, $height);
											$thumbname = $new_title;
											$location = JPATH_SITE . DS . $dimension['thumb_path'] . $thumbname;
											imagejpeg($thumb_image,$location,100); //NOTE=>3 arguments
											imagedestroy($thumb_image);
											break;
						default :
											imagedestroy($thumb_image);
											break;
						}
				$paths['image_name'] = $new_title;
				$paths['image_path']  = $dimension['path'] . $new_title;
				$paths['thumb_path']  = $dimension['thumb_path'] . $new_title;
			}
			return $paths;
		}
		catch (Exception $e)
		{
			return 0;
		}
	}

}
?>
