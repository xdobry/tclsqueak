$(document).ready(function() {
    if (this.location.protocol=="file:") {
		$("#sourceFrameSet").attr("rows","90%, 10%");
    } else {
		$("#sourceFrame").load(function() {
			$("#errorRef",top.frames["sourceFrame"].document).click(function() {
				$("#sourceFrameSet").attr("rows","90%, 10%");
			});
		});
	}
});
