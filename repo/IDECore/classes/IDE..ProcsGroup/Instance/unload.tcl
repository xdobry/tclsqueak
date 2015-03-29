IDE::ProcsGroup instproc unload {} {
    foreach sub [my info children] {
        if {[$sub istype IDE::TclProcsDescription]} {
            $sub unload
        }
    }
}
