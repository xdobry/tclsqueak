IDE::ListView instproc lock_here {} {
    my instvar selectedIndex listItems
    if {[my has_lock]} {
        my set lock_on [lindex $listItems $selectedIndex]
    }
}
