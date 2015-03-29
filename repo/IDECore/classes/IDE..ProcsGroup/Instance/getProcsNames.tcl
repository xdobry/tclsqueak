IDE::ProcsGroup instproc getProcsNames {} {
    set ret {}
    foreach sub [my info children] {
        if {[$sub istype IDE::TclProcsDescription]} {
            lappend ret [$sub getName]
        }
    }
    return $ret
}
