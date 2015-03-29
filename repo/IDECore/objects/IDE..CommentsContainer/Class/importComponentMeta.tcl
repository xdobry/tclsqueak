IDE::CommentsContainer proc importComponentMeta meta {
    if {[llength $meta]!=3} {
        puts stderr "meta: unexepted length of Component Meta >>$meta<<"
        return
    }
    set component [lindex $meta 1]
    set contens [lindex $meta 2]
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj eq ""} {
        puts stderr "meta: $component is not a Component"
        return
    }
    $cobj setComment [my extractComment $contens]
}
