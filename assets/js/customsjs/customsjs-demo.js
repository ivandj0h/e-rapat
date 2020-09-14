$(document).ready(function () {
	// upload user profile
	$(".custom-file-input").on("change", function () {
		let fileName = $(this).val().split("\\").pop();
		$(this).next(".custom-file-label").addClass("selected").html(fileName);
	});

	// Alerts system handler
	$(".alert-success")
		.fadeTo(2000, 500)
		.slideUp(2000, function () {
			$(".alert-success").slideUp(2000);
		});

	$(".alert-warning")
		.fadeTo(3000, 500)
		.slideUp(2000, function () {
			$(".alert-warning").slideUp(2000);
		});

	$(".alert-danger")
		.fadeTo(2000, 500)
		.slideUp(2000, function () {
			$(".alert-danger").slideUp(2000);
		});
});
