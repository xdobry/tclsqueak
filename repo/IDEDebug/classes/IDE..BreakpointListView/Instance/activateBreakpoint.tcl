IDE::BreakpointListView instproc activateBreakpoint args {
   [my set breakpoint] activate
   my refreshList
}
