IDE::TclModeEdit instproc uncommentRegion {} {
    set twin [my getTextWindow]
    set lines [my getSelectedLines]
    for {set x [lindex $lines 0]} {$x<=[lindex $lines 1]} {incr x} {
        set wordbeginn [$twin search -regexp {\S} $x.0 $x.end]
        if {$wordbeginn ne ""} {
            if {[$twin get $wordbeginn] eq "#"} {
                $twin delete $wordbeginn
                $twin tag remove comment $wordbeginn $x.end
            }
        }
    }
}
