IDE::BreakpointListView instproc deactivateBreakpoint args {
   [my set breakpoint] deactivate
   my refreshList
}
