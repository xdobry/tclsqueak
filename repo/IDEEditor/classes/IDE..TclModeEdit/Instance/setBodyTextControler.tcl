IDE::TclModeEdit instproc setBodyTextControler {class type method controler} {
    next
    my instvar breakpoint
    if {[info exists breakpoint] && $breakpoint ne ""} {
        $breakpoint removeInterestFrom [self]
    }
    my set breakpoint [IDE::BreakpointFasade searchBreakpoint $type $class $method]
    if {[my set breakpoint] ne ""} {
        my visibleBreakpoint
    } else {
        my unvisibleBreakpoint
    }
}
