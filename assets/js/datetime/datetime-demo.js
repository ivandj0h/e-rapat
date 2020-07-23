$(document).ready(function () {
	// date handler
	$("#date_issues").datetimepicker({
		timepicker: false,
		datepicker: true,
		format: "Y-m-d", // formatDate
		// value: "2020-07-23", // defaultDate
		// weeks: true,
		weekStart: 1,
		todayBtn: 1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,
	});

	// add start time handler
	$("#start_time").datetimepicker({
		timepicker: true,
		datepicker: false,
		format: "H:i", // formatTime
		// value: "00:00", // defaultTime
		hours12: false,
	});

	// add end time handler
	$("#end_time").datetimepicker({
		timepicker: true,
		datepicker: false,
		format: "H:i", // formatTime
		// value: "00:00", // defaultTime
		hours12: false,
	});
});
