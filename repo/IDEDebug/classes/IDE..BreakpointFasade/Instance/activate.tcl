IDE::BreakpointFasade instproc activate {} {
   #atk::breakpoint configure [my handle] -active 1
}
