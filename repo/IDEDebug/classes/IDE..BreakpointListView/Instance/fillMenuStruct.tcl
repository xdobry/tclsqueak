IDE::BreakpointListView instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 {Remove Breakpoint} [list [self] dispatchWithSelected removeBreakpoint] isValidSelection
    $ms addCommand2 {Activate Breakpoint} [list [self] dispatchWithSelected activateBreakpoint] {isValidSelection isDeactive}
    $ms addCommand2 {Deactivate Breakpoint} [list [self] dispatchWithSelected deactivateBreakpoint] {isValidSelection isActive}
    $ms addCommand2 {Edit Breakpoint} [list [self] dispatchWithSelected editBreakpoint] isValidSelection
    $ms addCommand2 {Refresh List} [list [self] refreshList]
    next
}
