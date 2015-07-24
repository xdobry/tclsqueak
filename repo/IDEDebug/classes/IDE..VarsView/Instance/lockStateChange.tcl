IDE::VarsView instproc lockStateChange {} {
    my instvar selectedIndex listItems
    if {[my isLockOn]} {
        my set lockedValue [lindex $listItems $selectedIndex]
    }
}
