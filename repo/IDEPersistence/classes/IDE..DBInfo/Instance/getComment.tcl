IDE::DBInfo instproc getComment {} {
    if {![my istype IDE::DBInfo] && ![my istype IDE::CommentHandler]} {
        [my getDescription] getComment
    } else {
        if {[my exists comment]} {
            return [my set comment]
        }
        return 
    }
}
