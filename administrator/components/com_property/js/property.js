jQuery.noConflict();
jQuery.metadata.setType("attr", "validate");
jQuery(function () {
    jQuery("#property_description").cleditor();
    jQuery.validator.addMethod('is_real', function (value, element) {
        return this.optional(element) || /^\d*\.?\d*$/i.test(value);
    }, 'Invalid input!');

    var validator = jQuery("#addPropertyForm").validate({
        debug: true,
        rules: {
            propTitle: {
                required: true,
                minlength: 2
            },
            address1: {
                required: true
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
            price: {
                required: "Please write Price"
            }
        },
        submitHandler: function(form) {
            jQuery(form).ajaxSubmit({
                success: detailForm
            });
            // return false to prevent normal browser submit and page navigation
            return false;
        }
    });

    function detailForm() {
        jQuery("#tabs").tabs('select', 1);
    }

	jQuery("#tabs").tabs({
			cache: false,
			spinner: 'Retrieving data...' ,
			ajaxOptions: {
				error: function(xhr, status, index, anchor) {
					jQuery(anchor.hash).html("<p style='padding:10px'>This Tab is Under Construction</p>");
				}
			}
      }).bind("tabsselect tabsload", function (event, ui) {
        selecTabIndex = jQuery('#tabs').tabs('option', 'selected');
        if (selecTabIndex == 0) {
            var isValid = jQuery("#addPropertyForm").valid();
            if (!isValid) { alert('Please fill Basic details'); }
            return isValid;
        }
        if (ui.index == 2) {
            jQuery("#contact_number").mask("(999) 999-9999");
            jQuery("#alt_number").mask("(999) 999-9999");
        }
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