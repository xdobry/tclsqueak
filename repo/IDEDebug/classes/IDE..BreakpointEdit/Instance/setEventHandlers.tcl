IDE::BreakpointEdit instproc setEventHandlers {} {
    set b [my breakpoint]
    $b addEventInteres [self] breakpointRemoved remove
}
