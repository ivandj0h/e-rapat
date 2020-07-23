$(document).ready(function () {
	$("#dataTable").DataTable({
		dom: "Bfrtip",
		buttons: ["excelHtml5", "pdfHtml5"],
	});
});
