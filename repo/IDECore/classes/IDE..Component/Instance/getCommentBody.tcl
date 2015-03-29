IDE::Component instproc getCommentBody {} {
    set comment [my getComment]
    if {$comment eq ""} return
    return "@ Component [my getName] \{\n[[my getIntroProxy] asDescriptionList $comment]\n\}\n"
}
