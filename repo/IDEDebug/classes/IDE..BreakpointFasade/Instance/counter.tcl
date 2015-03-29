IDE::BreakpointFasade instproc counter {} {
    #lindex [atk::breakpoint info [my handle]] 3
}
