IDE::TclModeEdit instproc autoIndent {} {
    set twin [my getTextWindow]
    set lines [my getSelectedLines]
    set startline [lindex $lines 0]
    if {$startline==[lindex $lines 1]} return
    set indent [my getIdentFromLine $startline]
    if {[$twin get "$startline.end - 1 c"] eq "\{"} {
        incr indent 4
    }
    for {set x [expr {$startline+1}]} {$x<=[lindex $lines 1]} {incr x} {
        set wordbeginn [$twin search -regexp {\S} $x.0 $x.end]
        if {$wordbeginn ne ""} {
            set indentString [$twin get $x.0 $wordbeginn]
            if {$indentString ne ""} {
                $twin delete $x.0 $x.[string length $indentString]
            }
            if {[$twin get $x.0] eq "\}"} {
                incr indent -4
            }
            if {$indent<0} {set indent 0}
            $twin insert $x.0 [string repeat " " $indent]
            set pos [$twin search -regexp -backward {\S} $x.end $x.0]
            if {$pos ne "" && [$twin get $pos] eq "\{"} {
                incr indent 4
            }
        }
    }
}
