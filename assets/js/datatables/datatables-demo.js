$(document).ready(function () {
	$("#dataTable").DataTable({
		dom: "Bfrtip",
		buttons: ["excelHtml5", "pdfHtml5"],
	});
	$("#freeRoom").DataTable({
		lengthMenu: [5, 10, 15],
		scrollY: 300,
	});
});
