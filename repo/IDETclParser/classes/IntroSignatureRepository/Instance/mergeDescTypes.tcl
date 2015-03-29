IntroSignatureRepository instproc mergeDescTypes {istypes newtypes} {
    if {[llength $istypes]!=[llength $newtypes]} {
        # interactive update
        return $newtypes
    }
    if {[lindex $istypes 0 0] ne [lindex $newtypes 0 0]} {
        # setting to unknown will force the update
        lset istypes 0 unknown
        next $istypes $newtypes
    } else {
        # renamin variable force the update
        set needChange 0
        for {set x 1} {$x<[llength $newtypes]} {incr x} {
            if {[lindex $istypes $x 1] ne [lindex $newtypes $x 1]} {
                # this will not work if the new variable is unknown
                # TODO
                set needChange 1
                lset istypes $x unknown
            }
        }
        if {$needChange} {
            next $istypes $newtypes
        } else {
            next
        }
    }
}
