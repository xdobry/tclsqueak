IDE::Component instproc getProcsGroupWithName name {
    foreach sub [my info children] {
        if {[$sub istype IDE::ProcsGroup] && [$sub set name]==$name} {
            return $sub
        }
    }
    return
}
