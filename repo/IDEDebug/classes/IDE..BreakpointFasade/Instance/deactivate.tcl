IDE::BreakpointFasade instproc deactivate {} {
   #atk::breakpoint configure [my handle] -active 0
}
