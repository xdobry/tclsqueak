IDE::MountList instproc isMountfile {} {
    set act [my selectedItemFirst]
    if {$act ne ""} {
        set p [my info parent]
        if {[$p exists mountTo] && [lsearch [$p set mountTo] $act]>=0} {
            return 1
        }
    }
    return 1
}
