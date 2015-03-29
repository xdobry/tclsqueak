IDE::Component instproc getProcsGroupsObjects {} {
    set ret [list]
    foreach sub [my info children] {
        if {[$sub istype IDE::ProcsGroup]} {
            lappend ret $sub
        }
    }
    return $ret
}
