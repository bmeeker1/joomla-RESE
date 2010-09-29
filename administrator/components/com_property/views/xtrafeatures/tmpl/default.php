<?php
	defined('_JEXEC') or die('Restricted access');
// 	$siteURL = JURI::base();
// 	$rootURL = JURI::root();
// 	$document =& JFactory::getDocument();
//
// 	$custom_css = $siteURL."components/com_property/css/custom.css";
// 	$editor_css = $siteURL."components/com_property/css/jquery.cleditor.css";
//
// 	$document->addStyleSheet($custom_css);
// 	$document->addStyleSheet($editor_css);
//
// 	$editor_js = $siteURL."components/com_property/js/jquery.cleditor.js";
// 	$document->addScript($editor_js);
?>
<fieldset >
	<form name="propertyDetailForm" id="propertyDetailForm" action="" method="POST">
		<label style="margin:3px;font:bold 14px verdna;color:#5F6F7F">Specifications</label>
		<table border="0" width="100%" cellpadding="5" cellspacing="5" style="border-bottom:1px dotted #7F6F6F;">
			<tr>
				<td width="25%" align="right" valign="top"><label for="bedroom">Total Bedroom:</label></td>
				<td width="75%" align="left" valign="top">
					<select id="bedroom" name="bedroom" >
						<option value="" >-Select-</option>
					<?php foreach (range(1,5) as $n) { ?>
						<option value="<?php echo $n; ?>" ><?php echo $n;?></option>
					<?php } ?>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="bathroom">Total Bathroom:</label></td>
				<td align="left" valign="top">
					<select id="bathroom" name="bathroom" >
						<option value="" >-Select-</option>
					<?php foreach (range(1,5) as $n) { ?>
						<option value="<?php echo $n; ?>" ><?php echo $n;?></option>
					<?php } ?>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="kitchen">Total Kitchen</label></td>
				<td align="left" valign="top">
					<select id="kitchen" name="kitchen" >
						<option value="" >-Select-</option>
					<?php foreach (range(1,5) as $n) { ?>
						<option value="<?php echo $n; ?>" ><?php echo $n;?></option>
					<?php } ?>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="cover_area">Total Covered Area:</label></td>
				<td align="left" valign="top">
					<input type="text" name="cover_area" id="cover_area" >&nbsp;m&sup2;
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="cover_veranda">Total Covered Verandas:</label></td>
				<td align="left" valign="top">
					<input type="text" name="cover_veranda" id="cover_veranda" >&nbsp;m&sup2;
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="swiming_pool">Swimming Pool:</label></td>
				<td align="left" valign="top">
					<select id="swiming_pool" name="swiming_pool" >
						<option value="" >-Select-</option>
						<option value="y" >Yes</option>
						<option value="n" >No</option>
						<option value="o" >Optional</option>
						<option value="p" >Personal</option>
						<option value="c" >Communal</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="garage">Garage:</label></td>
				<td align="left" valign="top">
					<input type="radio" name="garage" value="t" class="radio">Yes
					<input type="radio" name="garage" value="f" class="radio" checked="true">No
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="storage">Storage:</label></td>
				<td align="left" valign="top">
					<input type="radio" name="storage" value="t" class="radio">Yes
					<input type="radio" name="storage" value="f" class="radio" checked="true">No
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="garden">Garden:</label></td>
				<td align="left" valign="top">
					<input type="radio" name="garden" value="t" class="radio">Yes
					<input type="radio" name="garden" value="f" class="radio" checked="true">No
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="terrace">Terrace:</label></td>
				<td align="left" valign="top">
					<input type="radio" name="terrace" value="t" class="radio">Yes
					<input type="radio" name="terrace" value="f" class="radio" checked="true">No
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="balcony">Balcony:</label></td>
				<td align="left" valign="top">
					<input type="radio" name="balcony" value="t" class="radio">Yes
					<input type="radio" name="balcony" value="f" class="radio" checked="true">No
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="lift">Lift Available:</label></td>
				<td align="left" valign="top">
					<input type="radio" name="lift" value="t" class="radio">Yes
					<input type="radio" name="lift" value="f" class="radio" checked="true">No
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="parking_type">Parking Type:</label></td>
				<td align="left" valign="top">
					<input type="radio" name="parking_type" value="o" class="radio" >Open
					<input type="radio" name="parking_type" value="c" class="radio" checked="true">Carport
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label>Parking for:</label></td>
				<td align="left" valign="top">
					<select name="p_car" id="p_car">
						<option value="0">-Select-</option>
						<option value="c1">1 Car</option>
						<option value="c2">2 Car</option>
						<option value="c3">3 Car</option>
						<option value="cm">&gt;3 Car</option>
					</select>
					<select name="p_bike" id="p_bike">
						<option value="0">-Select-</option>
						<option value="b1">1 Bike</option>
						<option value="b2">2 Bike</option>
						<option value="bm"> &gt; 2 Bike</option>
					</select>
				</td>
			</tr>
		</table>
		<label style="margin:3px;font:bold 14px verdna;color:#5F6F7F">Other Features</label>
		<table border="0" width="100%" cellpadding="5" cellspacing="5" style="border-bottom:1px dotted #7F6F6F;">
			<tr>
				<td width="20%" align="right" valign="top"><label for="p_cond">Property Condition:</label></td>
				<td width="80%" align="left" valign="top">
					<select id="p_cond" name="p_cond">
						<option value="">-Select-</option>
					<?php foreach ($this->condition_list as $k=>$v) { ?>
						<option value="<?php echo $v['condition_id']; ?>" ><?php echo $v['condition_name'];?></option>
					<?php } ?>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="built_year">Built Year:</label></td>
				<td align="left" valign="top">
					<input type="text" maxlength="4" size="5" id="built_year" name="built_year"> <small>(YYYY)</small>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label >Long Description:</label></td>
				<td align="left" valign="top">
					<textarea id="more_detail" name="more_detail"></textarea>
				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><label for="video_link">Video link:</label></td>
				<td align="left" valign="top">
					<input type="text" id="video_link" name="video_link" value="http://" size="50" style="color:#666">
				</td>
			</tr>
		</table>
		<label style="margin:3px;font:bold 14px verdna;color:#5F6F7F">Distance FROM</label>
		<table border="0" cellpadding="4" cellspacing="4" width="100%" id="distanceTable">
			<tr>
				<td align="right" width="20%"><label for="sea_d" >Sea:</label></td>
				<td align="left" width="80%"><input type="text" name="sea_d" id="sea_d">&nbsp;Km</td>
			</tr>
			<tr>
				<td align="right"><label for="air_d">Airport:</label></td>
				<td align="left"><input type="text" name="air_d" id="air_d">&nbsp;Km</td>
			</tr>
			<tr>
				<td align="right"><label for="stn_d">Railway Station:</label>
				<td align="left"><input type="text" name="stn_d" id="stn_d">&nbsp;Km</td>
			</tr>
			<tr>
				<td align="right"><label for="hiw_d">Highway:</label>
				<td align="left"><input type="text" name="hiw_d" id="hiw_d">&nbsp;Km</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<input type="submit" value="<?php echo $this->title_text; ?>" name="doAction" class="submit" id="doAction" />
					<?php if(!empty($this->property_detail_id)) { ?>
					<input type="button" name="Back" onclick="javascript:history.go(-1)" value="Back" />
					<?php } else { ?>
					<input type="reset" value="Clear" name="Clear" class="submit" />
					<?php } ?>
				</td>
			</tr>
		</table>
		<input type='hidden' value='com_property' name='option' />
		<input type='hidden' value='property' name='controller' />
		<input type='hidden' value='storeDetails' name='task' />
		<input type='hidden' value='' name='property_id' />
		<input type='hidden' value='<?php echo $this->property_detail_id; ?>' name='property_detail_id' />
		<input type="hidden" name="<?php echo JUtility::getToken(); ?>" value="1" />
	</form>
</fieldset>
<script type="text/javascript">
	var isArea = function (val) {
				var rx=/^\d*\.?\d*$/;
				return rx.test(val);
		};
	jQuery(document).ready(function() {
		jQuery("#more_detail").cleditor();

		jQuery('#propertyDetailForm').submit(function() {
			//submit the form
			jQuery(this).ajaxSubmit();
   			jQuery("#tabs").tabs('select',2 );
			// return false to prevent normal browser submit and page navigation
			return false;
		});

		jQuery('#cover_area, #cover_veranda').change(function() {
			if(isArea(this.value)) jQuery(this).removeClass('wrong'); else jQuery(this).addClass('wrong');
			return isArea(this.value);
		});

		// following code is to validate all inpt field together in distance table using `delagate` method
		jQuery('table#distanceTable').delegate('td input','change', function () {
			if(isArea(this.value)) jQuery(this).removeClass('wrong'); else jQuery(this).addClass('wrong');
			return isArea(this.value);
		});

	});
</script>
