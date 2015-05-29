IDE::MethodEdit instproc saveValue value {
    my instvar controler vtype
    # remove all spaces before newline
    # regsub -all -line { +$} $value {} value
    if {$vtype eq "Source"} {
       my saveSource $value
    } elseif {$vtype eq "Comment"} {
       $controler editSaveComment $value [my getContentDescr]
       [my getTextWindow] edit modified 0
    } else {
       error {unknown view type}
    }
}
