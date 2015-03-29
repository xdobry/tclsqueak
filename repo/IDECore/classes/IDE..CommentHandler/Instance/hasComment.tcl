IDE::CommentHandler instproc hasComment {} {
    return [expr {[my exists comment] && [my set comment] ne ""}]
}
