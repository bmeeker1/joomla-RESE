<?php	defined('_JEXEC') or die('Restricted access');?>
<!--<link rel="stylesheet" href="components/com_property/css/custom.css" type="text/css" >
<script type="text/javascript" src="components/com_property/js/jquery.min.js"></script>
<script type="text/javascript" src="components/com_property/js/jquery.validate.js"></script>
<script type="text/javascript" src="components/com_property/js/jquery.form.js"></script>-->
<style type="text/css">
div.previous_image {
	padding:5px 0px;
	height:110px;
	margin-bottom:10px;
	border-bottom:1px dotted #9F7777;
	width:100%;
}
.fade {
	background-color:#EFE0E0;
}
</style>
<fieldset >
<form name="imageUploadForm" id="imageUploadForm" action="" method="POST" enctype="multipart/form-data" >
	<label style="margin:3px;font:bold 14px verdna;color:#5F6F7F">Upload Images</label>
	<?php if (!empty($this->image_data))  : ?>
	<fieldset style="width:700px;">
		<legend>Previous Images</legend>
		<?php foreach ($this->image_data as $key) { ?>
		<div class="previous_image">
			<div style="float:right;">
				<img src="<?php echo '../'.$key['thumb_path'];?>" title="<?php echo $key['image_title']; ?>" border="0"/>
			</div>
			<div style="float:left;">
					<input type="text" name="old_image_title" size="47" value="<?php echo $key['image_title']; ?>" ><br/>
					<input type="checkbox" class="check" name="delete_this[]" value="<?php echo $key['image_id'];?>" >Delete
			</div>
		</div>
		<?php } /* end of foreach */ ?>
	</fieldset>
	<?php endif; ?>
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
				<input type="reset"  value="Clear" name="Clear" class="submit" />
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
    jQuery('#addRow').click(function(){
        var quantity = jQuery('table[class=imageTable]').length;
	alert(quantity);
        var clonedRow = jQuery('table#mainTable > tbody > tr:first').clone(true);
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
	  jQuery('div > input:checkbox').click( function(){
			console.log(jQuery(this).attr("checked"));
		if (jQuery(this).attr("checked")) {
			jQuery(this).parent().parent('div').addClass('fade');
		} else {
			jQuery(this).parent().parent('div').removeClass('fade');
		}
	});

});
</script>
