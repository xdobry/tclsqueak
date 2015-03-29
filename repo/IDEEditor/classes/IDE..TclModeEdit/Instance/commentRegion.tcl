IDE::TclModeEdit instproc commentRegion {} {
    set twin [my getTextWindow]
    set lines [my getSelectedLines]
    for {set x [lindex $lines 0]} {$x<=[lindex $lines 1]} {incr x} {
        set wordbeginn [$twin search -regexp {\S} $x.0 $x.end]
        if {$wordbeginn ne ""} {
            if {[$twin get $wordbeginn] ne "#"} {
                $twin insert $wordbeginn #
                $twin tag remove quoted $wordbeginn $x.end
                $twin tag remove variable $wordbeginn $x.end
                $twin tag remove tclproc $wordbeginn $x.end
                $twin tag remove xotcl $wordbeginn $x.end
                $twin tag remove hlight $wordbeginn $x.end
                $twin tag add comment $wordbeginn $x.end
            }
        }
    }
}
