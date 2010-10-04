<?php
	defined('_JEXEC') or die('Restricted access');
?>
<!--<link rel="stylesheet" href="components/com_property/css/custom.css" type="text/css" >
<script type="text/javascript" src="components/com_property/js/jquery.min.js"></script>
<script type="text/javascript" src="components/com_property/js/jquery.validate.js"></script>
<script type="text/javascript" src="components/com_property/js/jquery.form.js"></script>-->
<fieldset >
<form name="imageUploadForm" id="imageUploadForm" action="" method="POST" enctype="multipart/form-data" >
	<label style="margin:3px;font:bold 14px verdna;color:#5F6F7F">Upload Images</label>
	<table border="0" width="80%" cellpadding="2" cellspacing="3" id="mainTable">
	<tbody>
		<tr id="imageRow">
			<td>
			<table border="0" cellpadding="4" cellspacing="4" class="imageTable">
				<tr><th colspan="2">Image 1 :</th></tr>
				<tr >
					<td width="20%" align="right" valign="top" ><label for="image_title"><sup>*</sup>Image Title:</label></td>
					<td width="80%" align="left" valign="top" >
						<input type="text" name="image_title[]" id="image_title" size="47"
							value="<?php if(isset($this->prop_data['image_title'])) echo $this->prop_data['image_title'] ?>" >
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">Image:</td>
					<td align="left" valign="top" >
						<input type="file" name="property_image[]" id="property_image" size="60" >
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</tbody>
	<tfoot>
        <tr>
			<td><input type="button" id="addRow" value="Add More" style="cursor:pointer;margin-top:5px;"/></td>
		</tr>
		<tr>
			<td align="right">
				<input type="submit" value="Upload" name="upload" class="submit" id="upload" />
				<?php if(!empty($this->property_id)) { ?>
				<input type="button" name="Back" onclick="javascript:history.go(-1)" value="Back" class="submit" />
				<?php } else { ?>
				<input type="reset"  value="Clear" name="Clear" class="submit" />
				<?php } ?>
			</td>
		</tr>
	</tfoot>
	</table>
		<input type='hidden' value='com_property' name='option' />
		<input type='hidden' value='property' name='controller' />
		<input type='hidden' value='StorePropertyImages' name='task' />
		<input type='hidden' value='<?php echo $this->property_id;?>' name='property_id' />
		<input type="hidden" name="<?php echo JUtility::getToken();?>" value="1" />
</form>
</fieldset>
<script type="text/javascript">
jQuery(document).ready(function () {
    jQuery('#addRow').live('click', function(){
        var quantity = jQuery('table[class^=imageTable]').length;
        var clonedRow = jQuery('#mainTable > tbody > tr:first').clone(true);
        var textID = clonedRow.find(':text').attr('id');
        clonedRow.find('label').attr('for', function () {
            return textID + (++quantity);
        });
		clonedRow.find('th').text('Image '+ quantity + ' :');
		clonedRow.find('sup').remove();
        clonedRow.attr('id', function () {
            return this.id + quantity;
        }).find(':text,:file').attr('id', function () {
            return this.id + quantity;
        }).val('').end().appendTo('#mainTable');
    });
});
</script>
