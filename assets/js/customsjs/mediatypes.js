$(document).ready(function () {
	$("#type_id").change(function () {
		var id_type = $("#type_id").val();
		console.log(id_type);
		var csrfName = "<?php echo $this->security->get_csrf_token_name(); ?>",
			csrfHash = "<?php echo $this->security->get_csrf_hash(); ?>";
		var dataJson = {
			[csrfName]: csrfHash,
			id_type: id_type,
		};
		$.ajax({
			url: "<?php echo base_url(); ?>meeting/get_media_meeting",
			method: "POST",
			data: dataJson,
			async: false,
			dataType: "json",
			success: function (data) {
				console.log(data);
				var html = "";
				var i;

				for (i = 0; i < data.length; i++) {
					html +=
						"<option value=" +
						data[i].id +
						">" +
						data[i].id +
						" . " +
						data[i].meeting_subtype +
						"</option>";
				}
				$("#meeting_subtype").html(html);
			},
		});
	});
});
