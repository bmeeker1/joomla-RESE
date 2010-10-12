<?php 
	defined('_JEXEC') or die('Restricted access'); 
	$siteURL = JURI::base();
?>

<script src="<?php echo $siteURL; ?>includes/js/jquery-1.4.2.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
	jQuery(function () {
		jQuery('#trasaction_id').change(function () {
			var traID = jQuery(this).val();
			jQuery.getJSON('?option=com_propertyform&amp;view=ajaxdata&amp;format=raw', {
				traID: traID
			}, function (data) {
					alert(data);
					if (data) {	
					
               	var jsonData = '';
						jsonData +='<select name="tab_id">';
                	jQuery.each(data, function (i, data) {
                  	jsonData +='<option value="">'+data.tab_name+'</option>';
                	});
						jsonData +='</select>';
               	console.log(jsonData);
               	jQuery('#txtOption').html(jsonData);
            	}
			});
		});
	});
</script>
<form action="index.php" method="post" name="adminForm" id="adminForm">
<div class="col100">
	<fieldset class="adminform">
		<legend><?php echo JText::_( 'Details' ); ?></legend>
		<table class="admintable">
		<tr>
			<td width="100" align="right" class="key">
				<label for="transaction">
					<?php echo JText::_( 'Transaction' ); ?>:
				</label>
			</td>
			<td>
				<select class="text_area" name="trasaction_id" id="trasaction_id">
					<option>Select Option</option>
					<?php
						foreach($this->arr_trans as $arrprop){
							if($arrprop->id==$this->propertyform->trasaction_id){
								$selected = "selected";
							} else { 
								$selected = ""; 
							}
					?>
					<option id="<?php echo $arrprop->id; ?>" value="<?php echo $arrprop->id; ?>" <?php echo $selected; ?>><?php echo $arrprop->transaction_name; ?></option>
					<?php } ?>
				</select>
			</td>
		</tr>
		<tr>
			<td width="100" align="right" class="key">
				<label for="tab">
					<?php echo JText::_( 'Tabs' ); ?>:
				</label>
			</td>
			<td id="txtOption">
			</td>
		</tr>
		<tr>
			<td width="100" align="right" class="key">
				<label for="form">
					<?php echo JText::_( 'Form' ); ?>:
				</label>
			</td>
			<td>
				<select class="text_area" name="form_id">
					<option>Select Option</option>
					<?php
						foreach($this->arr_forms as $arrforms){
							if($arrforms->id==$this->propertyform->form_id){
								$selected = "selected";
							} else { 
								$selected = ""; 
							}
					?>
					<option value="<?php echo $arrforms->id; ?>" <?php echo $selected; ?>><?php echo $arrforms->title; ?></option>
					<?php } ?>
				</select>
			</td>
		</tr>
	</table>
	</fieldset>
</div>
<div class="clr"></div>
<input type="hidden" name="option" value="com_propertyform" />
<input type="hidden" name="id" value="<?php echo $this->propertyform->id; ?>" />
<input type="hidden" name="task" value="" />
<input type="hidden" name="controller" value="propertyform" />
</form>