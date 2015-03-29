PrsFileContext instproc posToLine pos {
    my instvar lineStart linesLen
    set i 0
    set lineEnd 0
    foreach l $linesLen {
        incr lineEnd $l
        if {$pos<$lineEnd} {
            return [list [expr {$lineStart+$i}] [expr {$l-$pos}]]
        }
        incr i
    }
    incr i -1
    list [expr {$lineStart+$i}] [expr {$l-$pos}]
}
