IDE::ProgEdit instproc addIndent {} {
    set twin [my getTextWindow]
    set lines [my getSelectedLines]
    for {set x [lindex $lines 0]} {$x<=[lindex $lines 1]} {incr x} {
        $twin insert $x.0 "    "
    }
}
