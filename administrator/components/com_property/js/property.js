jQuery.noConflict();
jQuery.metadata.setType("attr", "validate");
jQuery(function () {
	jQuery("#property_description").cleditor();
    jQuery("#contact_number").mask("(999) 999-9999");
    jQuery("#zip").mask("9999999");
	var validator = jQuery("#addPropertyForm").validate({
		debug:true,
        rules: {
            propTitle: {
                required: true,
                minlength: 2
            },
            address1: {
                required: true
            },
            zip: {
                required: false,
				digits: true,
				maxlength: 7
            },
            price: {
                required: true
            }
        },
        messages: {
            propTitle: {
                required: "Please write Title",
                minlength: "Property name must consist of at least 2 characters"
            },
            address1: {
                required: "Please write Address"
            },
			 zip: {
                digits: "Only numbers",
				maxlength : "maximum 7 digits"
            },
            price: {
                required: "Please mention Price"
            }
        },
		submitHandler: function(form) {
			jQuery(form).ajaxSubmit();
			jQuery("#tabs").tabs( 'select',1);
			jQuery(form).resetForm();
			return false;
   		}
    });

	/* var validator = jQuery("#propertyDetailForm").validate({
        rules: {
            cover_area: {
                required: true,
				digit:true
            }
        },
        messages: {
            cover_area: {
                required: "Please write Covered area",
                digits: "Only numbers",
            }
        },
		submitHandler: function(form) {
			jQuery(form).ajaxSubmit();
			jQuery("#tabs").tabs( 'select',2);
			jQuery(form).resetForm();
			return false;
   		}
    });*/

	jQuery("#tabs").tabs({
// 			select: function(event, ui) {
// 				currentTabIndex = jQuery('#tabs').tabs('option', 'selected');
// // 				if (currentTabIndex == 0) {
// // 					var isValid = jQuery("#addPropertyForm").valid();
// // 						if(!isValid) alert('Please fill Basic details');
// // 						return isValid;
// // 				}
// 			},
// 			fx: { opacity: "toggle" },
			cache: false,
			spinner: 'Retrieving data...' ,
			ajaxOptions: {
				error: function(xhr, status, index, anchor) {
					jQuery(anchor.hash).html("<p style='padding:10px'>This Tab is Under Construction</p>");
				}
			}
      }).bind('tabsload', function(event, ui) {
	 if(ui.index == 2 )
		{
			jQuery("#contact_number").mask("(999) 999-9999");
			jQuery("#alt_number").mask("(999) 999-9999");
		}
	});
	jQuery("#tabs").bind( "tabsselect", function(event, ui) {
		selecTabIndex = jQuery('#tabs').tabs('option', 'selected');
// 		console.log(ui.index+':'+selecTabIndex);
				if (selecTabIndex == 0) {
					var isValid = jQuery("#addPropertyForm").valid();
						if(!isValid) alert('Please fill Basic details');
						return isValid;
				}
			});


	jQuery('#clear').click ( function () {
		validator.resetForm();
	});

// 	jQuery('input#price').bind('blur, change ', function() {
// 		var amt = parseFloat(this.value);
// 		if(isNaN(amt)) {
// 			jQuery(this).addClass('wrong');
// 		}
// 		else{
// 			jQuery(this).removeClass('wrong').val('$' + amt.toFixed(2));
// 		}
// 	});

//     jQuery("input[type=file]").each(function () {
//         jQuery(this).rules("add", {
//             accept: "png|jpe?g",
//             messages: {
//                 accept: "Only jpeg, jpg or png images"
//             }
//         });
//     });

	jQuery('#prop_province_id').change(function () {
		jQuery('#prop_district_id').removeAttr('disabled').empty();
		jQuery('#prop_city_id').empty().html('<option value="" >Select City</option>');
		var provID = jQuery(this).val();
		if (provID !== '') {
			jQuery('#prop_district_id').html('<option value="">Select District</option>');
			jQuery.getJSON('?option=com_property&view=ajaxdata&format=raw', {
				provID: provID,
				ajaxtype: 'province'
			}, function (data) {
				for (var i = 0; i < data.length; i++) {
					jQuery('#prop_district_id').append('<option value="' + data[i].district_id + '">' + data[i].district_name + '</option>');
				}
			});
		}
		else {
			jQuery('#prop_district_id').html('<option value="" >Select District</option>');
		}
	});

	jQuery('#prop_district_id').change(function () {
		jQuery('#prop_city_id').removeAttr('disabled').empty();
		var distID = jQuery(this).val();
		if (distID !== '') {
			jQuery('#prop_city_id').html('<option value="">Select City</option>');
			jQuery.getJSON('?option=com_property&view=ajaxdata&format=raw', {
				distID: distID,
				ajaxtype: 'district'
			}, function (data) {
				for (var i = 0; i < data.length; i++) {
					jQuery('#prop_city_id').append('<option value="' + data[i].city_id + '">' + data[i].city_name + '</option>');
				}
			});
		}
		else {
			jQuery('#prop_city_id').html('<option value="" >Select City</option>');
		}
	});
});

