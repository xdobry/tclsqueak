IDE::BreakpointListView instproc getMenuStruct {} {
    return [IDE::MenuStruct create [self]::ms {Breakpoints} 0]
}
