IDE::StateButton instproc setStates newStates {
    my instvar states state
    set states $newStates
    if {[lsearch $newStates $state]<0} {
        my setState [lindex $states 0]
    }
}
