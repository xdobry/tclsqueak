IDE::SampleElements instproc checkNoSampleTclProcsGroup {} {
    my assert {[info proc ::testProc] eq ""}
    my assert {[info proc ::testNamespace::testProc] eq ""}
}
