<?php defined('_JEXEC') or die('Restricted access'); ?>
<form action="index.php" method="post" name="adminForm">
<div id="editcell">
	<table class="adminlist">
	<thead>
		<tr>
			<th width="5">
				<?php echo JText::_( 'ID' ); ?>
			</th>
			<th width="20">
				<input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count( $this->items ); ?>);" />
			</th>			
			<th>
				<?php echo JText::_( 'Transaction' ); ?>
			</th>
			<th>
				<?php echo JText::_( 'Form' ); ?>
			</th>
		</tr>
	</thead>
	<?php
	$db =& JFactory::getDBO();
	$k = 0;
	for ($i=0, $n=count( $this->items ); $i < $n; $i++)	{
		$row = &$this->items[$i];
		$checked 	= JHTML::_('grid.id',   $i, $row->id );
		$link 		= JRoute::_( 'index.php?option=com_propertyform&controller=propertyform&task=edit&cid[]='. $row->id );

		$stmt = "SELECT transaction_name FROM #__property_transaction WHERE id=".$row->trasaction_id;
		$db->setQuery($stmt);
      $trans = $db->loadObject();

		$stmt1 = "SELECT title FROM #__jforms_forms WHERE id=".$row->form_id;
		$db->setQuery($stmt1);
      $froms = $db->loadObject();
		?>
		<tr class="<?php echo "row$k"; ?>">
			<td>
				<?php echo $row->id; ?>
			</td>
			<td>
				<?php echo $checked; ?>
			</td>
			<td>
				<a href="<?php echo $link; ?>"><?php echo $trans->transaction_name; ?></a>
			</td>
			<td>
				<a href="<?php echo $link; ?>"><?php echo $froms->title; ?></a>
			</td>
		</tr>
		<?php
		$k = 1 - $k;
	}
	?>
	</table>
</div>

<input type="hidden" name="option" value="com_propertyform" />
<input type="hidden" name="task" value="" />
<input type="hidden" name="boxchecked" value="0" />
<input type="hidden" name="controller" value="propertyform" />
</form>
