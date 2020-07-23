$(document).ready(function () {
	$("#dataTable").DataTable({
		dom: "Bfrtip",
		buttons: ["excelHtml5", "csvHtml5", "pdfHtml5"],
	});
});
