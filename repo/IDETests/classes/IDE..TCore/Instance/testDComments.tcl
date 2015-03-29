IDE::TCore instproc testDComments {} {
    my instvar obj tclgroup
    #[self] halt
    set introProxy [$obj getIntroProxy]
    my assert {[$introProxy getCommentForObject TestB] eq ""}
    my assert {[$obj getComment] eq ""}
    my assert {[$introProxy getMethodCommentForObject TestB Instance m1] eq ""}

    my assert {![$introProxy hasCommentForObject TestB]}
    my assert {![$obj hasComment]}
    my assert {![$introProxy hasMethodCommentForObject TestB Instance m1]}

    my addSampleObjectsComments $obj

    my checkSampleObjectsComments $obj

    my assert {[$introProxy hasCommentForObject TestB]}
    my assert {[$obj hasComment]}
    my assert {[$introProxy hasMethodCommentForObject TestB Instance m1]}

    # Tcl ProcGroups Comments Test
    my assert {![$tclgroup hasComment]}
    my assert {[$tclgroup getComment] eq ""}

    my addSampleTclProcsGroupComments $obj
    my checkSampleTclProcsGroupComments $obj

    # comments remove

    $tclgroup setComment {}
    my assert {![$tclgroup hasComment]}
    my assert {[$tclgroup getComment] eq ""}

    $tclgroup setMethodComment dummy ::testProc {}
    my assert {![$tclgroup hasMethodComment dummy ::testProc]}
    my assert {[$tclgroup getMethodComment dummy ::testProc] eq ""}
}
