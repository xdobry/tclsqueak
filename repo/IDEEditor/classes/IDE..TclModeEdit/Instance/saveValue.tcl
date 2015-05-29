IDE::TclModeEdit instproc saveValue value {
    my instvar controler vtype oldtext oldcommment
    if {$vtype eq "Source"} {
       lassign [my splitCommentSource $value] comment source
       set contentDesc [my getContentDescr]
       if {$oldtext ne $source} {
           my saveSource $source
       }
       if {$oldcommment ne $comment} {
           $controler editSaveComment $comment $contentDesc
       }
       [my getTextWindow] edit modified 0
    } elseif {$vtype eq "Comment"} {
       next
    }
}
