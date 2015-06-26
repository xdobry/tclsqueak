$(document).ready(function(){
   $("#treecontrol a:eq(0)").click(function() {
		$(".te").hide();
		$(".hita").addClass("hitclosed");
   });
   $("#treecontrol a:eq(1)").click(function() {
		$(".te").show();
		$(".hita").removeClass("hitclosed");
   });
   $(".hita").click(function() {
		$(this).toggleClass("hitclosed").parent().find(">ul").slideToggle();
		return false;
   });
});