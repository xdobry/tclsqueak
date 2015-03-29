IDE::SampleElements instproc addSampleTclProcsGroup obj {
    set tclgroup [$obj createTclProcsGroup testTclGroup 0]
    $tclgroup handleScript {proc testProc {} {puts testProc}}
    set tclgroup [$obj createTclProcsGroup testNamespace 1]
    $tclgroup handleScript {proc testNamespace::testProc {} {puts testProc}}
    return $tclgroup
}
