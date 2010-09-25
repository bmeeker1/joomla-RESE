<?php	defined('_JEXEC') or die('Restricted access');?>
<style type="text/css">
table tr th,table tr td { vertical-align:top; }
tr th { text-align:right;}
tr td { text-align:left;}
</style>
<div align="right">
	<a href="index.php?option=com_property"><strong>Back</strong></a>
</div>
<table  border="0" width="100%" cellpadding="3" cellspacing="5" >
		<tr>
			<th width="15%" >Property Name:</th>
			<td width="85%" ><?php echo $this->prop_info['property_name'];?></td>
		</tr>
		<tr>
			<th>Property Type :</th>
			<td><?php echo $this->type; ?></td>
		</tr>
		<tr >
			<th valign="top">Description:</th><td><?php echo str_replace("<p></p>","",$this->prop_info['property_description']); ?></td>
		</tr>
		<tr>
			<th >Address:</th>
			<td ><address><?php printf(" %s %s - %d", $this->prop_info['property_address_line1'],$this->prop_info['property_address_line2'],$this->prop_info['property_zip']); ?></address></td>
		</tr>
		<tr >
			<th >Province:</th>
			<td><?php echo $this->province; ?></td>
		</tr>
		<tr >
			<th >District:</th>
			<td ><?php echo $this->district; ?></td>
		</tr>
		<tr >
			<th >City:</th>
			<td ><?php echo $this->city; ?></td>
		</tr>
		<tr>
			<th >Contact Person:</th>
			<td ><?php printf("<b>%s</b><address>%s</address> ",$this->prop_info['contact_person'],$this->prop_info['contact_address']); ?></td>
		</tr>
		<tr>
			<th >Contact Number:</th>
			<td ><?php printf("%s<br/><i>%s</i> ",$this->prop_info['contact_number'],$this->prop_info['contact_email']); ?></td>
		</tr>
		<tr >
			<th >Price:</th>
			<td ><?php echo $this->prop_info['property_price']; ?></td>
		</tr>
</table>

