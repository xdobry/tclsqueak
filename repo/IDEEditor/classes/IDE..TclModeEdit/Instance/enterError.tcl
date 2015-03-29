IDE::TclModeEdit instproc enterError tag {
    my instvar errorsArr
    if {[llength $tag]>1} {
        foreach t $tag {
            if {[string index $t 0] eq "e"} {
                set tag $t
                break
            }
        }
    }
    [my info parent] setStatusBarText [lindex $errorsArr($tag) 2]
}
