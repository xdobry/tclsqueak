IDE::SampleElements instproc addSampleObjectsComments cobj {
    set introProxy [$cobj getIntroProxy]
    $introProxy setCommentForObject TestB object
    $cobj setComment component
    $introProxy setMethodCommentForObject TestB Instance m1 method
}
