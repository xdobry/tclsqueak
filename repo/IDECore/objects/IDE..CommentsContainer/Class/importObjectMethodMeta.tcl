IDE::CommentsContainer proc importObjectMethodMeta {type meta} {
    if {[llength $meta]!=5} {
        puts stderr "unexepted length of Method Meta >>$meta<<"
        return
    }
    set object [lindex $meta 0]
    set method [lindex $meta 2]
    set contens [lindex $meta 4]
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $object]
    if {$introProxy eq ""} {
        puts stderr "meta: $object is not a Object"
        return
    }
    $introProxy setMethodCommentForObject $object $type $method [my extractComment $contens]
}
