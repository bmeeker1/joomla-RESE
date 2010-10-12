<?php defined('_JEXEC') or die('Restricted access'); ?>

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
				<select class="text_area" name="trasaction_id">
					<option>Select Option</option>
					<?php
						foreach($this->arr_trans as $arrprop){
					?>
					<option value="<?php echo $arrprop->id; ?>"><?php echo $arrprop->transaction_name; ?></option>
					<?php } ?>
				</select>
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
					?>
					<option value="<?php echo $arrforms->id; ?>"><?php echo $arrforms->transaction_name; ?></option>
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
