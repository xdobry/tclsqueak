IDE::ProgEdit instproc minusIndent {} {
    set twin [my getTextWindow]
    set lines [my getSelectedLines]
    for {set x [lindex $lines 0]} {$x<=[lindex $lines 1]} {incr x} {
        set wordbeginn [$twin search -regexp {\S} $x.0 $x.end]
        if {$wordbeginn ne ""} {
            set indentString [$twin get $x.0 $wordbeginn]
            for {set cuts 0} {$cuts<4 && $cuts<[string length $indentString]} {incr cuts} {
                if {[string index $indentString $cuts] eq "\t"} break
                if {[string index $indentString $cuts] ne " "} break
            }
            $twin delete $x.0 $x.$cuts
        }
    }
}
