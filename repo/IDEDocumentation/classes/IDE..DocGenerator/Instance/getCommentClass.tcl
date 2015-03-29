IDE::DocGenerator instproc getCommentClass {comment class} {
    if {$comment ne ""} {
        return "<div class=\"$class\">[my getComment $comment]</div>\n"
    } else {
        return
    }
}
