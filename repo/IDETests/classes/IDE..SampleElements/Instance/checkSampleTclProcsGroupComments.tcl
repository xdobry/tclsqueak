IDE::SampleElements instproc checkSampleTclProcsGroupComments obj {
    set tclgroup [$obj getProcsGroupWithName testTclGroup]
    my assert {[$tclgroup getComment] eq "test_comment"}
    my assert {[$tclgroup getMethodComment dummy ::testProc] eq "test_comment"}
}
