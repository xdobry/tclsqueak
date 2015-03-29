IDE::CommentsContainer proc extractComment meta {
    if {[llength $meta]%2==0 && [llength $meta]>0} {
        array set metaArr $meta
        # add variables (metaArr)
        if {[info exists metaArr(description)]} {
            return $metaArr(description)
        }
    }
    return
}
