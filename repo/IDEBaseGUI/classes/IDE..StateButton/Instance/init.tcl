IDE::StateButton instproc init window {
    my instvar win states state
    set win $window
    if {![info exists state]} { 
        set state [lindex $states 0]
    }
    button $win -text $state -command [list [self] changeState]
}
