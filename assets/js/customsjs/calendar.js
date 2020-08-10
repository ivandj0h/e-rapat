// var baseurl = "<?php print site_url();?>";
var baseurl = "<?=base_url();?>";
console.log(baseurl);
// render calendar
if (jQuery("div#my-calendar").length > 0) {
	jQuery.ajax({
		url: baseurl + "getCalendar",
		dataType: "html",
		beforeSend: function () {
			$("#my-calendar").html(
				'<div class="text-center mrgA padA"><i class="fa fa-spinner fa-pulse fa-4x fa-fw"></i></div>'
			);
		},
		complete: function () {
			jQuery('[data-caltoggle="tooltip"]').tooltip();
		},
		success: function (html) {
			jQuery("#my-calendar").html(html);
		},
		error: function (xhr, ajaxOptions, thrownError) {
			console.log(
				thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText
			);
		},
	});
}

// render calendar with navigation
jQuery(document).on("click", "a.calnav", function (e) {
	e.preventDefault();
	var page = jQuery(this).data("calvalue");
	jQuery.ajax({
		url: baseurl + "getCalendar",
		type: "post",
		data: { page: page },
		dataType: "html",
		beforeSend: function () {
			$("#my-calendar").html(
				'<div class="text-center mrgA padA"><i class="fa fa-spinner fa-pulse fa-4x fa-fw"></i></div>'
			);
		},
		complete: function () {
			jQuery('[data-caltoggle="tooltip"]').tooltip();
		},
		success: function (html) {
			jQuery("#my-calendar").html(html);
		},
		error: function (xhr, ajaxOptions, thrownError) {
			console.log(
				thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText
			);
		},
	});
});

// render calendar change month
jQuery(document).on("change", "#setMonthVal", function (e) {
	e.preventDefault();
	var month = this.value;
	var year = jQuery("#setYearVal > option:selected").val();
	jQuery.ajax({
		url: baseurl + "getCalendar",
		type: "post",
		data: { year: year, month: month },
		dataType: "html",
		beforeSend: function () {
			$("#my-calendar").html(
				'<div class="text-center mrgA padA"><i class="fa fa-spinner fa-pulse fa-4x fa-fw"></i></div>'
			);
		},
		complete: function () {
			jQuery('[data-caltoggle="tooltip"]').tooltip();
		},
		success: function (html) {
			jQuery("#my-calendar").html(html);
		},
		error: function (xhr, ajaxOptions, thrownError) {
			console.log(
				thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText
			);
		},
	});
});

// render calendar change year
jQuery(document).on("change", "#setYearVal", function (e) {
	e.preventDefault();
	var year = this.value;
	var month = jQuery("#setMonthVal > option:selected").val();
	jQuery.ajax({
		url: baseurl + "getCalendar",
		type: "post",
		data: { year: year, month: month },
		dataType: "html",
		beforeSend: function () {
			$("#my-calendar").html(
				'<div class="text-center mrgA padA"><i class="fa fa-spinner fa-pulse fa-4x fa-fw"></i></div>'
			);
		},
		complete: function () {
			jQuery('[data-caltoggle="tooltip"]').tooltip();
		},
		success: function (html) {
			jQuery("#my-calendar").html(html);
		},
		error: function (xhr, ajaxOptions, thrownError) {
			console.log(
				thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText
			);
		},
	});
});
