IDE::DBInfo instproc makeCommentPersistent {} {
    my instvar comment infoid
    set infoid [[my getConnection] insertRowAutoId Info infotext [list $comment] infoid]
    my updateAttributes infoid
}
