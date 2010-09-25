jQuery.noConflict();
jQuery.metadata.setType("attr", "validate");
jQuery(function () {
    jQuery("#contact_number").mask("(999) 999-9999");
    var validator = jQuery("#propertyContactForm").validate({
		debug:true,
        rules: {
            contact_office: {
                required: true,
                minlength: 2
            }
        },
        messages: {
            contact_office: {
                required: "Please write Title",
                minlength: "Property name must consist of at least 2 characters"
            }
        },
		submitHandler: function(form) {
// 			var queryString = jQuery(form).formSerialize();
			jQuery(form).ajaxSubmit();
			jQuery("#tabs").tabs('select',3);
			jQuery(form).resetForm();
			return false;
   		}
    });
});