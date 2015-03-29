IDE::SampleElements instproc checkSampleObjectsComments cobj {
    set introProxy [$cobj getIntroProxy]
    my assert {[$introProxy getCommentForObject TestB] eq "object"}
    my assert {[$cobj getComment] eq "component"}
    my assert {[$introProxy getMethodCommentForObject TestB Instance m1] eq "method"}
    my assert {[$introProxy hasCommentForObject TestB]}
    my assert {[$cobj hasComment]}
    my assert {[$introProxy hasMethodCommentForObject TestB Instance m1]}
}
