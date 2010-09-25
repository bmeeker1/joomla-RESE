<?php defined('_JEXEC') or die('Restricted access');
	$document =& JFactory::getDocument();
	$document->addCustomTag('<script type="text/javascript">jQuery.noConflict();</script>');
?>
<h4 align="right">
	<a href="index.php?option=com_property&view=addProperty">Add Property</a>
</h4>
<form>
<table class="adminlist" width="100%" cellpadding="5" cellspacing="5">
	<thead>
		<tr>
			<th width="3%" class="title" align="left"><?php echo JText::_( 'NUM' ); ?></th>
			<th width="22%">Title</th>
			<th width="13%">Type</th>
			<th width="20%">Country</th>
			<th width="13%">Province</th>
			<th width="13%">District > City</th>
			<th width="16%">Action</th>
		</tr>
	</thead>
	<tbody>
	<?php
		$i=0; foreach($this->prop_info as $pkey=>&$pval) { $i++;
	?>
		<tr class="">
			<td align="center"><?php echo $i;?></td>
			<td align="left"><?php echo $pval['property_name']; ?></td>
			<td align="left"><?php echo $pval['type_name']; ?></td>
			<td align="left"><?php echo $pval['property_country']; ?></td>
			<td align="left"><?php echo $pval['province_name']; ?></td>
			<td align="left"><?php echo $pval['district_name']." > ".$pval['city_name']; ?></td>

			<td align="center">
				<a href="index.php?option=com_property&view=addProperty&pid=<?php echo $pval['property_id'];?>"><?php echo 'Edit'; ?>
				</a>&nbsp;|&nbsp;
				<a href = "index.php?option=com_property&view=displayproperty&pid=<?php echo $pval['property_id'];?>"><?php echo 'View'; ?></a>&nbsp;|&nbsp;
				<a href ="index.php?option=com_property&controller=property&task=deleteProperty&pid=<?php echo $pval['property_id'];?>" onclick="return confirm('Do You want to delete this Property?');"><?php echo 'Delete'; ?></a>
			</td>
		</tr>
	<?php } ?>
	</tbody>
</table>
</form>