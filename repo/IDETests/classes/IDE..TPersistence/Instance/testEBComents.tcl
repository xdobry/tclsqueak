IDE::TPersistence instproc testEBComents {} {
    my instvar compObj
    set introProxy [$compObj getIntroProxy]
    $introProxy getCommentForObject TestB
    $compObj getComment
    $introProxy getMethodCommentForObject TestB Instance m1

    my assert {![$introProxy hasCommentForObject TestB]}
    my assert {![$compObj hasComment]}
    my assert {![$introProxy hasMethodCommentForObject TestB Instance m1]}

    my addSampleObjectsComments $compObj

    my checkSampleObjectsComments $compObj
}
