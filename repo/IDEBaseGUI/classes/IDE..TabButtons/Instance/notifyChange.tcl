IDE::TabButtons instproc notifyChange {} {
    my instvar command state
    if {[info exists command]} {
        eval $command [list $state]
    }

}
