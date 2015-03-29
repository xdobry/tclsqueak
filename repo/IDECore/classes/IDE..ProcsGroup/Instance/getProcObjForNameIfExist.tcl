IDE::ProcsGroup instproc getProcObjForNameIfExist name {
    foreach sub [my info children] {
        if {[$sub istype IDE::TclProcsDescription] && ([$sub set name] eq $name || [$sub set name] eq [string trimleft $name :])} {
            return $sub
        }
    }
    return
}
