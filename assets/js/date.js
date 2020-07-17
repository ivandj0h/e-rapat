$("#datepicker").datepicker({
	weekStart: 1,
	daysOfWeekHighlighted: "6,0",
	autoclose: true,
	todayHighlight: true,
	language: "en",
});
$("#datepicker").datepicker("setDate", new Date());
