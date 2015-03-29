IDE::BreakpointListView instproc getCurrentBreakpoint {} {
    set index [my selectedIndex]
    return [lindex [my set breakpointsList] $index]
}
