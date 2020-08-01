$(document).ready(function () {
	$("#dataTable").DataTable({
		dom: "Bfrtip",
		buttons: ["print", "pdfHtml5"],
	});

	var table = $("#meeting").DataTable({
		// scrollY: "500px",
		paging: true,
		dom: "Bfrtip",
		buttons: ["print", "pdfHtml5"],
	});

	$("a.toggle-vis").on("click", function (e) {
		e.preventDefault();

		// Get the column API object
		var column = table.column($(this).attr("data-column"));

		// Toggle the visibility
		column.visible(!column.visible());
	});
	$("#freeRoom").DataTable({
		lengthMenu: [5, 10, 15],
		scrollY: 300,
	});
	$("#dataHistory").DataTable({
		lengthMenu: [5, 10, 15],
		dom: "Bfrtip",
		scrollY: 300,
	});
});
