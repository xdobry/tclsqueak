IDE::TEventHandling instproc testBFRemoveInteres {} {
    # no syntax check
    ta set t1 dummy
    tb removeInterestFrom ta
    tb signalEvent event4
    my assert {[ta set t1] eq "dummy"}
}
