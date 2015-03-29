IDE::Component instproc getProcsGroups {} {
    set ret [list]
    foreach sub [my info children] {
        if {[$sub istype IDE::ProcsGroup]} {
            lappend ret [$sub getObjectName]
        }
    }
    return $ret
}
