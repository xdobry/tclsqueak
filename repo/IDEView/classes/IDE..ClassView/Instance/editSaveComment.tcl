IDE::ClassView instproc editSaveComment {comment {contentDesc {}}} {
    my instvar vclass
    set introProxy [my getIntroProxy]
    if {[$introProxy isObject $vclass]} {
        $introProxy setCommentForObject $vclass $comment
    }
}
