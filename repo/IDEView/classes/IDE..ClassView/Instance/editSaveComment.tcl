IDE::ClassView instproc editSaveComment comment {
    my instvar vclass
    set introProxy [my getIntroProxy]
    if {[$introProxy isObject $vclass]} {
        $introProxy setCommentForObject $vclass $comment
    }
}
