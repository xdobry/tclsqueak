IDE::BreakpointFasade proc removeBreakpoint breakpoint {
    my unset breakpointsArr([$breakpoint handle])
    my signalEvent removeBreakpoint $breakpoint
}
