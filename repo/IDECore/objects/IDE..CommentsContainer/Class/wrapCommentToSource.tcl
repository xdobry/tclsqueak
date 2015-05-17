IDE::CommentsContainer proc wrapCommentToSource comment {
    if {$comment eq "" || [string trim $comment] eq ""} {
        return ""
    }
    set scomment ""
    foreach l [split $comment \n] {
        append scomment "# " $l \n
    }
    return $scomment
}
