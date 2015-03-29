IDE::SampleElements instproc addSampleTclProcsGroupComments obj {
    set tclgroup [$obj getProcsGroupWithName testTclGroup]
    $tclgroup setComment test_comment
    $tclgroup setMethodComment dummy ::testProc test_comment
}
