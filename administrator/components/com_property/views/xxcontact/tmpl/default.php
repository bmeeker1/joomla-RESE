<?php	defined('_JEXEC') or die('Restricted access');?>
<div align="right" style="float:right">
	<a href="<?php echo $siteURL;?>index.php?option=com_property" rel="canonical" ><strong>Back</strong></a>
</div><br/>
<table border="0" width="40%" cellpadding="3" cellspacing="2">
	<tr>
		<th align="left" >Province list</th>
	</tr>
	<tr >
	<?php $i=0; foreach($this->province_list as $tkey => $tval) { $i++; ?>
	<?php if($i%3==1) { ?> </tr ><tr> <?php } ?>
		<td align="center" valign="top" style="border:1px solid blue;" headers="<?php echo $i;?>"><?php echo $tval['province_name']; ?></td>
	<?php } // end of foreach ?>
	</tr >
</table>