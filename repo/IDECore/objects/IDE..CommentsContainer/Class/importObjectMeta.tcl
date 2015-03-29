IDE::CommentsContainer proc importObjectMeta meta {
    if {[llength $meta]!=3} {
        if {![string match @File* $meta]} {
            puts stderr "meta: unexepted length of Object Meta >>$meta<<"
        }
        return
    }
    set class [lindex $meta 0]
    set object [lindex $meta 1]
    set contens [lindex $meta 2]
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $object]
    if {$introProxy eq ""} {
        puts stderr "meta: $object is not a Object"
        return
    }
    $introProxy setCommentForObject $object [my extractComment $contens]
}
