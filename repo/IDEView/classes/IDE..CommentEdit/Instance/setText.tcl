IDE::CommentEdit instproc setText text {
    if {$text eq ""} {
        next "not commented"
    } else {
        next
    }
}
