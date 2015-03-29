IDE::TabButtons instproc setStates newStates {
    my instvar states state
    foreach s $states {
        if {[lsearch $newStates $s]<0} {
            [my winNameFromState $s] configure -state disabled
        } else {
            [my winNameFromState $s] configure -state normal
        }
    }
    if {[lsearch $newStates $state]<0} {
        my setState [lindex $newStates 0]
    }
}
