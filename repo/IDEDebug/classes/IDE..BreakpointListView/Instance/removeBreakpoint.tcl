IDE::BreakpointListView instproc removeBreakpoint item {
    [my set breakpoint] remove
    my refreshList
}
