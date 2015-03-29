IDE::BreakpointFasade instproc isActive {} {
   # lindex [atk::breakpoint info [my handle]] 2
   return 1
}
