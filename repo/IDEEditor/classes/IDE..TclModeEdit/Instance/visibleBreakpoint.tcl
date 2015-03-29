IDE::TclModeEdit instproc visibleBreakpoint {} {
    my instvar breakpoint bpwindow win
    if {![info exists bpwindow] || ![winfo exists $bpwindow]} {
        set bpwindow [button $win.bpbutton -text B -bg red -padx 1m -pady 0m -command [list [self] editBreakpoint]]
    }
    if {[$breakpoint isActive]} {
        $bpwindow configure -bg red
    } else {
        $bpwindow configure -bg [lindex [$bpwindow configure -bg] 3]
    }
    $breakpoint addEventInteres [self] breakpointRemoved remove
    pack $bpwindow -side left -before [my getTextWindow] -anchor n
}
