IDE::CommentsContainer proc importObjectMeta meta {
    if {[llength $meta]==4 && [lindex $meta 1] eq "idemeta"} {
        # it can be TclOO object (@ is not setting for this)
        lassign $meta object tag key value
        set introProxy [IDE::XOIntroProxy getIntroProxyForObject $object]
        if {$introProxy ne ""} {
            $introProxy setMetadataForObject $object $key $value
            if {$key eq "component"} {
                $introProxy moveToComponent $object $value
            }
        }
        return
    }
    if {[llength $meta]!=3} {
        if {![string match @File* $meta]} {
            puts stderr "meta: unexepted length of Object Meta >>$meta<<"
        }
        return
    }
    lassign $meta class object content
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $object]
    if {$introProxy eq ""} {
        puts stderr "meta: $object is not a Object"
        return
    }
    $introProxy setCommentForObject $object [my extractComment $content]
}
