IDE::TclModeEdit instproc saveValueForce value {
    my instvar hasErrors
    if {[info exists hasErrors] && $hasErrors} {
        set hasErrors 0
        my saveForce
    }
}
