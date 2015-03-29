IDE::TabButtons instproc changeState {} {
    my instvar states state
    if {[set pos [lsearch -exact $states $state]]==[llength $states]-1} {
        set newState [lindex $states 0]
    } else {
        set newState [lindex $states $pos+1]
    }
    my setState $newState
    my notifyChange
}
