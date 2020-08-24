$(document).ready(function () {
	// upload user profile
	$(".custom-file-input").on("change", function () {
		let fileName = $(this).val().split("\\").pop();
		$(this).next(".custom-file-label").addClass("selected").html(fileName);
	});

	// Alerts system handler
	$(".alert-success")
		.fadeTo(2000, 500)
		.slideUp(500, function () {
			$(".alert-success").slideUp(500);
		});

	$(".alert-warning")
		.fadeTo(3000, 500)
		.slideUp(500, function () {
			$(".alert-warning").slideUp(500);
		});

	$(".alert-danger")
		.fadeTo(2000, 500)
		.slideUp(500, function () {
			$(".alert-danger").slideUp(500);
		});
});
