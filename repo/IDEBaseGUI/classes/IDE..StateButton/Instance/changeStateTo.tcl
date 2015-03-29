IDE::StateButton instproc changeStateTo {newState {notify 1}} {
    my instvar states state
    if {[lsearch -exact $states $newState]>=0 && $newState ne $state} {
        my setState $newState
        if {$notify} {
            my notifyChange
        }
    }
}
