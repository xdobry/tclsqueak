IDE::TclModeEdit instproc unvisibleBreakpoint {} {
    my instvar win bpwindow
    if {[info exists bpwindow] && [winfo exists $bpwindow]} {
        pack forget $bpwindow
    }
}
