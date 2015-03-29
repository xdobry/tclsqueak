IDE::TExtDebugger instproc testEHaltThrowProc {} {
    set a 3
    giveForwardTo [self] testCSimpleHalt
    set b 4
}
