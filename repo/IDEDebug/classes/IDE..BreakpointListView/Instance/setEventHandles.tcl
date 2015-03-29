IDE::BreakpointListView instproc setEventHandles {} {
    IDE::BreakpointFasade addEventInteres [self] refreshList removeBreakpoint 
    IDE::BreakpointFasade addEventInteres [self] refreshList addBreakpoint 
}
