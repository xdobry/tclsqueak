IDE::DBInfo instproc hasComment {} {
    if {![my istype IDE::DBInfo] && ![my istype IDE::CommentHandler]} {
        [my getDescription] hasComment
    } else {
        expr {[my exists comment] && [my set comment] ne ""} 
    }
}
