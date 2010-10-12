<?php defined('_JEXEC') or die('Restricted access'); ?>

<form action="index.php" method="post" name="adminForm" id="adminForm">
<div class="col100">
	<fieldset class="adminform">
		<legend><?php echo JText::_( 'Add Transaction' ); ?></legend>
		<table class="admintable">
		<tr>
			<td width="100" align="right" class="key">
				<label for="transaction">
					<?php echo JText::_( 'Transaction' ); ?>:
				</label>
			</td>
			<td>
				<input class="text_area" type="text" name="transaction_name" id="transaction_name" size="32" maxlength="250" value="<?php echo $this->transaction->transaction_name;?>" />
			</td>
		</tr>
	</table>
	</fieldset>
</div>
<div class="clr"></div>

<input type="hidden" name="option" value="com_transaction" />
<input type="hidden" name="id" value="<?php echo $this->transaction->id; ?>" />
<input type="hidden" name="task" value="" />
<input type="hidden" name="controller" value="transaction" />
</form>
