IDE::TclModeEdit instproc getIdentFromLine line {
    set twin [my getTextWindow]
    set wordbeginn [$twin search -regexp {\S} $line.0 $line.end]
    if {$wordbeginn ne ""} {
        set indentString [$twin get $line.0 $wordbeginn]
        set indent 0
        for {set x 0} {$x<[string length $indentString]} {incr x} {
            if {[string index $indentString $x] eq "\t"} {incr indent 4}
            if {[string index $indentString $x] eq " "} {incr indent}
        }
        return $indent
    }
    return 0
}
