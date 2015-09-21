IDE::TclModeEdit instproc saveValue value {
    my instvar controler vtype oldtext oldcomment
    if {$vtype eq "Source"} {
       lassign [my splitCommentSource $value] comment source
       set contentDesc [my getContentDescr]
       if {$oldtext ne $source} {
           my saveSource $source
       }
       if {[info exists oldcomment] && $oldcomment ne $comment} {
           $controler editSaveComment $comment $contentDesc
       }
       [my getTextWindow] edit modified 0
    } elseif {$vtype eq "Comment"} {
       next
    }
}
