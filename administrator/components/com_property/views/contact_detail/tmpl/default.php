<?php
	defined('_JEXEC') or die('Restricted access');
?>
<!--<link rel="stylesheet" href="components/com_property/css/custom.css" type="text/css" >
<script type="text/javascript" src="components/com_property/js/jquery.min.js"></script>
<script type="text/javascript" src="components/com_property/js/jquery.validate.js"></script>
<script type="text/javascript" src="components/com_property/js/jquery.form.js"></script>-->
<fieldset >
<form name="propertyContactForm" id="propertyContactForm" action="" method="POST" >
	<label style="margin:3px;font:bold 14px verdna;color:#5F6F7F">Contact Detail</label>
	<table border="0" width="100%" cellpadding="5" cellspacing="5">
		<tr>
			<td width="20%" align="right" ><label for="contact_office"><sup>*</sup>Contact Office:</label></td>
			<td width="80%" align="left" valign="top">
				<input type="text" name="contact_office" id="contact_office" size="47"
				value="<?php if(isset($this->contact_data['contact_office_name'])) echo $this->contact_data['contact_office_name']; ?>" >
			</td>
		</tr>
		<tr>
			<td align="right" ><label for="contact_number"><sup>*</sup>Contact Number:</label></td>
			<td align="left" valign="top">
				<input type="text" name="contact_number" id="contact_number"
					value="<?php if(isset($this->contact_data['contact_number'])) echo $this->contact_data['contact_number'] ?>" >
			</td>
		</tr>
		<tr>
			<td align="right" ><label for="alt_number">Alternate Number:</td>
			<td align="left" valign="top">
				<input type="text" name="alt_number" id="alt_number"
					value="<?php if(isset($this->contact_data['alternate_number'])) echo $this->contact_data['alternate_number'] ?>" >
			</td>
		</tr>
		<tr>
			<td align="right"><label for="contact_person"><sup>*</sup>Contact Person:</label></td>
			<td align="left" valign="top">
				<input type="text" name="contact_person" id="contact_person" size="47"
				value="<?php if(isset($this->contact_data['contact_person'])) echo $this->contact_data['contact_person']; ?>" >
			</td>
		</tr>
		<tr>
			<td align="right" valign="top"><label for="contact_address" ><sup>*</sup>Contact Address:</label></td>
			<td align="left" valign="top">
				<textarea id="contact_address" name="contact_address" rows="5" cols="40"><?php if(isset($this->contact_data['contact_address'])) echo $this->contact_data['contact_address']; ?></textarea>
			</td>
		</tr>
		<tr>
			<td  align="right" valign="top"><label for="show_address" ><sup>*</sup>Show Contact Address:</label></td>
			<td align="left" valign="top">
				<input type="radio" name="show_address" value="t" class="radio" checked="checked" >Yes
				<input type="radio" name="show_address" value="f" class="radio"
				<?php if($this->contact_data['display_address'] == 'f')  { ?> checked="checked" <?php } ?> >No
			</td>
		</tr>
		<tr>
			<td  align="right" valign="top"><label for="contact_email">Contact email:</label></td>
			<td align="left" valign="top">
				<input type="text" name="contact_email" id ="contact_email" size="47"
					value="<?php if(isset($this->contact_data['contact_email'])) echo $this->contact_data['contact_email']; ?>" >
			</td>
		</tr>
		<tr>
			<td>
				<input type='hidden' value='com_property' name='option' />
				<input type='hidden' value='property' name='controller' />
				<input type='hidden' value='storeContact' name='task' />
				<input type='hidden' value='<?php echo $this->property_id;?>' name='property_id' />
				<input type='hidden' value='<?php echo $this->contact_id; ?>' name='contact_id' />
				<input type="hidden" value="1" name="<?php echo JUtility::getToken(); ?>"  />
			</td>
			<td>
				<input type="submit" value="<?php echo $this->title_text; ?>" name="submitContact" class="submit" id="submitContact" />
				<?php if(!empty($this->property_id)) { ?>
				<input type="button" name="Back" onclick="javascript:history.go(-1)" value="Back" class="submit" />
				<?php } else { ?>
				<input type="reset"  value="Clear" name="Clear" class="submit" />
				<?php } ?>
			</td>
		</tr>
	</table>
</form>
</fieldset>
<script type="text/javascript">
	jQuery(document).ready(function() {
		var validator = jQuery("#propertyContactForm").validate({
			debug:true,
			rules: {
				contact_office: {
					required: true,
				},
				contact_number: {
					required: true,
				},
				contact_person: {
					required: true,
				},
				contact_address: {
					required: true,
				}
			},
			messages: {
				contact_office: {
					required: "Pleaae write office name"
				},
				contact_number: {
					required: "Please write contact number"
				},
				contact_person: {
					required: "Please write name of contact person"
				},
				contact_address: {
					required: "Please write contact address"
				}
			},
			submitHandler: function(form) {
			// do other stuff for a valid form
					jQuery(form).ajaxSubmit({ success:  imageForm });
					// return false to prevent normal browser submit and page navigation
					return false;
   			}
 		});
	function imageForm() {
   		jQuery("#tabs").tabs('select',3);
	}
});
</script>