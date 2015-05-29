IDE::CommentsContainer proc unwrapCommentFromSource source {
    set comment ""
    foreach l [split $source \n] {
        if {[string index $l 0] eq "#"} {
            if {[string index $l 1] eq " "} {
                set start 2
            } else {
                set start 1
            }
            append comment [string range $l $start end] \n
        }
    }
    string range $comment 0 end-1
}
