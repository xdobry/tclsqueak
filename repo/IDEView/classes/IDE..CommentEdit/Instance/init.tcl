IDE::CommentEdit instproc init args {
    next
    set twin [my getTextWindow]
    bind $twin <Control-s> [list [self] save]
    $twin configure -font [lindex [$twin configure -font] 3]
}
