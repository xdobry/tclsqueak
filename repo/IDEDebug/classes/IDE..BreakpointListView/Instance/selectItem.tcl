IDE::BreakpointListView instproc selectItem item {
    my instvar breakpoint
    set breakpoint [my getCurrentBreakpoint]
    [[self] info parent]::methodedit setBodyTextControler [$breakpoint vclass] [$breakpoint vctype] [$breakpoint oomethod] [self]
}
