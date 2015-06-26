function searchBackreference() {
	var anchorElem = $(this).parent()
	var anchor = anchorElem.attr("name");
	var anchorPosition = anchorElem.position();
  
	var refTblUI = $("<tbody id='breftbl'>");
	$.each(tclHtmlBackRererences ,function(i,breference) {
		if (anchor==breference[0]) {
			$.each(breference[1],function(y,blink) {
				var trow = $("<tr><td><a href='"+blink[0]+"'>"+blink[1]+"</a></td></tr>");
				trow.appendTo(refTblUI);
		    });
			return false;
		}
	});
	$("#breftbl").replaceWith(refTblUI);
	$('#breftbl a').click(function () {     
        $('#sdialog').hide();
    });
	
	$('#sdialog').css({top:anchorPosition.top, left:anchorPosition.left+20}).show();
}

function initBackReferenceSearch() {
	$.each(tclHtmlBackRererences ,function(i,breference) {
		var image = $("<span class='search'>");
		image.click(searchBackreference);
		var anchor = breference[0];
		$("a[name='"+anchor+"']").addClass("breference").prepend(image);
	});
	$("body").append('<div id="sdialog"><table><tbody id="breftbl"></table><a id="sbutton" href="#" class="button">Close</a></div>');
	 $('#sbutton').click(function () {     
        $('#sdialog').hide();
        return false;
    });
}

$(document).ready(function(){
   // flash all variable references when mouse hover
   $(".variable[data-vindex!='']").mouseenter(function() {
		$(".variable[data-vindex='"+$(this).attr("data-vindex")+"']").addClass("marked");
	}).mouseleave(function() {
		var vindex = $(this).attr("data-vindex");
		setTimeout(function() {
			$(".variable[data-vindex='"+vindex+"']").removeClass("marked");
		},1000);
   });
   initBackReferenceSearch();
});