IDE::InterpView instproc fillMenuStruct ms {
    $ms enablementHandler [self]
    $ms addCommand2 {Create Interp} [list [self] createInterp]
    $ms addCommand2 {Browse} [list [self] dispatchWithSelected browserInterp] isValidSelection
    $ms addCommand2 {Source/Run Tcl Program} [list [self] dispatchWithSelected sourceInterp] isValidSelection
    $ms addCommand2 {Cancel} [list [self] dispatchWithSelected cancelInterp] isValidSelection
    $ms addCommand2 {Delete} [list [self] dispatchWithSelected deleteInterp] isValidSelection
    $ms addSeparator
    $ms addCommand2 {Refresh} [list [self] refresh]
}
