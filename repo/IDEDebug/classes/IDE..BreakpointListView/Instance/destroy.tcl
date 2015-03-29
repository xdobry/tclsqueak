IDE::BreakpointListView instproc destroy {} {
    IDE::BreakpointFasade removeInterestFrom [self]
    next
}
