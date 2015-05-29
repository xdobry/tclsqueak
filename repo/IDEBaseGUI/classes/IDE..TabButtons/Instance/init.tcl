IDE::TabButtons instproc init window {
    my instvar win states state
    set win $window
    frame $win
    foreach s $states {
        set winName [my winNameFromState $s]
        #button $winName -text $s -command [list [self] changeStateTo $s] -padx 0 -pady 1 -borderwidth 2
        ttk::button $winName -text $s -style Notebook.Tab -command [list [self] changeStateTo $s]
        #bind $winName <Button> [list [self] changeStateTo $s]
        pack $winName -side left -padx 0 -ipadx 0
    }
    if {![info exists state]} {
        set state [lindex $states 0]
    }
    my setState $state
}
