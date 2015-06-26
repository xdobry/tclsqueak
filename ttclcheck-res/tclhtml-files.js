$(document).ready(function(){
   $("a[data-source]").click(function() {
		var sourceLink = $(this).attr("data-source");
		if (sourceLink) {
			parent.sourceFrame.location=sourceLink;
		}
   });
});