IDE::BreakpointEdit instproc removeBreakpoint {} {
   [my breakpoint] remove
   my breakpoint {}
   my cancelBrowser
}
