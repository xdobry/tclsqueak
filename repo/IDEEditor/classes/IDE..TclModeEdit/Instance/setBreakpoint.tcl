IDE::TclModeEdit instproc setBreakpoint {} {
    my instvar vctype vtype vclass method
    set insertPos [string length [[my getTextWindow] get 1.0 insert]]
    set position [expr {$insertPos-[my getBodyStart]}]
    my set breakpoint [IDE::BreakpointFasade setNewBreakpoint $vctype $vclass $method $position]
    my visibleBreakpoint
}
