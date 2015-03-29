IDE::MethodView instproc editSaveComment comment {
   my instvar actItem
   set vclass [lindex $actItem 0]
   set vtype [lindex $actItem 1]
   set method [lindex $actItem 2]
   set introProxy [my getIntroProxy]
   $introProxy setMethodCommentForObject $vclass [IDE::XOIntroProxy getAbstractMethodType $vtype] $method $comment

}
