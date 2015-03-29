IDE::TclModeEdit instproc breakpointRemoved bpoint {
    my instvar breakpoint
    if {$breakpoint ne ""} {
        my unvisibleBreakpoint
        set breakpoint ""
    }
}
